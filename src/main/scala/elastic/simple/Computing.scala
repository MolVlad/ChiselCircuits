package elastic.simple

import chisel3._
import chisel3.util._

class Computing(width: Int = 32, N: Int = 8) extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(new Vector2(w = width))
    val in = Flipped(new DecoupledIO(new Vector2(w = width)))
  })

  val waitingInput :: computing :: waitingOutput :: Nil = Enum(3)
  val stateReg = RegInit(waitingInput)
  val xReg = RegInit(0.S(width.W))
  val yReg = RegInit(0.S(width.W))
  val cntReg = RegInit(0.U((log2Ceil(N) + 1).W))

  io.in.ready := stateReg === waitingInput
  io.out.valid := stateReg === waitingOutput
  io.out.bits.x := xReg
  io.out.bits.y := yReg

  switch(stateReg) {
    is(waitingInput) {
      when(io.in.valid) {
        xReg := io.in.bits.x
        yReg := io.in.bits.y
        cntReg := 1.U
        stateReg := computing
      }
    }
    is(computing) {
      xReg := xReg * 5.S + yReg * 3.S
      yReg := xReg * 3.S - yReg * 2.S

      when(cntReg === N.U) {
        stateReg := waitingOutput
      }.otherwise {
        cntReg := cntReg + 1.U
      }
    }
    is(waitingOutput) {
      when(io.out.ready) {
        stateReg := waitingInput
      }
    }
  }
}

class Vector2 (val w: Int = 32) extends Bundle {
  val x = SInt(w.W)
  val y = SInt(w.W)
}