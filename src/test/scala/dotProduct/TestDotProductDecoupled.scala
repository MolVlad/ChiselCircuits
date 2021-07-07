package dotProduct

import chisel3._
import chisel3.iotesters._
import elastic.dotProduct.DotProductDecoupled

object TestDotProductDecoupled extends App {
  def module = new DotProductDecoupled(N = 2)
  val name = "DotProductDecoupled"
  val dirName = "tested/" + name

  println("[{(Running test bench "+name+")}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchDotProductDecoupled(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

class TestBenchDotProductDecoupled(dut: DotProductDecoupled) extends PeekPokeTester(dut) {
  poke(dut.io.out.ready, true.B)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.x, 10.S)
  poke(dut.io.in.bits.y, 5.S)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(3)
  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.x, 10.S)
  poke(dut.io.in.bits.y, -1.S)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(50)
}
