circuit DotProductFSM :
  module DotProductPE :
    input clock : Clock
    input reset : UInt<1>
    input io_x : SInt<32>
    input io_y : SInt<32>
    input io_reset : UInt<1>
    output io_out : SInt<32>

    reg accReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), accReg) @[DotProductFSM.scala 67:23]
    node _T = mul(io_x, io_y) @[DotProductFSM.scala 73:29]
    node _T_1 = add(accReg, _T) @[DotProductFSM.scala 73:22]
    node _T_2 = tail(_T_1, 1) @[DotProductFSM.scala 73:22]
    node _T_3 = asSInt(_T_2) @[DotProductFSM.scala 73:22]
    node _GEN_0 = mux(io_reset, asSInt(UInt<1>("h0")), _T_3) @[DotProductFSM.scala 70:19 DotProductFSM.scala 71:12 DotProductFSM.scala 73:12]
    io_out <= accReg @[DotProductFSM.scala 68:10]
    accReg <= mux(reset, asSInt(UInt<32>("h0")), asSInt(bits(_GEN_0, 31, 0))) @[DotProductFSM.scala 67:23 DotProductFSM.scala 67:23]

  module DotProductFSM :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits_x : SInt<32>
    input io_in_bits_y : SInt<32>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<32>

    inst pe of DotProductPE @[DotProductFSM.scala 21:18]
    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[DotProductFSM.scala 16:25]
    reg xReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xReg) @[DotProductFSM.scala 17:21]
    reg yReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yReg) @[DotProductFSM.scala 18:21]
    reg cntReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[DotProductFSM.scala 19:23]
    node _T = eq(stateReg, UInt<2>("h0")) @[DotProductFSM.scala 27:27]
    node _T_1 = eq(stateReg, UInt<2>("h2")) @[DotProductFSM.scala 28:28]
    node _T_2 = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits_x, xReg) @[DotProductFSM.scala 32:25 DotProductFSM.scala 33:14 DotProductFSM.scala 17:21]
    node _GEN_1 = mux(io_in_valid, io_in_bits_y, yReg) @[DotProductFSM.scala 32:25 DotProductFSM.scala 34:14 DotProductFSM.scala 18:21]
    node _GEN_2 = mux(io_in_valid, UInt<2>("h1"), stateReg) @[DotProductFSM.scala 32:25 DotProductFSM.scala 35:18 DotProductFSM.scala 16:25]
    node _T_3 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_4 = add(cntReg, UInt<1>("h1")) @[DotProductFSM.scala 41:24]
    node _T_5 = tail(_T_4, 1) @[DotProductFSM.scala 41:24]
    node _T_6 = eq(cntReg, UInt<2>("h2")) @[DotProductFSM.scala 43:19]
    node _GEN_3 = mux(_T_6, UInt<2>("h2"), UInt<2>("h0")) @[DotProductFSM.scala 43:28 DotProductFSM.scala 44:18 DotProductFSM.scala 46:18]
    node _T_7 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _GEN_4 = mux(io_out_ready, UInt<1>("h1"), cntReg) @[DotProductFSM.scala 50:26 DotProductFSM.scala 51:16 DotProductFSM.scala 19:23]
    node _GEN_5 = mux(io_out_ready, UInt<1>("h1"), UInt<1>("h0")) @[DotProductFSM.scala 50:26 DotProductFSM.scala 52:21 DotProductFSM.scala 24:15]
    node _GEN_6 = mux(io_out_ready, UInt<2>("h0"), stateReg) @[DotProductFSM.scala 50:26 DotProductFSM.scala 53:18 DotProductFSM.scala 16:25]
    node _GEN_7 = mux(_T_7, _GEN_4, cntReg) @[Conditional.scala 39:67 DotProductFSM.scala 19:23]
    node _GEN_8 = mux(_T_7, _GEN_5, UInt<1>("h0")) @[Conditional.scala 39:67 DotProductFSM.scala 24:15]
    node _GEN_9 = mux(_T_7, _GEN_6, stateReg) @[Conditional.scala 39:67 DotProductFSM.scala 16:25]
    node _GEN_10 = mux(_T_3, xReg, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 DotProductFSM.scala 39:15 DotProductFSM.scala 22:11]
    node _GEN_11 = mux(_T_3, yReg, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 DotProductFSM.scala 40:15 DotProductFSM.scala 23:11]
    node _GEN_12 = mux(_T_3, _T_5, _GEN_7) @[Conditional.scala 39:67 DotProductFSM.scala 41:14]
    node _GEN_13 = mux(_T_3, _GEN_3, _GEN_9) @[Conditional.scala 39:67]
    node _GEN_14 = mux(_T_3, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67 DotProductFSM.scala 24:15]
    node _GEN_15 = mux(_T_2, _GEN_0, xReg) @[Conditional.scala 40:58 DotProductFSM.scala 17:21]
    node _GEN_16 = mux(_T_2, _GEN_1, yReg) @[Conditional.scala 40:58 DotProductFSM.scala 18:21]
    node _GEN_17 = mux(_T_2, _GEN_2, _GEN_13) @[Conditional.scala 40:58]
    node _GEN_18 = mux(_T_2, asSInt(UInt<1>("h0")), _GEN_10) @[Conditional.scala 40:58 DotProductFSM.scala 22:11]
    node _GEN_19 = mux(_T_2, asSInt(UInt<1>("h0")), _GEN_11) @[Conditional.scala 40:58 DotProductFSM.scala 23:11]
    node _GEN_20 = mux(_T_2, cntReg, _GEN_12) @[Conditional.scala 40:58 DotProductFSM.scala 19:23]
    node _GEN_21 = mux(_T_2, UInt<1>("h0"), _GEN_14) @[Conditional.scala 40:58 DotProductFSM.scala 24:15]
    io_in_ready <= _T @[DotProductFSM.scala 27:15]
    io_out_valid <= _T_1 @[DotProductFSM.scala 28:16]
    io_out_bits <= pe.io_out @[DotProductFSM.scala 25:15]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_17) @[DotProductFSM.scala 16:25 DotProductFSM.scala 16:25]
    xReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_15) @[DotProductFSM.scala 17:21 DotProductFSM.scala 17:21]
    yReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_16) @[DotProductFSM.scala 18:21 DotProductFSM.scala 18:21]
    cntReg <= mux(reset, UInt<2>("h1"), _GEN_20) @[DotProductFSM.scala 19:23 DotProductFSM.scala 19:23]
    pe.clock <= clock
    pe.reset <= reset
    pe.io_x <= _GEN_18
    pe.io_y <= _GEN_19
    pe.io_reset <= _GEN_21
