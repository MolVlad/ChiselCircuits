package elastic.DES_PipelinedElasticBuffer

import chisel3._
import chisel3.util._

class DES_EncryptionPipelinedElasticBuffer extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new Bundle {
      val text = UInt(64.W)
      val key = UInt(64.W)
    }))
    val encrypted = new DecoupledIO(UInt(64.W))
  })

  val initialPermutation = Module(new DES_InitialPermutation)
  initialPermutation.io.in.valid := io.in.valid
  initialPermutation.io.in.bits.text := io.in.bits.text
  initialPermutation.io.in.bits.key := io.in.bits.key
  io.in.ready := initialPermutation.io.in.ready

  val finalPermutation = Module(new DES_FinalPermutation)
  io.encrypted.bits := finalPermutation.io.out.bits
  io.encrypted.valid := finalPermutation.io.out.valid
  finalPermutation.io.out.ready := io.encrypted.ready

  val PEs = for (i <- 0 until 16) yield {
    val pe = Module(new DES_ProcessingElement(round = i))
    pe.io := DontCare
    pe
  }

  for (i <- 0 until 16) {
    if(i == 0) {
      PEs(i).io.in.valid := initialPermutation.io.out.valid
      PEs(i).io.in.bits := initialPermutation.io.out.bits
      initialPermutation.io.out.ready := PEs(i).io.in.ready

      PEs(i+1).io.in.valid := PEs(i).io.out.valid
      PEs(i+1).io.in.bits := PEs(i).io.out.bits
      PEs(i).io.out.ready := PEs(i+1).io.in.ready
    } else if(i == 15) {
      finalPermutation.io.in.valid := PEs(i).io.out.valid
      finalPermutation.io.in.bits.L := PEs(i).io.out.bits.L
      finalPermutation.io.in.bits.R := PEs(i).io.out.bits.R
      PEs(i).io.out.ready := finalPermutation.io.in.ready
    } else {
      PEs(i+1).io.in.valid := PEs(i).io.out.valid
      PEs(i+1).io.in.bits := PEs(i).io.out.bits
      PEs(i).io.out.ready := PEs(i+1).io.in.ready
    }
  }
}

class DES_InitialPermutation extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new Bundle{
      val text = UInt(64.W)
      val key = UInt(64.W)
    }))
    val out = new DecoupledIO(new DES_DataInterPE)
  })

  val result = Wire(new DES_DataInterPE)
  val input = Wire(new Bundle{val text = UInt(64.W); val key = UInt(64.W)})
  val data = RegInit(VecInit(Seq.fill(2)(0.U.asTypeOf(new Bundle{val text = UInt(64.W); val key = UInt(64.W)}))))

  val head = RegInit(false.B)
  val tail = RegInit(false.B)
  val full = RegInit(VecInit(Seq.fill(2)(false.B)))

  io.in.ready := !(full(0) && full(1))
  io.out.valid := full(0) || full(1)
  io.out.bits := result
  input := data(head)

  // write
  when(io.in.valid && !full(tail)) {
    full(tail) := true.B
    data(tail) := io.in.bits
    tail := !tail
  }

  // read
  when(io.out.ready && full(head)) {
    full(head) := false.B
    head := !head
  }

  // processing
  val ip = Module(new IP).io
  ip.text := input.text
  result.L := ip.L
  result.R := ip.R

  val pc_1 = Module(new PC_1).io
  pc_1.key := input.key
  result.C := pc_1.C
  result.D := pc_1.D
}

class DES_ProcessingElement(round: Int) extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(new DES_DataInterPE)
    val in = Flipped(out)
  })

  val input, result = Wire(new DES_DataInterPE)
  val data = RegInit(VecInit(Seq.fill(2)(0.U.asTypeOf(new DES_DataInterPE))))
  val head = RegInit(false.B)
  val tail = RegInit(false.B)
  val full = RegInit(VecInit(Seq.fill(2)(false.B)))

  io.in.ready := !(full(0) && full(1))
  io.out.valid := full(0) || full(1)
  io.out.bits := result
  input := data(head)

  // write
  when(io.in.valid && !full(tail)) {
    full(tail) := true.B
    data(tail) := io.in.bits
    tail := !tail
  }

  // read
  when(io.out.ready && full(head)) {
    full(head) := false.B
    head := !head
  }

  // computations
  val keys = Module(new DES_keys(round))
  keys.io.C := input.C
  keys.io.D := input.D

  val f = Module(new DES_f)
  f.io.R := input.R
  f.io.K := keys.io.K

  result.L := input.R
  result.R := input.L ^ f.io.out
  result.C := keys.io.C_next
  result.D := keys.io.D_next
}

class DES_FinalPermutation extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(UInt(64.W))
    val in = Flipped(new DecoupledIO(new Bundle{
      val L = UInt(32.W)
      val R = UInt(32.W)
    }))
  })

  val result = Wire(UInt(64.W))
  val input = Wire(new Bundle{val L = UInt(32.W); val R = UInt(32.W)})
  val data = RegInit(VecInit(Seq.fill(2)(0.U.asTypeOf(new Bundle{val L = UInt(32.W); val R = UInt(32.W)}))))

  val head = RegInit(false.B)
  val tail = RegInit(false.B)
  val full = RegInit(VecInit(Seq.fill(2)(false.B)))

  io.in.ready := !(full(0) && full(1))
  io.out.valid := full(0) || full(1)
  io.out.bits := result
  input := data(head)

  // write
  when(io.in.valid && !full(tail)) {
    full(tail) := true.B
    data(tail) := io.in.bits
    tail := !tail
  }

  // read
  when(io.out.ready && full(head)) {
    full(head) := false.B
    head := !head
  }

  // processing
  val concat = Wire(UInt(64.W))
  concat := Reverse(Cat(input.R, input.L))

  result := Cat(concat(39),concat(7),concat(47),concat(15),concat(55),concat(23),concat(63),concat(31),
    concat(38),concat(6),concat(46),concat(14),concat(54),concat(22),concat(62),concat(30),
    concat(37),concat(5),concat(45),concat(13),concat(53),concat(21),concat(61),concat(29),
    concat(36),concat(4),concat(44),concat(12),concat(52),concat(20),concat(60),concat(28),
    concat(35),concat(3),concat(43),concat(11),concat(51),concat(19),concat(59),concat(27),
    concat(34),concat(2),concat(42),concat(10),concat(50),concat(18),concat(58),concat(26),
    concat(33),concat(1),concat(41),concat(9),concat(49),concat(17),concat(57),concat(25),
    concat(32),concat(0),concat(40),concat(8),concat(48),concat(16),concat(56),concat(24))
}

class IP extends Module {
  val io = IO(new Bundle {
    val text = Input(UInt(64.W))
    val L = Output(UInt(32.W))
    val R = Output(UInt(32.W))
  })

  val reversed = Wire(UInt(64.W))
  reversed := Reverse(io.text)

  io.L := Cat(reversed(57),reversed(49),reversed(41),reversed(33),reversed(25),reversed(17),reversed(9),reversed(1),
    reversed(59),reversed(51),reversed(43),reversed(35),reversed(27),reversed(19),reversed(11),reversed(3),
    reversed(61),reversed(53),reversed(45),reversed(37),reversed(29),reversed(21),reversed(13),reversed(5),
    reversed(63),reversed(55),reversed(47),reversed(39),reversed(31),reversed(23),reversed(15),reversed(7))

  io.R := Cat(reversed(56),reversed(48),reversed(40),reversed(32),reversed(24),reversed(16),reversed(8),reversed(0),
    reversed(58),reversed(50),reversed(42),reversed(34),reversed(26),reversed(18),reversed(10),reversed(2),
    reversed(60),reversed(52),reversed(44),reversed(36),reversed(28),reversed(20),reversed(12),reversed(4),
    reversed(62),reversed(54),reversed(46),reversed(38),reversed(30),reversed(22),reversed(14),reversed(6))
}

class PC_1 extends Module {
  val io = IO(new Bundle {
    val key = Input(UInt(64.W))
    val C = Output(UInt(28.W))
    val D = Output(UInt(28.W))
  })

  val reversed = Wire(UInt(64.W))
  reversed := Reverse(io.key)

  io.C := Cat(reversed(56),reversed(48),reversed(40),reversed(32),reversed(24),reversed(16),reversed(8),
    reversed(0),reversed(57),reversed(49),reversed(41),reversed(33),reversed(25),reversed(17),
    reversed(9),reversed(1),reversed(58),reversed(50),reversed(42),reversed(34),reversed(26),
    reversed(18),reversed(10),reversed(2),reversed(59),reversed(51),reversed(43),reversed(35))

  io.D := Cat(reversed(62),reversed(54),reversed(46),reversed(38),reversed(30),reversed(22),reversed(14),
    reversed(6),reversed(61),reversed(53),reversed(45),reversed(37),reversed(29),reversed(21),
    reversed(13),reversed(5),reversed(60),reversed(52),reversed(44),reversed(36),reversed(28),
    reversed(20),reversed(12),reversed(4),reversed(27),reversed(19),reversed(11),reversed(3))
}

class DES_keys(round: Int) extends Module {
  val io = IO(new Bundle {
    val C = Input(UInt(28.W))
    val D = Input(UInt(28.W))
    val C_next = Output(UInt(28.W))
    val D_next = Output(UInt(28.W))
    val K = Output(UInt(48.W))
  })

  val s = round match {
    case 0 => 1
    case 1 => 1
    case 2 => 2
    case 3 => 2
    case 4 => 2
    case 5 => 2
    case 6 => 2
    case 7 => 2
    case 8 => 1
    case 9 => 2
    case 10 => 2
    case 11 => 2
    case 12 => 2
    case 13 => 2
    case 14 => 2
    case 15 => 1
  }

  val C_rotated = Wire(UInt(28.W))
  val D_rotated = Wire(UInt(28.W))
  val concat = Wire(UInt(56.W))

  if(s == 1) {
    C_rotated := Cat(io.C(26,0),io.C(27))
    D_rotated := Cat(io.D(26,0),io.D(27))
  } else if(s == 2) {
    C_rotated := Cat(io.C(25,0),io.C(27,26))
    D_rotated := Cat(io.D(25,0),io.D(27,26))
  }

  io.C_next := C_rotated
  io.D_next := D_rotated
  concat := Reverse(Cat(C_rotated, D_rotated))

  io.K := Cat(concat(13),concat(16),concat(10),concat(23),concat(0),concat(4),
    concat(2),concat(27),concat(14),concat(5),concat(20),concat(9),
    concat(22),concat(18),concat(11),concat(3),concat(25),concat(7),
    concat(15),concat(6),concat(26),concat(19),concat(12),concat(1),
    concat(40),concat(51),concat(30),concat(36),concat(46),concat(54),
    concat(29),concat(39),concat(50),concat(44),concat(32),concat(47),
    concat(43),concat(48),concat(38),concat(55),concat(33),concat(52),
    concat(45),concat(41),concat(49),concat(35),concat(28),concat(31))
}

class DES_f extends Module {
  val io = IO(new Bundle {
    val R = Input(UInt(32.W))
    val K = Input(UInt(48.W))
    val out = Output(UInt(32.W))
  })

  val E = Module(new DES_E)
  E.io.R := io.R

  val S = Module(new DES_S)
  S.io.in := E.io.E ^ io.K

  val P = Module(new DES_P)
  P.io.in := S.io.out
  io.out := P.io.out
}

class DES_S extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(48.W))
    val out = Output(UInt(32.W))
  })

  val B = Wire(Vec(8, UInt(6.W)))
  val row = Wire(Vec(8, UInt(2.W)))
  val col = Wire(Vec(8, UInt(4.W)))
  for (i <- 0 until 8) {
    B(7-i) := io.in(6*(i+1)-1,6*i)
    row(7-i) := Cat(B(7-i)(5),B(7-i)(0))
    col(7-i) := B(7-i)(4,1)
  }

  val S1 = VecInit(VecInit(14.U(4.W), 0.U(4.W), 4.U(4.W), 15.U(4.W)),
    VecInit(4.U(4.W), 15.U(4.W), 1.U(4.W), 12.U(4.W)),
    VecInit(13.U(4.W), 7.U(4.W), 14.U(4.W), 8.U(4.W)),
    VecInit(1.U(4.W), 4.U(4.W), 8.U(4.W), 2.U(4.W)),
    VecInit(2.U(4.W), 14.U(4.W), 13.U(4.W), 4.U(4.W)),
    VecInit(15.U(4.W), 2.U(4.W), 6.U(4.W), 9.U(4.W)),
    VecInit(11.U(4.W), 13.U(4.W), 2.U(4.W), 1.U(4.W)),
    VecInit(8.U(4.W), 1.U(4.W), 11.U(4.W), 7.U(4.W)),
    VecInit(3.U(4.W), 10.U(4.W), 15.U(4.W), 5.U(4.W)),
    VecInit(10.U(4.W), 6.U(4.W), 12.U(4.W), 11.U(4.W)),
    VecInit(6.U(4.W), 12.U(4.W), 9.U(4.W), 3.U(4.W)),
    VecInit(12.U(4.W), 11.U(4.W), 7.U(4.W), 14.U(4.W)),
    VecInit(5.U(4.W), 9.U(4.W), 3.U(4.W), 10.U(4.W)),
    VecInit(9.U(4.W), 5.U(4.W), 10.U(4.W), 0.U(4.W)),
    VecInit(0.U(4.W), 3.U(4.W), 5.U(4.W), 6.U(4.W)),
    VecInit(7.U(4.W), 8.U(4.W), 0.U(4.W), 13.U(4.W)))

  val S2 = VecInit(VecInit(15.U(4.W), 3.U(4.W), 0.U(4.W), 13.U(4.W)),
    VecInit(1.U(4.W), 13.U(4.W), 14.U(4.W), 8.U(4.W)),
    VecInit(8.U(4.W), 4.U(4.W), 7.U(4.W), 10.U(4.W)),
    VecInit(14.U(4.W), 7.U(4.W), 11.U(4.W), 1.U(4.W)),
    VecInit(6.U(4.W), 15.U(4.W), 10.U(4.W), 3.U(4.W)),
    VecInit(11.U(4.W), 2.U(4.W), 4.U(4.W), 15.U(4.W)),
    VecInit(3.U(4.W), 8.U(4.W), 13.U(4.W), 4.U(4.W)),
    VecInit(4.U(4.W), 14.U(4.W), 1.U(4.W), 2.U(4.W)),
    VecInit(9.U(4.W), 12.U(4.W), 5.U(4.W), 11.U(4.W)),
    VecInit(7.U(4.W), 0.U(4.W), 8.U(4.W), 6.U(4.W)),
    VecInit(2.U(4.W), 1.U(4.W), 12.U(4.W), 7.U(4.W)),
    VecInit(13.U(4.W), 10.U(4.W), 6.U(4.W), 12.U(4.W)),
    VecInit(12.U(4.W), 6.U(4.W), 9.U(4.W), 0.U(4.W)),
    VecInit(0.U(4.W), 9.U(4.W), 3.U(4.W), 5.U(4.W)),
    VecInit(5.U(4.W), 11.U(4.W), 2.U(4.W), 14.U(4.W)),
    VecInit(10.U(4.W), 5.U(4.W), 15.U(4.W), 9.U(4.W)))

  val S3 = VecInit(VecInit(10.U(4.W), 13.U(4.W), 13.U(4.W), 1.U(4.W)),
    VecInit(0.U(4.W), 7.U(4.W), 6.U(4.W), 10.U(4.W)),
    VecInit(9.U(4.W), 0.U(4.W), 4.U(4.W), 13.U(4.W)),
    VecInit(14.U(4.W), 9.U(4.W), 9.U(4.W), 0.U(4.W)),
    VecInit(6.U(4.W), 3.U(4.W), 8.U(4.W), 6.U(4.W)),
    VecInit(3.U(4.W), 4.U(4.W), 15.U(4.W), 9.U(4.W)),
    VecInit(15.U(4.W), 6.U(4.W), 3.U(4.W), 8.U(4.W)),
    VecInit(5.U(4.W), 10.U(4.W), 0.U(4.W), 7.U(4.W)),
    VecInit(1.U(4.W), 2.U(4.W), 11.U(4.W), 4.U(4.W)),
    VecInit(13.U(4.W), 8.U(4.W), 1.U(4.W), 15.U(4.W)),
    VecInit(12.U(4.W), 5.U(4.W), 2.U(4.W), 14.U(4.W)),
    VecInit(7.U(4.W), 14.U(4.W), 12.U(4.W), 3.U(4.W)),
    VecInit(11.U(4.W), 12.U(4.W), 5.U(4.W), 11.U(4.W)),
    VecInit(4.U(4.W), 11.U(4.W), 10.U(4.W), 5.U(4.W)),
    VecInit(2.U(4.W), 15.U(4.W), 14.U(4.W), 2.U(4.W)),
    VecInit(8.U(4.W), 1.U(4.W), 7.U(4.W), 12.U(4.W)))

  val S4 = VecInit(VecInit(7.U(4.W), 13.U(4.W), 10.U(4.W), 3.U(4.W)),
    VecInit(13.U(4.W), 8.U(4.W), 6.U(4.W), 15.U(4.W)),
    VecInit(14.U(4.W), 11.U(4.W), 9.U(4.W), 0.U(4.W)),
    VecInit(3.U(4.W), 5.U(4.W), 0.U(4.W), 6.U(4.W)),
    VecInit(0.U(4.W), 6.U(4.W), 12.U(4.W), 10.U(4.W)),
    VecInit(6.U(4.W), 15.U(4.W), 11.U(4.W), 1.U(4.W)),
    VecInit(9.U(4.W), 0.U(4.W), 7.U(4.W), 13.U(4.W)),
    VecInit(10.U(4.W), 3.U(4.W), 13.U(4.W), 8.U(4.W)),
    VecInit(1.U(4.W), 4.U(4.W), 15.U(4.W), 9.U(4.W)),
    VecInit(2.U(4.W), 7.U(4.W), 1.U(4.W), 4.U(4.W)),
    VecInit(8.U(4.W), 2.U(4.W), 3.U(4.W), 5.U(4.W)),
    VecInit(5.U(4.W), 12.U(4.W), 14.U(4.W), 11.U(4.W)),
    VecInit(11.U(4.W), 1.U(4.W), 5.U(4.W), 12.U(4.W)),
    VecInit(12.U(4.W), 10.U(4.W), 2.U(4.W), 7.U(4.W)),
    VecInit(4.U(4.W), 14.U(4.W), 8.U(4.W), 2.U(4.W)),
    VecInit(15.U(4.W), 9.U(4.W), 4.U(4.W), 14.U(4.W)))

  val S5 = VecInit(VecInit(2.U(4.W), 14.U(4.W), 4.U(4.W), 11.U(4.W)),
    VecInit(12.U(4.W), 11.U(4.W), 2.U(4.W), 8.U(4.W)),
    VecInit(4.U(4.W), 2.U(4.W), 1.U(4.W), 12.U(4.W)),
    VecInit(1.U(4.W), 12.U(4.W), 11.U(4.W), 7.U(4.W)),
    VecInit(7.U(4.W), 4.U(4.W), 10.U(4.W), 1.U(4.W)),
    VecInit(10.U(4.W), 7.U(4.W), 13.U(4.W), 14.U(4.W)),
    VecInit(11.U(4.W), 13.U(4.W), 7.U(4.W), 2.U(4.W)),
    VecInit(6.U(4.W), 1.U(4.W), 8.U(4.W), 13.U(4.W)),
    VecInit(8.U(4.W), 5.U(4.W), 15.U(4.W), 6.U(4.W)),
    VecInit(5.U(4.W), 0.U(4.W), 9.U(4.W), 15.U(4.W)),
    VecInit(3.U(4.W), 15.U(4.W), 12.U(4.W), 0.U(4.W)),
    VecInit(15.U(4.W), 10.U(4.W), 5.U(4.W), 9.U(4.W)),
    VecInit(13.U(4.W), 3.U(4.W), 6.U(4.W), 10.U(4.W)),
    VecInit(0.U(4.W), 9.U(4.W), 3.U(4.W), 4.U(4.W)),
    VecInit(14.U(4.W), 8.U(4.W), 0.U(4.W), 5.U(4.W)),
    VecInit(9.U(4.W), 6.U(4.W), 14.U(4.W), 3.U(4.W)))

  val S6 = VecInit(VecInit(12.U(4.W), 10.U(4.W), 9.U(4.W), 4.U(4.W)),
    VecInit(1.U(4.W), 15.U(4.W), 14.U(4.W), 3.U(4.W)),
    VecInit(10.U(4.W), 4.U(4.W), 15.U(4.W), 2.U(4.W)),
    VecInit(15.U(4.W), 2.U(4.W), 5.U(4.W), 12.U(4.W)),
    VecInit(9.U(4.W), 7.U(4.W), 2.U(4.W), 9.U(4.W)),
    VecInit(2.U(4.W), 12.U(4.W), 8.U(4.W), 5.U(4.W)),
    VecInit(6.U(4.W), 9.U(4.W), 12.U(4.W), 15.U(4.W)),
    VecInit(8.U(4.W), 5.U(4.W), 3.U(4.W), 10.U(4.W)),
    VecInit(0.U(4.W), 6.U(4.W), 7.U(4.W), 11.U(4.W)),
    VecInit(13.U(4.W), 1.U(4.W), 0.U(4.W), 14.U(4.W)),
    VecInit(3.U(4.W), 13.U(4.W), 4.U(4.W), 1.U(4.W)),
    VecInit(4.U(4.W), 14.U(4.W), 10.U(4.W), 7.U(4.W)),
    VecInit(14.U(4.W), 0.U(4.W), 1.U(4.W), 6.U(4.W)),
    VecInit(7.U(4.W), 11.U(4.W), 13.U(4.W), 0.U(4.W)),
    VecInit(5.U(4.W), 3.U(4.W), 11.U(4.W), 8.U(4.W)),
    VecInit(11.U(4.W), 8.U(4.W), 6.U(4.W), 13.U(4.W)))

  val S7 = VecInit(VecInit(4.U(4.W), 13.U(4.W), 1.U(4.W), 6.U(4.W)),
    VecInit(11.U(4.W), 0.U(4.W), 4.U(4.W), 11.U(4.W)),
    VecInit(2.U(4.W), 11.U(4.W), 11.U(4.W), 13.U(4.W)),
    VecInit(14.U(4.W), 7.U(4.W), 13.U(4.W), 8.U(4.W)),
    VecInit(15.U(4.W), 4.U(4.W), 12.U(4.W), 1.U(4.W)),
    VecInit(0.U(4.W), 9.U(4.W), 3.U(4.W), 4.U(4.W)),
    VecInit(8.U(4.W), 1.U(4.W), 7.U(4.W), 10.U(4.W)),
    VecInit(13.U(4.W), 10.U(4.W), 14.U(4.W), 7.U(4.W)),
    VecInit(3.U(4.W), 14.U(4.W), 10.U(4.W), 9.U(4.W)),
    VecInit(12.U(4.W), 3.U(4.W), 15.U(4.W), 5.U(4.W)),
    VecInit(9.U(4.W), 5.U(4.W), 6.U(4.W), 0.U(4.W)),
    VecInit(7.U(4.W), 12.U(4.W), 8.U(4.W), 15.U(4.W)),
    VecInit(5.U(4.W), 2.U(4.W), 0.U(4.W), 14.U(4.W)),
    VecInit(10.U(4.W), 15.U(4.W), 5.U(4.W), 2.U(4.W)),
    VecInit(6.U(4.W), 8.U(4.W), 9.U(4.W), 3.U(4.W)),
    VecInit(1.U(4.W), 6.U(4.W), 2.U(4.W), 12.U(4.W)))

  val S8 = VecInit(VecInit(13.U(4.W), 1.U(4.W), 7.U(4.W), 2.U(4.W)),
    VecInit(2.U(4.W), 15.U(4.W), 11.U(4.W), 1.U(4.W)),
    VecInit(8.U(4.W), 13.U(4.W), 4.U(4.W), 14.U(4.W)),
    VecInit(4.U(4.W), 8.U(4.W), 1.U(4.W), 7.U(4.W)),
    VecInit(6.U(4.W), 10.U(4.W), 9.U(4.W), 4.U(4.W)),
    VecInit(15.U(4.W), 3.U(4.W), 12.U(4.W), 10.U(4.W)),
    VecInit(11.U(4.W), 7.U(4.W), 14.U(4.W), 8.U(4.W)),
    VecInit(1.U(4.W), 4.U(4.W), 2.U(4.W), 13.U(4.W)),
    VecInit(10.U(4.W), 12.U(4.W), 0.U(4.W), 15.U(4.W)),
    VecInit(9.U(4.W), 5.U(4.W), 6.U(4.W), 12.U(4.W)),
    VecInit(3.U(4.W), 6.U(4.W), 10.U(4.W), 9.U(4.W)),
    VecInit(14.U(4.W), 11.U(4.W), 13.U(4.W), 0.U(4.W)),
    VecInit(5.U(4.W), 0.U(4.W), 15.U(4.W), 3.U(4.W)),
    VecInit(0.U(4.W), 14.U(4.W), 3.U(4.W), 5.U(4.W)),
    VecInit(12.U(4.W), 9.U(4.W), 5.U(4.W), 6.U(4.W)),
    VecInit(7.U(4.W), 2.U(4.W), 8.U(4.W), 11.U(4.W)))

  io.out := Cat(S1(col(0))(row(0)),S2(col(1))(row(1)),S3(col(2))(row(2)),S4(col(3))(row(3)),
    S5(col(4))(row(4)),S6(col(5))(row(5)),S7(col(6))(row(6)),S8(col(7))(row(7)))
}

class DES_P extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(32.W))
    val out = Output(UInt(32.W))
  })

  val reversed = Wire(UInt(32.W))
  reversed := Reverse(io.in)

  io.out := Cat(reversed(15),reversed(6),reversed(19),reversed(20),
    reversed(28),reversed(11),reversed(27),reversed(16),
    reversed(0),reversed(14),reversed(22),reversed(25),
    reversed(4),reversed(17),reversed(30),reversed(9),
    reversed(1),reversed(7),reversed(23),reversed(13),
    reversed(31),reversed(26),reversed(2),reversed(8),
    reversed(18),reversed(12),reversed(29),reversed(5),
    reversed(21),reversed(10),reversed(3),reversed(24))
}

class DES_E extends Module {
  val io = IO(new Bundle {
    val R = Input(UInt(32.W))
    val E = Output(UInt(48.W))
  })

  val reversed = Wire(UInt(32.W))
  reversed := Reverse(io.R)

  io.E := Cat(reversed(31),reversed(0),reversed(1),reversed(2),reversed(3),reversed(4),
    reversed(3),reversed(4),reversed(5),reversed(6),reversed(7),reversed(8),
    reversed(7),reversed(8),reversed(9),reversed(10),reversed(11),reversed(12),
    reversed(11),reversed(12),reversed(13),reversed(14),reversed(15),reversed(16),
    reversed(15),reversed(16),reversed(17),reversed(18),reversed(19),reversed(20),
    reversed(19),reversed(20),reversed(21),reversed(22),reversed(23),reversed(24),
    reversed(23),reversed(24),reversed(25),reversed(26),reversed(27),reversed(28),
    reversed(27),reversed(28),reversed(29),reversed(30),reversed(31),reversed(0))
}

class DES_DataInterPE extends Bundle {
  val L = Output(UInt(32.W))
  val R = Output(UInt(32.W))
  val C = Output(UInt(28.W))
  val D = Output(UInt(28.W))
}

