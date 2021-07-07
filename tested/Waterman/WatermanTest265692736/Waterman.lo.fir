circuit Waterman :
  module substituteElements :
    input clock : Clock
    input reset : UInt<1>
    input io_first : UInt<2>
    input io_second : UInt<2>
    output io_out : SInt<32>

    node _T = eq(io_first, io_second) @[DNA.scala 27:18]
    node _GEN_0 = mux(_T, asSInt(UInt<2>("h1")), asSInt(UInt<2>("h3"))) @[DNA.scala 27:33 DNA.scala 28:12 DNA.scala 30:12]
    io_out <= _GEN_0

  module Waterman :
    input clock : Clock
    input reset : UInt<1>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<32>
    output io_x_ready : UInt<1>
    input io_x_valid : UInt<1>
    input io_x_bits : UInt<2>
    output io_y_ready : UInt<1>
    input io_y_valid : UInt<1>
    input io_y_bits : UInt<2>

    inst s of substituteElements @[Waterman.scala 14:17]
    io_out_valid <= UInt<1>("h1") @[Waterman.scala 20:16]
    io_out_bits <= s.io_out @[Waterman.scala 17:15]
    io_x_ready <= UInt<1>("h1") @[Waterman.scala 19:14]
    io_y_ready <= UInt<1>("h1") @[Waterman.scala 21:14]
    s.clock <= clock
    s.reset <= reset
    s.io_first <= io_x_bits @[Waterman.scala 15:14]
    s.io_second <= io_y_bits @[Waterman.scala 16:15]
