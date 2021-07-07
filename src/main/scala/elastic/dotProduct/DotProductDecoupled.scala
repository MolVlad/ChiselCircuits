package elastic.dotProduct

import chisel3._
import chisel3.util._

class DotProductDecoupled(width: Int = 32, N: Int = 8) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new Bundle {
      val x = SInt(width.W)
      val y = SInt(width.W)
    }))
    val out = new DecoupledIO(SInt(width.W))
  })

  val waitingInput :: sending :: reading :: waitingOutput :: resetting :: Nil = Enum(5)
  val stateReg = RegInit(waitingInput)
  val xReg = RegInit(0.S(width.W))
  val yReg = RegInit(0.S(width.W))
  val resReg = RegInit(0.S(width.W))
  val cntReg = RegInit(1.U((log2Ceil(N) + 1).W))

  val pe = Module(new DecoupledMultiplyAndAccumulate(width))
  pe.io.in.bits.x := 0.S
  pe.io.in.bits.y := 0.S
  pe.io.in.bits.reset := false.B
  pe.io.in.valid := (stateReg === sending) || (stateReg === resetting)
  pe.io.out.ready := stateReg === reading

  io.out.bits := resReg
  io.in.ready := stateReg === waitingInput
  io.out.valid := stateReg === waitingOutput

  switch(stateReg) {
    is(waitingInput) {
      when(io.in.valid) {
        xReg := io.in.bits.x
        yReg := io.in.bits.y
        stateReg := sending
      }
    }
    is(sending) {
      when(pe.io.in.ready)
      {
        pe.io.in.bits.x := xReg
        pe.io.in.bits.y := yReg

        cntReg := cntReg + 1.U
        when(cntReg === N.U) {
          stateReg := reading
        } .otherwise {
          stateReg := waitingInput
        }
      }
    }
    is(reading) {
      when(pe.io.out.valid) {
        resReg := pe.io.out.bits
        stateReg := waitingOutput
      }
    }
    is(waitingOutput) {
      when(io.out.ready) {
        cntReg := 1.U
        stateReg := resetting
      }
    }
    is(resetting) {
      when(pe.io.in.ready) {
        pe.io.in.bits.reset := true.B
        stateReg := waitingInput
      }
    }
  }
}

class DecoupledMultiplyAndAccumulate(width: Int = 32) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new Bundle {
      val x = Input(SInt(width.W))
      val y = Input(SInt(width.W))
      val reset = Input(Bool())
    }))
    val out = new DecoupledIO(SInt(width.W))
  })

  val waiting :: computing :: Nil = Enum(2)
  val stateReg = RegInit(waiting)
  val xReg = RegInit(0.S(width.W))
  val yReg = RegInit(0.S(width.W))
  val resetReg = RegInit(false.B)
  val accReg = RegInit(0.S(width.W))

  io.out.bits := accReg
  io.in.ready := stateReg === waiting
  io.out.valid := stateReg === waiting

  switch(stateReg) {
    is(waiting) {
      when(io.in.valid) {
        xReg := io.in.bits.x
        yReg := io.in.bits.y
        resetReg := io.in.bits.reset

        stateReg := computing
      }
    }
    is(computing) {
      stateReg := waiting

      when (resetReg) {
        accReg := 0.S
      } .otherwise {
        accReg := accReg + xReg * yReg
      }
    }
  }
}

