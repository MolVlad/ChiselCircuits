package md4

import chisel3._
import chisel3.iotesters._
import elastic.md4._

object TestMD4Pipelined extends App {
  def module = new md4Pipelined
  val name = "md4Pipelined"
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

class TestBenchMD4Pipelined(dut: md4Pipelined) extends PeekPokeTester(dut) {
  step(10)
  poke(dut.io.hash.ready, true.B)

  poke(dut.io.in.valid, true.B)

  poke(dut.io.in.bits.A0, "h11".U)
  poke(dut.io.in.bits.B0, "h11".U)
  poke(dut.io.in.bits.X, "h11".U)
  step(1)
  poke(dut.io.in.bits.A0, "h12".U)
  step(1)
  poke(dut.io.in.bits.A0, "h13".U)
  step(1)
  poke(dut.io.in.bits.A0, "h14".U)
  step(1)
  poke(dut.io.in.bits.A0, "h15".U)
  step(1)
  poke(dut.io.in.bits.A0, "h16".U)
  step(1)
  poke(dut.io.in.bits.A0, "h17".U)

  step(10)
  poke(dut.io.in.valid, false.B)

  step(100)
}
