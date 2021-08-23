package elastic.simple

import chisel3._
import chisel3.util._

// N iterations of the same computations on (x,y) input vector
class Computing(width: Int = 32, N: Int = 8) extends Module {
  // Elastic input/output interfaces, in/out - Vector2 type, which contains x and y
  val io = IO(new Bundle {
    val out = new DecoupledIO(new Vector2(w = width))
    val in = Flipped(new DecoupledIO(new Vector2(w = width)))
  })

  // FSM with 3 states
  val waitingInput :: computing :: waitingOutput :: Nil = Enum(3)
  val stateReg = RegInit(waitingInput) // register for current state
  val xReg = RegInit(0.S(width.W)) // register for x
  val yReg = RegInit(0.S(width.W)) // register for y
  val cntReg = RegInit(0.U((log2Ceil(N) + 1).W)) // register for counting number of operations left

  io.in.ready := stateReg === waitingInput // input ready is high when state is waitingInput
  io.out.valid := stateReg === waitingOutput // output valid is high when state is waitingOutput

  // output of the module is xReg and yReg
  io.out.bits.x := xReg
  io.out.bits.y := yReg

  // switch construction for FSM implementation
  switch(stateReg) {
    is(waitingInput) { // state of reading data
      when(io.in.valid) { // when handshaking is successful
        // store input data in data register
        xReg := io.in.bits.x
        yReg := io.in.bits.y

        cntReg := 1.U // init register for counting number of operations left
        stateReg := computing // go to the state of computing
      }
    }
    is(computing) { // state of computing
      // computations on (x,y) vector, just multiplication by matrix
      xReg := xReg * 5.S + yReg * 3.S
      yReg := xReg * 3.S - yReg * 2.S

      when (cntReg === N.U) { // when required amount of shifts is performed
        stateReg := waitingOutput // go to waitingOutput state to output data
      } .otherwise { // if shifts to perform left
        cntReg := cntReg + 1.U // count current shift and stay in the same state
      }
    }
    is(waitingOutput) { // state for data output
      when(io.out.ready) { // when handshaking is successful
        stateReg := waitingInput // go to the state of reading data again
      }
    }
  }
}

// data type for in/out
class Vector2 (val w: Int = 32) extends Bundle {
  val x = SInt(w.W)
  val y = SInt(w.W)
}