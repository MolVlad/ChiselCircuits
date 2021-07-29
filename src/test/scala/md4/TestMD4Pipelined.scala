package md4

import chisel3._
import chisel3.iotesters._
import elastic.MD4Pipelined.MD4Pipelined

object TestMD4Pipelined extends App {
  def module = new MD4Pipelined
  val name = "MD4Pipelined"
  val dirName = "tested/" + name

  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchMD4Pipelined(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

class TestBenchMD4Pipelined(dut: MD4Pipelined) extends PeekPokeTester(dut) {
  poke(dut.io.hash.ready, true.B)
  poke(dut.io.in.valid, true.B)

  poke(dut.io.in.bits.A0, "h01234567".U)
  poke(dut.io.in.bits.B0, "h89abcdef".U)
  poke(dut.io.in.bits.C0, "hfedcba98".U)
  poke(dut.io.in.bits.D0, "h76543210".U)
  poke(dut.io.in.bits.X, "h80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000".U)
  step(1)
  poke(dut.io.in.bits.A0, "h01234567".U)
  poke(dut.io.in.bits.B0, "h89abcdef".U)
  poke(dut.io.in.bits.C0, "hfedcba98".U)
  poke(dut.io.in.bits.D0, "h76543210".U)
  poke(dut.io.in.bits.X, "h61800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000000000000".U)
  step(1)
  poke(dut.io.in.bits.A0, "h01234567".U)
  poke(dut.io.in.bits.B0, "h89abcdef".U)
  poke(dut.io.in.bits.C0, "hfedcba98".U)
  poke(dut.io.in.bits.D0, "h76543210".U)
  poke(dut.io.in.bits.X, "h61626380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001800000000000000".U)
  step(1)
  poke(dut.io.in.bits.A0, "h01234567".U)
  poke(dut.io.in.bits.B0, "h89abcdef".U)
  poke(dut.io.in.bits.C0, "hfedcba98".U)
  poke(dut.io.in.bits.D0, "h76543210".U)
  poke(dut.io.in.bits.X, "h6c6f6c80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001800000000000000".U)
  step(1)
  poke(dut.io.in.bits.A0, "h01234567".U)
  poke(dut.io.in.bits.B0, "h89abcdef".U)
  poke(dut.io.in.bits.C0, "hfedcba98".U)
  poke(dut.io.in.bits.D0, "h76543210".U)
  poke(dut.io.in.bits.X, "h31323335313233348000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000".U)
  step(1)
  poke(dut.io.in.bits.A0, "h01234567".U)
  poke(dut.io.in.bits.B0, "h89abcdef".U)
  poke(dut.io.in.bits.C0, "hfedcba98".U)
  poke(dut.io.in.bits.D0, "h76543210".U)
  poke(dut.io.in.bits.X, "h617364677265726761736662676b6a65776b726a673b77657267800000000000000000000000000000000000000000000000000000000000d000000000000000".U)
  step(1)
  poke(dut.io.in.bits.A0, "h01234567".U)
  poke(dut.io.in.bits.B0, "h89abcdef".U)
  poke(dut.io.in.bits.C0, "hfedcba98".U)
  poke(dut.io.in.bits.D0, "h76543210".U)
  poke(dut.io.in.bits.X, "h776567687577697270676873646a6765726b6c676a696577686765726a6572678000000000000000000000000000000000000000000000000001000000000000".U)

  step(1)
  poke(dut.io.in.valid, false.B)

  step(500)
}
