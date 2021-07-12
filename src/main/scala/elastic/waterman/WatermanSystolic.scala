package elastic.waterman

import chisel3._
import chisel3.util._
import elastic.waterman.DNA._

class WatermanSystolic(rowsNumber: Int = 4, columnsNumber: Int = 4) extends Module {
  require(rowsNumber <= columnsNumber)
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new Bundle {
      val S = Vec(columnsNumber, Elements())
      val T = Vec(rowsNumber, Elements())
    }))
    val out = Vec(rowsNumber, DecoupledIO(new OutputData(rowsNumber = rowsNumber, columnsNumber = columnsNumber)))
  })

  val SReg = RegInit(VecInit(Seq.fill(columnsNumber)(Elements.A)))
  val columnsReg = RegInit(VecInit(Seq.fill(columnsNumber)(0.S(Scores.width.W))))
  val TReg = RegInit(VecInit(Seq.fill(rowsNumber)(Elements.A)))
  val rowsReg = RegInit(VecInit(Seq.fill(rowsNumber)(0.S(Scores.width.W))))
  val resReg = RegInit(VecInit(Seq.fill(rowsNumber)(0.S(Scores.width.W))))
  val diagReg = RegInit(VecInit(Seq.fill(rowsNumber)(0.S(Scores.width.W))))
  val intermDiagReg = RegInit(VecInit(Seq.fill(rowsNumber)(0.S(Scores.width.W))))
  val outValidReg = RegInit(VecInit(Seq.fill(rowsNumber)(false.B)))
  val stepReg = RegInit(0.S((log2Ceil(rowsNumber + columnsNumber) + 1).W))

  val waitingInput :: computing :: waitingOutput :: update :: Nil = Enum(4)
  val stateReg = RegInit(waitingInput)

  val PEs = VecInit(Seq.fill(rowsNumber) {
    Module(new calculateCell).io
  })

  for (i <- 0 until rowsNumber) {
    PEs(i).upper := columnsReg((stepReg - i.S).abs.asUInt)
    PEs(i).diagonal := diagReg(i.U)
    PEs(i).columnElement := SReg((stepReg - i.S).abs.asUInt)
    PEs(i).left := rowsReg(i)
    PEs(i).rowElement := TReg(i)
  }

  val leftForOutput = Module(new VectorElemOr(rowsNumber))
  leftForOutput.io.input := outValidReg

  for (i <- 0 until rowsNumber) {
    io.out(i).bits.x := (stepReg - i.S).abs.asUInt
    io.out(i).bits.y := i.U
    io.out(i).bits.score := resReg(i)
    io.out(i).valid := outValidReg(i)
  }
  io.in.ready := stateReg === waitingInput

  switch(stateReg) {
    is(waitingInput) {
      when(io.in.valid) {
        for (i <- 0 until columnsNumber) {
          SReg(i) := io.in.bits.S(i)
          columnsReg(i) := 0.S
        }
        for (i <- 0 until rowsNumber) {
          TReg(i) := io.in.bits.T(i)
          rowsReg(i) := 0.S
          diagReg(i) := 0.S
          intermDiagReg(i) := 0.S
        }
        stepReg := 0.S
        stateReg := computing
      }
    }
    is(computing) {
      for (i <- 0 until rowsNumber) {
        when((i.S >= (stepReg - columnsNumber.S + 1.S)) && (i.S <= stepReg)) {
          resReg(i) := PEs(i).out
          outValidReg(i) := true.B
        }
      }
      stateReg := waitingOutput
    }
    is(waitingOutput) {
      when(leftForOutput.io.out) {
        for (i <- 0 until rowsNumber) {
          when((i.S >= (stepReg - columnsNumber.S + 1.S)) && (i.S <= stepReg)) {
            when(io.out(i).ready) {
              outValidReg(i) := false.B
            }
          }
        }
      } .otherwise {
        stateReg := update
      }
    }
    is(update) {
      for (i <- 0 until rowsNumber) {
        when((i.S >= (stepReg - columnsNumber.S + 1.S)) && (i.S <= stepReg)) {
          columnsReg((stepReg - i.S).abs.asUInt) := resReg(i)
          rowsReg(i) := resReg(i)
          diagReg(i) := intermDiagReg(i)
          if(i != (rowsNumber - 1)) {
            intermDiagReg(i + 1) := resReg(i)
          }
        }
      }
      stepReg := stepReg + 1.S
      when(stepReg === (rowsNumber + columnsNumber - 2).S) {
        stateReg := waitingInput
      } .otherwise {
        stateReg := computing
      }
    }
  }
}

class OutputData(val rowsNumber: Int, val columnsNumber: Int) extends  Bundle {
  val score = Output(SInt(Scores.width.W))
  val x = Output(UInt(log2Ceil(columnsNumber).W))
  val y = Output(UInt(log2Ceil(rowsNumber).W))
}

class VectorElemOr(N: Int) extends Module {
  val io = IO (new Bundle {
    val input = Input(Vec(N, Bool()))
    val out = Output(Bool())
  })
  io.out := io.input.reduce(_ || _)
}