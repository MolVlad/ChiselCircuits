package simple

import chisel3._
import chisel3.iotesters._
import elastic.simple.Computing

// Test for module Computing. Generates waveforms, verilog code and fir file
object TestComputing extends App {
  def module = new Computing(N = 8) // define calling module for convenience
  val name = "Computing" // name of output files
  val dirName = "tested/" + name // directory of output files

  // execute test bench for generating waveforms
  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchComputing(c)}

  // generate verilog code
  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

// test bench with poke functions for generating waveforms
class TestBenchComputing(dut: Computing) extends PeekPokeTester(dut) {
  poke(dut.io.out.ready, true.B)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.x, 10.S)
  poke(dut.io.in.bits.y, 5.S)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(15)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.x, 1.S)
  poke(dut.io.in.bits.y, 0.S)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(10)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.x, 0.S)
  poke(dut.io.in.bits.y, 1.S)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(50)
}
