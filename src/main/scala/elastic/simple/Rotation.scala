package elastic.simple

import chisel3._
import chisel3.util._

// N cyclic shifts of width bits register
class Rotation(width: Int = 4, N: Int = 8) extends Module {
  // Elastic input/output interfaces
  val io = IO(new Bundle {
    val out = new DecoupledIO(UInt(width.W))
    val in = Flipped(new DecoupledIO(UInt(width.W)))
  })

  // FSM with 3 states
  val waitingInput :: computing :: waitingOutput :: Nil = Enum (3)
  val stateReg = RegInit(waitingInput) // register for current state
  val dataReg = RegInit(0.U(width.W)) // register for data
  val cntReg = RegInit(0.U((log2Ceil(N)+1).W)) // register for counting number of cyclic shifts left

  io.in.ready := stateReg === waitingInput // input ready is high when state is waitingInput
  io.out.valid := stateReg === waitingOutput // output valid is high when state is waitingOutput
  io.out.bits := dataReg // output of the module is dataReg

  // switch construction for FSM implementation
  switch (stateReg) {
    is (waitingInput) { // state of reading data
      when (io.in.valid) { // when handshaking is successful
        dataReg := io.in.bits // store input data in data register
        cntReg := 1.U // init register for counting number of cyclic shifts left
        stateReg := computing // go to the state of computing
      }
    }
    is (computing) { // state of computing
      // perform cyclic shift
      dataReg := Cat(dataReg(0), dataReg(width - 1, 1))

      when (cntReg === N.U) { // when required amount of shifts is performed
        stateReg := waitingOutput // go to waitingOutput state to output data
      } .otherwise { // if shifts to perform left
        cntReg := cntReg + 1.U // count current shift and stay in the same state
      }
    }
    is (waitingOutput) { // state for data output
      when (io.out.ready) { // when handshaking is successful
        stateReg := waitingInput // go to the state of reading data again
      }
    }
  }
}