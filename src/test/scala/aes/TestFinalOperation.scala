package aes

import chisel3._
import chisel3.iotesters._
import elastic.AES_Pipelined._

object TestFinalOperation extends App {
  def module = new AES_FinalOperation
  val name = "AES_FinalOperation"
  val dirName = "tested/" + name

  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchFinalOperation(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

class TestBenchFinalOperation(dut: AES_FinalOperation) extends PeekPokeTester(dut) {
  step(10)

  poke(dut.io.in.valid, true.B)

  poke(dut.io.in.bits.state(0)(0), "he9".U)
  poke(dut.io.in.bits.state(0)(1), "h31".U)
  poke(dut.io.in.bits.state(0)(2), "h7d".U)
  poke(dut.io.in.bits.state(0)(3), "hb5".U)
  poke(dut.io.in.bits.state(1)(0), "hcb".U)
  poke(dut.io.in.bits.state(1)(1), "h32".U)
  poke(dut.io.in.bits.state(1)(2), "h2c".U)
  poke(dut.io.in.bits.state(1)(3), "h72".U)
  poke(dut.io.in.bits.state(2)(0), "h3d".U)
  poke(dut.io.in.bits.state(2)(1), "h2e".U)
  poke(dut.io.in.bits.state(2)(2), "h89".U)
  poke(dut.io.in.bits.state(2)(3), "h5f".U)
  poke(dut.io.in.bits.state(3)(0), "haf".U)
  poke(dut.io.in.bits.state(3)(1), "h09".U)
  poke(dut.io.in.bits.state(3)(2), "h07".U)
  poke(dut.io.in.bits.state(3)(3), "h94".U)

  poke(dut.io.in.bits.key(0)(0), "hd0".U)
  poke(dut.io.in.bits.key(0)(1), "h14".U)
  poke(dut.io.in.bits.key(0)(2), "hf9".U)
  poke(dut.io.in.bits.key(0)(3), "ha8".U)
  poke(dut.io.in.bits.key(1)(0), "hc9".U)
  poke(dut.io.in.bits.key(1)(1), "hee".U)
  poke(dut.io.in.bits.key(1)(2), "h25".U)
  poke(dut.io.in.bits.key(1)(3), "h89".U)
  poke(dut.io.in.bits.key(2)(0), "he1".U)
  poke(dut.io.in.bits.key(2)(1), "h3f".U)
  poke(dut.io.in.bits.key(2)(2), "h0c".U)
  poke(dut.io.in.bits.key(2)(3), "hc8".U)
  poke(dut.io.in.bits.key(3)(0), "hb6".U)
  poke(dut.io.in.bits.key(3)(1), "h63".U)
  poke(dut.io.in.bits.key(3)(2), "h0c".U)
  poke(dut.io.in.bits.key(3)(3), "ha6".U)

  step(100)
}
