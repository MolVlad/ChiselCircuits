package elastic.MD4Pipelined

import chisel3._
import chisel3.util._

class MD4Pipelined extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new MD4OutputData))
    val hash = new DecoupledIO(UInt(128.W))
  })

  val changeInput = Module(new MD4ChangeOrderInput)
  changeInput.io.in.valid := io.in.valid
  changeInput.io.in.bits.X := io.in.bits.X
  changeInput.io.in.bits.A0 := io.in.bits.A0
  changeInput.io.in.bits.B0 := io.in.bits.B0
  changeInput.io.in.bits.C0 := io.in.bits.C0
  changeInput.io.in.bits.D0 := io.in.bits.D0
  io.in.ready := changeInput.io.in.ready

  val add = Module(new MD4FinalAddition)
  add.io.in.bits.X := DontCare

  val changeOutput = Module(new MD4ChangeOrderOutput)
  changeOutput.io.in.valid := add.io.out.valid
  changeOutput.io.in.bits := Cat(add.io.out.bits.A, add.io.out.bits.B, add.io.out.bits.C, add.io.out.bits.D)
  add.io.out.ready := changeOutput.io.in.ready
  io.hash.bits := changeOutput.io.out.bits
  io.hash.valid := changeOutput.io.out.valid
  changeOutput.io.out.ready := io.hash.ready

  val PEs = for (i <- 0 until 3) yield {
    for (j <- 0 until 16) yield {
      val pe = Module(new MD4ProcessingElement(round = i, operation = j))
      pe.io := DontCare
      pe
    }
  }

  for (i <- 0 until 3) {
    for (j <- 0 until 16) {
      if((i == 0) && (j == 0)) {
        PEs(i)(j).io.in.valid := changeInput.io.out.valid
        PEs(i)(j).io.in.bits.X := changeInput.io.out.bits.X
        PEs(i)(j).io.in.bits.A0 := changeInput.io.out.bits.A0
        PEs(i)(j).io.in.bits.B0 := changeInput.io.out.bits.B0
        PEs(i)(j).io.in.bits.C0 := changeInput.io.out.bits.C0
        PEs(i)(j).io.in.bits.D0 := changeInput.io.out.bits.D0
        PEs(i)(j).io.in.bits.A := changeInput.io.out.bits.A0
        PEs(i)(j).io.in.bits.B := changeInput.io.out.bits.B0
        PEs(i)(j).io.in.bits.C := changeInput.io.out.bits.C0
        PEs(i)(j).io.in.bits.D := changeInput.io.out.bits.D0
        changeInput.io.out.ready := PEs(i)(j).io.in.ready

        PEs(i)(j+1).io.in.valid := PEs(i)(j).io.out.valid
        PEs(i)(j+1).io.in.bits.X := PEs(i)(j).io.out.bits.X
        PEs(i)(j+1).io.in.bits.A0 := PEs(i)(j).io.out.bits.A0
        PEs(i)(j+1).io.in.bits.B0 := PEs(i)(j).io.out.bits.B0
        PEs(i)(j+1).io.in.bits.C0 := PEs(i)(j).io.out.bits.C0
        PEs(i)(j+1).io.in.bits.D0 := PEs(i)(j).io.out.bits.D0
        PEs(i)(j+1).io.in.bits.A := PEs(i)(j).io.out.bits.A
        PEs(i)(j+1).io.in.bits.B := PEs(i)(j).io.out.bits.B
        PEs(i)(j+1).io.in.bits.C := PEs(i)(j).io.out.bits.C
        PEs(i)(j+1).io.in.bits.D := PEs(i)(j).io.out.bits.D
        PEs(i)(j).io.out.ready := PEs(i)(j+1).io.in.ready
      } else if((i == 2) && (j == 15)) {
        add.io.in.valid := PEs(i)(j).io.out.valid
        add.io.in.bits.A0 := PEs(i)(j).io.out.bits.A0
        add.io.in.bits.B0 := PEs(i)(j).io.out.bits.B0
        add.io.in.bits.C0 := PEs(i)(j).io.out.bits.C0
        add.io.in.bits.D0 := PEs(i)(j).io.out.bits.D0
        add.io.in.bits.A := PEs(i)(j).io.out.bits.A
        add.io.in.bits.B := PEs(i)(j).io.out.bits.B
        add.io.in.bits.C := PEs(i)(j).io.out.bits.C
        add.io.in.bits.D := PEs(i)(j).io.out.bits.D
        PEs(i)(j).io.out.ready := add.io.in.ready
      } else if(j == 15) {
        PEs(i+1)(0).io.in.valid := PEs(i)(j).io.out.valid
        PEs(i+1)(0).io.in.bits.X := PEs(i)(j).io.out.bits.X
        PEs(i+1)(0).io.in.bits.A0 := PEs(i)(j).io.out.bits.A0
        PEs(i+1)(0).io.in.bits.B0 := PEs(i)(j).io.out.bits.B0
        PEs(i+1)(0).io.in.bits.C0 := PEs(i)(j).io.out.bits.C0
        PEs(i+1)(0).io.in.bits.D0 := PEs(i)(j).io.out.bits.D0
        PEs(i+1)(0).io.in.bits.A := PEs(i)(j).io.out.bits.A
        PEs(i+1)(0).io.in.bits.B := PEs(i)(j).io.out.bits.B
        PEs(i+1)(0).io.in.bits.C := PEs(i)(j).io.out.bits.C
        PEs(i+1)(0).io.in.bits.D := PEs(i)(j).io.out.bits.D
        PEs(i)(j).io.out.ready := PEs(i+1)(0).io.in.ready
      } else {
        PEs(i)(j+1).io.in.valid := PEs(i)(j).io.out.valid
        PEs(i)(j+1).io.in.bits.X := PEs(i)(j).io.out.bits.X
        PEs(i)(j+1).io.in.bits.A0 := PEs(i)(j).io.out.bits.A0
        PEs(i)(j+1).io.in.bits.B0 := PEs(i)(j).io.out.bits.B0
        PEs(i)(j+1).io.in.bits.C0 := PEs(i)(j).io.out.bits.C0
        PEs(i)(j+1).io.in.bits.D0 := PEs(i)(j).io.out.bits.D0
        PEs(i)(j+1).io.in.bits.A := PEs(i)(j).io.out.bits.A
        PEs(i)(j+1).io.in.bits.B := PEs(i)(j).io.out.bits.B
        PEs(i)(j+1).io.in.bits.C := PEs(i)(j).io.out.bits.C
        PEs(i)(j+1).io.in.bits.D := PEs(i)(j).io.out.bits.D
        PEs(i)(j).io.out.ready := PEs(i)(j+1).io.in.ready
      }
    }
  }

}

class MD4ChangeOrderInput extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(new MD4OutputData)
    val in = Flipped(out)
  })

  val empty = RegInit(true.B)
  val enable = Wire(Bool())
  enable := io.out.ready || empty

  when(enable) {
    empty := !io.in.valid
  }

  val result = Wire(new MD4OutputData)
  val input = RegEnable(io.in.bits, enable)
  val valid = RegEnable(io.in.valid, enable)

  when(empty) {
    io.out.valid := false.B
    io.in.ready := true.B
    io.out.bits := 0.U.asTypeOf(io.out.bits)
  } .otherwise {
    io.out.valid := valid
    io.in.ready := enable
    io.out.bits := result
  }

  // processing
  val PEs = VecInit(Seq.fill(16) {
    Module(new changeWordOrder).io
  })
  for (i <- 0 until 16) {
    PEs(i).in := input.X(32*(i+1)-1,32*i)
  }
  result.X := Cat(PEs(15).out, PEs(14).out, PEs(13).out, PEs(12).out, PEs(11).out,
    PEs(10).out, PEs(9).out, PEs(8).out, PEs(7).out, PEs(6).out, PEs(5).out,
    PEs(4).out, PEs(3).out, PEs(2).out, PEs(1).out, PEs(0).out)

  val PEa = Module(new changeWordOrder).io
  PEa.in := input.A0
  result.A0 := PEa.out

  val PEb = Module(new changeWordOrder).io
  PEb.in := input.B0
  result.B0 := PEb.out

  val PEc = Module(new changeWordOrder).io
  PEc.in := input.C0
  result.C0 := PEc.out

  val PEd = Module(new changeWordOrder).io
  PEd.in := input.D0
  result.D0 := PEd.out
}

class MD4ProcessingElement(round: Int = 1, operation: Int = 1) extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(new MD4DataInterPE)
    val in = Flipped(out)
  })

  val empty = RegInit(true.B)
  val enable = Wire(Bool())
  enable := io.out.ready || empty

  when(enable) {
    empty := !io.in.valid
  }

  val result = Wire(new MD4DataInterPE)
  val input = RegEnable(io.in.bits, enable)
  val valid = RegEnable(io.in.valid, enable)

  when(empty) {
    io.out.valid := false.B
    io.in.ready := true.B
    io.out.bits := 0.U.asTypeOf(io.out.bits)
  } .otherwise {
    io.out.valid := valid
    io.in.ready := enable
    io.out.bits := result
  }

  // computations
  result.A0 := input.A0
  result.B0 := input.B0
  result.C0 := input.C0
  result.D0 := input.D0
  result.X := input.X

  val const = Wire(UInt(32.W))
  val function = Wire(UInt(32.W))
  val F, G, H = Wire(UInt(32.W))
  val a, b, c, d, xk = Wire(UInt(32.W))
  val sum, rotated = Wire(UInt(32.W))

  F := (b & c) | ((~b).asUInt & d)
  G := (b & c) | (b & d) | (c & d)
  H := b ^ c ^ d

  sum := a + function + xk + const

  if((operation % 4) == 0) {
    a := input.A; b := input.B; c := input.C; d := input.D;
    result.A := rotated; result.B := input.B; result.C := input.C; result.D := input.D
    rotated := Cat(sum(28, 0), sum(31, 29))
  } else if((operation % 4) == 1) {
    a := input.D; b := input.A; c := input.B; d := input.C;
    result.A := input.A; result.B := input.B; result.C := input.C; result.D := rotated

    round match {
      case 0 => rotated := Cat(sum(24, 0), sum(31, 25))
      case 1 => rotated := Cat(sum(26, 0), sum(31, 27))
      case 2 => rotated := Cat(sum(22, 0), sum(31, 23))
    }
  } else if((operation % 4) == 2) {
    a := input.C; b := input.D; c := input.A; d := input.B;
    result.A := input.A; result.B := input.B; result.C := rotated; result.D := input.D

    round match {
      case 0 => rotated := Cat(sum(20, 0), sum(31, 21))
      case 1 => rotated := Cat(sum(22, 0), sum(31, 23))
      case 2 => rotated := Cat(sum(20, 0), sum(31, 21))
    }
  } else {
    a := input.B; b := input.C; c := input.D; d := input.A;
    result.A := input.A; result.B := rotated; result.C := input.C; result.D := input.D

    round match {
      case 0 => rotated := Cat(sum(12, 0), sum(31, 13))
      case 1 => rotated := Cat(sum(18, 0), sum(31, 19))
      case 2 => rotated := Cat(sum(16, 0), sum(31, 17))
    }
  }

  if(round == 0) {
    const := 0.U
    function := F

    operation match {
      case 0 => xk := input.X(511, 480)
      case 1 => xk := input.X(479, 448)
      case 2 => xk := input.X(447, 416)
      case 3 => xk := input.X(415, 384)
      case 4 => xk := input.X(383, 352)
      case 5 => xk := input.X(351, 320)
      case 6 => xk := input.X(319, 288)
      case 7 => xk := input.X(287, 256)
      case 8 => xk := input.X(255, 224)
      case 9 => xk := input.X(223, 192)
      case 10 => xk := input.X(191, 160)
      case 11 => xk := input.X(159, 128)
      case 12 => xk := input.X(127, 96)
      case 13 => xk := input.X(95, 64)
      case 14 => xk := input.X(63, 32)
      case 15 => xk := input.X(31,0)
    }
  } else if(round == 1) {
    const := "h5A827999".U
    function := G

    operation match {
      case 0 => xk := input.X(511, 480)
      case 1 => xk := input.X(383, 352)
      case 2 => xk := input.X(255, 224)
      case 3 => xk := input.X(127, 96)
      case 4 => xk := input.X(479, 448)
      case 5 => xk := input.X(351, 320)
      case 6 => xk := input.X(223, 192)
      case 7 => xk := input.X(95, 64)
      case 8 => xk := input.X(447, 416)
      case 9 => xk := input.X(319, 288)
      case 10 => xk := input.X(191, 160)
      case 11 => xk := input.X(63, 32)
      case 12 => xk := input.X(415, 384)
      case 13 => xk := input.X(287, 256)
      case 14 => xk := input.X(159, 128)
      case 15 => xk := input.X(31,0)
    }
  } else {
    const := "h6ED9EBA1".U
    function := H

    operation match {
      case 0 => xk := input.X(511, 480)
      case 1 => xk := input.X(255, 224)
      case 2 => xk := input.X(383, 352)
      case 3 => xk := input.X(127, 96)
      case 4 => xk := input.X(447, 416)
      case 5 => xk := input.X(191, 160)
      case 6 => xk := input.X(319, 288)
      case 7 => xk := input.X(63, 32)
      case 8 => xk := input.X(479, 448)
      case 9 => xk := input.X(223, 192)
      case 10 => xk := input.X(351, 320)
      case 11 => xk := input.X(95, 64)
      case 12 => xk := input.X(415, 384)
      case 13 => xk := input.X(159, 128)
      case 14 => xk := input.X(287, 256)
      case 15 => xk := input.X(31,0)
    }
  }
}

class MD4FinalAddition extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new MD4DataInterPE))
    val out = new DecoupledIO(new Bundle {
      val A = UInt(32.W)
      val B = UInt(32.W)
      val C = UInt(32.W)
      val D = UInt(32.W)
    })
  })

  val empty = RegInit(true.B)
  val enable = Wire(Bool())
  enable := io.out.ready || empty

  when(enable) {
    empty := !io.in.valid
  }

  val result = Wire(new Bundle {
    val A = UInt(32.W); val B = UInt(32.W); val C = UInt(32.W); val D = UInt(32.W)
  })
  val input = RegEnable(io.in.bits, enable)
  val valid = RegEnable(io.in.valid, enable)

  when(empty) {
    io.out.valid := false.B
    io.in.ready := true.B
    io.out.bits := 0.U.asTypeOf(io.out.bits)
  } .otherwise {
    io.out.valid := valid
    io.in.ready := enable
    io.out.bits := result
  }

  // processing
  result.A := input.A + input.A0
  result.B := input.B + input.B0
  result.C := input.C + input.C0
  result.D := input.D + input.D0
}

class MD4ChangeOrderOutput extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(UInt(128.W))
    val in = Flipped(out)
  })

  val empty = RegInit(true.B)
  val enable = Wire(Bool())
  enable := io.out.ready || empty

  when(enable) {
    empty := !io.in.valid
  }

  val result = Wire(UInt(128.W))
  val input = RegEnable(io.in.bits, enable)
  val valid = RegEnable(io.in.valid, enable)

  when(empty) {
    io.out.valid := false.B
    io.in.ready := true.B
    io.out.bits := 0.U.asTypeOf(io.out.bits)
  } .otherwise {
    io.out.valid := valid
    io.in.ready := enable
    io.out.bits := result
  }

  // processing
  val PEs = VecInit(Seq.fill(4) {
    Module(new changeWordOrder).io
  })
  for (i <- 0 until 4) {
    PEs(i).in := input(32*(i+1)-1,32*i)
  }
  result := Cat(PEs(3).out, PEs(2).out, PEs(1).out, PEs(0).out)
}

class changeWordOrder extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(32.W))
    val out = Output(UInt(32.W))
  })

  val byte0, byte1, byte2, byte3 = Wire(UInt(8.W))
  byte0 := io.in(7,0)
  byte1 := io.in(15,8)
  byte2 := io.in(23,16)
  byte3 := io.in(31,24)

  io.out := Cat(byte0, byte1, byte2, byte3)
}

class MD4OutputData extends Bundle {
  val X = Output(UInt(512.W))
  val A0 = Output(UInt(32.W))
  val B0 = Output(UInt(32.W))
  val C0 = Output(UInt(32.W))
  val D0 = Output(UInt(32.W))
}

class MD4DataInterPE extends Bundle {
  val X = Output(UInt(512.W))
  val A = Output(UInt(32.W))
  val B = Output(UInt(32.W))
  val C = Output(UInt(32.W))
  val D = Output(UInt(32.W))
  val A0 = Output(UInt(32.W))
  val B0 = Output(UInt(32.W))
  val C0 = Output(UInt(32.W))
  val D0 = Output(UInt(32.W))
}
