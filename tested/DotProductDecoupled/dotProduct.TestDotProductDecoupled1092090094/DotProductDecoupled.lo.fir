circuit DotProductDecoupled :
  module DecoupledMultiplyAndAccumulate :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits_x : SInt<32>
    input io_in_bits_y : SInt<32>
    input io_in_bits_reset : UInt<1>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<32>

    reg stateReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[DotProductDecoupled.scala 87:25]
    reg xReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xReg) @[DotProductDecoupled.scala 88:21]
    reg yReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yReg) @[DotProductDecoupled.scala 89:21]
    reg resetReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), resetReg) @[DotProductDecoupled.scala 90:25]
    reg accReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), accReg) @[DotProductDecoupled.scala 91:23]
    node _T = eq(stateReg, UInt<1>("h0")) @[DotProductDecoupled.scala 94:27]
    node _T_1 = eq(stateReg, UInt<1>("h0")) @[DotProductDecoupled.scala 95:28]
    node _T_2 = eq(UInt<1>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits_x, xReg) @[DotProductDecoupled.scala 99:25 DotProductDecoupled.scala 100:14 DotProductDecoupled.scala 88:21]
    node _GEN_1 = mux(io_in_valid, io_in_bits_y, yReg) @[DotProductDecoupled.scala 99:25 DotProductDecoupled.scala 101:14 DotProductDecoupled.scala 89:21]
    node _GEN_2 = mux(io_in_valid, io_in_bits_reset, resetReg) @[DotProductDecoupled.scala 99:25 DotProductDecoupled.scala 102:18 DotProductDecoupled.scala 90:25]
    node _GEN_3 = mux(io_in_valid, UInt<1>("h1"), stateReg) @[DotProductDecoupled.scala 99:25 DotProductDecoupled.scala 104:18 DotProductDecoupled.scala 87:25]
    node _T_3 = eq(UInt<1>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_4 = mul(xReg, yReg) @[DotProductDecoupled.scala 113:33]
    node _T_5 = add(accReg, _T_4) @[DotProductDecoupled.scala 113:26]
    node _T_6 = tail(_T_5, 1) @[DotProductDecoupled.scala 113:26]
    node _T_7 = asSInt(_T_6) @[DotProductDecoupled.scala 113:26]
    node _GEN_4 = mux(resetReg, asSInt(UInt<1>("h0")), _T_7) @[DotProductDecoupled.scala 110:23 DotProductDecoupled.scala 111:16 DotProductDecoupled.scala 113:16]
    node _GEN_5 = mux(_T_3, UInt<1>("h0"), stateReg) @[Conditional.scala 39:67 DotProductDecoupled.scala 108:16 DotProductDecoupled.scala 87:25]
    node _GEN_6 = mux(_T_3, _GEN_4, accReg) @[Conditional.scala 39:67 DotProductDecoupled.scala 91:23]
    node _GEN_7 = mux(_T_2, _GEN_0, xReg) @[Conditional.scala 40:58 DotProductDecoupled.scala 88:21]
    node _GEN_8 = mux(_T_2, _GEN_1, yReg) @[Conditional.scala 40:58 DotProductDecoupled.scala 89:21]
    node _GEN_9 = mux(_T_2, _GEN_2, resetReg) @[Conditional.scala 40:58 DotProductDecoupled.scala 90:25]
    node _GEN_10 = mux(_T_2, _GEN_3, _GEN_5) @[Conditional.scala 40:58]
    node _GEN_11 = mux(_T_2, accReg, _GEN_6) @[Conditional.scala 40:58 DotProductDecoupled.scala 91:23]
    io_in_ready <= _T @[DotProductDecoupled.scala 94:15]
    io_out_valid <= _T_1 @[DotProductDecoupled.scala 95:16]
    io_out_bits <= accReg @[DotProductDecoupled.scala 93:15]
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_10) @[DotProductDecoupled.scala 87:25 DotProductDecoupled.scala 87:25]
    xReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_7) @[DotProductDecoupled.scala 88:21 DotProductDecoupled.scala 88:21]
    yReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_8) @[DotProductDecoupled.scala 89:21 DotProductDecoupled.scala 89:21]
    resetReg <= mux(reset, UInt<1>("h0"), _GEN_9) @[DotProductDecoupled.scala 90:25 DotProductDecoupled.scala 90:25]
    accReg <= mux(reset, asSInt(UInt<32>("h0")), asSInt(bits(_GEN_11, 31, 0))) @[DotProductDecoupled.scala 91:23 DotProductDecoupled.scala 91:23]

  module DotProductDecoupled :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits_x : SInt<32>
    input io_in_bits_y : SInt<32>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<32>

    inst pe of DecoupledMultiplyAndAccumulate @[DotProductDecoupled.scala 22:18]
    reg stateReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[DotProductDecoupled.scala 16:25]
    reg xReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xReg) @[DotProductDecoupled.scala 17:21]
    reg yReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yReg) @[DotProductDecoupled.scala 18:21]
    reg resReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), resReg) @[DotProductDecoupled.scala 19:23]
    reg cntReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[DotProductDecoupled.scala 20:23]
    node _T = eq(stateReg, UInt<3>("h1")) @[DotProductDecoupled.scala 26:31]
    node _T_1 = eq(stateReg, UInt<3>("h4")) @[DotProductDecoupled.scala 26:57]
    node _T_2 = or(_T, _T_1) @[DotProductDecoupled.scala 26:44]
    node _T_3 = eq(stateReg, UInt<3>("h2")) @[DotProductDecoupled.scala 27:31]
    node _T_4 = eq(stateReg, UInt<3>("h0")) @[DotProductDecoupled.scala 30:27]
    node _T_5 = eq(stateReg, UInt<3>("h3")) @[DotProductDecoupled.scala 31:28]
    node _T_6 = eq(UInt<3>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits_x, xReg) @[DotProductDecoupled.scala 35:25 DotProductDecoupled.scala 36:14 DotProductDecoupled.scala 17:21]
    node _GEN_1 = mux(io_in_valid, io_in_bits_y, yReg) @[DotProductDecoupled.scala 35:25 DotProductDecoupled.scala 37:14 DotProductDecoupled.scala 18:21]
    node _GEN_2 = mux(io_in_valid, UInt<3>("h1"), stateReg) @[DotProductDecoupled.scala 35:25 DotProductDecoupled.scala 38:18 DotProductDecoupled.scala 16:25]
    node _T_7 = eq(UInt<3>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_8 = add(cntReg, UInt<1>("h1")) @[DotProductDecoupled.scala 47:26]
    node _T_9 = tail(_T_8, 1) @[DotProductDecoupled.scala 47:26]
    node _T_10 = eq(cntReg, UInt<2>("h2")) @[DotProductDecoupled.scala 48:21]
    node _GEN_3 = mux(_T_10, UInt<3>("h2"), UInt<3>("h0")) @[DotProductDecoupled.scala 48:30 DotProductDecoupled.scala 49:20 DotProductDecoupled.scala 51:20]
    node _GEN_4 = mux(pe.io_in_ready, xReg, asSInt(UInt<1>("h0"))) @[DotProductDecoupled.scala 43:7 DotProductDecoupled.scala 44:25 DotProductDecoupled.scala 23:19]
    node _GEN_5 = mux(pe.io_in_ready, yReg, asSInt(UInt<1>("h0"))) @[DotProductDecoupled.scala 43:7 DotProductDecoupled.scala 45:25 DotProductDecoupled.scala 24:19]
    node _GEN_6 = mux(pe.io_in_ready, _T_9, cntReg) @[DotProductDecoupled.scala 43:7 DotProductDecoupled.scala 47:16 DotProductDecoupled.scala 20:23]
    node _GEN_7 = mux(pe.io_in_ready, _GEN_3, stateReg) @[DotProductDecoupled.scala 43:7 DotProductDecoupled.scala 16:25]
    node _T_11 = eq(UInt<3>("h2"), stateReg) @[Conditional.scala 37:30]
    node _GEN_8 = mux(pe.io_out_valid, pe.io_out_bits, resReg) @[DotProductDecoupled.scala 56:29 DotProductDecoupled.scala 57:16 DotProductDecoupled.scala 19:23]
    node _GEN_9 = mux(pe.io_out_valid, UInt<3>("h3"), stateReg) @[DotProductDecoupled.scala 56:29 DotProductDecoupled.scala 58:18 DotProductDecoupled.scala 16:25]
    node _T_12 = eq(UInt<3>("h3"), stateReg) @[Conditional.scala 37:30]
    node _GEN_10 = mux(io_out_ready, UInt<1>("h1"), cntReg) @[DotProductDecoupled.scala 62:26 DotProductDecoupled.scala 63:16 DotProductDecoupled.scala 20:23]
    node _GEN_11 = mux(io_out_ready, UInt<3>("h4"), stateReg) @[DotProductDecoupled.scala 62:26 DotProductDecoupled.scala 64:18 DotProductDecoupled.scala 16:25]
    node _T_13 = eq(UInt<3>("h4"), stateReg) @[Conditional.scala 37:30]
    node _GEN_12 = mux(pe.io_in_ready, UInt<1>("h1"), UInt<1>("h0")) @[DotProductDecoupled.scala 68:28 DotProductDecoupled.scala 69:29 DotProductDecoupled.scala 25:23]
    node _GEN_13 = mux(pe.io_in_ready, UInt<3>("h0"), stateReg) @[DotProductDecoupled.scala 68:28 DotProductDecoupled.scala 70:18 DotProductDecoupled.scala 16:25]
    node _GEN_14 = mux(_T_13, _GEN_12, UInt<1>("h0")) @[Conditional.scala 39:67 DotProductDecoupled.scala 25:23]
    node _GEN_15 = mux(_T_13, _GEN_13, stateReg) @[Conditional.scala 39:67 DotProductDecoupled.scala 16:25]
    node _GEN_16 = mux(_T_12, _GEN_10, cntReg) @[Conditional.scala 39:67 DotProductDecoupled.scala 20:23]
    node _GEN_17 = mux(_T_12, _GEN_11, _GEN_15) @[Conditional.scala 39:67]
    node _GEN_18 = mux(_T_12, UInt<1>("h0"), _GEN_14) @[Conditional.scala 39:67 DotProductDecoupled.scala 25:23]
    node _GEN_19 = mux(_T_11, _GEN_8, resReg) @[Conditional.scala 39:67 DotProductDecoupled.scala 19:23]
    node _GEN_20 = mux(_T_11, _GEN_9, _GEN_17) @[Conditional.scala 39:67]
    node _GEN_21 = mux(_T_11, cntReg, _GEN_16) @[Conditional.scala 39:67 DotProductDecoupled.scala 20:23]
    node _GEN_22 = mux(_T_11, UInt<1>("h0"), _GEN_18) @[Conditional.scala 39:67 DotProductDecoupled.scala 25:23]
    node _GEN_23 = mux(_T_7, _GEN_4, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 DotProductDecoupled.scala 23:19]
    node _GEN_24 = mux(_T_7, _GEN_5, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 DotProductDecoupled.scala 24:19]
    node _GEN_25 = mux(_T_7, _GEN_6, _GEN_21) @[Conditional.scala 39:67]
    node _GEN_26 = mux(_T_7, _GEN_7, _GEN_20) @[Conditional.scala 39:67]
    node _GEN_27 = mux(_T_7, resReg, _GEN_19) @[Conditional.scala 39:67 DotProductDecoupled.scala 19:23]
    node _GEN_28 = mux(_T_7, UInt<1>("h0"), _GEN_22) @[Conditional.scala 39:67 DotProductDecoupled.scala 25:23]
    node _GEN_29 = mux(_T_6, _GEN_0, xReg) @[Conditional.scala 40:58 DotProductDecoupled.scala 17:21]
    node _GEN_30 = mux(_T_6, _GEN_1, yReg) @[Conditional.scala 40:58 DotProductDecoupled.scala 18:21]
    node _GEN_31 = mux(_T_6, _GEN_2, _GEN_26) @[Conditional.scala 40:58]
    node _GEN_32 = mux(_T_6, asSInt(UInt<1>("h0")), _GEN_23) @[Conditional.scala 40:58 DotProductDecoupled.scala 23:19]
    node _GEN_33 = mux(_T_6, asSInt(UInt<1>("h0")), _GEN_24) @[Conditional.scala 40:58 DotProductDecoupled.scala 24:19]
    node _GEN_34 = mux(_T_6, cntReg, _GEN_25) @[Conditional.scala 40:58 DotProductDecoupled.scala 20:23]
    node _GEN_35 = mux(_T_6, resReg, _GEN_27) @[Conditional.scala 40:58 DotProductDecoupled.scala 19:23]
    node _GEN_36 = mux(_T_6, UInt<1>("h0"), _GEN_28) @[Conditional.scala 40:58 DotProductDecoupled.scala 25:23]
    io_in_ready <= _T_4 @[DotProductDecoupled.scala 30:15]
    io_out_valid <= _T_5 @[DotProductDecoupled.scala 31:16]
    io_out_bits <= resReg @[DotProductDecoupled.scala 29:15]
    stateReg <= mux(reset, UInt<3>("h0"), _GEN_31) @[DotProductDecoupled.scala 16:25 DotProductDecoupled.scala 16:25]
    xReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_29) @[DotProductDecoupled.scala 17:21 DotProductDecoupled.scala 17:21]
    yReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_30) @[DotProductDecoupled.scala 18:21 DotProductDecoupled.scala 18:21]
    resReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_35) @[DotProductDecoupled.scala 19:23 DotProductDecoupled.scala 19:23]
    cntReg <= mux(reset, UInt<2>("h1"), _GEN_34) @[DotProductDecoupled.scala 20:23 DotProductDecoupled.scala 20:23]
    pe.clock <= clock
    pe.reset <= reset
    pe.io_in_valid <= _T_2 @[DotProductDecoupled.scala 26:18]
    pe.io_in_bits_x <= _GEN_32
    pe.io_in_bits_y <= _GEN_33
    pe.io_in_bits_reset <= _GEN_36
    pe.io_out_ready <= _T_3 @[DotProductDecoupled.scala 27:19]
