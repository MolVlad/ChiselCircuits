package elastic.md4

import chisel3._
import chisel3.util._

class changeWordOrder extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(32.W))
    val out = Output(UInt(32.W))
  })

  val byte0, byte1, byte2, byte3 = Wire(UInt(8.W))
  byte0 := io.in(7,0)
  byte1 := io.in(15,8)
  byte2 := io.in(23,16)
  byte3 := io.in(31,24)

  io.out := Cat(byte0, byte1, byte2, byte3)
}