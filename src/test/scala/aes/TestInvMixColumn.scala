package aes

import chisel3._
import chisel3.iotesters._
import elastic.AES_Pipelined._

object TestInvMixColumn extends App {
  def module = new InvMixColumn
  val name = "InvMixColumn"
  val dirName = "tested/" + name

  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchInvMixColumn(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

class TestBenchInvMixColumn(dut: InvMixColumn) extends PeekPokeTester(dut) {
  poke(dut.io.in(0), "h8e".U)
  poke(dut.io.in(1), "h4d".U)
  poke(dut.io.in(2), "ha1".U)
  poke(dut.io.in(3), "hbc".U)
  step(1)
  poke(dut.io.in(0), "h9f".U)
  poke(dut.io.in(1), "hdc".U)
  poke(dut.io.in(2), "h58".U)
  poke(dut.io.in(3), "h9d".U)
  step(1)
  poke(dut.io.in(0), "h01".U)
  poke(dut.io.in(1), "h01".U)
  poke(dut.io.in(2), "h01".U)
  poke(dut.io.in(3), "h01".U)

  step(100)
}
