package elastic.waterman

import chisel3._
import chisel3.util._
import elastic.waterman.DNA._

class WatermanSystolicDecoupled(rowsNumber: Int = 4, columnsNumber: Int = 4) extends Module {
  require(rowsNumber <= columnsNumber)
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
  val rows = RegInit(VecInit(Seq.fill(rowsNumber)(0.S(Scores.width.W))))
  val columns = RegInit(VecInit(Seq.fill(columnsNumber + 1)(0.S(Scores.width.W))))
  val resultingColumns = RegInit(VecInit(Seq.fill(columnsNumber)(0.S(Scores.width.W))))

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
        printf("\n")
        for (i <- 0 until columnsNumber) {
          SReg(i) := io.in.bits.S(i)
        }
        for (i <- 0 until rowsNumber) {
          TReg(i) := io.in.bits.T(i)
        }
        for (i <- 0 until (columnsNumber + 1)) {
          columns(i) := 0.S
        }
        for (i <- 0 until rowsNumber) {
          rows(i) := 0.S
        }
        for (i <- 0 until columnsNumber) {
          resultingColumns(i) := 0.S
        }

        cntColumnReg := 0.U
        cntRowReg := 0.U
        stateReg := computing
      }
    }
    is(computing) {
      pe.io.upper := columns(cntColumnReg + 1.U)
      pe.io.diagonal := columns(cntColumnReg)
      pe.io.left := rows(cntRowReg)
      pe.io.rowElement := TReg(cntRowReg)
      pe.io.columnElement := SReg(cntColumnReg)

      resReg := pe.io.out
      stateReg := waitingOutput
    }
    is(waitingOutput) {
      when(io.out.ready) {
        resultingColumns(cntColumnReg) := resReg
        rows(cntRowReg) := resReg
        printf("%d ", resReg)

        when((cntColumnReg === (columnsNumber - 1).U) && (cntRowReg === (rowsNumber - 1).U)) {
          stateReg := waitingInput
          printf("\n")
        } .elsewhen(cntColumnReg === (columnsNumber - 1).U) {
          cntColumnReg := 0.U
          cntRowReg := cntRowReg + 1.U
          printf("\n")
          stateReg := update
        } .otherwise {
          cntColumnReg := cntColumnReg + 1.U
          stateReg := computing
        }
      }
    }
    is(update) {
      for (i <- 0 until columnsNumber) {
        columns(i + 1) := resultingColumns(i)
      }
      stateReg := computing
    }
  }
}