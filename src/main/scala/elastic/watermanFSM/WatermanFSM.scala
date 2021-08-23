package elastic.watermanFSM

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum
import chisel3.util.log2Ceil

// Smith-Waterman algorithm implemented in FSM way
class WatermanFSM(rowsNumber: Int = 4, columnsNumber: Int = 4) extends Module {
  // Elastic input/output interfaces
  val io = IO(new Bundle {
    // in - two vectors of elements of sequence (S and T)
    val in = Flipped(new DecoupledIO(new Bundle {
      val S = Vec(columnsNumber, Elements())
      val T = Vec(rowsNumber, Elements())
    }))
    // out - score of the cell in matrix and x/y positions of the cell in matrix
    val out = new DecoupledIO(new Bundle {
      val score = SInt(Scores.width.W)
      val x = UInt(log2Ceil(columnsNumber).W)
      val y = UInt(log2Ceil(rowsNumber).W)
    })
  })

  // regs for storing input data
  val SReg = RegInit(VecInit(Seq.fill(columnsNumber)(Elements.A)))
  val TReg = RegInit(VecInit(Seq.fill(rowsNumber)(Elements.A)))

  // regs for storing intermediate results needed for computations
  val rowsReg = RegInit(VecInit(Seq.fill(rowsNumber)(0.S(Scores.width.W))))
  val columnsReg = RegInit(VecInit(Seq.fill(columnsNumber + 1)(0.S(Scores.width.W))))
  val resultingColumnsReg = RegInit(VecInit(Seq.fill(columnsNumber)(0.S(Scores.width.W))))

  // FSM with 4 states
  val waitingInput :: computing :: update :: waitingOutput :: Nil = Enum(4)
  val stateReg = RegInit(waitingInput) // reg for current state
  val cntColumnReg = RegInit(0.U((log2Ceil(columnsNumber) + 1).W)) // counter for current number of column, x
  val cntRowReg = RegInit(0.U((log2Ceil(rowsNumber) + 1).W)) // counter for current number of row, y
  val resReg = RegInit(0.S) // reg for storing result

  // processing element (PE) for cell calculation, data is provided to it in state machine fashion. It can be replaced by pipelined version.
  val pe = Module(new calculateCell)
  // initialize inputs
  pe.io.upper := DontCare
  pe.io.diagonal := DontCare
  pe.io.left := DontCare
  pe.io.rowElement := DontCare
  pe.io.columnElement := DontCare

  io.out.bits.x := cntColumnReg // cntColumnReg is x position of current cell
  io.out.bits.y := cntRowReg // cntRowReg is y position of current cell
  io.out.bits.score := resReg // resReg is score value of current cell
  io.out.valid := stateReg === waitingOutput // output valid is high when state is waitingOutput
  io.in.ready := stateReg === waitingInput // input ready is high when state is waitingInput

  // switch construction for implementing FSM
  switch(stateReg) {
    is(waitingInput) { // state of reading data
      when(io.in.valid) { // when handshaking is successful
        // store input data into register
        for (i <- 0 until columnsNumber) {
          SReg(i) := io.in.bits.S(i)
        }
        for (i <- 0 until rowsNumber) {
          TReg(i) := io.in.bits.T(i)
        }

        // initialize registers
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

        // go to state computing
        stateReg := computing
      }
    }
    is(computing) { // state of computing cells
      // put values corresponding to the current cell to pe
      pe.io.upper := columnsReg(cntColumnReg + 1.U)
      pe.io.diagonal := columnsReg(cntColumnReg)
      pe.io.left := rowsReg(cntRowReg)
      pe.io.rowElement := TReg(cntRowReg)
      pe.io.columnElement := SReg(cntColumnReg)

      resReg := pe.io.out // save the result of cell calculation into resReg
      stateReg := waitingOutput // go to state waitingOutput to output data from resReg
    }
    is(waitingOutput) { // state of data output
      when(io.out.ready) { // when handshaking is successful
        // update registers with intermediate results
        resultingColumnsReg(cntColumnReg) := resReg
        rowsReg(cntRowReg) := resReg

        when((cntColumnReg === (columnsNumber - 1).U) && (cntRowReg === (rowsNumber - 1).U)) { // when computations are over
          stateReg := waitingInput // go to initial state to read input data again
        } .elsewhen(cntColumnReg === (columnsNumber - 1).U) { // else when column is finished
          // go to the next column
          cntColumnReg := 0.U // reset column position
          cntRowReg := cntRowReg + 1.U // increase row position
          stateReg := update // go the special state for updating registers for intermediate results
        } .otherwise {
          cntColumnReg := cntColumnReg + 1.U // otherwise just move pointer to the next column
          stateReg := computing // go to the state computing again
        }
      }
    }
    is(update) { // state of updating registers for intermediate results. need to be visited after finishing column
      // update columnsReg with resultingColumnsReg values
      for (i <- 0 until columnsNumber) {
        columnsReg(i + 1) := resultingColumnsReg(i)
      }
      stateReg := computing // go to state computing again
    }
  }
}

// module for substituting elements, main logic of smith-waterman algorithm
// first, second - elements of two sequences
// out - score from substituting them
class substituteElements(width: Int = Scores.width) extends Module {
  val io = IO(new Bundle {
    val first = Input(Elements())
    val second = Input(Elements())
    val out = Output(SInt(width.W))
  })

  io.out := Scores.matchScore // initialization
  when (io.first === io.second) { // when elements are equal
    io.out := Scores.matchScore // return matchScore
  } .otherwise { // when they differ
    io.out := Scores.mismatchScore // return mismatchScore
  }
}

// pe for calculating cell using data from neighbouring ones
// rowElement and columnElement - elements of two sequences to be alligned
// upper - score from upper cell
// left - score from left cell
// diagonal - score from diagonal cell
// out - computed score of current cell
class calculateCell(width: Int = Scores.width) extends Module {
  val io = IO(new Bundle {
    val upper = Input(SInt(width.W))
    val left = Input(SInt(width.W))
    val diagonal = Input(SInt(width.W))
    val rowElement = Input(Elements())
    val columnElement = Input(Elements())

    val out = Output(SInt(width.W))
  })

  // module for computing score from substitution of two elements
  val substituteElements = Module(new substituteElements)
  substituteElements.io.first := io.rowElement
  substituteElements.io.second := io.columnElement

  // define wires for further use
  val upper, diag, left, diagUpper, diagLeft, max = Wire(SInt(width.W))

  // compute score from diag, upper, left
  diag := io.diagonal + substituteElements.io.out
  upper := io.upper - Scores.gapScore
  left := io.left - Scores.gapScore

  // finding max value among diag, upper, left
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

  if (Scores.useLowerBound) { // if use lower bound
    when (max > Scores.lowerBound) { // if max exceeds bound
      io.out := max // return max
    } .otherwise {
      io.out := Scores.lowerBound // otherwise cut max to lower bound
    }
  } else {
    io.out := max // if lower bound is not used just return max
  }
}

// data type used in calculations
// score - score value of the cell in matrix
// x, y - positions of the cell in matrix
class OutputData(val rowsNumber: Int, val columnsNumber: Int) extends  Bundle {
  val score = Output(SInt(Scores.width.W))
  val x = Output(UInt(log2Ceil(columnsNumber).W))
  val y = Output(UInt(log2Ceil(rowsNumber).W))
}

// parameters of smith-waterman algorithm
object Scores {
  val width = 32
  val matchScore = 1.S(2.W) // score for matching
  val mismatchScore = -1.S(2.W) // score for mismatching
  val gapScore = 2.S(3.W) // score for the gap
  val lowerBound = 0.S // lower bound of values in matrix (0 for smith-waterman)
  val useLowerBound = true // either to use lower bound or not (true for smith-waterman)
}

// enum for sequence elements
object Elements extends ChiselEnum {
  val A, G, C, T = Value
}
