package simple

import chisel3._
import chisel3.iotesters._
import elastic.simple.Rotation

// Test for module Rotation. Generates waveforms, verilog code and fir file
object TestRotation extends App {
  def module = new Rotation(8) // define calling module for convenience
  val name = "Rotation" // name of output files
  val dirName = "tested/" + name // directory of output files

  // execute test bench for generating waveforms
  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchRotation(c)}

  // generate verilog code
  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

// test bench with poke functions for generating waveforms
class TestBenchRotation(dut: Rotation) extends PeekPokeTester(dut) {
  poke(dut.io.out.ready, true.B)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits, "b1000".U)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(10)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits, "b0001".U)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(10)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits, "b0110".U)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(50)
}

