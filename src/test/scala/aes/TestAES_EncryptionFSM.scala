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
    c.io.out.initSink()
    c.io.out.setSinkClock(c.clock)

    c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h30303030303030303030303030303030".U, _.text -> "h6162636465666768696a6b6c6d6e6f70".U))
    c.io.out.expectDequeue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h379853138d43cf2b36790a8da77becb7".U, _.text -> "hd63e32ae28545fa649840e0a80a71d77".U))

    fork {
      c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h31323334353637383930717765727479".U, _.text -> "h617364676a6c3b6b65726e676861736a".U))
      c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h666b6a77656c6b6a68636f736d676c73".U, _.text -> "h6768706f6a6c3b686173696f68726f67".U))
      c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h6a7432393874343937356839696e7639".U, _.text -> "h3334696a67383073646f6e6770336f67".U))
      c.io.in.enqueue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h2b7e151628aed2a6abf7158809cf4f3c".U, _.text -> "h3243f6a8885a308d313198a2e0370734".U))
    }.fork {
      c.io.out.expectDequeue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h79ab839133ba852d1bd971f77fc4f9b2".U, _.text -> "h60abaf8450f1140638346425b0122f2e".U))
      c.io.out.expectDequeue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "h3bee7b2c6fd149c6e238f3fb5306bf8b".U, _.text -> "haab115ba56924f7c79511427ef2cce3d".U))
      c.io.out.expectDequeue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "hfa2b3bb1d657e7dbc20d291372b8ae3a".U, _.text -> "he6ac515b3d6d66142356adf5a5502b38".U))
      c.io.out.expectDequeue(chiselTypeOf(c.io.in.bits).Lit(_.key -> "hd014f9a8c9ee2589e13f0cc8b6630ca6".U, _.text -> "h3925841d02dc09fbdc118597196a0b32".U))
    }.join()
  }
}

class TestBenchAES_EncryptionFSM(dut: AES_EncryptionFSM) extends PeekPokeTester(dut) {
  poke(dut.io.out.ready, true.B)
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
