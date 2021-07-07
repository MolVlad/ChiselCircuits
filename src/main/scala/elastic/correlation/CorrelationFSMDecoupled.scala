package elastic.correlation

import chisel3._
import chisel3.util._

class CorrelationFSMDecoupled(width: Int = 32) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(SInt(width.W)))
    val out = new DecoupledIO(SInt(width.W))
  })

  val waitingInput :: sending :: reading :: waitingOutput :: resetting :: Nil = Enum(5)

  val stateReg = RegInit(waitingInput)

  val computingStage1 :: computingStage2 :: computingStage3 :: Nil = Enum(3)
  val computingStageReg = RegInit(computingStage1)

  val x0Reg = RegInit(0.S(width.W))
  val x1Reg = RegInit(0.S(width.W))
  val x2Reg = RegInit(0.S(width.W))

  val w0Reg = RegInit(Weights.weights(0))
  val w1Reg = RegInit(Weights.weights(1))
  val w2Reg = RegInit(Weights.weights(2))

  val resReg = RegInit(0.S(width.W))
  io.out.bits := resReg

  val pe = Module(new DecoupledMultiplyAndAccumulate(width))

  io.in.ready := stateReg === waitingInput
  io.out.valid := stateReg === waitingOutput

  pe.io.in.bits.x := 0.S
  pe.io.in.bits.y := 0.S
  pe.io.in.bits.reset := false.B
  pe.io.in.valid := (stateReg === sending) || (stateReg === resetting)
  pe.io.out.ready := stateReg === reading

  switch(stateReg) {
    is(waitingInput) {
      when(io.in.valid) {
        x0Reg := x1Reg
        x1Reg := x2Reg
        x2Reg := io.in.bits
        stateReg := sending
        computingStageReg := computingStage1
      }
    }
    is(sending) {
      switch(computingStageReg) {
        is(computingStage1) {
          pe.io.in.bits.x := x0Reg
          pe.io.in.bits.y := w0Reg
        }
        is(computingStage2) {
          pe.io.in.bits.x := x1Reg
          pe.io.in.bits.y := w1Reg
        }
        is(computingStage3) {
          pe.io.in.bits.x := x2Reg
          pe.io.in.bits.y := w2Reg
        }
      }
      when(pe.io.in.ready) {
        stateReg := reading
      }
    }
    is(reading) {
      when(pe.io.out.valid) {
        resReg := pe.io.out.bits

        switch(computingStageReg) {
          is(computingStage1) {
            computingStageReg := computingStage2
            stateReg := sending
          }
          is(computingStage2) {
            computingStageReg := computingStage3
            stateReg := sending
          }
          is(computingStage3) {
            stateReg := waitingOutput
          }
        }
      }
    }
    is(waitingOutput) {
      when(io.out.ready) {
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

