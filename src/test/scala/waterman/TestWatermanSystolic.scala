package waterman

import chisel3._
import chisel3.iotesters._
import elastic.waterman.DNA.Elements
import elastic.waterman._

object TestWatermanSystolic extends App {
  def module = new WatermanSystolic(rowsNumber = 4, columnsNumber = 4)
//  def module = new WatermanSystolic(rowsNumber = 15, columnsNumber = 21)
  val name = "WatermanSystolic"
  val dirName = "tested/" + name

  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchWatermanSystolicSimple(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

class TestBenchWatermanSystolicSimple(dut: WatermanSystolic) extends PeekPokeTester(dut) {
  poke(dut.io.out(0).ready, true.B)
  poke(dut.io.out(1).ready, true.B)
  poke(dut.io.out(2).ready, true.B)
  poke(dut.io.out(3).ready, true.B)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.S(0), Elements.A)
  poke(dut.io.in.bits.S(1), Elements.G)
  poke(dut.io.in.bits.S(2), Elements.C)
  poke(dut.io.in.bits.S(3), Elements.T)
  poke(dut.io.in.bits.T(0), Elements.A)
  poke(dut.io.in.bits.T(1), Elements.G)
  poke(dut.io.in.bits.T(2), Elements.C)
  poke(dut.io.in.bits.T(3), Elements.A)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(15)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.S(0), Elements.A)
  poke(dut.io.in.bits.S(1), Elements.G)
  poke(dut.io.in.bits.S(2), Elements.C)
  poke(dut.io.in.bits.S(3), Elements.T)
  poke(dut.io.in.bits.T(0), Elements.A)
  poke(dut.io.in.bits.T(1), Elements.G)
  poke(dut.io.in.bits.T(2), Elements.C)
  poke(dut.io.in.bits.T(3), Elements.T)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(50)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.S(0), Elements.A)
  poke(dut.io.in.bits.S(1), Elements.C)
  poke(dut.io.in.bits.S(2), Elements.T)
  poke(dut.io.in.bits.S(3), Elements.A)
  poke(dut.io.in.bits.T(0), Elements.G)
  poke(dut.io.in.bits.T(1), Elements.A)
  poke(dut.io.in.bits.T(2), Elements.T)
  poke(dut.io.in.bits.T(3), Elements.G)
  step(1)
  poke(dut.io.in.valid, false.B)

  step(50)
}

class TestBenchWatermanSystolicHard(dut: WatermanSystolic) extends PeekPokeTester(dut) {
  for (i <- 0 until 15) {
    poke(dut.io.out(i).ready, true.B)
  }

  poke(dut.io.in.valid, true.B)

  poke(dut.io.in.bits.S(0), Elements.T)
  poke(dut.io.in.bits.S(1), Elements.G)
  poke(dut.io.in.bits.S(2), Elements.T)
  poke(dut.io.in.bits.S(3), Elements.T)
  poke(dut.io.in.bits.S(4), Elements.A)
  poke(dut.io.in.bits.S(5), Elements.C)
  poke(dut.io.in.bits.S(6), Elements.G)
  poke(dut.io.in.bits.S(7), Elements.G)
  poke(dut.io.in.bits.S(8), Elements.T)
  poke(dut.io.in.bits.S(9), Elements.T)
  poke(dut.io.in.bits.S(10), Elements.A)
  poke(dut.io.in.bits.S(11), Elements.A)
  poke(dut.io.in.bits.S(12), Elements.A)
  poke(dut.io.in.bits.S(13), Elements.G)
  poke(dut.io.in.bits.S(14), Elements.C)
  poke(dut.io.in.bits.S(15), Elements.T)
  poke(dut.io.in.bits.S(16), Elements.A)
  poke(dut.io.in.bits.S(17), Elements.G)
  poke(dut.io.in.bits.S(18), Elements.C)
  poke(dut.io.in.bits.S(19), Elements.T)
  poke(dut.io.in.bits.S(20), Elements.A)

  poke(dut.io.in.bits.T(0), Elements.G)
  poke(dut.io.in.bits.T(1), Elements.G)
  poke(dut.io.in.bits.T(2), Elements.T)
  poke(dut.io.in.bits.T(3), Elements.T)
  poke(dut.io.in.bits.T(4), Elements.G)
  poke(dut.io.in.bits.T(5), Elements.A)
  poke(dut.io.in.bits.T(6), Elements.C)
  poke(dut.io.in.bits.T(7), Elements.T)
  poke(dut.io.in.bits.T(8), Elements.A)
  poke(dut.io.in.bits.T(9), Elements.G)
  poke(dut.io.in.bits.T(10), Elements.C)
  poke(dut.io.in.bits.T(11), Elements.T)
  poke(dut.io.in.bits.T(12), Elements.T)
  poke(dut.io.in.bits.T(13), Elements.A)
  poke(dut.io.in.bits.T(14), Elements.G)

  step(1)
  poke(dut.io.in.valid, false.B)

  step(1000)
}
