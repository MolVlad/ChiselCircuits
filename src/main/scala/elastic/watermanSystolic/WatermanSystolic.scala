package elastic.watermanSystolic

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum
import chisel3.util.log2Ceil

class WatermanSystolic(rowsNumber: Int = 4, columnsNumber: Int = 4) extends Module {
  require(rowsNumber <= columnsNumber)
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new Bundle {
      val S = Vec(columnsNumber, Elements())
      val T = Vec(rowsNumber, Elements())
    }))
    val out = Vec(rowsNumber, DecoupledIO(new OutputData(rowsNumber = rowsNumber, columnsNumber = columnsNumber)))
  })

  val waitingInput :: sending :: waitingLast :: Nil = Enum(3)
  val stateReg = RegInit(waitingInput)
  val stepReg = RegInit(0.U(log2Ceil(columnsNumber).W))
  val TReg = RegInit(VecInit(Seq.fill(rowsNumber)(Elements.A)))
  val SReg = RegInit(VecInit(Seq.fill(columnsNumber)(Elements.A)))
  val resetReg = RegInit(false.B)

  val PEs = VecInit(Seq.fill(rowsNumber) {
    Module(new processingElementDecoupled(rowsNumber = rowsNumber, columnsNumber = columnsNumber)).io
  })

  PEs(rowsNumber - 1).toNextPE.ready := true.B
  for (i <- 0 until rowsNumber) {
    if (i == 0) {
      PEs(i).fromPreviousPE.valid := stateReg === sending
      PEs(i).fromPreviousPE.bits.columnElement := SReg(0)
      PEs(i).fromPreviousPE.bits.upper := 0.S
      PEs(i).fromPreviousPE.bits.diagonal := 0.S
    } else {
      PEs(i - 1).toNextPE.ready := PEs(i).fromPreviousPE.ready
      PEs(i).fromPreviousPE.valid := PEs(i - 1).toNextPE.valid
      PEs(i).fromPreviousPE.bits.upper := PEs(i - 1).toNextPE.bits.upper
      PEs(i).fromPreviousPE.bits.diagonal := PEs(i - 1).toNextPE.bits.diagonal
      PEs(i).fromPreviousPE.bits.columnElement := PEs(i - 1).toNextPE.bits.columnElement
    }

    PEs(i).number := i.U
    PEs(i).rowElement := TReg(i)
    PEs(i).reset := resetReg

    io.out(i).bits.x := PEs(i).out.bits.x
    io.out(i).bits.y := PEs(i).out.bits.y
    io.out(i).bits.score := PEs(i).out.bits.score
    io.out(i).valid := PEs(i).out.valid
    PEs(i).out.ready := io.out(i).ready
  }

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
        resetReg := false.B
        stepReg := 0.U
        stateReg := sending
      }
    }
    is(sending) {
      when(PEs(0).fromPreviousPE.ready) {
        for (i <- 0 until (columnsNumber - 1)) {
          SReg(i) := SReg(i + 1)
        }
        stepReg := stepReg + 1.U
        when(stepReg === (columnsNumber - 1).U) {
          stateReg := waitingLast
        }
      }
    }
    is(waitingLast) {
      when((PEs(rowsNumber - 1).out.valid) && (PEs(rowsNumber - 1).out.bits.x === (rowsNumber - 1).U)) {
        resetReg := true.B
        stateReg := waitingInput
      }
    }
  }
}

class processingElementDecoupled(rowsNumber: Int, columnsNumber: Int, width: Int = Scores.width) extends Module {
  val io = IO(new Bundle {
    val fromPreviousPE = Flipped(new DecoupledIO(new Bundle {
      val upper = SInt(width.W)
      val diagonal = SInt(width.W)
      val columnElement = Elements()
    }))

    val rowElement = Input(Elements())
    val reset = Input(Bool())
    val number = Input(UInt(width.W))

    val out = new DecoupledIO(new OutputData(rowsNumber = rowsNumber, columnsNumber = columnsNumber))

    val toNextPE = new DecoupledIO(new Bundle {
      val upper = SInt(width.W)
      val diagonal = SInt(width.W)
      val columnElement = Elements()
    })
  })

  val waitingInput :: waitingOutput :: Nil = Enum(2)
  val stateReg = RegInit(waitingInput)
  val toNextPeValidReg = RegInit(false.B)
  val scoreValidReg = RegInit(false.B)
  val previousScore = RegInit(0.S(width.W))
  val leftReg = RegInit(0.S(width.W))
  val diagReg = RegInit(0.S(width.W))
  val upperReg = RegInit(0.S(width.W))
  val columnElementReg = RegInit(Elements.A)
  val stepReg = RegInit(0.U(log2Ceil(columnsNumber).W))

  val substituteElements = Module(new substituteElements)
  substituteElements.io.first := io.rowElement
  substituteElements.io.second := columnElementReg
  val upper, diag, left = Wire(SInt(width.W))
  val diagOrUpper, diagOrLeft, max, score = Wire(SInt(width.W))
  diag := diagReg + substituteElements.io.out
  upper := upperReg - Scores.gapScore
  left := leftReg - Scores.gapScore

  io.fromPreviousPE.ready := stateReg === waitingInput
  io.toNextPE.valid := toNextPeValidReg
  io.out.valid := scoreValidReg
  io.out.bits.score := score
  io.out.bits.y := io.number
  io.out.bits.x := stepReg
  io.toNextPE.bits.upper := score
  io.toNextPE.bits.diagonal := previousScore
  io.toNextPE.bits.columnElement := columnElementReg

  when(diag > upper) {
    diagOrUpper := diag
  }.otherwise {
    diagOrUpper := upper
  }
  when(diag > left) {
    diagOrLeft := diag
  }.otherwise {
    diagOrLeft := left
  }
  when(diagOrLeft > diagOrUpper) {
    max := diagOrLeft
  }.otherwise {
    max := diagOrUpper
  }

  if (Scores.useLowerBound) {
    when(max > Scores.lowerBound) {
      score := max
    }.otherwise {
      score := Scores.lowerBound
    }
  } else {
    score := max
  }

  when(io.reset) {
    previousScore := 0.S
    leftReg := 0.S
    stepReg := 0.U
    stateReg := waitingInput
  }.otherwise {
    switch(stateReg) {
      is(waitingInput) {
        when(io.fromPreviousPE.valid) {
          upperReg := io.fromPreviousPE.bits.upper
          diagReg := io.fromPreviousPE.bits.diagonal
          columnElementReg := io.fromPreviousPE.bits.columnElement

          scoreValidReg := true.B
          toNextPeValidReg := true.B
          stateReg := waitingOutput
        }
      }
      is(waitingOutput) {
        when(io.out.ready) {
          scoreValidReg := false.B
        }
        when(io.toNextPE.ready) {
          toNextPeValidReg := false.B
        }
        when(!(scoreValidReg || toNextPeValidReg)) {
          previousScore := score
          stateReg := waitingInput
          stepReg := stepReg + 1.U
          leftReg := score
        }
      }
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
