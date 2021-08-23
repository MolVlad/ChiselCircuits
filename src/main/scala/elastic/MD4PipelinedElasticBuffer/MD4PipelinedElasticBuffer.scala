package elastic.MD4PipelinedElasticBuffer

import chisel3._
import chisel3.util._

// Fully pipelined MD4 algorithm, it produces data every clock cycle
// Several PEs are connected by chain, each has elastic buffer.
class MD4PipelinedElasticBuffer extends Module {
  // Elastic input/output interfaces
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new MD4OutputData))
    val hash = new DecoupledIO(UInt(128.W))
  })

  // first module in chain, directly connected to top module inputs, needed for changing byte order of input
  // output of this module is connected to the input of the first PE
  val changeInput = Module(new MD4ChangeOrderInput)
  changeInput.io.in.valid := io.in.valid
  changeInput.io.in.bits.X := io.in.bits.X
  changeInput.io.in.bits.A0 := io.in.bits.A0
  changeInput.io.in.bits.B0 := io.in.bits.B0
  changeInput.io.in.bits.C0 := io.in.bits.C0
  changeInput.io.in.bits.D0 := io.in.bits.D0
  io.in.ready := changeInput.io.in.ready

  // penultimate module in chain, needed to perform final addition of MD4 algorithm
  // input of this module is connected to the output of the last PE
  val add = Module(new MD4FinalAddition)
  add.io.in.bits.X := DontCare

  // ultimate module in chain, directly connected to top module outputs, needed for changing byte order of input
  // input of this module is connected to the output of add module
  val changeOutput = Module(new MD4ChangeOrderOutput)
  changeOutput.io.in.valid := add.io.out.valid
  changeOutput.io.in.bits := Cat(add.io.out.bits.A, add.io.out.bits.B, add.io.out.bits.C, add.io.out.bits.D)
  add.io.out.ready := changeOutput.io.in.ready
  io.hash.bits := changeOutput.io.out.bits
  io.hash.valid := changeOutput.io.out.valid
  changeOutput.io.out.ready := io.hash.ready

  // matrix of 48 PEs (processing elements), each element is unique, specified by parameters round and operation
  val PEs = for (i <- 0 until 3) yield {
    for (j <- 0 until 16) yield {
      val pe = Module(new MD4ProcessingElement(round = i, operation = j))
      pe.io := DontCare
      pe
    }
  }

  // connection of the PEs in chain
  for (i <- 0 until 3) {
    for (j <- 0 until 16) {
      if((i == 0) && (j == 0)) { // first pe
        // first pe input is connected to changeInput module's output
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

        // first pe output is connected to the second pe input
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
      } else if((i == 2) && (j == 15)) { // last pe
        // very last pe output is connected to add module's input
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
      } else if(j == 15) { // not very last pe, but the last one for this round
        // this pe output is connected to the input of the first pe of the next round
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
      } else { // just ordinary pe somewhere in the middle (not the first, not the last, not the last of the round)
        // just connect its output to the input of the next one
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

// change byte order of input data
class MD4ChangeOrderInput extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(new MD4OutputData)
    val in = Flipped(out)
  })

  /*
  ------------------------------------------------
  -------------- Boilerplate code ----------------
  ------------------------------------------------
  -------- Pipelining with elastic buffers -------
  ------------------------------------------------
  */

  val input = WireDefault(io.in.bits) // this wire should be used for computations
  val result = WireDefault(io.out.bits) // this wire should be assigned to computation result
  val data = RegInit(VecInit(Seq.fill(2)(0.U.asTypeOf(io.in.bits)))) // two registers for data to implement 2-slots elastic buffer
  val head = RegInit(false.B) // pointer to current slot for reading
  val tail = RegInit(false.B) // pointer to current slot for writing
  val full = RegInit(VecInit(Seq.fill(2)(false.B))) // two registers to indicate which registers with data are full

  io.in.ready := !(full(0) && full(1)) // input is ready when at least one slot is empty
  io.out.valid := full(0) || full(1) // output is valid when at least one slot is full
  io.out.bits := result // output result as output bits
  input := data(head) // input refers to the slot in data pointed by head

  // write
  when(io.in.valid && !full(tail)) { // when input is valid and current slot for writing is empty
    full(tail) := true.B // mark current slot as full
    data(tail) := io.in.bits // store data into current slot
    tail := !tail // move pointer for writing to the next slot
  }

  // read
  when(io.out.ready && full(head)) { // when output is ready and current slot for reading is full
    full(head) := false.B // mark current slot as empty
    head := !head // move pointer for reading to the next slot
  }

  /*
    ------------------------------------------------
    ----------------- Processing -------------------
    ------------------------------------------------
    ------ Usage: result = computations(input) -----
    ------------------------------------------------
   */

  // vector of PEs for changing byte order of X
  val PEs = VecInit(Seq.fill(16) {
    Module(new changeWordOrder).io
  })
  for (i <- 0 until 16) {
    PEs(i).in := input.X(32*(i+1)-1,32*i)
  }

  // construct resulting X from outputs of modules
  result.X := Cat(PEs(15).out, PEs(14).out, PEs(13).out, PEs(12).out, PEs(11).out,
    PEs(10).out, PEs(9).out, PEs(8).out, PEs(7).out, PEs(6).out, PEs(5).out,
    PEs(4).out, PEs(3).out, PEs(2).out, PEs(1).out, PEs(0).out)

  // module for changing byte order of A
  val PEa = Module(new changeWordOrder).io
  PEa.in := input.A0
  result.A0 := PEa.out

  // module for changing byte order of B
  val PEb = Module(new changeWordOrder).io
  PEb.in := input.B0
  result.B0 := PEb.out

  // module for changing byte order of C
  val PEc = Module(new changeWordOrder).io
  PEc.in := input.C0
  result.C0 := PEc.out

  // module for changing byte order of D
  val PEd = Module(new changeWordOrder).io
  PEd.in := input.D0
  result.D0 := PEd.out
}

// processing element for MD4 algorithm, round and operation are parameters to specify it
class MD4ProcessingElement(round: Int = 1, operation: Int = 1) extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(new MD4DataInterPE)
    val in = Flipped(out)
  })

  /*
  ------------------------------------------------
  -------------- Boilerplate code ----------------
  ------------------------------------------------
  -------- Pipelining with elastic buffers -------
  ------------------------------------------------
  */

  val input = WireDefault(io.in.bits) // this wire should be used for computations
  val result = WireDefault(io.out.bits) // this wire should be assigned to computation result
  val data = RegInit(VecInit(Seq.fill(2)(0.U.asTypeOf(io.in.bits)))) // two registers for data to implement 2-slots elastic buffer
  val head = RegInit(false.B) // pointer to current slot for reading
  val tail = RegInit(false.B) // pointer to current slot for writing
  val full = RegInit(VecInit(Seq.fill(2)(false.B))) // two registers to indicate which registers with data are full

  io.in.ready := !(full(0) && full(1)) // input is ready when at least one slot is empty
  io.out.valid := full(0) || full(1) // output is valid when at least one slot is full
  io.out.bits := result // output result as output bits
  input := data(head) // input refers to the slot in data pointed by head

  // write
  when(io.in.valid && !full(tail)) { // when input is valid and current slot for writing is empty
    full(tail) := true.B // mark current slot as full
    data(tail) := io.in.bits // store data into current slot
    tail := !tail // move pointer for writing to the next slot
  }

  // read
  when(io.out.ready && full(head)) { // when output is ready and current slot for reading is full
    full(head) := false.B // mark current slot as empty
    head := !head // move pointer for reading to the next slot
  }

  /*
    ------------------------------------------------
    ----------------- Processing -------------------
    ------------------------------------------------
    ------ Usage: result = computations(input) -----
    ------------------------------------------------
   */

  // transfer A0,B0,C0,D0 and X to the next PE without changes
  result.A0 := input.A0
  result.B0 := input.B0
  result.C0 := input.C0
  result.D0 := input.D0
  result.X := input.X

  // define wires for further use
  val const = Wire(UInt(32.W))
  val function = Wire(UInt(32.W))
  val F, G, H = Wire(UInt(32.W))
  val a, b, c, d, xk = Wire(UInt(32.W))
  val sum, rotated = Wire(UInt(32.W))

  // functions used in different steps
  F := (b & c) | ((~b).asUInt & d)
  G := (b & c) | (b & d) | (c & d)
  H := b ^ c ^ d

  // general formula for one MD4 step
  sum := a + function + xk + const

  // inputs for functions and element for storing output differ for each operation number, next if/else structure manages that
  if((operation % 4) == 0) {
    // choose a,b,c,d for such operations
    a := input.A; b := input.B; c := input.C; d := input.D;

    // store result in A; B,C,D are unchanged
    result.A := rotated; result.B := input.B; result.C := input.C; result.D := input.D

    // implementation of cyclic shift
    rotated := Cat(sum(28, 0), sum(31, 29))
  } else if((operation % 4) == 1) {
    // choose a,b,c,d for such operations
    a := input.D; b := input.A; c := input.B; d := input.C;

    // store result in D; A,B,C are unchanged
    result.A := input.A; result.B := input.B; result.C := input.C; result.D := rotated

    // implementation of cyclic shift
    round match {
      case 0 => rotated := Cat(sum(24, 0), sum(31, 25))
      case 1 => rotated := Cat(sum(26, 0), sum(31, 27))
      case 2 => rotated := Cat(sum(22, 0), sum(31, 23))
    }
  } else if((operation % 4) == 2) {
    // choose a,b,c,d for such operations
    a := input.C; b := input.D; c := input.A; d := input.B;

    // store result in C; A,B,D are unchanged
    result.A := input.A; result.B := input.B; result.C := rotated; result.D := input.D

    // implementation of cyclic shift
    round match {
      case 0 => rotated := Cat(sum(20, 0), sum(31, 21))
      case 1 => rotated := Cat(sum(22, 0), sum(31, 23))
      case 2 => rotated := Cat(sum(20, 0), sum(31, 21))
    }
  } else {
    // choose a,b,c,d for such operations
    a := input.B; b := input.C; c := input.D; d := input.A;

    // store result in B; A,C,D are unchanged
    result.A := input.A; result.B := rotated; result.C := input.C; result.D := input.D

    // implementation of cyclic shift
    round match {
      case 0 => rotated := Cat(sum(12, 0), sum(31, 13))
      case 1 => rotated := Cat(sum(18, 0), sum(31, 19))
      case 2 => rotated := Cat(sum(16, 0), sum(31, 17))
    }
  }

  // const, function and word extraction from X differ for each round number, next if/else structure manages that
  if(round == 0) {
    const := 0.U
    function := F

    // extract word from X depending on the operation number
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

    // extract word from X depending on the operation number
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

    // extract word from X depending on the operation number
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

// final addition for MD4 algorithm
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

  /*
  ------------------------------------------------
  -------------- Boilerplate code ----------------
  ------------------------------------------------
  -------- Pipelining with elastic buffers -------
  ------------------------------------------------
  */

  val input = WireDefault(io.in.bits) // this wire should be used for computations
  val result = WireDefault(io.out.bits) // this wire should be assigned to computation result
  val data = RegInit(VecInit(Seq.fill(2)(0.U.asTypeOf(io.in.bits)))) // two registers for data to implement 2-slots elastic buffer
  val head = RegInit(false.B) // pointer to current slot for reading
  val tail = RegInit(false.B) // pointer to current slot for writing
  val full = RegInit(VecInit(Seq.fill(2)(false.B))) // two registers to indicate which registers with data are full

  io.in.ready := !(full(0) && full(1)) // input is ready when at least one slot is empty
  io.out.valid := full(0) || full(1) // output is valid when at least one slot is full
  io.out.bits := result // output result as output bits
  input := data(head) // input refers to the slot in data pointed by head

  // write
  when(io.in.valid && !full(tail)) { // when input is valid and current slot for writing is empty
    full(tail) := true.B // mark current slot as full
    data(tail) := io.in.bits // store data into current slot
    tail := !tail // move pointer for writing to the next slot
  }

  // read
  when(io.out.ready && full(head)) { // when output is ready and current slot for reading is full
    full(head) := false.B // mark current slot as empty
    head := !head // move pointer for reading to the next slot
  }

  /*
    ------------------------------------------------
    ----------------- Processing -------------------
    ------------------------------------------------
    ------ Usage: result = computations(input) -----
    ------------------------------------------------
   */

  // just add *0 to *, where * is A,B,C or D
  result.A := input.A + input.A0
  result.B := input.B + input.B0
  result.C := input.C + input.C0
  result.D := input.D + input.D0
}

// change byte order of output data
class MD4ChangeOrderOutput extends Module {
  val io = IO(new Bundle {
    val out = new DecoupledIO(UInt(128.W))
    val in = Flipped(out)
  })

  /*
  ------------------------------------------------
  -------------- Boilerplate code ----------------
  ------------------------------------------------
  -------- Pipelining with elastic buffers -------
  ------------------------------------------------
  */

  val input = WireDefault(io.in.bits) // this wire should be used for computations
  val result = WireDefault(io.out.bits) // this wire should be assigned to computation result
  val data = RegInit(VecInit(Seq.fill(2)(0.U.asTypeOf(io.in.bits)))) // two registers for data to implement 2-slots elastic buffer
  val head = RegInit(false.B) // pointer to current slot for reading
  val tail = RegInit(false.B) // pointer to current slot for writing
  val full = RegInit(VecInit(Seq.fill(2)(false.B))) // two registers to indicate which registers with data are full

  io.in.ready := !(full(0) && full(1)) // input is ready when at least one slot is empty
  io.out.valid := full(0) || full(1) // output is valid when at least one slot is full
  io.out.bits := result // output result as output bits
  input := data(head) // input refers to the slot in data pointed by head

  // write
  when(io.in.valid && !full(tail)) { // when input is valid and current slot for writing is empty
    full(tail) := true.B // mark current slot as full
    data(tail) := io.in.bits // store data into current slot
    tail := !tail // move pointer for writing to the next slot
  }

  // read
  when(io.out.ready && full(head)) { // when output is ready and current slot for reading is full
    full(head) := false.B // mark current slot as empty
    head := !head // move pointer for reading to the next slot
  }

  /*
    ------------------------------------------------
    ----------------- Processing -------------------
    ------------------------------------------------
    ------ Usage: result = computations(input) -----
    ------------------------------------------------
   */

  // vector of PEs for changing byte order of input
  val PEs = VecInit(Seq.fill(4) {
    Module(new changeWordOrder).io
  })
  for (i <- 0 until 4) {
    PEs(i).in := input(32*(i+1)-1,32*i)
  }

  // construct result from outputs of modules
  result := Cat(PEs(3).out, PEs(2).out, PEs(1).out, PEs(0).out)
}

// change byte order of the word (word is 32 bits, 4 bytes)
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

// data type for input and output
class MD4OutputData extends Bundle {
  val X = Output(UInt(512.W))
  val A0 = Output(UInt(32.W))
  val B0 = Output(UInt(32.W))
  val C0 = Output(UInt(32.W))
  val D0 = Output(UInt(32.W))
}

// data type for data transferred between PEs
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
