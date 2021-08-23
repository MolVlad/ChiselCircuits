package simple

import chisel3._
import chisel3.iotesters._
import elastic.simple.Multiplier

// Test for module Multiplier. Generates waveforms, verilog code and fir file
object TestMultiplier extends App {
  def module = new Multiplier(semiWidth = 2) // define calling module for convenience
  val name = "Multiplier" // name of output files
  val dirName = "tested/" + name // directory of output files

  // execute test bench for generating waveforms
  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchMultiplier(c)}

  // generate verilog code
  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

// test bench with poke functions for generating waveforms
class TestBenchMultiplier(dut: Multiplier) extends PeekPokeTester(dut) {
  poke(dut.io.out.ready, true.B)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.x, "b1111".U)
  poke(dut.io.in.bits.y, "b0110".U)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(5)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.x, "b0100".U)
  poke(dut.io.in.bits.y, "b1011".U)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(10)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.x, "b1111".U)
  poke(dut.io.in.bits.y, "b0000".U)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(10)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.x, "b0000".U)
  poke(dut.io.in.bits.y, "b1111".U)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(10)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.x, 2.U)
  poke(dut.io.in.bits.y, 1.U)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(10)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.x, "b0100".U)
  poke(dut.io.in.bits.y, "b1011".U)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(50)
}
