package elastic.dotProduct

import chisel3._
import chisel3.util._

class DotProductDoubleSync(width: Int = 32, N: Int = 8) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new Bundle {
      val x = SInt(width.W)
      val y = SInt(width.W)
    }))
    val out = new DecoupledIO(SInt(width.W))
  })

  val waitingInput :: computing :: waitingComputed :: waitingOutput :: Nil = Enum(4)
  val stateReg = RegInit(waitingInput)
  val xReg = RegInit(0.S(width.W))
  val yReg = RegInit(0.S(width.W))
  val cntReg = RegInit(1.U((log2Ceil(N) + 1).W))

  val pe = Module(new SynchronizedMultiplyAndAccumulate(width))
  pe.io.x := 0.S
  pe.io.y := 0.S
  pe.io.reset := false.B
  io.out.bits := pe.io.out

  io.in.ready := stateReg === waitingInput
  io.out.valid := stateReg === waitingOutput

  switch(stateReg) {
    is(waitingInput) {
      when(io.in.valid) {
        xReg := io.in.bits.x
        yReg := io.in.bits.y
        stateReg := computing
      }
    }
    is(computing) {
      pe.io.x := xReg
      pe.io.y := yReg
      stateReg := waitingComputed
    }
    is(waitingComputed) {
      cntReg := cntReg + 1.U

      when(cntReg === N.U) {
        stateReg := waitingOutput
      } .otherwise {
        stateReg := waitingInput
      }
    }
    is(waitingOutput) {
      when(io.out.ready) {
        cntReg := 1.U
        pe.io.reset := true.B
        stateReg := waitingInput
      }
    }
  }
}

class SynchronizedMultiplyAndAccumulate(width: Int = 32) extends  Module {
  val io = IO(new Bundle {
    val x = Input(SInt(width.W))
    val y = Input(SInt(width.W))
    val reset = Input(Bool())
    val out = Output(SInt(width.W))
  })

  val xReg = RegNext(io.x, 0.S)
  val yReg = RegNext(io.y, 0.S)
  val resetReg = RegNext(io.reset, false.B)

  val accReg = RegInit(0.S(width.W))
  io.out := accReg

  when (resetReg) {
    accReg := 0.S
  } .otherwise {
    accReg := accReg + xReg * yReg
  }
}
