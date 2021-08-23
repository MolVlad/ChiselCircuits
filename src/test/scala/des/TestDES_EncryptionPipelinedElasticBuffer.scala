package des

import chisel3._
import chisel3.iotesters._
import elastic.DES_PipelinedElasticBuffer._

// Test for module DES_PipelinedElasticBuffer in encryption mode. Generates waveforms, verilog code and fir file
object TestDES_EncryptionPipelinedElasticBuffer extends App {
  def module = new DES_PipelinedElasticBuffer(encrypt = true) // define calling module for convenience, encrypt = true => encryption
  val name = "DES_EncryptionPipelinedElasticBuffer" // name of output files
  val dirName = "tested/" + name // directory of output files

  // execute test bench for generating waveforms
  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchDES_EncryptionPipelinedElasticBuffer(c)}

  // generate verilog code
  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

// test bench with poke functions for generating waveforms
class TestBenchDES_EncryptionPipelinedElasticBuffer(dut: DES_PipelinedElasticBuffer) extends PeekPokeTester(dut) {
  step(10)
  poke(dut.io.result.ready, true.B)
  poke(dut.io.in.valid, true.B)

  poke(dut.io.in.bits.text, "h0123456789ABCDEF".U)
  poke(dut.io.in.bits.key, "h133457799BBCDFF1".U)
  step(1)

  poke(dut.io.in.bits.text, "h6162636465666768".U)
  poke(dut.io.in.bits.key, "h3132333435363738".U)
  step(1)

  poke(dut.io.in.bits.text, "h7177657274797569".U)
  poke(dut.io.in.bits.key, "h3132333435363738".U)
  step(1)

  poke(dut.io.in.bits.text, "h6162636465666768".U)
  poke(dut.io.in.bits.key, "h3837363534333231".U)
  step(1)

  poke(dut.io.in.bits.text, "h7177657274797569".U)
  poke(dut.io.in.bits.key, "h3837363534333231".U)
  step(1)

  poke(dut.io.in.bits.text, "h0123456789ABCDEF".U)
  poke(dut.io.in.bits.key, "h133457799BBCDFF1".U)
  step(1)

  poke(dut.io.in.valid, false.B)

  step(100)
}
