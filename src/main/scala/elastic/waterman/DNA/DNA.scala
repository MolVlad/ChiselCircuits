package elastic.waterman.DNA

import chisel3._
import chisel3.experimental.ChiselEnum

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

// it's necessary to check it with simulation
class calculateCell(width: Int = Scores.width) extends Module {
  val io = IO(new Bundle {
    val upper = Input(SInt(width.W))
    val left = Input(SInt(width.W))
    val diagonal = Input(SInt(width.W))
    val first = Input(Elements())
    val second = Input(Elements())

    val out = Output(SInt(width.W))
  })

  val substituteElements = Module(new substituteElements)
  substituteElements.io.first := io.first
  substituteElements.io.second := io.second

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
    io.out := max
  } else {
    when (max > Scores.lowerBound) {
      io.out := max
    } .otherwise {
      io.out := Scores.lowerBound
    }
  }
}

