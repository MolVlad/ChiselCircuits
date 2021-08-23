package dotProduct

import chisel3._
import chisel3.iotesters._
import elastic.dotProduct.DotProduct

// Test for module DotProduct. Generates waveforms, verilog code and fir file
object TestDotProduct extends App {
  def module = new DotProduct(N = 4) // define calling module for convenience
  val name = "DotProduct" // name of output files
  val dirName = "tested/" + name // directory of output files

  // execute test bench for generating waveforms
  println("[{(Running test bench "+name+")}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchDotProduct(c)}

  // generate verilog code
  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

// test bench with poke functions for generating waveforms
class TestBenchDotProduct(dut: DotProduct) extends PeekPokeTester(dut) {
  poke(dut.io.out.ready, true.B)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.x(0), 1.S)
  poke(dut.io.in.bits.y(0), 2.S)
  poke(dut.io.in.bits.x(1), 3.S)
  poke(dut.io.in.bits.y(1), 4.S)
  poke(dut.io.in.bits.x(2), 5.S)
  poke(dut.io.in.bits.y(2), 6.S)
  poke(dut.io.in.bits.x(3), 7.S)
  poke(dut.io.in.bits.y(3), 8.S)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(15)
  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.x(0), 1.S)
  poke(dut.io.in.bits.y(0), -1.S)
  poke(dut.io.in.bits.x(1), 2.S)
  poke(dut.io.in.bits.y(1), -1.S)
  poke(dut.io.in.bits.x(2), 3.S)
  poke(dut.io.in.bits.y(2), -1.S)
  poke(dut.io.in.bits.x(3), 4.S)
  poke(dut.io.in.bits.y(3), -1.S)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(50)
}
