package des

import chisel3._
import chisel3.iotesters._
import elastic.DES_Pipelined._
import chisel3.tester.RawTester.test
import chisel3.tester._
import chisel3.experimental.BundleLiterals._

// Test for module DES_Pipelined in encryption mode. Generates waveforms, verilog code and fir file
object TestDES_EncryptionPipelined extends App {
  def module = new DES_Pipelined(encrypt = true) // define calling module for convenience, encrypt = true => encryption
  val name = "DES_EncryptionPipelined" // name of output files
  val dirName = "tested/" + name // directory of output files

  // execute test bench for generating waveforms
  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchDES_EncryptionPipelined(c)}

  // generate verilog code
  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )

  // tester
  test(module) {c =>
    // boilerplate code
    c.io.in.initSource()
    c.io.in.setSourceClock(c.clock)
    c.io.result.initSink()
    c.io.result.setSinkClock(c.clock)

    // put input data when input ready is high
    c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h3132333435363738".U, _.text -> "h6162636465666768".U))
    // take output data when output valid is high and compare this with true value
    c.io.result.expectDequeue("h94d4436bc3b5b693".U)

    // two threads: one for putting data when input ready is high, another for taking result when output valid is high
    fork {
      c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h3132333435363738".U, _.text -> "h7177657274797569".U))
      c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h3837363534333231".U, _.text -> "h6162636465666768".U))
      c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h3837363534333231".U, _.text -> "h7177657274797569".U))
    }.fork {
      c.io.result.expectDequeue("h71d05d44594773b0".U)
      c.io.result.expectDequeue("h8a48430bb561b872".U)
      c.io.result.expectDequeue("h710b7ccbb95ca673".U)
    }.join()
  }
}

// test bench with poke functions for generating waveforms
class TestBenchDES_EncryptionPipelined(dut: DES_Pipelined) extends PeekPokeTester(dut) {
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
