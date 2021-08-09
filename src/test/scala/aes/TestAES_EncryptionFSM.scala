package aes

import chisel3._
import chisel3.iotesters._
import elastic.AES_EncryptionFSM._
import chisel3.tester.RawTester.test
import chisel3.tester._
import chisel3.experimental.BundleLiterals._

object TestAES_EncryptionFSM extends App {
  def module = new AES_EncryptionFSM
  val name = "AES_EncryptionFSM"
  val dirName = "tested/" + name

  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver.execute(
    Array("-o", name, "--generate-vcd-output", "on", "--target-dir", dirName),
    () => module) { c => new TestBenchAES_EncryptionFSM(c)}

  println("[{(Generating Verilog file)}]")
  (new chisel3.stage.ChiselStage).emitVerilog(
    module,
    Array("-o", name, "--target-dir", dirName, "-foaf", name)
  )

  test(module) {c =>
    c.io.in.initSource()
    c.io.in.setSourceClock(c.clock)
    c.io.result.initSink()
    c.io.result.setSinkClock(c.clock)

    c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h30303030303030303030303030303030".U, _.text -> "h6162636465666768696a6b6c6d6e6f70".U))
    c.io.result.expectDequeue("hd63e32ae28545fa649840e0a80a71d77".U)

    fork {
      c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h31323334353637383930717765727479".U, _.text -> "h617364676a6c3b6b65726e676861736a".U))
      c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h666b6a77656c6b6a68636f736d676c73".U, _.text -> "h6768706f6a6c3b686173696f68726f67".U))
      c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h6a7432393874343937356839696e7639".U, _.text -> "h3334696a67383073646f6e6770336f67".U))
      c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h2b7e151628aed2a6abf7158809cf4f3c".U, _.text -> "h3243f6a8885a308d313198a2e0370734".U))
    }.fork {
      c.io.result.expectDequeue("h60abaf8450f1140638346425b0122f2e".U)
      c.io.result.expectDequeue("haab115ba56924f7c79511427ef2cce3d".U)
      c.io.result.expectDequeue("he6ac515b3d6d66142356adf5a5502b38".U)
      c.io.result.expectDequeue("h3925841d02dc09fbdc118597196a0b32".U)
    }.join()
  }
}

class TestBenchAES_EncryptionFSM(dut: AES_EncryptionFSM) extends PeekPokeTester(dut) {
  poke(dut.io.result.ready, true.B)
  poke(dut.io.in.valid, true.B)

  poke(dut.io.in.bits.text, "h3243f6a8885a308d313198a2e0370734".U)
  poke(dut.io.in.bits.key, "h2b7e151628aed2a6abf7158809cf4f3c".U)
  step(15)

  poke(dut.io.in.bits.text, "h6162636465666768696a6b6c6d6e6f70".U)
  poke(dut.io.in.bits.key, "h30303030303030303030303030303030".U)
  step(15)

  poke(dut.io.in.bits.text, "h617364676a6c3b6b65726e676861736a".U)
  poke(dut.io.in.bits.key, "h31323334353637383930717765727479".U)
  step(15)

  poke(dut.io.in.bits.text, "h6768706f6a6c3b686173696f68726f67".U)
  poke(dut.io.in.bits.key, "h666b6a77656c6b6a68636f736d676c73".U)
  step(15)

  poke(dut.io.in.bits.text, "h3334696a67383073646f6e6770336f67".U)
  poke(dut.io.in.bits.key, "h6a7432393874343937356839696e7639".U)
  step(15)

  poke(dut.io.in.valid, false.B)

  step(100)
}
