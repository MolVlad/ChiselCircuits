package md4

import chisel3._
import chisel3.iotesters._
import elastic.MD4FSM._

// Test for module TestMD4. Generates waveforms, verilog code and fir file
object TestMD4 extends App {
  def module = new MD4FSM // define calling module for convenience
  val name = "MD4FSM" // name of output files
  val dirName = "tested/" + name // directory of output files

  // execute test bench for generating waveforms
  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchMD4FSM(c)}

  // generate verilog code
  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

// test bench with poke functions for generating waveforms
class TestBenchMD4FSM(dut: MD4FSM) extends PeekPokeTester(dut) {
  poke(dut.io.hash.ready, true.B)

  poke(dut.io.extraDataNum.valid, true.B)
  poke(dut.io.extraDataNum.bits, 0.U)
  step(1)
  poke(dut.io.extraDataNum.valid, false.B)

  poke(dut.io.data.valid, true.B)
  poke(dut.io.data.bits, "h61800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000000000000".U)
  step(1)
  poke(dut.io.data.valid, false.B)

  step(100)

  poke(dut.io.extraDataNum.valid, true.B)
  poke(dut.io.extraDataNum.bits, 1.U)
  step(1)
  poke(dut.io.extraDataNum.valid, false.B)

  poke(dut.io.data.valid, true.B)
  poke(dut.io.data.bits, "h61303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030".U)
  step(1)
  poke(dut.io.data.valid, false.B)

  step(100)

  poke(dut.io.data.valid, true.B)
  poke(dut.io.data.bits, "h30303030306180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003002000000000000".U)
  step(1)
  poke(dut.io.data.valid, false.B)

  step(100)

  poke(dut.io.extraDataNum.valid, true.B)
  poke(dut.io.extraDataNum.bits, 0.U)
  step(1)
  poke(dut.io.extraDataNum.valid, false.B)

  poke(dut.io.data.valid, true.B)
  poke(dut.io.data.bits, "h6173646b62686f7065716867703b6b6c6a73646667696f68675b65726a673b6b6173646a64666764647364666f6968656673646c6b5d5d80b801000000000000".U)
  step(1)
  poke(dut.io.data.valid, false.B)

  step(100)

  poke(dut.io.extraDataNum.valid, true.B)
  poke(dut.io.extraDataNum.bits, 0.U)
  poke(dut.io.data.valid, true.B)
  poke(dut.io.data.bits, "h6173646b62686f7065716867703b6b6c6a73646667696f68675b65726a673b6b6173646a64666764647364666f6968656673646c6b5d5d80b801000000000000".U)
  step(1)
  poke(dut.io.extraDataNum.valid, false.B)
  poke(dut.io.data.valid, false.B)


  step(1000)
}
