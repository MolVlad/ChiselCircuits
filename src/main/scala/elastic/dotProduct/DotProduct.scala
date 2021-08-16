package elastic.dotProduct

import chisel3._
import chisel3.util._

class DotProduct(width: Int = 32, N: Int = 8) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new Bundle {
      val x = Vec(N, SInt(width.W))
      val y = Vec(N, SInt(width.W))
    }))
    val out = new DecoupledIO(SInt(width.W))
  })

  val xRegs = RegInit(VecInit(Seq.fill(N)(0.S(width.W))))
  val yRegs = RegInit(VecInit(Seq.fill(N)(0.S(width.W))))

  val waitingInput :: sending :: waitingComputation :: waitingOutput :: resetting :: Nil = Enum(5)
  val stateReg = RegInit(waitingInput)
  val cntReg = RegInit(0.U((log2Ceil(N) + 1).W))

//  val pe = Module(new FastDecoupledMultiplyAndAccumulate(width))
  val pe = Module(new DecoupledMultiplyAndAccumulate(width))

  pe.io.in.bits.x := 0.S
  pe.io.in.bits.y := 0.S
  pe.io.in.bits.reset := false.B
  pe.io.in.valid := (stateReg === sending) || (stateReg === resetting)
  pe.io.out.ready := stateReg === waitingComputation

  io.out.bits := pe.io.out.bits
  io.in.ready := stateReg === waitingInput
  io.out.valid := stateReg === waitingOutput

  switch(stateReg) {
    is(waitingInput) {
      when(io.in.valid) {
        for(i <- 0 until N) {
          xRegs(i) := io.in.bits.x(i)
        }
        for(i <- 0 until N) {
          yRegs(i) := io.in.bits.y(i)
        }
        cntReg := 0.U
        stateReg := sending
      }
    }
    is(sending) {
      when(pe.io.in.ready)
      {
        pe.io.in.bits.x := xRegs(cntReg)
        pe.io.in.bits.y := yRegs(cntReg)

        stateReg := waitingComputation
      }
    }
    is(waitingComputation) {
      when(pe.io.out.valid) {
        cntReg := cntReg + 1.U

        when(cntReg === (N-1).U) {
          stateReg := waitingOutput
        } .otherwise {
          stateReg := sending
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

class FastDecoupledMultiplyAndAccumulate(width: Int = 32) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new Bundle {
      val x = Input(SInt(width.W))
      val y = Input(SInt(width.W))
      val reset = Input(Bool())
    }))
    val out = new DecoupledIO(SInt(width.W))
  })

  val accReg = RegInit(0.S(width.W))

  io.out.bits := accReg
  io.in.ready := true.B
  io.out.valid := true.B

  when(io.in.valid) {
    when (io.in.bits.reset) {
      accReg := 0.S
    } .otherwise {
      accReg := accReg + io.in.bits.x * io.in.bits.y
    }
  }
}

