package correlation

import chisel3._
import chisel3.iotesters._
import elastic.correlation._

object TestCorrelationSystolicDecoupled extends App {
  def module = new CorrelationSystolicDecoupled
  val name = "CorrelationSystolicDecoupled"
  val dirName = "tested/" + name

  println("[{(Running test bench "+name+")}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchCorrelationSystolicDecoupled(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

class TestBenchCorrelationSystolicDecoupled(dut: CorrelationSystolicDecoupled) extends PeekPokeTester(dut) {
  poke(dut.io.out.ready, true.B)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits, 1.S)
  step(1)
  poke(dut.io.in.valid, false.B)
  step(15)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits, -1.S)
  step(1)
  poke(dut.io.in.valid, false.B)
  step(15)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits, 1.S)
  step(1)
  poke(dut.io.in.valid, false.B)
  step(15)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits, 2.S)
  step(1)
  poke(dut.io.in.valid, false.B)
  step(15)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits, 1.S)
  step(1)
  poke(dut.io.in.valid, false.B)
  step(5)

  step(50)
}
