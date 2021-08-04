package aes

import chisel3._
import chisel3.iotesters._
import elastic.AES_Pipelined._

object TestInitialOperation extends App {
  def module = new AES_InitialOperation
  val name = "AES_InitialOperation"
  val dirName = "tested/" + name

  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchInitialOperation(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

class TestBenchInitialOperation(dut: AES_InitialOperation) extends PeekPokeTester(dut) {
  step(10)

  poke(dut.io.in.valid, true.B)
  poke(dut.io.in.bits.text, "h3243f6a8885a308d313198a2e0370734".U)
  poke(dut.io.in.bits.key, "h2b7e151628aed2a6abf7158809cf4f3c".U)

  step(100)
}
