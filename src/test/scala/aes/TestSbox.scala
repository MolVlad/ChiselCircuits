package aes

import chisel3._
import chisel3.iotesters._
import elastic.AES_Pipelined._

object TestSbox extends App {
  def module = new InvAES_S
  val name = "Sbox"
  val dirName = "tested/" + name

  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchSbox(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

class TestBenchSbox(dut: InvAES_S) extends PeekPokeTester(dut) {
  poke(dut.io.in, "h00".U)
  step(1)
  poke(dut.io.in, "h42".U)
  step(1)
  poke(dut.io.in, "h53".U)
  step(1)
  poke(dut.io.in, "hff".U)
  step(1)
  poke(dut.io.in, "hac".U)
  step(1)

  step(100)
}
