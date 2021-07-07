package elastic.waterman

import chisel3._
import chisel3.util._
import elastic.waterman.DNA._

class Waterman extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(SInt(Scores.width.W))
    val x = Flipped(new DecoupledIO(Elements()))
    val y = Flipped(new DecoupledIO(Elements()))
  })

  val s = Module(new substituteElements)
  s.io.first := io.x.bits
  s.io.second := io.y.bits
  io.out.bits := s.io.out

  io.x.ready := true.B
  io.out.valid := true.B
  io.y.ready := true.B
}