package waterman

import chisel3._
import chisel3.iotesters._
import elastic.waterman.DNA.Elements
import elastic.waterman.Waterman

object TestWaterman extends App {
  def module = new Waterman
  val name = "Waterman"
  val dirName = "tested/" + name

  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchWaterman(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

class TestBenchWaterman(dut: Waterman) extends PeekPokeTester(dut) {
  poke(dut.io.out.ready, true.B)

  poke(dut.io.x.valid, true.B)
  poke(dut.io.y.valid, true.B)
  poke(dut.io.x.bits, Elements.A)
  poke(dut.io.y.bits, Elements.G)
  step(1)
  poke(dut.io.x.valid, false.B)
  poke(dut.io.y.valid, false.B)

  step(5)

  poke(dut.io.x.valid, true.B)
  poke(dut.io.y.valid, true.B)
  poke(dut.io.x.bits, Elements.A)
  poke(dut.io.y.bits, Elements.A)
  step(1)
  poke(dut.io.x.valid, false.B)
  poke(dut.io.y.valid, false.B)

  step(50)
}
