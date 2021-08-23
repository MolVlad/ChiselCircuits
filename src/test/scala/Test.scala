import chisel3.iotesters._
import chisel3._
import chisel3.util._

class Test extends Module {
  val io = IO(new Bundle {
    val A = Input(Bool())
    val B = Input(Bool())
    val data = Input(SInt(32.W))
    val output_valid = Input(Bool())
    val input_ready = Input(Bool())
    val out1 = Output(SInt(32.W))
    val out2 = Output(Bool())
  })

  io.out1 := io.data
  io.out2 := io.output_valid && io.input_ready && io.A && io.B
}

object Test extends App {
  def module = new Test
  val name = "Test"
  val dirName = "tested/" + name

  println("[{(Running test bench "+name+")}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBench(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )
}

class TestBench(dut: Test) extends PeekPokeTester(dut) {
  step(15)
  poke(dut.io.data, 15.S)
  poke(dut.io.output_valid, true.B)
  poke(dut.io.input_ready, true.B)
  step(1)
  poke(dut.io.data, 0.S)
  poke(dut.io.output_valid, false.B)
  poke(dut.io.input_ready, false.B)
  step(15)
  poke(dut.io.A, true.B)
  step(1)
  poke(dut.io.A, false.B)
  step(2)
  poke(dut.io.B, true.B)
  step(1)
  poke(dut.io.B, false.B)
  step(50)
}
