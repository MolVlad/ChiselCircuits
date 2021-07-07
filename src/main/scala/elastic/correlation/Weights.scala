package elastic.correlation

import chisel3._
import chisel3.util._

object Weights {
  val weights = Vector(1, 2, 3).map(x => x.S)
  val weightsLength = weights.length
}
