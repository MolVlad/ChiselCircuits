package aes

import chisel3._
import chisel3.iotesters._
import elastic.AES_Pipelined._

object TestMixColumn extends App {
  def module = new AES_MixColumn
  val name = "MixColumn"
  val dirName = "tested/" + name

  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchMixColumn(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

class TestBenchMixColumn(dut: AES_MixColumn) extends PeekPokeTester(dut) {
  poke(dut.io.in(0), "hdb".U)
  poke(dut.io.in(1), "h13".U)
  poke(dut.io.in(2), "h53".U)
  poke(dut.io.in(3), "h45".U)
  step(1)
  poke(dut.io.in(0), "hf2".U)
  poke(dut.io.in(1), "h0a".U)
  poke(dut.io.in(2), "h22".U)
  poke(dut.io.in(3), "h5c".U)
  step(1)
  poke(dut.io.in(0), "h01".U)
  poke(dut.io.in(1), "h01".U)
  poke(dut.io.in(2), "h01".U)
  poke(dut.io.in(3), "h01".U)

  step(100)
}
