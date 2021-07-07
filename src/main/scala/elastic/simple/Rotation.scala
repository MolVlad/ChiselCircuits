package elastic.simple

import chisel3._
import chisel3.util._

class Rotation(width: Int = 4, N: Int = 8) extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(UInt(width.W))
    val in = Flipped(new DecoupledIO(UInt(width.W)))
  })

  val waitingInput :: computing :: waitingOutput :: Nil = Enum (3)
  val stateReg = RegInit(waitingInput)
  val dataReg = RegInit(0.U(width.W))
  val cntReg = RegInit(0.U((log2Ceil(N)+1).W))

  io.in.ready := stateReg === waitingInput
  io.out.valid := stateReg === waitingOutput
  io.out.bits := dataReg

  switch (stateReg) {
    is (waitingInput) {
      when (io.in.valid) {
        dataReg := io.in.bits
        cntReg := 1.U
        stateReg := computing
      }
    }
    is (computing) {
      dataReg := Cat(dataReg(0), dataReg(width - 1, 1))

      when (cntReg === N.U) {
        stateReg := waitingOutput
      } .otherwise {
        cntReg := cntReg + 1.U
      }
    }
    is (waitingOutput) {
      when (io.out.ready) {
        stateReg := waitingInput
      }
    }
  }
}