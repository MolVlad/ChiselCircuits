package elastic.simple

import chisel3._
import chisel3.util._

class Multiplier(semiWidth: Int = 2) extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(UInt((4*semiWidth).W))
    val in = Flipped(new DecoupledIO(new Bundle {
      val x = UInt((2*semiWidth).W)
      val y = UInt((2*semiWidth).W)
    }))
  })

  val waitingInput :: computing :: waitingOutput :: Nil = Enum(3)
  val stateReg = RegInit(waitingInput)
  val stage1 :: stage2 :: stage3 :: stage4 :: Nil = Enum(4)
  val multStageReg = RegInit(stage1)

  io.in.ready := stateReg === waitingInput
  io.out.valid := stateReg === waitingOutput

  // n - semiWidth, N=2*n - width
  // x = x1 * 2^n + x0
  // y = y1 * 2^n + y0
  val N = semiWidth * 2; val n = semiWidth
  val x0 = Wire(UInt(n.W))
  x0 := io.in.bits.x(n - 1, 0)
  val x1 = Wire(UInt(n.W))
  x1 := io.in.bits.x(N - 1, n)
  val y0 = Wire(UInt(n.W))
  y0 := io.in.bits.y(n - 1, 0)
  val y1 = Wire(UInt(n.W));
  y1 := io.in.bits.y(N - 1, n)

  val xMul = Wire(UInt(n.W))
  val yMul = Wire(UInt(n.W))
  val resMul = Wire(UInt(N.W))

  resMul := xMul * yMul

  val resReg = RegInit(0.U((2*N).W))
  io.out.bits := resReg

  xMul := 0.U
  yMul := 0.U

  switch(stateReg) {
    is(waitingInput) {
      when(io.in.valid) {
        stateReg := computing
      }
    }
    is(computing) {
      // n - semiWidth, N=2*n - width
      // x*y = (x1 * 2^n + x0) * (y1 * 2^n + y0) =
      // [stage1]: x1 * y1 << N +
      // [stage2]: x0 * y1 << n +
      // [stage3]: x1 * y0 << n +
      // [stage4]: x0 * y0 << 1

      switch(multStageReg) {
        is(stage1) {
          xMul := x1
          yMul := y1
          resReg := resMul << N.U

          multStageReg := stage2
        }
        is(stage2) {
          xMul := x0
          yMul := y1
          resReg := resReg + (resMul << n.U)

          multStageReg := stage3
        }
        is(stage3) {
          xMul := x1
          yMul := y0
          resReg := resReg + (resMul << n.U)

          multStageReg := stage4
        }
        is(stage4) {
          xMul := x0
          yMul := y0
          resReg := resReg + resMul

          multStageReg := stage1
          stateReg := waitingOutput
        }
      }
    }
    is(waitingOutput) {
      when(io.out.ready) {
        stateReg := waitingInput
      }
    }
  }
}