package elastic.watermanSystolic

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum
import chisel3.util.log2Ceil

// Smith-Waterman algorithm implemented with systolic arrays
class WatermanSystolic(rowsNumber: Int = 4, columnsNumber: Int = 4) extends Module {
  require(rowsNumber <= columnsNumber) // check matrix size
  // Elastic input/output interfaces
  val io = IO(new Bundle {
    // in - two vectors of elements of sequence (S and T)
    val in = Flipped(new DecoupledIO(new Bundle {
      val S = Vec(columnsNumber, Elements())
      val T = Vec(rowsNumber, Elements())
    }))
    // out - vec of cells characteristics: score and x/y position
    val out = Vec(rowsNumber, DecoupledIO(new OutputData(rowsNumber = rowsNumber, columnsNumber = columnsNumber)))
  })

  // FSM with 3 states
  val waitingInput :: sending :: waitingLast :: Nil = Enum(3)
  val stateReg = RegInit(waitingInput) // reg for current state
  val stepReg = RegInit(0.U(log2Ceil(columnsNumber).W)) // reg for tracking current state of computations

  // vectors of regs for input data
  val TReg = RegInit(VecInit(Seq.fill(rowsNumber)(Elements.A)))
  val SReg = RegInit(VecInit(Seq.fill(columnsNumber)(Elements.A)))

  // reg for resetting PEs
  val resetReg = RegInit(false.B)

  // vector of PEs connected by chain
  val PEs = VecInit(Seq.fill(rowsNumber) {
    Module(new processingElementDecoupled(rowsNumber = rowsNumber, columnsNumber = columnsNumber)).io
  })

  // connect PEs by chain
  PEs(rowsNumber - 1).toNextPE.ready := true.B // last PE doesn't transfer data further so output ready is always high
  for (i <- 0 until rowsNumber) {
    if (i == 0) { // first PE
      PEs(i).fromPreviousPE.valid := stateReg === sending // data is transferred to first PE when state is sending
      PEs(i).fromPreviousPE.bits.columnElement := SReg(0) // column element is always the same

      // upper and diagonal are always zeros
      PEs(i).fromPreviousPE.bits.upper := 0.S
      PEs(i).fromPreviousPE.bits.diagonal := 0.S
    } else { // next PE
      // output ready and input valid signal connection between PEs
      PEs(i - 1).toNextPE.ready := PEs(i).fromPreviousPE.ready
      PEs(i).fromPreviousPE.valid := PEs(i - 1).toNextPE.valid

      // upper, diagonal and columnElement are transferred from previous PE
      PEs(i).fromPreviousPE.bits.columnElement := PEs(i - 1).toNextPE.bits.columnElement
      PEs(i).fromPreviousPE.bits.upper := PEs(i - 1).toNextPE.bits.upper
      PEs(i).fromPreviousPE.bits.diagonal := PEs(i - 1).toNextPE.bits.diagonal
    }

    PEs(i).number := i.U // y position in matrix
    PEs(i).rowElement := TReg(i) // rowElement is transferred from corresponding position in TReg vector
    PEs(i).reset := resetReg // connect PE reset to common reset register

    // connect PE output to module output
    io.out(i).bits.x := PEs(i).out.bits.x
    io.out(i).bits.y := PEs(i).out.bits.y
    io.out(i).bits.score := PEs(i).out.bits.score
    io.out(i).valid := PEs(i).out.valid
    PEs(i).out.ready := io.out(i).ready
  }

  io.in.ready := stateReg === waitingInput // input is ready when state is waitingInput

  // switch construction for implementing FSM
  switch(stateReg) {
    is(waitingInput) { // state of reading data
      when(io.in.valid) { // when handshaking is successful
        // store data into registers
        for (i <- 0 until columnsNumber) {
          SReg(i) := io.in.bits.S(i)
        }
        for (i <- 0 until rowsNumber) {
          TReg(i) := io.in.bits.T(i)
        }

        // init reset and step registers
        resetReg := false.B
        stepReg := 0.U

        // go to the state of sending data
        stateReg := sending
      }
    }
    is(sending) { // state of sending data to the first PE
      when(PEs(0).fromPreviousPE.ready) { // when handshaking is successful
        // shift data in SReg
        for (i <- 0 until (columnsNumber - 1)) {
          SReg(i) := SReg(i + 1)
        }
        stepReg := stepReg + 1.U // increment step counter
        when(stepReg === (columnsNumber - 1).U) { // when computations are done
          stateReg := waitingLast // move to the last state
        }
      }
    }
    is(waitingLast) { // state of waiting until the last PE outputs data
      // when last PE outputs data for the last cell in matrix
      when((PEs(rowsNumber - 1).out.valid) && (PEs(rowsNumber - 1).out.bits.x === (rowsNumber - 1).U)) {
        resetReg := true.B // reset all PE
        stateReg := waitingInput // go to the state of reading data again
      }
    }
  }
}

// processing element (PE) for systolic arrays implementation
class processingElementDecoupled(rowsNumber: Int, columnsNumber: Int, width: Int = Scores.width) extends Module {
  // Elastic input/output interfaces
  val io = IO(new Bundle {
    // upper, diagonal and columnElement are transferred from the previous PE using elastic interfaces
    val fromPreviousPE = Flipped(new DecoupledIO(new Bundle {
      val upper = SInt(width.W)
      val diagonal = SInt(width.W)
      val columnElement = Elements()
    }))

    // non-decoupled input wires for rowElement, reset and number
    val rowElement = Input(Elements())
    val reset = Input(Bool())
    val number = Input(UInt(width.W)) // corresponds to y position in matrix

    // elastic interface connected to the output of top module
    val out = new DecoupledIO(new OutputData(rowsNumber = rowsNumber, columnsNumber = columnsNumber))

    // upper, diagonal and columnElement are transferred to the next PE using elastic interfaces
    val toNextPE = new DecoupledIO(new Bundle {
      val upper = SInt(width.W)
      val diagonal = SInt(width.W)
      val columnElement = Elements()
    })
  })

  val waitingInput :: waitingOutput :: Nil = Enum(2) // FSM with two states
  val stateReg = RegInit(waitingInput) // register for current state
  val toNextPeValidReg = RegInit(false.B) // register to store information either output valid for next pe is high
  val scoreValidReg = RegInit(false.B) // register to store information either output valid for top module is high
  val previousScore = RegInit(0.S(width.W)) // register to store score from previous pe
  val leftReg = RegInit(0.S(width.W)) // register to store score from left cell in matrix
  val diagReg = RegInit(0.S(width.W)) // register to store score from diagonal cell in matrix
  val upperReg = RegInit(0.S(width.W)) // register to store score from upper cell in matrix
  val columnElementReg = RegInit(Elements.A) // register to store element of current cell in matrix
  val stepReg = RegInit(0.U(log2Ceil(columnsNumber).W)) // counter of steps in algorithm

  // module for computing score from substitution of two elements
  val substituteElements = Module(new substituteElements)
  substituteElements.io.first := io.rowElement
  substituteElements.io.second := columnElementReg

  // define wires for further use
  val upper, diag, left = Wire(SInt(width.W))
  val diagOrUpper, diagOrLeft, max, score = Wire(SInt(width.W))

  // compute score from diag, upper, left
  diag := diagReg + substituteElements.io.out
  upper := upperReg - Scores.gapScore
  left := leftReg - Scores.gapScore

  io.fromPreviousPE.ready := stateReg === waitingInput // ready to take input data in waitingInput state

  // output data to the top module output
  io.out.valid := scoreValidReg // output valid is scoreValidReg
  io.out.bits.score := score // output score is computed score
  io.out.bits.y := io.number // y position in matrix is number transferred from top module
  io.out.bits.x := stepReg // x position in matrix corresponds to the current step

  // output data to the next pe
  io.toNextPE.valid := toNextPeValidReg // output valid is toNextPeValidReg
  io.toNextPE.bits.upper := score // upper for the next pe is current score
  io.toNextPE.bits.diagonal := previousScore // diagonal for the next pe is score one step before
  io.toNextPE.bits.columnElement := columnElementReg // columnElement for the next pe is current columnElement

  // finding max value among diag, upper, left
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

  if (Scores.useLowerBound) { // if use lower bound
    when (max > Scores.lowerBound) { // if max exceeds bound
      io.out := max // return max
    } .otherwise {
      io.out := Scores.lowerBound // otherwise cut max to lower bound
    }
  } else {
    io.out := max // if lower bound is not used just return max
  }

  // when and switch constructions for implementing FSM
  when(io.reset) { // when reset
    // reset regs
    previousScore := 0.S
    leftReg := 0.S
    stepReg := 0.U
    stateReg := waitingInput
  }.otherwise {
    switch(stateReg) {
      is(waitingInput) { // state of reading data
        when(io.fromPreviousPE.valid) { // when handshaking with previous pe is successful
          // store data into registers
          upperReg := io.fromPreviousPE.bits.upper
          diagReg := io.fromPreviousPE.bits.diagonal
          columnElementReg := io.fromPreviousPE.bits.columnElement

          // assert valid signals
          scoreValidReg := true.B
          toNextPeValidReg := true.B

          // go to the state of data output
          stateReg := waitingOutput
        }
      }
      is(waitingOutput) { // state of data output
        when(io.out.ready) { // when handshaking with top module is successful
          scoreValidReg := false.B // reset corresponding register
        }
        when(io.toNextPE.ready) { // when handshaking with next pe is successful
          toNextPeValidReg := false.B // reset corresponding register
        }
        when(!(scoreValidReg || toNextPeValidReg)) { // when both handshaking was successful
          previousScore := score // update previousScore register
          leftReg := score // update leftReg register
          stepReg := stepReg + 1.U // increment step counter
          stateReg := waitingInput // go to the state of reading data
        }
      }
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

