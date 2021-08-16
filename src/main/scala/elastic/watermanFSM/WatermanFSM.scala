package elastic.watermanFSM

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum
import chisel3.util.log2Ceil

class WatermanFSM(rowsNumber: Int = 4, columnsNumber: Int = 4) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new Bundle {
      val S = Vec(columnsNumber, Elements())
      val T = Vec(rowsNumber, Elements())
    }))
    val out = new DecoupledIO(new Bundle {
      val score = SInt(Scores.width.W)
      val x = UInt(log2Ceil(columnsNumber).W)
      val y = UInt(log2Ceil(rowsNumber).W)
    })
  })

  val SReg = RegInit(VecInit(Seq.fill(columnsNumber)(Elements.A)))
  val TReg = RegInit(VecInit(Seq.fill(rowsNumber)(Elements.A)))
  val rowsReg = RegInit(VecInit(Seq.fill(rowsNumber)(0.S(Scores.width.W))))
  val columnsReg = RegInit(VecInit(Seq.fill(columnsNumber + 1)(0.S(Scores.width.W))))
  val resultingColumnsReg = RegInit(VecInit(Seq.fill(columnsNumber)(0.S(Scores.width.W))))

  val waitingInput :: computing :: update :: waitingOutput :: Nil = Enum(4)
  val stateReg = RegInit(waitingInput)
  val cntColumnReg = RegInit(0.U((log2Ceil(columnsNumber) + 1).W))
  val cntRowReg = RegInit(0.U((log2Ceil(rowsNumber) + 1).W))
  val resReg = RegInit(0.S)

  val pe = Module(new calculateCell)
  pe.io.upper := DontCare
  pe.io.diagonal := DontCare
  pe.io.left := DontCare
  pe.io.rowElement := DontCare
  pe.io.columnElement := DontCare

  io.out.bits.x := cntColumnReg
  io.out.bits.y := cntRowReg
  io.out.bits.score := resReg
  io.out.valid := stateReg === waitingOutput
  io.in.ready := stateReg === waitingInput

  switch(stateReg) {
    is(waitingInput) {
      when(io.in.valid) {
        for (i <- 0 until columnsNumber) {
          SReg(i) := io.in.bits.S(i)
        }
        for (i <- 0 until rowsNumber) {
          TReg(i) := io.in.bits.T(i)
        }
        for (i <- 0 until (columnsNumber + 1)) {
          columnsReg(i) := 0.S
        }
        for (i <- 0 until rowsNumber) {
          rowsReg(i) := 0.S
        }
        for (i <- 0 until columnsNumber) {
          resultingColumnsReg(i) := 0.S
        }

        cntColumnReg := 0.U
        cntRowReg := 0.U
        stateReg := computing
      }
    }
    is(computing) {
      pe.io.upper := columnsReg(cntColumnReg + 1.U)
      pe.io.diagonal := columnsReg(cntColumnReg)
      pe.io.left := rowsReg(cntRowReg)
      pe.io.rowElement := TReg(cntRowReg)
      pe.io.columnElement := SReg(cntColumnReg)

      resReg := pe.io.out
      stateReg := waitingOutput
    }
    is(waitingOutput) {
      when(io.out.ready) {
        resultingColumnsReg(cntColumnReg) := resReg
        rowsReg(cntRowReg) := resReg

        when((cntColumnReg === (columnsNumber - 1).U) && (cntRowReg === (rowsNumber - 1).U)) {
          stateReg := waitingInput
        } .elsewhen(cntColumnReg === (columnsNumber - 1).U) {
          cntColumnReg := 0.U
          cntRowReg := cntRowReg + 1.U
          stateReg := update
        } .otherwise {
          cntColumnReg := cntColumnReg + 1.U
          stateReg := computing
        }
      }
    }
    is(update) {
      for (i <- 0 until columnsNumber) {
        columnsReg(i + 1) := resultingColumnsReg(i)
      }
      stateReg := computing
    }
  }
}

class substituteElements(width: Int = Scores.width) extends Module {
  val io = IO(new Bundle {
    val first = Input(Elements())
    val second = Input(Elements())
    val out = Output(SInt(width.W))
  })

  io.out := Scores.matchScore
  when (io.first === io.second) {
    io.out := Scores.matchScore
  } .otherwise {
    io.out := Scores.mismatchScore
  }
}

class calculateCell(width: Int = Scores.width) extends Module {
  val io = IO(new Bundle {
    val upper = Input(SInt(width.W))
    val left = Input(SInt(width.W))
    val diagonal = Input(SInt(width.W))
    val rowElement = Input(Elements())
    val columnElement = Input(Elements())

    val out = Output(SInt(width.W))
  })

  val substituteElements = Module(new substituteElements)
  substituteElements.io.first := io.rowElement
  substituteElements.io.second := io.columnElement

  val upper, diag, left, diagUpper, diagLeft, max = Wire(SInt(width.W))
  diag := io.diagonal + substituteElements.io.out
  upper := io.upper - Scores.gapScore
  left := io.left - Scores.gapScore

  when (diag > upper) {
    diagUpper := diag
  } .otherwise {
    diagUpper := upper
  }
  when (diag > left) {
    diagLeft := diag
  } .otherwise {
    diagLeft := left
  }
  when (diagLeft > diagUpper) {
    max := diagLeft
  } .otherwise {
    max := diagUpper
  }

  if (Scores.useLowerBound) {
    when (max > Scores.lowerBound) {
      io.out := max
    } .otherwise {
      io.out := Scores.lowerBound
    }
  } else {
    io.out := max
  }
}

class OutputData(val rowsNumber: Int, val columnsNumber: Int) extends  Bundle {
  val score = Output(SInt(Scores.width.W))
  val x = Output(UInt(log2Ceil(columnsNumber).W))
  val y = Output(UInt(log2Ceil(rowsNumber).W))
}

object Scores {
  val width = 32
  val matchScore = 1.S(2.W)
  val mismatchScore = -1.S(2.W)
  val gapScore = 2.S(3.W)
  val lowerBound = 0.S
  val useLowerBound = true
}

object Elements extends ChiselEnum {
  val A, G, C, T = Value
}
