circuit Computing :
  module Computing :
    input clock : Clock
    input reset : UInt<1>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits_x : SInt<32>
    output io_out_bits_y : SInt<32>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits_x : SInt<32>
    input io_in_bits_y : SInt<32>

    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[Computing.scala 13:25]
    reg xReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xReg) @[Computing.scala 14:21]
    reg yReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yReg) @[Computing.scala 15:21]
    reg cntReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Computing.scala 16:23]
    node _T = eq(stateReg, UInt<2>("h0")) @[Computing.scala 18:27]
    node _T_1 = eq(stateReg, UInt<2>("h2")) @[Computing.scala 19:28]
    node _T_2 = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits_x, xReg) @[Computing.scala 25:25 Computing.scala 26:14 Computing.scala 14:21]
    node _GEN_1 = mux(io_in_valid, io_in_bits_y, yReg) @[Computing.scala 25:25 Computing.scala 27:14 Computing.scala 15:21]
    node _GEN_2 = mux(io_in_valid, UInt<1>("h1"), cntReg) @[Computing.scala 25:25 Computing.scala 28:16 Computing.scala 16:23]
    node _GEN_3 = mux(io_in_valid, UInt<2>("h1"), stateReg) @[Computing.scala 25:25 Computing.scala 29:18 Computing.scala 13:25]
    node _T_3 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_4 = mul(xReg, asSInt(UInt<4>("h5"))) @[Computing.scala 33:20]
    node _T_5 = mul(yReg, asSInt(UInt<3>("h3"))) @[Computing.scala 33:33]
    node _T_6 = add(_T_4, _T_5) @[Computing.scala 33:26]
    node _T_7 = tail(_T_6, 1) @[Computing.scala 33:26]
    node _T_8 = asSInt(_T_7) @[Computing.scala 33:26]
    node _T_9 = mul(xReg, asSInt(UInt<3>("h3"))) @[Computing.scala 34:20]
    node _T_10 = mul(yReg, asSInt(UInt<3>("h2"))) @[Computing.scala 34:33]
    node _T_11 = sub(_T_9, _T_10) @[Computing.scala 34:26]
    node _T_12 = tail(_T_11, 1) @[Computing.scala 34:26]
    node _T_13 = asSInt(_T_12) @[Computing.scala 34:26]
    node _T_14 = eq(cntReg, UInt<4>("h8")) @[Computing.scala 36:19]
    node _T_15 = add(cntReg, UInt<1>("h1")) @[Computing.scala 39:26]
    node _T_16 = tail(_T_15, 1) @[Computing.scala 39:26]
    node _GEN_4 = mux(_T_14, UInt<2>("h2"), stateReg) @[Computing.scala 36:28 Computing.scala 37:18 Computing.scala 13:25]
    node _GEN_5 = mux(_T_14, cntReg, _T_16) @[Computing.scala 36:28 Computing.scala 16:23 Computing.scala 39:16]
    node _T_17 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _GEN_6 = mux(io_out_ready, UInt<2>("h0"), stateReg) @[Computing.scala 43:26 Computing.scala 44:18 Computing.scala 13:25]
    node _GEN_7 = mux(_T_17, _GEN_6, stateReg) @[Conditional.scala 39:67 Computing.scala 13:25]
    node _GEN_8 = mux(_T_3, _T_8, xReg) @[Conditional.scala 39:67 Computing.scala 33:12 Computing.scala 14:21]
    node _GEN_9 = mux(_T_3, _T_13, yReg) @[Conditional.scala 39:67 Computing.scala 34:12 Computing.scala 15:21]
    node _GEN_10 = mux(_T_3, _GEN_4, _GEN_7) @[Conditional.scala 39:67]
    node _GEN_11 = mux(_T_3, _GEN_5, cntReg) @[Conditional.scala 39:67 Computing.scala 16:23]
    node _GEN_12 = mux(_T_2, _GEN_0, _GEN_8) @[Conditional.scala 40:58]
    node _GEN_13 = mux(_T_2, _GEN_1, _GEN_9) @[Conditional.scala 40:58]
    node _GEN_14 = mux(_T_2, _GEN_2, _GEN_11) @[Conditional.scala 40:58]
    node _GEN_15 = mux(_T_2, _GEN_3, _GEN_10) @[Conditional.scala 40:58]
    io_out_valid <= _T_1 @[Computing.scala 19:16]
    io_out_bits_x <= xReg @[Computing.scala 20:17]
    io_out_bits_y <= yReg @[Computing.scala 21:17]
    io_in_ready <= _T @[Computing.scala 18:15]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_15) @[Computing.scala 13:25 Computing.scala 13:25]
    xReg <= mux(reset, asSInt(UInt<32>("h0")), asSInt(bits(_GEN_12, 31, 0))) @[Computing.scala 14:21 Computing.scala 14:21]
    yReg <= mux(reset, asSInt(UInt<32>("h0")), asSInt(bits(_GEN_13, 31, 0))) @[Computing.scala 15:21 Computing.scala 15:21]
    cntReg <= mux(reset, UInt<4>("h0"), _GEN_14) @[Computing.scala 16:23 Computing.scala 16:23]
