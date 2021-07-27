package des

import chisel3._
import chisel3.iotesters._
import elastic.DES_Pipelined._

object TestDES_DecryptionPipelined extends App {
  def module = new DES_Pipelined(encrypt = false)
  val name = "DES_DecryptionPipelined"
  val dirName = "tested/" + name

  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchDES_DecryptionPipelined(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

class TestBenchDES_DecryptionPipelined(dut: DES_Pipelined) extends PeekPokeTester(dut) {
  step(10)
  poke(dut.io.result.ready, true.B)
  poke(dut.io.in.valid, true.B)

  poke(dut.io.in.bits.text, "h85E813540F0AB405".U)
  poke(dut.io.in.bits.key, "h133457799BBCDFF1".U)
  step(1)

  poke(dut.io.in.bits.text, "h94d4436bc3b5b693".U)
  poke(dut.io.in.bits.key, "h3132333435363738".U)
  step(1)

  poke(dut.io.in.bits.text, "h71d05d44594773b0".U)
  poke(dut.io.in.bits.key, "h3132333435363738".U)
  step(1)

  poke(dut.io.in.bits.text, "h8a48430bb561b872".U)
  poke(dut.io.in.bits.key, "h3837363534333231".U)
  step(1)

  poke(dut.io.in.bits.text, "h710b7ccbb95ca673".U)
  poke(dut.io.in.bits.key, "h3837363534333231".U)
  step(1)

  poke(dut.io.in.bits.text, "h85E813540F0AB405".U)
  poke(dut.io.in.bits.key, "h133457799BBCDFF1".U)
  step(1)

  poke(dut.io.in.valid, false.B)

  step(100)
}
