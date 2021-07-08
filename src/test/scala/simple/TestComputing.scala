package simple

import chisel3._
import chisel3.iotesters._
import elastic.simple.Computing

object TestComputing extends App {
  def module = new Computing(N = 8)
  val name = "Computing"
  val dirName = "tested/" + name

  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchComputing(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

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
