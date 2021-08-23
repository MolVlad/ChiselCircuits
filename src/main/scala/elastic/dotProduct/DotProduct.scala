package elastic.dotProduct

import chisel3._
import chisel3.util._

// Dot product with decoupled processing element (PE) inside
class DotProduct(width: Int = 32, N: Int = 8) extends Module {
  val io = IO(new Bundle {
    // Elastic input/output interfaces, in - two vectors with length N
    val in = Flipped(new DecoupledIO(new Bundle {
      val x = Vec(N, SInt(width.W))
      val y = Vec(N, SInt(width.W))
    }))
    val out = new DecoupledIO(SInt(width.W))
  })

  // regs for storing input data
  val xRegs = RegInit(VecInit(Seq.fill(N)(0.S(width.W))))
  val yRegs = RegInit(VecInit(Seq.fill(N)(0.S(width.W))))

  // FSM with 5 states
  val waitingInput :: sending :: waitingComputation :: waitingOutput :: resetting :: Nil = Enum(5)
  val stateReg = RegInit(waitingInput) // register for current state
  val cntReg = RegInit(0.U((log2Ceil(N) + 1).W)) // register for counting number of current operation

  // processing element for accumulating the result of multiplication of two values
  val pe = Module(new DecoupledMultiplyAndAccumulate(width))

  // initializing
  pe.io.in.bits.x := 0.S
  pe.io.in.bits.y := 0.S
  pe.io.in.bits.reset := false.B

  // input is valid for pe in two states: sending and resetting
  pe.io.in.valid := (stateReg === sending) || (stateReg === resetting)
  // output is ready for pe in state waitingComputation
  pe.io.out.ready := stateReg === waitingComputation

  io.out.bits := pe.io.out.bits // output is the output of pe
  io.in.ready := stateReg === waitingInput // input ready is high when state is waitingInput
  io.out.valid := stateReg === waitingOutput // output valid is high when state is waitingOutput

  // switch construction for FSM implementation
  switch(stateReg) {
    is(waitingInput) { // state of reading data
      when(io.in.valid) { // when handshaking is successful
        // store input data into registers
        for(i <- 0 until N) {
          xRegs(i) := io.in.bits.x(i)
        }
        for(i <- 0 until N) {
          yRegs(i) := io.in.bits.y(i)
        }

        cntReg := 0.U // initialize number of operations
        stateReg := sending // go to state sending
      }
    }
    is(sending) { // state of sending data to PE
      when(pe.io.in.ready) // when handshaking is successful
      {
        // put appropriate data into pe input
        pe.io.in.bits.x := xRegs(cntReg)
        pe.io.in.bits.y := yRegs(cntReg)

        stateReg := waitingComputation // go to state waitingComputation
      }
    }
    is(waitingComputation) { // state of waiting data from pe
      when(pe.io.out.valid) { // when handshaking is successful
        cntReg := cntReg + 1.U // increment counter of current operation

        when(cntReg === (N-1).U) { // when it is the last operation
          stateReg := waitingOutput // go to state waitingOutput
        } .otherwise {
          stateReg := sending // otherwise send net data to pe
        }
      }
    }
    is(waitingOutput) { // state of waiting output ready
      when(io.out.ready) { // when handshaking is successful
        stateReg := resetting // go to state resetting to reset pe
      }
    }
    is(resetting) { // state of resetting pe
      when(pe.io.in.ready) { // when handshaking is successful
        pe.io.in.bits.reset := true.B // reset pe
        stateReg := waitingInput // go to initial state of waiting input data again
      }
    }
  }
}

// Decoupled processing element (PE), which accumulates the result of multiplication of two input values (x and y)
class DecoupledMultiplyAndAccumulate(width: Int = 32) extends Module {
  val io = IO(new Bundle {
    // Elastic input/output interfaces
    val in = Flipped(new DecoupledIO(new Bundle {
      val x = Input(SInt(width.W))
      val y = Input(SInt(width.W))
      val reset = Input(Bool())
    }))
    val out = new DecoupledIO(SInt(width.W))
  })

  // FSM with 2 states
  val waiting :: computing :: Nil = Enum(2)
  val stateReg = RegInit(waiting) // register for current state

  // registers to store input data
  val xReg = RegInit(0.S(width.W))
  val yReg = RegInit(0.S(width.W))
  val resetReg = RegInit(false.B)

  // register for accumulating result
  val accReg = RegInit(0.S(width.W))

  // accReg is the output of the module
  io.out.bits := accReg

  // input ready and output valid are high when state is waiting
  io.in.ready := stateReg === waiting
  io.out.valid := stateReg === waiting

  // switch construction for FSM implementation
  switch(stateReg) {
    is(waiting) { // state of waiting input data
      when(io.in.valid) { // when handshaking is successful
        // store input data into register
        xReg := io.in.bits.x
        yReg := io.in.bits.y
        resetReg := io.in.bits.reset

        stateReg := computing // go to state computing
      }
    }
    is(computing) { // state of computing
      stateReg := waiting // go to state computing

      when (resetReg) {
        accReg := 0.S // reset accReg if desired
      } .otherwise {
        accReg := accReg + xReg * yReg // otherwise multiply input values and add it to accumulating register
      }
    }
  }
}

