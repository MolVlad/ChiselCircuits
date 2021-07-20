package elastic.md4

import chisel3._
import chisel3.util._

class md4(width: Int = 2) extends Module {
  val io = IO(new Bundle {
    val data = Flipped(new DecoupledIO(UInt(512.W)))
    val dataPieces = Flipped(new DecoupledIO(UInt(width.W)))
    val hash = new DecoupledIO(UInt(128.W))
  })

  val waitingLength :: waitingData :: computing :: updating :: waitingOutput :: Nil = Enum(5)
  val stateReg = RegInit(waitingLength)
  val roundReg = RegInit(0.U(2.W))
  val operReg = RegInit(0.U(5.W))
  val A, B, C, D, AA, BB, CC, DD = RegInit(0.U(32.W))
  val X = RegInit(0.U(512.W))

  val dataPiecesReg = RegInit(0.U(width.W))

  val m = Module(new Operation)
  m.io.a := DontCare
  m.io.b := DontCare
  m.io.c := DontCare
  m.io.d := DontCare
  m.io.x := DontCare
  m.io.s := DontCare
  m.io.round := roundReg

  val map = Module(new MappingX)
  m.io.x := map.io.out
  map.io.X := X
  map.io.round := roundReg
  map.io.oper := operReg

  val change1 = Module(new changeWordsOrder)
  change1.io.in := io.data.bits

  val change2 = Module(new changeWordsOrder)
  change2.io.in := Cat(A,B,C,D)

  io.hash.valid := stateReg === waitingOutput
  io.hash.bits :=  change2.io.out
  io.dataPieces.ready := stateReg === waitingLength
  io.data.ready := stateReg === waitingData

  switch(stateReg) {
    is(waitingLength) {
      when(io.dataPieces.valid) {
        when(io.dataPieces.bits > 0.U) {
          A := "h67452301".U
          B := "hEFCDAB89".U
          C := "h98BADCFE".U
          D := "h10325476".U
          when(io.data.valid) {
            roundReg := 0.U
            operReg := 0.U
            dataPiecesReg := io.dataPieces.bits - 1.U
            X := change1.io.out
            AA := "h67452301".U
            BB := "hEFCDAB89".U
            CC := "h98BADCFE".U
            DD := "h10325476".U
            stateReg := computing
          } .otherwise {
            dataPiecesReg := io.dataPieces.bits
            stateReg := waitingData
          }
        }
      }
    }
    is(waitingData) {
      when(io.data.valid) {
        roundReg := 0.U
        operReg := 0.U
        dataPiecesReg := dataPiecesReg - 1.U
        X := change1.io.out
        AA := A
        BB := B
        CC := C
        DD := D
        stateReg := computing
      }
    }
    is(computing) {
      when((operReg % 4.U) === 0.U) {
        m.io.a := A; m.io.b := B; m.io.c := C; m.io.d := D; A := m.io.out
        m.io.s := 3.U
      } .elsewhen((operReg % 4.U) === 1.U) {
        m.io.a := D; m.io.b := A; m.io.c := B; m.io.d := C; D := m.io.out
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

      when(operReg === 15.U) {
        operReg := 0.U
        when(roundReg === 2.U) {
          stateReg := updating
        } otherwise {
          roundReg := roundReg + 1.U
        }
      } otherwise {
        operReg := operReg + 1.U
      }
    }
    is(updating) {
      A := A + AA
      B := B + BB
      C := C + CC
      D := D + DD
      when(dataPiecesReg === 0.U) {
        stateReg := waitingOutput
      } otherwise {
        stateReg := waitingData
      }
    }
    is(waitingOutput) {
      when(io.hash.ready) {
          stateReg := waitingLength
      }
    }
  }
}

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

  val operation = Wire(Bits(32.W))
  val F = Wire(Bits(32.W))
  val G = Wire(Bits(32.W))
  val H = Wire(Bits(32.W))
  val const = Wire(Bits(32.W))
  val sum = Wire(Bits(32.W))

  F := (io.b & io.c) | ((~io.b).asUInt & io.d)
  G := (io.b & io.c) | (io.b & io.d) | (io.c & io.d)
  H := io.b ^ io.c ^ io.d

  sum := io.a + operation + io.x + const

  when(io.round === 0.U) {
    operation := F
    const := 0.U
  } .elsewhen(io.round === 1.U) {
    operation := G
    const := "h5A827999".U
  } otherwise  {
    operation := H
    const := "h6ED9EBA1".U
  }

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

class changeWordsOrder extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(512.W))
    val out = Output(UInt(512.W))
  })

  val PEs = VecInit(Seq.fill(16) {
    Module(new changeWordOrder).io
  })
  for (i <- 0 until 16) {
    PEs(i).in := io.in(32*(i+1)-1,32*i)
  }
  io.out := Cat(PEs(15).out, PEs(14).out, PEs(13).out, PEs(12).out, PEs(11).out,
    PEs(10).out, PEs(9).out, PEs(8).out, PEs(7).out, PEs(6).out, PEs(5).out,
    PEs(4).out, PEs(3).out, PEs(2).out, PEs(1).out, PEs(0).out)
}
