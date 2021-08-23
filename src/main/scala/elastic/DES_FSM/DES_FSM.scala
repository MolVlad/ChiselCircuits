package elastic.DES_FSM

import chisel3._
import chisel3.util._

// DES algorithm, there is one PE inside, data is provided to it in state machine fashion
// parameter encrypt: true - encryption, false - decryption
class DES_FSM(encrypt: Boolean = true) extends Module {
  // Elastic input/output interfaces
  val io = IO(new Bundle {
    val in = Flipped(new DecoupledIO(new Bundle {
      val text = UInt(64.W) // text to be ciphered/deciphered
      val key = UInt(64.W)
    }))
    val result = new DecoupledIO(UInt(64.W)) // ciphered/deciphered text
  })

  // FSM with 5 states
  val waitingInput :: initialPermut :: computing :: finalPermut :: waitingOutput :: Nil = Enum(5)
  val stateReg = RegInit(waitingInput) // register for current state
  val roundReg = RegInit(0.U(4.W)) // register for round number
  val textReg = RegInit(0.U.asTypeOf(io.in.bits.text)) // register for storing input text
  val keyReg = RegInit(0.U.asTypeOf(io.in.bits.key)) // register for storing input key
  val dataReg = RegInit(0.U.asTypeOf(new DES_DataInterPE)) // register for data to be transferred from round to round
  val resultsReg = RegInit(0.U.asTypeOf(io.result.bits)) // register for storing result before it has been read

  io.in.ready := stateReg === waitingInput // data input is ready when state is waitingInput
  io.result.valid := stateReg === waitingOutput // data output is valid when state is waitingOutput
  io.result.bits := resultsReg // output resultsReg as result bits

  // module for initial permutation in DES algorithm
  val ip = Module(new DES_InitialPermutation)
  ip.io := DontCare

  // module for final permutation in DES algorithm
  val fp = Module(new DES_FinalPermutation)
  fp.io := DontCare

  // processing element (PE) for one step of DES algorithm
  val pe = Module(new DES_ProcessingElement(encrypt = encrypt))
  pe.io := DontCare

  // switch construction for implementing FSM
  switch(stateReg) {
    is(waitingInput) { // state for reading input data
      when(io.in.valid) { // when handshaking is successful
        // store input data into registers
        textReg := io.in.bits.text
        keyReg := io.in.bits.key

        // go to the next state
        stateReg := initialPermut
      }
    }
    is(initialPermut) { // state of performing initial permutation
      // provide textReg and keyReg as inputs for ip module
      ip.io.text := textReg
      ip.io.key := keyReg

      dataReg := ip.io.out // store result in dataReg
      roundReg := 0.U // init counter of rounds
      stateReg := computing // go to the next state
    }
    is(computing) { // state of the main part of DES algorithm with 16 steps
      pe.io.in := dataReg // provide dataReg as input data for pe module
      pe.io.round := roundReg // provide current number of round to pe module
      dataReg := pe.io.out // store result in dataReg
      roundReg := roundReg + 1.U // increment round counter
      when(roundReg === 15.U) { // when it is final round
        stateReg := finalPermut // go to the state of final permutation
      }
    }
    is(finalPermut) { // state of performing final permutation
      // provide R and L fields of dataReg as input data for fp module
      fp.io.R := dataReg.R
      fp.io.L := dataReg.L

      resultsReg := fp.io.out // store result in resultsReg
      stateReg := waitingOutput // go to the final state, state of data output
    }
    is(waitingOutput) { // state of data output
      when(io.result.ready) { // when handshaking is successful
        stateReg := waitingInput // go to the state of reading data again
      }
    }
  }
}

// initial permutation for DES algorithm
class DES_InitialPermutation extends Module {
  val io = IO(new Bundle {
    val text = Input(UInt(64.W))
    val key = Input(UInt(64.W))
    val out = Output(new DES_DataInterPE) // DES_DataInterPE - data type for data transferred between PEs
  })

  // module for initial permutation of text to create L and R words
  val ip = Module(new IP).io
  ip.text := io.text
  io.out.L := ip.L
  io.out.R := ip.R

  // module for initial permutation of key to create C and D words
  val pc_1 = Module(new PC_1).io
  pc_1.key := io.key
  io.out.C := pc_1.C
  io.out.D := pc_1.D
}

// processing element for main part of DES algorithm
class DES_ProcessingElement(encrypt: Boolean) extends Module {
  val io = IO(new Bundle {
    val round = Input(UInt(5.W))
    val in = Input(new DES_DataInterPE) // DES_DataInterPE - data type for data transferred between PEs
    val out = Flipped(in)
  })

  // module for generating key for the next round
  val keys = Module(new DES_keys(encrypt = encrypt))
  keys.io.round := io.round // provide round number
  keys.io.C := io.in.C // provide C word as input
  keys.io.D := io.in.D // provide D word as input

  // module for computing f function of DES algorithm
  val f = Module(new DES_f)
  f.io.R := io.in.R // provide R word as input
  f.io.K := keys.io.K // provide K output of keys module as another input

  // assign output of keys and f modules to the output of this module
  io.out.L := io.in.R // next L is R
  io.out.R := io.in.L ^ f.io.out // next R is L xor output of f module
  io.out.C := keys.io.C_next // next C is C field of keys module's output
  io.out.D := keys.io.D_next // next D is D field of keys module's output
}

// final permutation for DES algorithm
class DES_FinalPermutation extends Module {
  val io = IO(new Bundle {
    val L = Input(UInt(32.W))
    val R = Input(UInt(32.W))
    val out = Output(UInt(64.W))
  })

  // processing
  val concat = WireDefault(io.out) // wire with the same type as io.out
  concat := Reverse(Cat(io.R, io.L)) // reverse order of concatenation R and L

  // construct output from concat wire in the way defined by DES standard
  io.out := Cat(concat(39),concat(7),concat(47),concat(15),concat(55),concat(23),concat(63),concat(31),
    concat(38),concat(6),concat(46),concat(14),concat(54),concat(22),concat(62),concat(30),
    concat(37),concat(5),concat(45),concat(13),concat(53),concat(21),concat(61),concat(29),
    concat(36),concat(4),concat(44),concat(12),concat(52),concat(20),concat(60),concat(28),
    concat(35),concat(3),concat(43),concat(11),concat(51),concat(19),concat(59),concat(27),
    concat(34),concat(2),concat(42),concat(10),concat(50),concat(18),concat(58),concat(26),
    concat(33),concat(1),concat(41),concat(9),concat(49),concat(17),concat(57),concat(25),
    concat(32),concat(0),concat(40),concat(8),concat(48),concat(16),concat(56),concat(24))
}

// IP function of DES algorithm
class IP extends Module {
  val io = IO(new Bundle {
    val text = Input(UInt(64.W))
    val L = Output(UInt(32.W))
    val R = Output(UInt(32.W))
  })

  val reversed = WireDefault(io.text) // create wire with the same type as io.text
  reversed := Reverse(io.text) // reversed order of bits in io.text

  // construct L and R from reversed in the way defined by DES standard

  io.L := Cat(reversed(57),reversed(49),reversed(41),reversed(33),reversed(25),reversed(17),reversed(9),reversed(1),
    reversed(59),reversed(51),reversed(43),reversed(35),reversed(27),reversed(19),reversed(11),reversed(3),
    reversed(61),reversed(53),reversed(45),reversed(37),reversed(29),reversed(21),reversed(13),reversed(5),
    reversed(63),reversed(55),reversed(47),reversed(39),reversed(31),reversed(23),reversed(15),reversed(7))

  io.R := Cat(reversed(56),reversed(48),reversed(40),reversed(32),reversed(24),reversed(16),reversed(8),reversed(0),
    reversed(58),reversed(50),reversed(42),reversed(34),reversed(26),reversed(18),reversed(10),reversed(2),
    reversed(60),reversed(52),reversed(44),reversed(36),reversed(28),reversed(20),reversed(12),reversed(4),
    reversed(62),reversed(54),reversed(46),reversed(38),reversed(30),reversed(22),reversed(14),reversed(6))
}

// PC_1 function of DES algorithm
class PC_1 extends Module {
  val io = IO(new Bundle {
    val key = Input(UInt(64.W))
    val C = Output(UInt(28.W))
    val D = Output(UInt(28.W))
  })

  val reversed = WireDefault(io.key) // create wire with the same type as io.key
  reversed := Reverse(io.key) // reversed order of bits in io.key

  // construct C and D from reversed in the way defined by DES standard

  io.C := Cat(reversed(56),reversed(48),reversed(40),reversed(32),reversed(24),reversed(16),reversed(8),
    reversed(0),reversed(57),reversed(49),reversed(41),reversed(33),reversed(25),reversed(17),
    reversed(9),reversed(1),reversed(58),reversed(50),reversed(42),reversed(34),reversed(26),
    reversed(18),reversed(10),reversed(2),reversed(59),reversed(51),reversed(43),reversed(35))

  io.D := Cat(reversed(62),reversed(54),reversed(46),reversed(38),reversed(30),reversed(22),reversed(14),
    reversed(6),reversed(61),reversed(53),reversed(45),reversed(37),reversed(29),reversed(21),
    reversed(13),reversed(5),reversed(60),reversed(52),reversed(44),reversed(36),reversed(28),
    reversed(20),reversed(12),reversed(4),reversed(27),reversed(19),reversed(11),reversed(3))
}

// generate key for the next round
class DES_keys(encrypt: Boolean) extends Module {
  val io = IO(new Bundle {
    val round = Input(UInt(5.W))
    val C = Input(UInt(28.W))
    val D = Input(UInt(28.W))
    val C_next = Output(UInt(28.W))
    val D_next = Output(UInt(28.W))
    val K = Output(UInt(48.W))
  })

  val r = Wire(UInt(6.W)) // wire corresponding to the number of round
  val s = Wire(UInt(2.W)) // wire corresponding to the value of cyclic shift

  // take into account decryption: reverse operations for key transform if it's necessary
  if (encrypt) {
    r := io.round // forward order for encryption
  } else {
    r := 16.U - io.round // reverse order of decryption
  }

  // define s depending on the value of r
  s := 0.U
  switch(r) {
    is(0.U) {
      s := 1.U
    }
    is(1.U) {
      s := 1.U
    }
    is(2.U) {
      s := 2.U
    }
    is(3.U) {
      s := 2.U
    }
    is(4.U) {
      s := 2.U
    }
    is(5.U) {
      s := 2.U
    }
    is(6.U) {
      s := 2.U
    }
    is(7.U) {
      s := 2.U
    }
    is(8.U) {
      s := 1.U
    }
    is(9.U) {
      s := 2.U
    }
    is(10.U) {
      s := 2.U
    }
    is(11.U) {
      s := 2.U
    }
    is(12.U) {
      s := 2.U
    }
    is(13.U) {
      s := 2.U
    }
    is(14.U) {
      s := 2.U
    }
    is(15.U) {
      s := 1.U
    }
    is(16.U) {
      s := 0.U
    }
  }

  // define wires for further use
  val C_rotated = Wire(UInt(28.W))
  val D_rotated = Wire(UInt(28.W))
  val concat = Wire(UInt(56.W))

  // perform cyclic shift
  if (encrypt) { // in forward direction for encryption
    when(s === 1.U) {
      C_rotated := Cat(io.C(26,0),io.C(27))
      D_rotated := Cat(io.D(26,0),io.D(27))
    } .otherwise {
      C_rotated := Cat(io.C(25,0),io.C(27,26))
      D_rotated := Cat(io.D(25,0),io.D(27,26))
    }
  } else { // in reverse direction for decryption
    when(s === 1.U) {
      C_rotated := Cat(io.C(0),io.C(27,1))
      D_rotated := Cat(io.D(0),io.D(27,1))
    } .elsewhen(s === 2.U) {
      C_rotated := Cat(io.C(1,0),io.C(27,2))
      D_rotated := Cat(io.D(1,0),io.D(27,2))
    } otherwise {
      C_rotated := io.C
      D_rotated := io.D
    }
  }

  // assign values transferred to the next round
  io.C_next := C_rotated
  io.D_next := D_rotated

  // concatenate C and D after transformation, reverse its order and assign to concat wire for further use
  concat := Reverse(Cat(C_rotated, D_rotated))

  // construct key for current round from concat in the way described in DES standard
  io.K := Cat(concat(13),concat(16),concat(10),concat(23),concat(0),concat(4),
    concat(2),concat(27),concat(14),concat(5),concat(20),concat(9),
    concat(22),concat(18),concat(11),concat(3),concat(25),concat(7),
    concat(15),concat(6),concat(26),concat(19),concat(12),concat(1),
    concat(40),concat(51),concat(30),concat(36),concat(46),concat(54),
    concat(29),concat(39),concat(50),concat(44),concat(32),concat(47),
    concat(43),concat(48),concat(38),concat(55),concat(33),concat(52),
    concat(45),concat(41),concat(49),concat(35),concat(28),concat(31))
}

// computing f function of DES algorithm
class DES_f extends Module {
  val io = IO(new Bundle {
    val R = Input(UInt(32.W))
    val K = Input(UInt(48.W))
    val out = Output(UInt(32.W))
  })

  // perform E permutation of R input
  val E = Module(new DES_E)
  E.io.R := io.R

  // put the result of E permutation xor'ed with K to S-boxes
  val S = Module(new DES_S)
  S.io.in := E.io.E ^ io.K

  // put the output of S-boxes to the block with P permutations
  val P = Module(new DES_P)
  P.io.in := S.io.out
  io.out := P.io.out // output of P permutations is the output of this module
}

// S-box for DES algorithm
class DES_S extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(48.W))
    val out = Output(UInt(32.W))
  })

  // vector of wires for splitting input bits into groups of 6 bits
  val B = Wire(Vec(8, UInt(6.W)))

  // vector of wires for defining row and col from each group of 6 bits
  val row = Wire(Vec(8, UInt(2.W)))
  val col = Wire(Vec(8, UInt(4.W)))

  for (i <- 0 until 8) { // for each group
    B(7-i) := io.in(6*(i+1)-1,6*i) // extract 6 bits from input data and store it in corresponding register in B vector
    row(7-i) := Cat(B(7-i)(5),B(7-i)(0)) // extract 2 bits for row from corresponding group of 6 six bits
    col(7-i) := B(7-i)(4,1) // extract 4 bits for column from corresponding group of 6 six bits
  }

  // -------------------------------
  // S-boxes defined in DES standard
  // -------------------------------

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

  // construct the result from col and row vectors using S-boxes
  io.out := Cat(S1(col(0))(row(0)),S2(col(1))(row(1)),S3(col(2))(row(2)),S4(col(3))(row(3)),
    S5(col(4))(row(4)),S6(col(5))(row(5)),S7(col(6))(row(6)),S8(col(7))(row(7)))
}

// P permutation for DES algorithm
class DES_P extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(32.W))
    val out = Output(UInt(32.W))
  })

  val reversed = Wire(UInt(32.W)) // define 32bits wire for further use
  reversed := Reverse(io.in) // assign this wire to io.in with reversed order of bits

  // construct the result from reversed in the way defined in DES standard
  io.out := Cat(reversed(15),reversed(6),reversed(19),reversed(20),
    reversed(28),reversed(11),reversed(27),reversed(16),
    reversed(0),reversed(14),reversed(22),reversed(25),
    reversed(4),reversed(17),reversed(30),reversed(9),
    reversed(1),reversed(7),reversed(23),reversed(13),
    reversed(31),reversed(26),reversed(2),reversed(8),
    reversed(18),reversed(12),reversed(29),reversed(5),
    reversed(21),reversed(10),reversed(3),reversed(24))
}

// E permutation for DES algorithm
class DES_E extends Module {
  val io = IO(new Bundle {
    val R = Input(UInt(32.W))
    val E = Output(UInt(48.W))
  })

  val reversed = Wire(UInt(32.W)) // define 32bits wire
  reversed := Reverse(io.R) // assign this wire to io.R with reversed order of bits

  // construct the result from reversed in the way defined in DES standard
  io.E := Cat(reversed(31),reversed(0),reversed(1),reversed(2),reversed(3),reversed(4),
    reversed(3),reversed(4),reversed(5),reversed(6),reversed(7),reversed(8),
    reversed(7),reversed(8),reversed(9),reversed(10),reversed(11),reversed(12),
    reversed(11),reversed(12),reversed(13),reversed(14),reversed(15),reversed(16),
    reversed(15),reversed(16),reversed(17),reversed(18),reversed(19),reversed(20),
    reversed(19),reversed(20),reversed(21),reversed(22),reversed(23),reversed(24),
    reversed(23),reversed(24),reversed(25),reversed(26),reversed(27),reversed(28),
    reversed(27),reversed(28),reversed(29),reversed(30),reversed(31),reversed(0))
}

// data type for data transferred between PEs
class DES_DataInterPE extends Bundle {
  val L = Output(UInt(32.W))
  val R = Output(UInt(32.W))
  val C = Output(UInt(28.W))
  val D = Output(UInt(28.W))
}

