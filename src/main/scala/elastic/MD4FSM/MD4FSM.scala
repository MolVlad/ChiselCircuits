package elastic.MD4FSM

import chisel3._
import chisel3.util._

// MD4 algorithm, there is one PE inside, data is provided to it in state machine fashion
// width - width of extraDataNum wire
class MD4FSM(width: Int = 2) extends Module {
  // Elastic input/output interfaces
  val io = IO(new Bundle {
    val data = Flipped(new DecoupledIO(UInt(512.W))) // input data to be hashed
    val extraDataNum = Flipped(new DecoupledIO(UInt(width.W))) // number of extra pieces of data
    val hash = new DecoupledIO(UInt(128.W)) // result
  })

  // FSM with 5 states
  val waitingLength :: waitingData :: computing :: updating :: waitingOutput :: Nil = Enum(5)
  val stateReg = RegInit(waitingLength) // register for current state
  val roundReg = RegInit(0.U(2.W)) // register for round number
  val operReg = RegInit(0.U(5.W)) // register for operation number
  val A, B, C, D, AA, BB, CC, DD = RegInit(0.U(32.W)) // intermediate buffers of MD4 algorithm
  val X = RegInit(0.U(512.W)) // register for storing input data
  val extraDataNumReg = RegInit(0.U(width.W)) // register for storing number of extra pieces

  // module for performing one operation
  val m = Module(new Operation)
  // init input values
  m.io.a := DontCare
  m.io.b := DontCare
  m.io.c := DontCare
  m.io.d := DontCare
  m.io.x := DontCare
  m.io.s := DontCare

  // provide current round number to m module
  m.io.round := roundReg

  // module for mapping X
  val map = Module(new MappingX)
  m.io.x := map.io.out // output of map module is x value for m module
  map.io.X := X // provide data to be hashed for mapping
  map.io.round := roundReg // provide current round number
  map.io.oper := operReg // provide current operation number

  // module for changing bytes order of input data
  val change1 = Module(new changeWordsOrder)
  change1.io.in := io.data.bits

  // module for changing bytes order of output data
  val change2 = Module(new changeWordsOrder)
  change2.io.in := Cat(A,B,C,D)

  io.hash.valid := stateReg === waitingOutput // output is valid when state is waitingOutput
  io.hash.bits :=  change2.io.out // output data is output of change2 module
  io.extraDataNum.ready := stateReg === waitingLength // extraDataNum input is ready when state is waitingLength
  io.data.ready := (stateReg === waitingLength) || (stateReg === waitingData) // data input is ready when state is either waitingLength or waitingData

  // switch construction for FSM implementation
  switch(stateReg) {
    is(waitingLength) { // state of reading length of input data (reading number of extra pieces)
      when(io.extraDataNum.valid) { // when handshaking is successful
        // init buffers
        A := "h67452301".U
        B := "hEFCDAB89".U
        C := "h98BADCFE".U
        D := "h10325476".U
        when(io.data.valid) { // if handshaking for data is successful at the same time
          // init other buffers as well
          roundReg := 0.U
          operReg := 0.U
          AA := "h67452301".U
          BB := "hEFCDAB89".U
          CC := "h98BADCFE".U
          DD := "h10325476".U

          // store data and number of pieces into registers
          extraDataNumReg := io.extraDataNum.bits
          X := change1.io.out

          stateReg := computing // go directly to the state of computing
        } .otherwise { // if only handshaking for length is successful
          extraDataNumReg := io.extraDataNum.bits + 1.U // store number of extra pieces incremented by 1
          stateReg := waitingData // go to the state of reading data
        }
      }
    }
    is(waitingData) { // state of reading data
      when(io.data.valid) { // when handshaking is successful
        // init registers
        roundReg := 0.U
        operReg := 0.U
        AA := A
        BB := B
        CC := C
        DD := D

        X := change1.io.out // store input data into register
        extraDataNumReg := extraDataNumReg - 1.U // decrement counter of extra data pieces
        stateReg := computing // go to the state of computing
      }
    }
    is(computing) { // state of computing, main part of MD4 algorithm
      // inputs for m module and buffer for storing m output differ for each operation number, next when structure manages that
      when((operReg % 4.U) === 0.U) {
        m.io.a := A; m.io.b := B; m.io.c := C; m.io.d := D; A := m.io.out
        m.io.s := 3.U
      } .elsewhen((operReg % 4.U) === 1.U) {
        m.io.a := D; m.io.b := A; m.io.c := B; m.io.d := C; D := m.io.out
        // for these operation numbers value of s depends on round number, next switch structure manages that
        switch(roundReg) {
          is(0.U) {
            m.io.s := 7.U
          }
          is(1.U) {
            m.io.s := 5.U
          }
          is(2.U) {
            m.io.s := 9.U
          }
        }
      } .elsewhen((operReg % 4.U) === 2.U) {
        m.io.a := C; m.io.b := D; m.io.c := A; m.io.d := B; C := m.io.out
        // for these operation numbers value of s depends on round number, next switch structure manages that
        switch(roundReg) {
          is(0.U) {
            m.io.s := 11.U
          }
          is(1.U) {
            m.io.s := 9.U
          }
          is(2.U) {
            m.io.s := 11.U
          }
        }
      } otherwise {
        m.io.a := B; m.io.b := C; m.io.c := D; m.io.d := A; B := m.io.out
        // for these operation numbers value of s depends on round number, next switch structure manages that
        switch(roundReg) {
          is(0.U) {
            m.io.s := 19.U
          }
          is(1.U) {
            m.io.s := 13.U
          }
          is(2.U) {
            m.io.s := 15.U
          }
        }
      }

      when(operReg === 15.U) { // when we finished the last operation in the round
        operReg := 0.U // reset operation counter
        when(roundReg === 2.U) { // when we finished the last round
          stateReg := updating // go to the state of updating buffers
        } otherwise {
          roundReg := roundReg + 1.U // if there are more rounds just increment round counter
        }
      } otherwise {
        operReg := operReg + 1.U // if there are more operations just increment operation counter
      }
    }
    is(updating) { // state of updating buffers, need to be executed after each data piece being hashed
      // increment A,B,C,D buffers by AA,BB,CC,DD correspondingly
      A := A + AA
      B := B + BB
      C := C + CC
      D := D + DD
      when(extraDataNumReg === 0.U) { // when there are no more data
        stateReg := waitingOutput // go to the state of data ouput
      } otherwise {
        stateReg := waitingData // otherwise go to the state of reading next piece of data again
      }
    }
    is(waitingOutput) { // state of data output
      when(io.hash.ready) { // if handshaking is successful
          stateReg := waitingLength // go to the initial state again
      }
    }
  }
}

// one operation of MD4 algorithm
class Operation extends Module {
  val io = IO(new Bundle {
    val a = Input(Bits(32.W))
    val b = Input(Bits(32.W))
    val c = Input(Bits(32.W))
    val d = Input(Bits(32.W))
    val x = Input(Bits(32.W))
    val s = Input(Bits(5.W))
    val round = Input(UInt(2.W))

    val out = Output(Bits(32.W))
  })

  // define wires for further use
  val function = Wire(Bits(32.W))
  val F = Wire(Bits(32.W))
  val G = Wire(Bits(32.W))
  val H = Wire(Bits(32.W))
  val const = Wire(Bits(32.W))
  val sum = Wire(Bits(32.W))

  // functions used in different steps
  F := (io.b & io.c) | ((~io.b).asUInt & io.d)
  G := (io.b & io.c) | (io.b & io.d) | (io.c & io.d)
  H := io.b ^ io.c ^ io.d

  // general formula for one MD4 step
  sum := io.a + function + io.x + const

  // function and const used depend on round number
  when(io.round === 0.U) {
    function := F
    const := 0.U
  } .elsewhen(io.round === 1.U) {
    function := G
    const := "h5A827999".U
  } otherwise  {
    function := H
    const := "h6ED9EBA1".U
  }

  // implementation of cyclic shift
  io.out := 0.U
  switch(io.s) {
    is(3.U) {
      io.out := Cat(sum(28, 0), sum(31, 29))
    }
    is(5.U) {
      io.out := Cat(sum(26, 0), sum(31, 27))
    }
    is(7.U) {
      io.out := Cat(sum(24, 0), sum(31, 25))
    }
    is(9.U) {
      io.out := Cat(sum(22, 0), sum(31, 23))
    }
    is(11.U) {
      io.out := Cat(sum(20, 0), sum(31, 21))
    }
    is(13.U) {
      io.out := Cat(sum(18, 0), sum(31, 19))
    }
    is(15.U) {
      io.out := Cat(sum(16, 0), sum(31, 17))
    }
    is(19.U) {
      io.out := Cat(sum(12, 0), sum(31, 13))
    }
  }
}

// extract 32 bits from 512 bits input data for corresponding round and operation numbers
class MappingX extends Module {
  val io = IO(new Bundle {
    val X = Input(Bits(512.W))
    val round = Input(UInt(2.W))
    val oper = Input(UInt(5.W))

    val out = Output(Bits(32.W))
  })

  io.out := DontCare

  switch(io.round) {
    is(0.U) {
      switch(io.oper) {
        is(0.U) {
          io.out := io.X(511, 480)
        }
        is(1.U) {
          io.out := io.X(479, 448)
        }
        is(2.U) {
          io.out := io.X(447, 416)
        }
        is(3.U) {
          io.out := io.X(415, 384)
        }
        is(4.U) {
          io.out := io.X(383, 352)
        }
        is(5.U) {
          io.out := io.X(351, 320)
        }
        is(6.U) {
          io.out := io.X(319, 288)
        }
        is(7.U) {
          io.out := io.X(287, 256)
        }
        is(8.U) {
          io.out := io.X(255, 224)
        }
        is(9.U) {
          io.out := io.X(223, 192)
        }
        is(10.U) {
          io.out := io.X(191, 160)
        }
        is(11.U) {
          io.out := io.X(159, 128)
        }
        is(12.U) {
          io.out := io.X(127, 96)
        }
        is(13.U) {
          io.out := io.X(95, 64)
        }
        is(14.U) {
          io.out := io.X(63, 32)
        }
        is(15.U) {
          io.out := io.X(31,0)
        }
      }
    }
    is(1.U) {
      switch(io.oper) {
        is(0.U) {
          io.out := io.X(511, 480)
        }
        is(1.U) {
          io.out := io.X(383, 352)
        }
        is(2.U) {
          io.out := io.X(255, 224)
        }
        is(3.U) {
          io.out := io.X(127, 96)
        }
        is(4.U) {
          io.out := io.X(479, 448)
        }
        is(5.U) {
          io.out := io.X(351, 320)
        }
        is(6.U) {
          io.out := io.X(223, 192)
        }
        is(7.U) {
          io.out := io.X(95, 64)
        }
        is(8.U) {
          io.out := io.X(447, 416)
        }
        is(9.U) {
          io.out := io.X(319, 288)
        }
        is(10.U) {
          io.out := io.X(191, 160)
        }
        is(11.U) {
          io.out := io.X(63, 32)
        }
        is(12.U) {
          io.out := io.X(415, 384)
        }
        is(13.U) {
          io.out := io.X(287, 256)
        }
        is(14.U) {
          io.out := io.X(159, 128)
        }
        is(15.U) {
          io.out := io.X(31,0)
        }
      }
    }
    is(2.U) {
      switch(io.oper) {
        is(0.U) {
          io.out := io.X(511, 480)
        }
        is(1.U) {
          io.out := io.X(255, 224)
        }
        is(2.U) {
          io.out := io.X(383, 352)
        }
        is(3.U) {
          io.out := io.X(127, 96)
        }
        is(4.U) {
          io.out := io.X(447, 416)
        }
        is(5.U) {
          io.out := io.X(191, 160)
        }
        is(6.U) {
          io.out := io.X(319, 288)
        }
        is(7.U) {
          io.out := io.X(63, 32)
        }
        is(8.U) {
          io.out := io.X(479, 448)
        }
        is(9.U) {
          io.out := io.X(223, 192)
        }
        is(10.U) {
          io.out := io.X(351, 320)
        }
        is(11.U) {
          io.out := io.X(95, 64)
        }
        is(12.U) {
          io.out := io.X(415, 384)
        }
        is(13.U) {
          io.out := io.X(159, 128)
        }
        is(14.U) {
          io.out := io.X(287, 256)
        }
        is(15.U) {
          io.out := io.X(31,0)
        }
      }
    }
  }
}

// change byte order of several words
class changeWordsOrder extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(512.W))
    val out = Output(UInt(512.W))
  })

  // create vector of modules for chaning byte order of one word
  val PEs = VecInit(Seq.fill(16) {
    Module(new changeWordOrder).io
  })
  // provide corresponding data for each such module
  for (i <- 0 until 16) {
    PEs(i).in := io.in(32*(i+1)-1,32*i)
  }
  // construct result from output data of these modules
  io.out := Cat(PEs(15).out, PEs(14).out, PEs(13).out, PEs(12).out, PEs(11).out,
    PEs(10).out, PEs(9).out, PEs(8).out, PEs(7).out, PEs(6).out, PEs(5).out,
    PEs(4).out, PEs(3).out, PEs(2).out, PEs(1).out, PEs(0).out)
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