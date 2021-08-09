package elastic.AES_EncryptionPipelinedElasticBuffer

import chisel3._
import chisel3.util._

class AES_EncryptionPipelinedElasticBuffer extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(new AES_DataOutput)
    val in = Flipped(out)
  })

  val initialOperation = Module(new AES_InitialOperation)
  initialOperation.io.in.valid := io.in.valid
  initialOperation.io.in.bits := io.in.bits
  io.in.ready := initialOperation.io.in.ready

  val finalOperation = Module(new AES_FinalOperation)
  io.out.bits := finalOperation.io.out.bits
  io.out.valid := finalOperation.io.out.valid
  finalOperation.io.out.ready := io.out.ready

  val PEs = for (i <- 0 until 10) yield {
    val pe = Module(new AES_ProcessingElement(round = i))
    pe.io := DontCare
    pe
  }

  for (i <- 0 until 10) {
    if(i == 0) {
      PEs(i).io.in.valid := initialOperation.io.out.valid
      PEs(i).io.in.bits := initialOperation.io.out.bits
      initialOperation.io.out.ready := PEs(i).io.in.ready

      PEs(i+1).io.in.valid := PEs(i).io.out.valid
      PEs(i+1).io.in.bits := PEs(i).io.out.bits
      PEs(i).io.out.ready := PEs(i+1).io.in.ready
    } else if(i == 9) {
      finalOperation.io.in.valid := PEs(i).io.out.valid
      finalOperation.io.in.bits.state := PEs(i).io.out.bits.state
      finalOperation.io.in.bits.key := PEs(i).io.out.bits.key
      PEs(i).io.out.ready := finalOperation.io.in.ready
    } else {
      PEs(i+1).io.in.valid := PEs(i).io.out.valid
      PEs(i+1).io.in.bits := PEs(i).io.out.bits
      PEs(i).io.out.ready := PEs(i+1).io.in.ready
    }
  }
}

class AES_InitialOperation extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new AES_DataOutput))
    val out = new DecoupledIO(new AES_DataInterPE)
  })

  val input = WireDefault(io.in.bits)
  val result = WireDefault(io.out.bits)
  val data = RegInit(VecInit(Seq.fill(2)(0.U.asTypeOf(io.in.bits))))
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
  for(i <- 0 until 4) {
    for(j <- 0 until 4) {
      result.state(3-i)(3-j) := input.text(32*i+8*(j+1)-1, 32*i+8*j)
      result.key(3-i)(3-j) := input.key(32*i+8*(j+1)-1, 32*i+8*j)
    }
  }
}

class AES_FinalOperation extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(new AES_DataOutput)
    val in = Flipped(new DecoupledIO(new AES_DataInterPE))
  })

  val input = WireDefault(io.in.bits)
  val result = WireDefault(io.out.bits)
  val data = RegInit(VecInit(Seq.fill(2)(0.U.asTypeOf(io.in.bits))))
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
  result.text := Cat(input.state(0)(0)^input.key(0)(0),input.state(0)(1)^input.key(0)(1),
    input.state(0)(2)^input.key(0)(2),input.state(0)(3)^input.key(0)(3),
    input.state(1)(0)^input.key(1)(0),input.state(1)(1)^input.key(1)(1),
    input.state(1)(2)^input.key(1)(2),input.state(1)(3)^input.key(1)(3),
    input.state(2)(0)^input.key(2)(0),input.state(2)(1)^input.key(2)(1),
    input.state(2)(2)^input.key(2)(2),input.state(2)(3)^input.key(2)(3),
    input.state(3)(0)^input.key(3)(0),input.state(3)(1)^input.key(3)(1),
    input.state(3)(2)^input.key(3)(2),input.state(3)(3)^input.key(3)(3))

  result.key := Cat(input.key(0)(0),input.key(0)(1),input.key(0)(2),input.key(0)(3),
    input.key(1)(0),input.key(1)(1),input.key(1)(2),input.key(1)(3),
    input.key(2)(0),input.key(2)(1),input.key(2)(2),input.key(2)(3),
    input.key(3)(0),input.key(3)(1),input.key(3)(2),input.key(3)(3))
}

class AES_ProcessingElement(round: Int) extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(new AES_DataInterPE)
    val in = Flipped(out)
  })

  val input = WireDefault(io.in.bits)
  val result = WireDefault(io.out.bits)
  val data = RegInit(VecInit(Seq.fill(2)(0.U.asTypeOf(io.in.bits))))
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
  val sub = Module(new AES_SubBytes)
  sub.io.in.key := DontCare
  for(i <- 0 until 4) {
    for(j <- 0 until 4) {
      sub.io.in.state(i)(j) := input.state(i)(j) ^ input.key(i)(j)
    }
  }

  val shift = Module(new AES_ShiftRows)
  shift.io.in := sub.io.out

  val mix = Module(new AES_MixColumns)
  mix.io.in := shift.io.out

  if(round == 9) {
    result.state := shift.io.out.state
  } else {
    result.state := mix.io.out.state
  }

  val key = Module(new AES_GetNewKey(round = round))
  key.io.in.state := DontCare
  key.io.in.key := input.key
  result.key := key.io.out.key
}

class AES_GetNewKey(round: Int) extends Module {
  val io = IO(new Bundle {
    val out = new AES_DataInterPE
    val in = Flipped(out)
  })

  io.out.state := DontCare

  val w0, w1, w2, w3 = Wire(UInt(32.W))
  w0 := Cat(io.in.key(0)(0), io.in.key(0)(1), io.in.key(0)(2), io.in.key(0)(3))
  w1 := Cat(io.in.key(1)(0), io.in.key(1)(1), io.in.key(1)(2), io.in.key(1)(3))
  w2 := Cat(io.in.key(2)(0), io.in.key(2)(1), io.in.key(2)(2), io.in.key(2)(3))
  w3 := Cat(io.in.key(3)(0), io.in.key(3)(1), io.in.key(3)(2), io.in.key(3)(3))

  val rot = Module(new AES_RotWord)
  rot.io.in := w3

  val sub = Module(new AES_SubWord)
  sub.io.in := rot.io.out

  val Rcon = Wire(UInt(32.W))
  round match {
    case 0 => Rcon := "h01000000".U
    case 1 => Rcon := "h02000000".U
    case 2 => Rcon := "h04000000".U
    case 3 => Rcon := "h08000000".U
    case 4 => Rcon := "h10000000".U
    case 5 => Rcon := "h20000000".U
    case 6 => Rcon := "h40000000".U
    case 7 => Rcon := "h80000000".U
    case 8 => Rcon := "h1b000000".U
    case 9 => Rcon := "h36000000".U
  }

  val w5, w6, w7, w8 = Wire(UInt(32.W))
  w5 := sub.io.out ^ Rcon ^ w0
  w6 := w5 ^ w1
  w7 := w6 ^ w2
  w8 := w7 ^ w3

  for(i <- 0 until 4) {
    io.out.key(0)(3-i) := w5(8*(i+1)-1,8*i)
    io.out.key(1)(3-i) := w6(8*(i+1)-1,8*i)
    io.out.key(2)(3-i) := w7(8*(i+1)-1,8*i)
    io.out.key(3)(3-i) := w8(8*(i+1)-1,8*i)
  }
}

class AES_SubWord extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(32.W))
    val in = Flipped(out)
  })

  val PEs = for(i <- 0 until 4) yield {
    val pe = Module(new AES_S)
    pe.io.in := io.in((i+1)*8-1,i*8)
    pe
  }

  io.out := Cat(PEs(3).io.out, PEs(2).io.out, PEs(1).io.out, PEs(0).io.out)
}

class AES_RotWord extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(32.W))
    val in = Flipped(out)
  })

  io.out := Cat(io.in(23,0), io.in(31,24))
}

class AES_MixColumns extends Module {
  val io = IO(new Bundle {
    val out = new AES_DataInterPE
    val in = Flipped(out)
  })

  io.out.key := DontCare

  val PEs = for (i <- 0 until 4) yield {
    val pe = Module(new AES_MixColumn)
    pe.io := DontCare
    pe
  }

  for(i <- 0 until 4) {
    PEs(i).io.in := io.in.state(i)
    io.out.state(i) := PEs(i).io.out
  }
}

class AES_MixColumn extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(4, UInt(8.W)))
    val out = Output(Vec(4, UInt(8.W)))
  })

  val mul2 = VecInit("h00".U, "h02".U, "h04".U, "h06".U, "h08".U, "h0a".U, "h0c".U, "h0e".U,
    "h10".U, "h12".U, "h14".U, "h16".U, "h18".U, "h1a".U, "h1c".U, "h1e".U,
    "h20".U, "h22".U, "h24".U, "h26".U, "h28".U, "h2a".U, "h2c".U, "h2e".U,
    "h30".U, "h32".U, "h34".U, "h36".U, "h38".U, "h3a".U, "h3c".U, "h3e".U,
    "h40".U, "h42".U, "h44".U, "h46".U, "h48".U, "h4a".U, "h4c".U, "h4e".U,
    "h50".U, "h52".U, "h54".U, "h56".U, "h58".U, "h5a".U, "h5c".U, "h5e".U,
    "h60".U, "h62".U, "h64".U, "h66".U, "h68".U, "h6a".U, "h6c".U, "h6e".U,
    "h70".U, "h72".U, "h74".U, "h76".U, "h78".U, "h7a".U, "h7c".U, "h7e".U,
    "h80".U, "h82".U, "h84".U, "h86".U, "h88".U, "h8a".U, "h8c".U, "h8e".U,
    "h90".U, "h92".U, "h94".U, "h96".U, "h98".U, "h9a".U, "h9c".U, "h9e".U,
    "ha0".U, "ha2".U, "ha4".U, "ha6".U, "ha8".U, "haa".U, "hac".U, "hae".U,
    "hb0".U, "hb2".U, "hb4".U, "hb6".U, "hb8".U, "hba".U, "hbc".U, "hbe".U,
    "hc0".U, "hc2".U, "hc4".U, "hc6".U, "hc8".U, "hca".U, "hcc".U, "hce".U,
    "hd0".U, "hd2".U, "hd4".U, "hd6".U, "hd8".U, "hda".U, "hdc".U, "hde".U,
    "he0".U, "he2".U, "he4".U, "he6".U, "he8".U, "hea".U, "hec".U, "hee".U,
    "hf0".U, "hf2".U, "hf4".U, "hf6".U, "hf8".U, "hfa".U, "hfc".U, "hfe".U,
    "h1b".U, "h19".U, "h1f".U, "h1d".U, "h13".U, "h11".U, "h17".U, "h15".U,
    "h0b".U, "h09".U, "h0f".U, "h0d".U, "h03".U, "h01".U, "h07".U, "h05".U,
    "h3b".U, "h39".U, "h3f".U, "h3d".U, "h33".U, "h31".U, "h37".U, "h35".U,
    "h2b".U, "h29".U, "h2f".U, "h2d".U, "h23".U, "h21".U, "h27".U, "h25".U,
    "h5b".U, "h59".U, "h5f".U, "h5d".U, "h53".U, "h51".U, "h57".U, "h55".U,
    "h4b".U, "h49".U, "h4f".U, "h4d".U, "h43".U, "h41".U, "h47".U, "h45".U,
    "h7b".U, "h79".U, "h7f".U, "h7d".U, "h73".U, "h71".U, "h77".U, "h75".U,
    "h6b".U, "h69".U, "h6f".U, "h6d".U, "h63".U, "h61".U, "h67".U, "h65".U,
    "h9b".U, "h99".U, "h9f".U, "h9d".U, "h93".U, "h91".U, "h97".U, "h95".U,
    "h8b".U, "h89".U, "h8f".U, "h8d".U, "h83".U, "h81".U, "h87".U, "h85".U,
    "hbb".U, "hb9".U, "hbf".U, "hbd".U, "hb3".U, "hb1".U, "hb7".U, "hb5".U,
    "hab".U, "ha9".U, "haf".U, "had".U, "ha3".U, "ha1".U, "ha7".U, "ha5".U,
    "hdb".U, "hd9".U, "hdf".U, "hdd".U, "hd3".U, "hd1".U, "hd7".U, "hd5".U,
    "hcb".U, "hc9".U, "hcf".U, "hcd".U, "hc3".U, "hc1".U, "hc7".U, "hc5".U,
    "hfb".U, "hf9".U, "hff".U, "hfd".U, "hf3".U, "hf1".U, "hf7".U, "hf5".U,
    "heb".U, "he9".U, "hef".U, "hed".U, "he3".U, "he1".U, "he7".U, "he5".U)

  io.out(0) := mul2(io.in(0)) ^ mul2(io.in(1)) ^ io.in(1) ^ io.in(2) ^ io.in(3)
  io.out(1) := io.in(0) ^ mul2(io.in(1)) ^ mul2(io.in(2)) ^ io.in(2) ^ io.in(3)
  io.out(2) := io.in(0) ^ io.in(1) ^ mul2(io.in(2)) ^ mul2(io.in(3)) ^ io.in(3)
  io.out(3) := mul2(io.in(0)) ^ io.in(0) ^ io.in(1) ^ io.in(2) ^ mul2(io.in(3))
}

class AES_ShiftRows extends Module {
  val io = IO(new Bundle {
    val out = new AES_DataInterPE
    val in = Flipped(out)
  })

  io.out.key := DontCare

  io.out.state(0)(0) := io.in.state(0)(0)
  io.out.state(1)(0) := io.in.state(1)(0)
  io.out.state(2)(0) := io.in.state(2)(0)
  io.out.state(3)(0) := io.in.state(3)(0)

  io.out.state(0)(1) := io.in.state(1)(1)
  io.out.state(1)(1) := io.in.state(2)(1)
  io.out.state(2)(1) := io.in.state(3)(1)
  io.out.state(3)(1) := io.in.state(0)(1)

  io.out.state(0)(2) := io.in.state(2)(2)
  io.out.state(1)(2) := io.in.state(3)(2)
  io.out.state(2)(2) := io.in.state(0)(2)
  io.out.state(3)(2) := io.in.state(1)(2)

  io.out.state(0)(3) := io.in.state(3)(3)
  io.out.state(1)(3) := io.in.state(0)(3)
  io.out.state(2)(3) := io.in.state(1)(3)
  io.out.state(3)(3) := io.in.state(2)(3)
}

class AES_SubBytes extends Module {
  val io = IO(new Bundle {
    val out = new AES_DataInterPE
    val in = Flipped(out)
  })

  io.out.key := DontCare

  val PEs = for (i <- 0 until 4) yield {
    for (j <- 0 until 4) yield {
      val pe = Module(new AES_S)
      pe.io := DontCare
      pe
    }
  }

  for(i <- 0 until 4) {
    for(j <- 0 until 4) {
      PEs(i)(j).io.in := io.in.state(i)(j)
      io.out.state(i)(j) := PEs(i)(j).io.out
    }
  }
}

class AES_S extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(8.W))
    val out = Output(UInt(8.W))
  })

  val S = VecInit(VecInit("h63".U, "h7c".U, "h77".U, "h7b".U, "hf2".U, "h6b".U, "h6f".U, "hc5".U,
    "h30".U, "h01".U, "h67".U, "h2b".U, "hfe".U, "hd7".U, "hab".U, "h76".U),
    VecInit("hca".U, "h82".U, "hc9".U, "h7d".U, "hfa".U, "h59".U, "h47".U, "hf0".U,
      "had".U, "hd4".U, "ha2".U, "haf".U, "h9c".U, "ha4".U, "h72".U, "hc0".U),
    VecInit("hb7".U, "hfd".U, "h93".U, "h26".U, "h36".U, "h3f".U, "hf7".U, "hcc".U,
      "h34".U, "ha5".U, "he5".U, "hf1".U, "h71".U, "hd8".U, "h31".U, "h15".U),
    VecInit("h04".U, "hc7".U, "h23".U, "hc3".U, "h18".U, "h96".U, "h05".U, "h9a".U,
      "h07".U, "h12".U, "h80".U, "he2".U, "heb".U, "h27".U, "hb2".U, "h75".U),
    VecInit("h09".U, "h83".U, "h2c".U, "h1a".U, "h1b".U, "h6e".U, "h5a".U, "ha0".U,
      "h52".U, "h3b".U, "hd6".U, "hb3".U, "h29".U, "he3".U, "h2f".U, "h84".U),
    VecInit("h53".U, "hd1".U, "h00".U, "hed".U, "h20".U, "hfc".U, "hb1".U, "h5b".U,
      "h6a".U, "hcb".U, "hbe".U, "h39".U, "h4a".U, "h4c".U, "h58".U, "hcf".U),
    VecInit("hd0".U, "hef".U, "haa".U, "hfb".U, "h43".U, "h4d".U, "h33".U, "h85".U,
      "h45".U, "hf9".U, "h02".U, "h7f".U, "h50".U, "h3c".U, "h9f".U, "ha8".U),
    VecInit("h51".U, "ha3".U, "h40".U, "h8f".U, "h92".U, "h9d".U, "h38".U, "hf5".U,
      "hbc".U, "hb6".U, "hda".U, "h21".U, "h10".U, "hff".U, "hf3".U, "hd2".U),
    VecInit("hcd".U, "h0c".U, "h13".U, "hec".U, "h5f".U, "h97".U, "h44".U, "h17".U,
      "hc4".U, "ha7".U, "h7e".U, "h3d".U, "h64".U, "h5d".U, "h19".U, "h73".U),
    VecInit("h60".U, "h81".U, "h4f".U, "hdc".U, "h22".U, "h2a".U, "h90".U, "h88".U,
      "h46".U, "hee".U, "hb8".U, "h14".U, "hde".U, "h5e".U, "h0b".U, "hdb".U),
    VecInit("he0".U, "h32".U, "h3a".U, "h0a".U, "h49".U, "h06".U, "h24".U, "h5c".U,
      "hc2".U, "hd3".U, "hac".U, "h62".U, "h91".U, "h95".U, "he4".U, "h79".U),
    VecInit("he7".U, "hc8".U, "h37".U, "h6d".U, "h8d".U, "hd5".U, "h4e".U, "ha9".U,
      "h6c".U, "h56".U, "hf4".U, "hea".U, "h65".U, "h7a".U, "hae".U, "h08".U),
    VecInit("hba".U, "h78".U, "h25".U, "h2e".U, "h1c".U, "ha6".U, "hb4".U, "hc6".U,
      "he8".U, "hdd".U, "h74".U, "h1f".U, "h4b".U, "hbd".U, "h8b".U, "h8a".U),
    VecInit("h70".U, "h3e".U, "hb5".U, "h66".U, "h48".U, "h03".U, "hf6".U, "h0e".U,
      "h61".U, "h35".U, "h57".U, "hb9".U, "h86".U, "hc1".U, "h1d".U, "h9e".U),
    VecInit("he1".U, "hf8".U, "h98".U, "h11".U, "h69".U, "hd9".U, "h8e".U, "h94".U,
      "h9b".U, "h1e".U, "h87".U, "he9".U, "hce".U, "h55".U, "h28".U, "hdf".U),
    VecInit("h8c".U, "ha1".U, "h89".U, "h0d".U, "hbf".U, "he6".U, "h42".U, "h68".U,
      "h41".U, "h99".U, "h2d".U, "h0f".U, "hb0".U, "h54".U, "hbb".U, "h16".U))

  io.out := S(io.in(7,4))(io.in(3,0))
}

class AES_InvS extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(8.W))
    val out = Output(UInt(8.W))
  })

  val S = VecInit(VecInit("h52".U, "h09".U, "h6a".U, "hd5".U, "h30".U, "h36".U, "ha5".U, "h38".U,
    "hbf".U, "h40".U, "ha3".U, "h9e".U, "h81".U, "hf3".U, "hd7".U, "hfb".U),
    VecInit("h7c".U, "he3".U, "h39".U, "h82".U, "h9b".U, "h2f".U, "hff".U, "h87".U,
      "h34".U, "h8e".U, "h43".U, "h44".U, "hc4".U, "hde".U, "he9".U, "hcb".U),
    VecInit("h54".U, "h7b".U, "h94".U, "h32".U, "ha6".U, "hc2".U, "h23".U, "h3d".U,
      "hee".U, "h4c".U, "h95".U, "h0b".U, "h42".U, "hfa".U, "hc3".U, "h4e".U),
    VecInit("h08".U, "h2e".U, "ha1".U, "h66".U, "h28".U, "hd9".U, "h24".U, "hb2".U,
      "h76".U, "h5b".U, "ha2".U, "h49".U, "h6d".U, "h8b".U, "hd1".U, "h25".U),
    VecInit("h72".U, "hf8".U, "hf6".U, "h64".U, "h86".U, "h68".U, "h98".U, "h16".U,
      "hd4".U, "ha4".U, "h5c".U, "hcc".U, "h5d".U, "h65".U, "hb6".U, "h92".U),
    VecInit("h6c".U, "h70".U, "h48".U, "h50".U, "hfd".U, "hed".U, "hb9".U, "hda".U,
      "h5e".U, "h15".U, "h46".U, "h57".U, "ha7".U, "h8d".U, "h9d".U, "h84".U),
    VecInit("h90".U, "hd8".U, "hab".U, "h00".U, "h8c".U, "hbc".U, "hd3".U, "h0a".U,
      "hf7".U, "he4".U, "h58".U, "h05".U, "hb8".U, "hb3".U, "h45".U, "h06".U),
    VecInit("hd0".U, "h2c".U, "h1e".U, "h8f".U, "hca".U, "h3f".U, "h0f".U, "h02".U,
      "hc1".U, "haf".U, "hbd".U, "h03".U, "h01".U, "h13".U, "h8a".U, "h6b".U),
    VecInit("h3a".U, "h91".U, "h11".U, "h41".U, "h4f".U, "h67".U, "hdc".U, "hea".U,
      "h97".U, "hf2".U, "hcf".U, "hce".U, "hf0".U, "hb4".U, "he6".U, "h73".U),
    VecInit("h96".U, "hac".U, "h74".U, "h22".U, "he7".U, "had".U, "h35".U, "h85".U,
      "he2".U, "hf9".U, "h37".U, "he8".U, "h1c".U, "h75".U, "hdf".U, "h6e".U),
    VecInit("h47".U, "hf1".U, "h1a".U, "h71".U, "h1d".U, "h29".U, "hc5".U, "h89".U,
      "h6f".U, "hb7".U, "h62".U, "h0e".U, "haa".U, "h18".U, "hbe".U, "h1b".U),
    VecInit("hfc".U, "h56".U, "h3e".U, "h4b".U, "hc6".U, "hd2".U, "h79".U, "h20".U,
      "h9a".U, "hdb".U, "hc0".U, "hfe".U, "h78".U, "hcd".U, "h5a".U, "hf4".U),
    VecInit("h1f".U, "hdd".U, "ha8".U, "h33".U, "h88".U, "h07".U, "hc7".U, "h31".U,
      "hb1".U, "h12".U, "h10".U, "h59".U, "h27".U, "h80".U, "hec".U, "h5f".U),
    VecInit("h60".U, "h51".U, "h7f".U, "ha9".U, "h19".U, "hb5".U, "h4a".U, "h0d".U,
      "h2d".U, "he5".U, "h7a".U, "h9f".U, "h93".U, "hc9".U, "h9c".U, "hef".U),
    VecInit("ha0".U, "he0".U, "h3b".U, "h4d".U, "hae".U, "h2a".U, "hf5".U, "hb0".U,
      "hc8".U, "heb".U, "hbb".U, "h3c".U, "h83".U, "h53".U, "h99".U, "h61".U),
    VecInit("h17".U, "h2b".U, "h04".U, "h7e".U, "hba".U, "h77".U, "hd6".U, "h26".U,
      "he1".U, "h69".U, "h14".U, "h63".U, "h55".U, "h21".U, "h0c".U, "h7d".U))

  io.out := S(io.in(7,4))(io.in(3,0))
}

class AES_InvMixColumn extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(4, UInt(8.W)))
    val out = Output(Vec(4, UInt(8.W)))
  })

  val mul9 = VecInit("h00".U, "h09".U, "h12".U, "h1b".U, "h24".U, "h2d".U, "h36".U, "h3f".U,
    "h48".U, "h41".U, "h5a".U, "h53".U, "h6c".U, "h65".U, "h7e".U, "h77".U,
    "h90".U, "h99".U, "h82".U, "h8b".U, "hb4".U, "hbd".U, "ha6".U, "haf".U,
    "hd8".U, "hd1".U, "hca".U, "hc3".U, "hfc".U, "hf5".U, "hee".U, "he7".U,
    "h3b".U, "h32".U, "h29".U, "h20".U, "h1f".U, "h16".U, "h0d".U, "h04".U,
    "h73".U, "h7a".U, "h61".U, "h68".U, "h57".U, "h5e".U, "h45".U, "h4c".U,
    "hab".U, "ha2".U, "hb9".U, "hb0".U, "h8f".U, "h86".U, "h9d".U, "h94".U,
    "he3".U, "hea".U, "hf1".U, "hf8".U, "hc7".U, "hce".U, "hd5".U, "hdc".U,
    "h76".U, "h7f".U, "h64".U, "h6d".U, "h52".U, "h5b".U, "h40".U, "h49".U,
    "h3e".U, "h37".U, "h2c".U, "h25".U, "h1a".U, "h13".U, "h08".U, "h01".U,
    "he6".U, "hef".U, "hf4".U, "hfd".U, "hc2".U, "hcb".U, "hd0".U, "hd9".U,
    "hae".U, "ha7".U, "hbc".U, "hb5".U, "h8a".U, "h83".U, "h98".U, "h91".U,
    "h4d".U, "h44".U, "h5f".U, "h56".U, "h69".U, "h60".U, "h7b".U, "h72".U,
    "h05".U, "h0c".U, "h17".U, "h1e".U, "h21".U, "h28".U, "h33".U, "h3a".U,
    "hdd".U, "hd4".U, "hcf".U, "hc6".U, "hf9".U, "hf0".U, "heb".U, "he2".U,
    "h95".U, "h9c".U, "h87".U, "h8e".U, "hb1".U, "hb8".U, "ha3".U, "haa".U,
    "hec".U, "he5".U, "hfe".U, "hf7".U, "hc8".U, "hc1".U, "hda".U, "hd3".U,
    "ha4".U, "had".U, "hb6".U, "hbf".U, "h80".U, "h89".U, "h92".U, "h9b".U,
    "h7c".U, "h75".U, "h6e".U, "h67".U, "h58".U, "h51".U, "h4a".U, "h43".U,
    "h34".U, "h3d".U, "h26".U, "h2f".U, "h10".U, "h19".U, "h02".U, "h0b".U,
    "hd7".U, "hde".U, "hc5".U, "hcc".U, "hf3".U, "hfa".U, "he1".U, "he8".U,
    "h9f".U, "h96".U, "h8d".U, "h84".U, "hbb".U, "hb2".U, "ha9".U, "ha0".U,
    "h47".U, "h4e".U, "h55".U, "h5c".U, "h63".U, "h6a".U, "h71".U, "h78".U,
    "h0f".U, "h06".U, "h1d".U, "h14".U, "h2b".U, "h22".U, "h39".U, "h30".U,
    "h9a".U, "h93".U, "h88".U, "h81".U, "hbe".U, "hb7".U, "hac".U, "ha5".U,
    "hd2".U, "hdb".U, "hc0".U, "hc9".U, "hf6".U, "hff".U, "he4".U, "hed".U,
    "h0a".U, "h03".U, "h18".U, "h11".U, "h2e".U, "h27".U, "h3c".U, "h35".U,
    "h42".U, "h4b".U, "h50".U, "h59".U, "h66".U, "h6f".U, "h74".U, "h7d".U,
    "ha1".U, "ha8".U, "hb3".U, "hba".U, "h85".U, "h8c".U, "h97".U, "h9e".U,
    "he9".U, "he0".U, "hfb".U, "hf2".U, "hcd".U, "hc4".U, "hdf".U, "hd6".U,
    "h31".U, "h38".U, "h23".U, "h2a".U, "h15".U, "h1c".U, "h07".U, "h0e".U,
    "h79".U, "h70".U, "h6b".U, "h62".U, "h5d".U, "h54".U, "h4f".U, "h46".U)

  val mul11 = VecInit("h00".U, "h0b".U, "h16".U, "h1d".U, "h2c".U, "h27".U, "h3a".U, "h31".U,
    "h58".U, "h53".U, "h4e".U, "h45".U, "h74".U, "h7f".U, "h62".U, "h69".U,
    "hb0".U, "hbb".U, "ha6".U, "had".U, "h9c".U, "h97".U, "h8a".U, "h81".U,
    "he8".U, "he3".U, "hfe".U, "hf5".U, "hc4".U, "hcf".U, "hd2".U, "hd9".U,
    "h7b".U, "h70".U, "h6d".U, "h66".U, "h57".U, "h5c".U, "h41".U, "h4a".U,
    "h23".U, "h28".U, "h35".U, "h3e".U, "h0f".U, "h04".U, "h19".U, "h12".U,
    "hcb".U, "hc0".U, "hdd".U, "hd6".U, "he7".U, "hec".U, "hf1".U, "hfa".U,
    "h93".U, "h98".U, "h85".U, "h8e".U, "hbf".U, "hb4".U, "ha9".U, "ha2".U,
    "hf6".U, "hfd".U, "he0".U, "heb".U, "hda".U, "hd1".U, "hcc".U, "hc7".U,
    "hae".U, "ha5".U, "hb8".U, "hb3".U, "h82".U, "h89".U, "h94".U, "h9f".U,
    "h46".U, "h4d".U, "h50".U, "h5b".U, "h6a".U, "h61".U, "h7c".U, "h77".U,
    "h1e".U, "h15".U, "h08".U, "h03".U, "h32".U, "h39".U, "h24".U, "h2f".U,
    "h8d".U, "h86".U, "h9b".U, "h90".U, "ha1".U, "haa".U, "hb7".U, "hbc".U,
    "hd5".U, "hde".U, "hc3".U, "hc8".U, "hf9".U, "hf2".U, "hef".U, "he4".U,
    "h3d".U, "h36".U, "h2b".U, "h20".U, "h11".U, "h1a".U, "h07".U, "h0c".U,
    "h65".U, "h6e".U, "h73".U, "h78".U, "h49".U, "h42".U, "h5f".U, "h54".U,
    "hf7".U, "hfc".U, "he1".U, "hea".U, "hdb".U, "hd0".U, "hcd".U, "hc6".U,
    "haf".U, "ha4".U, "hb9".U, "hb2".U, "h83".U, "h88".U, "h95".U, "h9e".U,
    "h47".U, "h4c".U, "h51".U, "h5a".U, "h6b".U, "h60".U, "h7d".U, "h76".U,
    "h1f".U, "h14".U, "h09".U, "h02".U, "h33".U, "h38".U, "h25".U, "h2e".U,
    "h8c".U, "h87".U, "h9a".U, "h91".U, "ha0".U, "hab".U, "hb6".U, "hbd".U,
    "hd4".U, "hdf".U, "hc2".U, "hc9".U, "hf8".U, "hf3".U, "hee".U, "he5".U,
    "h3c".U, "h37".U, "h2a".U, "h21".U, "h10".U, "h1b".U, "h06".U, "h0d".U,
    "h64".U, "h6f".U, "h72".U, "h79".U, "h48".U, "h43".U, "h5e".U, "h55".U,
    "h01".U, "h0a".U, "h17".U, "h1c".U, "h2d".U, "h26".U, "h3b".U, "h30".U,
    "h59".U, "h52".U, "h4f".U, "h44".U, "h75".U, "h7e".U, "h63".U, "h68".U,
    "hb1".U, "hba".U, "ha7".U, "hac".U, "h9d".U, "h96".U, "h8b".U, "h80".U,
    "he9".U, "he2".U, "hff".U, "hf4".U, "hc5".U, "hce".U, "hd3".U, "hd8".U,
    "h7a".U, "h71".U, "h6c".U, "h67".U, "h56".U, "h5d".U, "h40".U, "h4b".U,
    "h22".U, "h29".U, "h34".U, "h3f".U, "h0e".U, "h05".U, "h18".U, "h13".U,
    "hca".U, "hc1".U, "hdc".U, "hd7".U, "he6".U, "hed".U, "hf0".U, "hfb".U,
    "h92".U, "h99".U, "h84".U, "h8f".U, "hbe".U, "hb5".U, "ha8".U, "ha3".U)

  val mul13 = VecInit("h00".U, "h0d".U, "h1a".U, "h17".U, "h34".U, "h39".U, "h2e".U, "h23".U,
    "h68".U, "h65".U, "h72".U, "h7f".U, "h5c".U, "h51".U, "h46".U, "h4b".U,
    "hd0".U, "hdd".U, "hca".U, "hc7".U, "he4".U, "he9".U, "hfe".U, "hf3".U,
    "hb8".U, "hb5".U, "ha2".U, "haf".U, "h8c".U, "h81".U, "h96".U, "h9b".U,
    "hbb".U, "hb6".U, "ha1".U, "hac".U, "h8f".U, "h82".U, "h95".U, "h98".U,
    "hd3".U, "hde".U, "hc9".U, "hc4".U, "he7".U, "hea".U, "hfd".U, "hf0".U,
    "h6b".U, "h66".U, "h71".U, "h7c".U, "h5f".U, "h52".U, "h45".U, "h48".U,
    "h03".U, "h0e".U, "h19".U, "h14".U, "h37".U, "h3a".U, "h2d".U, "h20".U,
    "h6d".U, "h60".U, "h77".U, "h7a".U, "h59".U, "h54".U, "h43".U, "h4e".U,
    "h05".U, "h08".U, "h1f".U, "h12".U, "h31".U, "h3c".U, "h2b".U, "h26".U,
    "hbd".U, "hb0".U, "ha7".U, "haa".U, "h89".U, "h84".U, "h93".U, "h9e".U,
    "hd5".U, "hd8".U, "hcf".U, "hc2".U, "he1".U, "hec".U, "hfb".U, "hf6".U,
    "hd6".U, "hdb".U, "hcc".U, "hc1".U, "he2".U, "hef".U, "hf8".U, "hf5".U,
    "hbe".U, "hb3".U, "ha4".U, "ha9".U, "h8a".U, "h87".U, "h90".U, "h9d".U,
    "h06".U, "h0b".U, "h1c".U, "h11".U, "h32".U, "h3f".U, "h28".U, "h25".U,
    "h6e".U, "h63".U, "h74".U, "h79".U, "h5a".U, "h57".U, "h40".U, "h4d".U,
    "hda".U, "hd7".U, "hc0".U, "hcd".U, "hee".U, "he3".U, "hf4".U, "hf9".U,
    "hb2".U, "hbf".U, "ha8".U, "ha5".U, "h86".U, "h8b".U, "h9c".U, "h91".U,
    "h0a".U, "h07".U, "h10".U, "h1d".U, "h3e".U, "h33".U, "h24".U, "h29".U,
    "h62".U, "h6f".U, "h78".U, "h75".U, "h56".U, "h5b".U, "h4c".U, "h41".U,
    "h61".U, "h6c".U, "h7b".U, "h76".U, "h55".U, "h58".U, "h4f".U, "h42".U,
    "h09".U, "h04".U, "h13".U, "h1e".U, "h3d".U, "h30".U, "h27".U, "h2a".U,
    "hb1".U, "hbc".U, "hab".U, "ha6".U, "h85".U, "h88".U, "h9f".U, "h92".U,
    "hd9".U, "hd4".U, "hc3".U, "hce".U, "hed".U, "he0".U, "hf7".U, "hfa".U,
    "hb7".U, "hba".U, "had".U, "ha0".U, "h83".U, "h8e".U, "h99".U, "h94".U,
    "hdf".U, "hd2".U, "hc5".U, "hc8".U, "heb".U, "he6".U, "hf1".U, "hfc".U,
    "h67".U, "h6a".U, "h7d".U, "h70".U, "h53".U, "h5e".U, "h49".U, "h44".U,
    "h0f".U, "h02".U, "h15".U, "h18".U, "h3b".U, "h36".U, "h21".U, "h2c".U,
    "h0c".U, "h01".U, "h16".U, "h1b".U, "h38".U, "h35".U, "h22".U, "h2f".U,
    "h64".U, "h69".U, "h7e".U, "h73".U, "h50".U, "h5d".U, "h4a".U, "h47".U,
    "hdc".U, "hd1".U, "hc6".U, "hcb".U, "he8".U, "he5".U, "hf2".U, "hff".U,
    "hb4".U, "hb9".U, "hae".U, "ha3".U, "h80".U, "h8d".U, "h9a".U, "h97".U)

  val mul14 = VecInit("h00".U, "h0e".U, "h1c".U, "h12".U, "h38".U, "h36".U, "h24".U, "h2a".U,
    "h70".U, "h7e".U, "h6c".U, "h62".U, "h48".U, "h46".U, "h54".U, "h5a".U,
    "he0".U, "hee".U, "hfc".U, "hf2".U, "hd8".U, "hd6".U, "hc4".U, "hca".U,
    "h90".U, "h9e".U, "h8c".U, "h82".U, "ha8".U, "ha6".U, "hb4".U, "hba".U,
    "hdb".U, "hd5".U, "hc7".U, "hc9".U, "he3".U, "hed".U, "hff".U, "hf1".U,
    "hab".U, "ha5".U, "hb7".U, "hb9".U, "h93".U, "h9d".U, "h8f".U, "h81".U,
    "h3b".U, "h35".U, "h27".U, "h29".U, "h03".U, "h0d".U, "h1f".U, "h11".U,
    "h4b".U, "h45".U, "h57".U, "h59".U, "h73".U, "h7d".U, "h6f".U, "h61".U,
    "had".U, "ha3".U, "hb1".U, "hbf".U, "h95".U, "h9b".U, "h89".U, "h87".U,
    "hdd".U, "hd3".U, "hc1".U, "hcf".U, "he5".U, "heb".U, "hf9".U, "hf7".U,
    "h4d".U, "h43".U, "h51".U, "h5f".U, "h75".U, "h7b".U, "h69".U, "h67".U,
    "h3d".U, "h33".U, "h21".U, "h2f".U, "h05".U, "h0b".U, "h19".U, "h17".U,
    "h76".U, "h78".U, "h6a".U, "h64".U, "h4e".U, "h40".U, "h52".U, "h5c".U,
    "h06".U, "h08".U, "h1a".U, "h14".U, "h3e".U, "h30".U, "h22".U, "h2c".U,
    "h96".U, "h98".U, "h8a".U, "h84".U, "hae".U, "ha0".U, "hb2".U, "hbc".U,
    "he6".U, "he8".U, "hfa".U, "hf4".U, "hde".U, "hd0".U, "hc2".U, "hcc".U,
    "h41".U, "h4f".U, "h5d".U, "h53".U, "h79".U, "h77".U, "h65".U, "h6b".U,
    "h31".U, "h3f".U, "h2d".U, "h23".U, "h09".U, "h07".U, "h15".U, "h1b".U,
    "ha1".U, "haf".U, "hbd".U, "hb3".U, "h99".U, "h97".U, "h85".U, "h8b".U,
    "hd1".U, "hdf".U, "hcd".U, "hc3".U, "he9".U, "he7".U, "hf5".U, "hfb".U,
    "h9a".U, "h94".U, "h86".U, "h88".U, "ha2".U, "hac".U, "hbe".U, "hb0".U,
    "hea".U, "he4".U, "hf6".U, "hf8".U, "hd2".U, "hdc".U, "hce".U, "hc0".U,
    "h7a".U, "h74".U, "h66".U, "h68".U, "h42".U, "h4c".U, "h5e".U, "h50".U,
    "h0a".U, "h04".U, "h16".U, "h18".U, "h32".U, "h3c".U, "h2e".U, "h20".U,
    "hec".U, "he2".U, "hf0".U, "hfe".U, "hd4".U, "hda".U, "hc8".U, "hc6".U,
    "h9c".U, "h92".U, "h80".U, "h8e".U, "ha4".U, "haa".U, "hb8".U, "hb6".U,
    "h0c".U, "h02".U, "h10".U, "h1e".U, "h34".U, "h3a".U, "h28".U, "h26".U,
    "h7c".U, "h72".U, "h60".U, "h6e".U, "h44".U, "h4a".U, "h58".U, "h56".U,
    "h37".U, "h39".U, "h2b".U, "h25".U, "h0f".U, "h01".U, "h13".U, "h1d".U,
    "h47".U, "h49".U, "h5b".U, "h55".U, "h7f".U, "h71".U, "h63".U, "h6d".U,
    "hd7".U, "hd9".U, "hcb".U, "hc5".U, "hef".U, "he1".U, "hf3".U, "hfd".U,
    "ha7".U, "ha9".U, "hbb".U, "hb5".U, "h9f".U, "h91".U, "h83".U, "h8d".U)

  io.out(0) := mul14(io.in(0)) ^ mul11(io.in(1)) ^ mul13(io.in(2)) ^ mul9(io.in(3))
  io.out(1) := mul9(io.in(0)) ^ mul14(io.in(1)) ^ mul11(io.in(2)) ^ mul13(io.in(3))
  io.out(2) := mul13(io.in(0)) ^ mul9(io.in(1)) ^ mul14(io.in(2)) ^ mul11(io.in(3))
  io.out(3) := mul11(io.in(0)) ^ mul13(io.in(1)) ^ mul9(io.in(2)) ^ mul14(io.in(3))
}

class AES_DataInterPE extends Bundle {
  val state = Output(Vec(4,Vec(4, UInt(8.W))))
  val key = Output(Vec(4,Vec(4, UInt(8.W))))
}

class AES_DataOutput extends Bundle {
  val text = Output(UInt(128.W))
  val key = Output(UInt(128.W))
}
