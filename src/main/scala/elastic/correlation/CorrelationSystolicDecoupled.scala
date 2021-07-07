package elastic.correlation

import chisel3._
import chisel3.util._

class CorrelationSystolicDecoupled(width: Int = 32) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(SInt(width.W)))
    val out = new DecoupledIO(SInt(width.W))
  })

  val waitingInput :: sending :: reading :: waitingOutput :: Nil = Enum(4)
  val stateReg = RegInit(waitingInput)

  val resReg = RegInit(0.S(width.W))
  io.out.bits := resReg
  io.in.ready := stateReg === waitingInput
  io.out.valid := stateReg === waitingOutput

  val pe0 = Module(new DecoupledPE(width))
  val pe1 = Module(new DecoupledPE(width))
  val pe2 = Module(new DecoupledPE(width))

  pe0.io.in.bits.prev := 0.S
  pe1.io.in.bits.prev := pe0.io.out.bits
  pe2.io.in.bits.prev := pe1.io.out.bits

  pe0.io.in.bits.w := Weights.weights(0)
  pe1.io.in.bits.w := Weights.weights(1)
  pe2.io.in.bits.w := Weights.weights(2)

  val xReg = RegInit(0.S(width.W))
  pe0.io.in.bits.x := xReg
  pe1.io.in.bits.x := xReg
  pe2.io.in.bits.x := xReg

  pe0.io.in.valid := stateReg === sending
  pe1.io.in.valid := pe0.io.out.valid
  pe2.io.in.valid := pe1.io.out.valid

  pe0.io.out.ready := pe1.io.in.ready
  pe1.io.out.ready := pe2.io.in.ready
  pe2.io.out.ready := stateReg === reading

  switch(stateReg) {
    is(waitingInput) {
      when(io.in.valid) {
        xReg := io.in.bits
        stateReg := sending
      }
    }
    is(sending) {
      when(pe0.io.in.ready) {
        stateReg := reading
      }
    }
    is(reading) {
      when(pe2.io.out.valid) {
        resReg := pe2.io.out.bits
        stateReg := waitingOutput
      }
    }
    is(waitingOutput) {
      when(io.out.ready) {
        stateReg := waitingInput
      }
    }
  }
}

class DecoupledPE(width: Int = 32) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new Bundle {
      val x = Input(SInt(width.W))
      val w = Input(SInt(width.W))
      val prev = Input(SInt(width.W))
    }))
    val out = new DecoupledIO(SInt(width.W))
  })

  val waitingInput :: computing :: waitingOutput :: Nil = Enum(3)
  val stateReg = RegInit(waitingInput)
  val xReg = RegInit(0.S(width.W))
  val wReg = RegInit(0.S(width.W))
  val prevReg = RegInit(0.S(width.W))
  val accReg = RegInit(0.S(width.W))
  val resReg = RegInit(0.S(width.W))

  io.out.bits := resReg
  io.in.ready := stateReg === waitingInput
  io.out.valid := stateReg === waitingOutput

  switch(stateReg) {
    is(waitingInput) {
      when(io.in.valid) {
        xReg := io.in.bits.x
        wReg := io.in.bits.w
        prevReg := io.in.bits.prev

        stateReg := computing
      }
    }
    is(computing) {
      stateReg := waitingOutput
      accReg := prevReg
      resReg := accReg + xReg * wReg
    }
    is(waitingOutput) {
      when(io.out.ready) {
        stateReg := waitingInput
      }
    }
  }
}

