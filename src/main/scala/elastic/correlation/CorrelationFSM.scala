package elastic.correlation

import chisel3._
import chisel3.util._
import elastic.correlation.Weights

class CorrelationFSM(width: Int = 32) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(SInt(width.W)))
    val out = new DecoupledIO(SInt(width.W))
  })

  val waitingInput :: computing :: waitingOutput :: Nil = Enum(3)
  val stateReg = RegInit(waitingInput)

  val computingStage1 :: computingStage2 :: computingStage3 :: Nil = Enum(3)
  val computingStageReg = RegInit(computingStage1)

  val x0Reg = RegInit(0.S(width.W))
  val x1Reg = RegInit(0.S(width.W))
  val x2Reg = RegInit(0.S(width.W))

  val w0Reg = RegInit(Weights.weights(0))
  val w1Reg = RegInit(Weights.weights(1))
  val w2Reg = RegInit(Weights.weights(2))

  val pe = Module(new MultiplyAndAccumulate(width))

  pe.io.x := 0.S
  pe.io.y := 0.S
  pe.io.reset := false.B
  io.out.bits := pe.io.out

  io.in.ready := stateReg === waitingInput
  io.out.valid := stateReg === waitingOutput

  switch(stateReg) {
    is(waitingInput) {
      when(io.in.valid) {
        x0Reg := x1Reg
        x1Reg := x2Reg
        x2Reg := io.in.bits
        stateReg := computing
        computingStageReg := computingStage1
      }
    }
    is(computing) {
      switch(computingStageReg) {
        is(computingStage1) {
          pe.io.x := x0Reg
          pe.io.y := w0Reg
          computingStageReg := computingStage2
        }
        is(computingStage2) {
          pe.io.x := x1Reg
          pe.io.y := w1Reg
          computingStageReg := computingStage3
        }
        is(computingStage3) {
          pe.io.x := x2Reg
          pe.io.y := w2Reg
          stateReg := waitingOutput
        }
      }
    }
    is(waitingOutput) {
      when(io.out.ready) {
        pe.io.reset := true.B
        stateReg := waitingInput
      }
    }
  }
}

class MultiplyAndAccumulate(width: Int = 32) extends  Module {
  val io = IO(new Bundle {
    val x = Input(SInt(width.W))
    val y = Input(SInt(width.W))
    val reset = Input(Bool())
    val out = Output(SInt(width.W))
  })

  val accReg = RegInit(0.S(width.W))
  io.out := accReg

  when (io.reset) {
    accReg := 0.S
  } .otherwise {
    accReg := accReg + io.x * io.y
  }
}

