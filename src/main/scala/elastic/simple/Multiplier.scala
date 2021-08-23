package elastic.simple

import chisel3._
import chisel3.util._

// 2n bits x 2n bits multiplier through one nxn multiplier
// semiWidth = n
class Multiplier(semiWidth: Int = 2) extends Module {
  // Elastic input/output interfaces
  val io = IO(new Bundle {
    val out = new DecoupledIO(UInt((4*semiWidth).W))
    val in = Flipped(new DecoupledIO(new Bundle {
      val x = UInt((2*semiWidth).W)
      val y = UInt((2*semiWidth).W)
    }))
  })

  // FSM with 3 states
  val waitingInput :: computing :: waitingOutput :: Nil = Enum(3)
  val stateReg = RegInit(waitingInput) // register for current state
  // enum for stages of multiplication
  val stage1 :: stage2 :: stage3 :: stage4 :: Nil = Enum(4)
  val multStageReg = RegInit(stage1) // register for current stage of multiplication

  io.in.ready := stateReg === waitingInput // input ready is high when state is waitingInput
  io.out.valid := stateReg === waitingOutput // output valid is high when state is waitingOutput

  // registers for storing input data (x and y)
  val xReg = RegInit(io.in.bits.x)
  val yReg = RegInit(io.in.bits.y)

  // n - semiWidth, N=2*n - width
  // x = x1 * 2^n + x0
  // y = y1 * 2^n + y0
  val N = semiWidth * 2; val n = semiWidth // for convenience
  val x0 = Wire(UInt(n.W))
  x0 := xReg(n - 1, 0)
  val x1 = Wire(UInt(n.W))
  x1 := xReg(N - 1, n)
  val y0 = Wire(UInt(n.W))
  y0 := yReg(n - 1, 0)
  val y1 = Wire(UInt(n.W));
  y1 := yReg(N - 1, n)

  // inputs and output of multiplication block
  val xMul = Wire(UInt(n.W))
  val yMul = Wire(UInt(n.W))
  val resMul = Wire(UInt(N.W))

  // multiplication block used in every stage
  resMul := xMul * yMul

  // register for storing result
  val resReg = RegInit(0.U((2*N).W))
  io.out.bits := resReg // resReg is output of the module

  // init input ports of multiplication block
  xMul := 0.U
  yMul := 0.U

  // switch construction for FSM implementation
  switch(stateReg) {
    is(waitingInput) { // state of reading data
      when(io.in.valid) { // when handshaking is successful
        // store input data in registers
        xReg := io.in.bits.x
        yReg := io.in.bits.y

        stateReg := computing // go to the state of computing
      }
    }
    is(computing) { // state of computing
      // n - semiWidth, N=2*n - width
      // x*y = (x1 * 2^n + x0) * (y1 * 2^n + y0) =
      // [stage1]: x1 * y1 << N +
      // [stage2]: x0 * y1 << n +
      // [stage3]: x1 * y0 << n +
      // [stage4]: x0 * y0 << 1

      // switch construction for moving between stages
      switch(multStageReg) {
        is(stage1) { // first stage
          // input values for multiplication block are x1 and y1
          xMul := x1
          yMul := y1
          // store result shifted by N in resReg
          resReg := resMul << N.U

          multStageReg := stage2 // go to the next stage
        }
        is(stage2) { // second stage
          // input values for multiplication block are x0 and y1
          xMul := x0
          yMul := y1
          // add the result shifted by n to resReg
          resReg := resReg + (resMul << n.U)

          multStageReg := stage3 // go to the next stage
        }
        is(stage3) { // third stage
          // input values for multiplication block are x1 and y0
          xMul := x1
          yMul := y0
          // add the result shifted by n to resReg
          resReg := resReg + (resMul << n.U)

          multStageReg := stage4 // go to the next stage
        }
        is(stage4) { // last stage
          // input values for multiplication block are x0 and y0
          xMul := x0
          yMul := y0
          // add the result to resReg
          resReg := resReg + resMul

          multStageReg := stage1 // reset multStageReg
          stateReg := waitingOutput // go to waitingOutput state to output data
        }
      }
    }
    is(waitingOutput) { // state for data output
      when(io.out.ready) { // when handshaking is successful
        stateReg := waitingInput // go to the state of reading data again
      }
    }
  }
}