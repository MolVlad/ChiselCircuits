package elastic.dotProduct

import chisel3._
import chisel3.util._

class DotProduct(width: Int = 32, N: Int = 8) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new Bundle {
      val x = SInt(width.W)
      val y = SInt(width.W)
    }))
    val out = new DecoupledIO(SInt(width.W))
  })

  val waitingInput :: computing :: waitingOutput :: Nil = Enum(3)
  val stateReg = RegInit(waitingInput)
  val accReg = RegInit(0.S(width.W))
  val cntReg = RegInit(1.U((log2Ceil(N) + 1).W))

  io.in.ready := true.B
  io.out.valid := stateReg === waitingOutput
  io.out.bits := accReg

  switch(stateReg) {
    is(waitingInput) {
      io.in.ready := true.B
      when(io.in.valid) {
        accReg := io.in.bits.x * io.in.bits.y
        cntReg := 1.U
        stateReg := computing
      }
    }
    is(computing) {
      io.in.ready := true.B
      when(io.in.valid) {
        accReg := accReg + io.in.bits.x * io.in.bits.y
        cntReg := cntReg + 1.U
        when(cntReg === (N-1).U) {
          stateReg := waitingOutput
        }
      }
    }
    is(waitingOutput) {
      io.in.ready := io.out.ready

      when(io.out.ready) {
        when(io.in.valid) {
          accReg := io.in.bits.x * io.in.bits.y
          cntReg := 1.U
          stateReg := computing
        } .otherwise {
          stateReg := waitingInput
        }
      }
    }
  }
}
