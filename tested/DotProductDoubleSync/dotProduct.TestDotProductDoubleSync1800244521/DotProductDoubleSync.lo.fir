circuit DotProductDoubleSync :
  module SynchronizedDotProductPE :
    input clock : Clock
    input reset : UInt<1>
    input io_x : SInt<32>
    input io_y : SInt<32>
    input io_reset : UInt<1>
    output io_out : SInt<32>

    reg xReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xReg) @[DotProductDoubleSync.scala 70:21]
    reg yReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yReg) @[DotProductDoubleSync.scala 71:21]
    reg resetReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), resetReg) @[DotProductDoubleSync.scala 72:25]
    reg accReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), accReg) @[DotProductDoubleSync.scala 74:23]
    node _T = mul(xReg, yReg) @[DotProductDoubleSync.scala 80:29]
    node _T_1 = add(accReg, _T) @[DotProductDoubleSync.scala 80:22]
    node _T_2 = tail(_T_1, 1) @[DotProductDoubleSync.scala 80:22]
    node _T_3 = asSInt(_T_2) @[DotProductDoubleSync.scala 80:22]
    node _GEN_0 = mux(resetReg, asSInt(UInt<1>("h0")), _T_3) @[DotProductDoubleSync.scala 77:19 DotProductDoubleSync.scala 78:12 DotProductDoubleSync.scala 80:12]
    io_out <= accReg @[DotProductDoubleSync.scala 75:10]
    xReg <= mux(reset, asSInt(UInt<1>("h0")), io_x) @[DotProductDoubleSync.scala 70:21 DotProductDoubleSync.scala 70:21 DotProductDoubleSync.scala 70:21]
    yReg <= mux(reset, asSInt(UInt<1>("h0")), io_y) @[DotProductDoubleSync.scala 71:21 DotProductDoubleSync.scala 71:21 DotProductDoubleSync.scala 71:21]
    resetReg <= mux(reset, UInt<1>("h0"), io_reset) @[DotProductDoubleSync.scala 72:25 DotProductDoubleSync.scala 72:25 DotProductDoubleSync.scala 72:25]
    accReg <= mux(reset, asSInt(UInt<32>("h0")), asSInt(bits(_GEN_0, 31, 0))) @[DotProductDoubleSync.scala 74:23 DotProductDoubleSync.scala 74:23]

  module DotProductDoubleSync :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits_x : SInt<32>
    input io_in_bits_y : SInt<32>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<32>

    inst pe of SynchronizedDotProductPE @[DotProductDoubleSync.scala 21:18]
    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[DotProductDoubleSync.scala 16:25]
    reg xReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xReg) @[DotProductDoubleSync.scala 17:21]
    reg yReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yReg) @[DotProductDoubleSync.scala 18:21]
    reg cntReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[DotProductDoubleSync.scala 19:23]
    node _T = eq(stateReg, UInt<2>("h0")) @[DotProductDoubleSync.scala 27:27]
    node _T_1 = eq(stateReg, UInt<2>("h3")) @[DotProductDoubleSync.scala 28:28]
    node _T_2 = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits_x, xReg) @[DotProductDoubleSync.scala 32:25 DotProductDoubleSync.scala 33:14 DotProductDoubleSync.scala 17:21]
    node _GEN_1 = mux(io_in_valid, io_in_bits_y, yReg) @[DotProductDoubleSync.scala 32:25 DotProductDoubleSync.scala 34:14 DotProductDoubleSync.scala 18:21]
    node _GEN_2 = mux(io_in_valid, UInt<2>("h1"), stateReg) @[DotProductDoubleSync.scala 32:25 DotProductDoubleSync.scala 35:18 DotProductDoubleSync.scala 16:25]
    node _T_3 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _T_5 = add(cntReg, UInt<1>("h1")) @[DotProductDoubleSync.scala 44:24]
    node _T_6 = tail(_T_5, 1) @[DotProductDoubleSync.scala 44:24]
    node _T_7 = eq(cntReg, UInt<2>("h2")) @[DotProductDoubleSync.scala 46:19]
    node _GEN_3 = mux(_T_7, UInt<2>("h3"), UInt<2>("h0")) @[DotProductDoubleSync.scala 46:28 DotProductDoubleSync.scala 47:18 DotProductDoubleSync.scala 49:18]
    node _T_8 = eq(UInt<2>("h3"), stateReg) @[Conditional.scala 37:30]
    node _GEN_4 = mux(io_out_ready, UInt<1>("h1"), cntReg) @[DotProductDoubleSync.scala 53:26 DotProductDoubleSync.scala 54:16 DotProductDoubleSync.scala 19:23]
    node _GEN_5 = mux(io_out_ready, UInt<1>("h1"), UInt<1>("h0")) @[DotProductDoubleSync.scala 53:26 DotProductDoubleSync.scala 55:21 DotProductDoubleSync.scala 24:15]
    node _GEN_6 = mux(io_out_ready, UInt<2>("h0"), stateReg) @[DotProductDoubleSync.scala 53:26 DotProductDoubleSync.scala 56:18 DotProductDoubleSync.scala 16:25]
    node _GEN_7 = mux(_T_8, _GEN_4, cntReg) @[Conditional.scala 39:67 DotProductDoubleSync.scala 19:23]
    node _GEN_8 = mux(_T_8, _GEN_5, UInt<1>("h0")) @[Conditional.scala 39:67 DotProductDoubleSync.scala 24:15]
    node _GEN_9 = mux(_T_8, _GEN_6, stateReg) @[Conditional.scala 39:67 DotProductDoubleSync.scala 16:25]
    node _GEN_10 = mux(_T_4, _T_6, _GEN_7) @[Conditional.scala 39:67 DotProductDoubleSync.scala 44:14]
    node _GEN_11 = mux(_T_4, _GEN_3, _GEN_9) @[Conditional.scala 39:67]
    node _GEN_12 = mux(_T_4, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67 DotProductDoubleSync.scala 24:15]
    node _GEN_13 = mux(_T_3, xReg, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 DotProductDoubleSync.scala 39:15 DotProductDoubleSync.scala 22:11]
    node _GEN_14 = mux(_T_3, yReg, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 DotProductDoubleSync.scala 40:15 DotProductDoubleSync.scala 23:11]
    node _GEN_15 = mux(_T_3, UInt<2>("h2"), _GEN_11) @[Conditional.scala 39:67 DotProductDoubleSync.scala 41:16]
    node _GEN_16 = mux(_T_3, cntReg, _GEN_10) @[Conditional.scala 39:67 DotProductDoubleSync.scala 19:23]
    node _GEN_17 = mux(_T_3, UInt<1>("h0"), _GEN_12) @[Conditional.scala 39:67 DotProductDoubleSync.scala 24:15]
    node _GEN_18 = mux(_T_2, _GEN_0, xReg) @[Conditional.scala 40:58 DotProductDoubleSync.scala 17:21]
    node _GEN_19 = mux(_T_2, _GEN_1, yReg) @[Conditional.scala 40:58 DotProductDoubleSync.scala 18:21]
    node _GEN_20 = mux(_T_2, _GEN_2, _GEN_15) @[Conditional.scala 40:58]
    node _GEN_21 = mux(_T_2, asSInt(UInt<1>("h0")), _GEN_13) @[Conditional.scala 40:58 DotProductDoubleSync.scala 22:11]
    node _GEN_22 = mux(_T_2, asSInt(UInt<1>("h0")), _GEN_14) @[Conditional.scala 40:58 DotProductDoubleSync.scala 23:11]
    node _GEN_23 = mux(_T_2, cntReg, _GEN_16) @[Conditional.scala 40:58 DotProductDoubleSync.scala 19:23]
    node _GEN_24 = mux(_T_2, UInt<1>("h0"), _GEN_17) @[Conditional.scala 40:58 DotProductDoubleSync.scala 24:15]
    io_in_ready <= _T @[DotProductDoubleSync.scala 27:15]
    io_out_valid <= _T_1 @[DotProductDoubleSync.scala 28:16]
    io_out_bits <= pe.io_out @[DotProductDoubleSync.scala 25:15]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_20) @[DotProductDoubleSync.scala 16:25 DotProductDoubleSync.scala 16:25]
    xReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_18) @[DotProductDoubleSync.scala 17:21 DotProductDoubleSync.scala 17:21]
    yReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_19) @[DotProductDoubleSync.scala 18:21 DotProductDoubleSync.scala 18:21]
    cntReg <= mux(reset, UInt<2>("h1"), _GEN_23) @[DotProductDoubleSync.scala 19:23 DotProductDoubleSync.scala 19:23]
    pe.clock <= clock
    pe.reset <= reset
    pe.io_x <= _GEN_21
    pe.io_y <= _GEN_22
    pe.io_reset <= _GEN_24
