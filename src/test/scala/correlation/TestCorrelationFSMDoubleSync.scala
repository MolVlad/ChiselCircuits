package correlation

import chisel3._
import chisel3.iotesters._
import elastic.correlation._

object TestCorrelationFSMDoubleSync extends App {
  def module = new CorrelationFSMDoubleSync
  val name = "CorrelationFSMDoubleSync"
  val dirName = "tested/" + name

  println("[{(Running test bench "+name+")}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchCorrelationFSMDoubleSync(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

class TestBenchCorrelationFSMDoubleSync(dut: CorrelationFSMDoubleSync) extends PeekPokeTester(dut) {
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

  step(50)
}
