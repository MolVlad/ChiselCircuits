circuit Rotation :
  module Rotation :
    input clock : Clock
    input reset : UInt<1>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<8>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits : UInt<8>

    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[Rotation.scala 13:25]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[Rotation.scala 14:24]
    reg cntReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Rotation.scala 15:23]
    node _T = eq(stateReg, UInt<2>("h0")) @[Rotation.scala 17:27]
    node _T_1 = eq(stateReg, UInt<2>("h2")) @[Rotation.scala 18:28]
    node _T_2 = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits, dataReg) @[Rotation.scala 23:26 Rotation.scala 24:17 Rotation.scala 14:24]
    node _GEN_1 = mux(io_in_valid, UInt<1>("h1"), cntReg) @[Rotation.scala 23:26 Rotation.scala 25:16 Rotation.scala 15:23]
    node _GEN_2 = mux(io_in_valid, UInt<2>("h1"), stateReg) @[Rotation.scala 23:26 Rotation.scala 26:18 Rotation.scala 13:25]
    node _T_3 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node hi = bits(dataReg, 0, 0) @[Rotation.scala 30:29]
    node lo = bits(dataReg, 7, 1) @[Rotation.scala 30:41]
    node _T_4 = cat(hi, lo) @[Cat.scala 30:58]
    node _T_5 = eq(cntReg, UInt<4>("h8")) @[Rotation.scala 32:20]
    node _T_6 = add(cntReg, UInt<1>("h1")) @[Rotation.scala 35:26]
    node _T_7 = tail(_T_6, 1) @[Rotation.scala 35:26]
    node _GEN_3 = mux(_T_5, UInt<2>("h2"), stateReg) @[Rotation.scala 32:29 Rotation.scala 33:18 Rotation.scala 13:25]
    node _GEN_4 = mux(_T_5, cntReg, _T_7) @[Rotation.scala 32:29 Rotation.scala 15:23 Rotation.scala 35:16]
    node _T_8 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _GEN_5 = mux(io_out_ready, UInt<2>("h0"), stateReg) @[Rotation.scala 39:27 Rotation.scala 40:18 Rotation.scala 13:25]
    node _GEN_6 = mux(_T_8, _GEN_5, stateReg) @[Conditional.scala 39:67 Rotation.scala 13:25]
    node _GEN_7 = mux(_T_3, _T_4, dataReg) @[Conditional.scala 39:67 Rotation.scala 30:15 Rotation.scala 14:24]
    node _GEN_8 = mux(_T_3, _GEN_3, _GEN_6) @[Conditional.scala 39:67]
    node _GEN_9 = mux(_T_3, _GEN_4, cntReg) @[Conditional.scala 39:67 Rotation.scala 15:23]
    node _GEN_10 = mux(_T_2, _GEN_0, _GEN_7) @[Conditional.scala 40:58]
    node _GEN_11 = mux(_T_2, _GEN_1, _GEN_9) @[Conditional.scala 40:58]
    node _GEN_12 = mux(_T_2, _GEN_2, _GEN_8) @[Conditional.scala 40:58]
    io_out_valid <= _T_1 @[Rotation.scala 18:16]
    io_out_bits <= dataReg @[Rotation.scala 19:15]
    io_in_ready <= _T @[Rotation.scala 17:15]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_12) @[Rotation.scala 13:25 Rotation.scala 13:25]
    dataReg <= mux(reset, UInt<8>("h0"), _GEN_10) @[Rotation.scala 14:24 Rotation.scala 14:24]
    cntReg <= mux(reset, UInt<4>("h0"), _GEN_11) @[Rotation.scala 15:23 Rotation.scala 15:23]
