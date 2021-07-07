circuit CorrelationFSMDecoupled :
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
      reset => (UInt<1>("h0"), stateReg) @[CorrelationFSMDecoupled.scala 114:25]
    reg xReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xReg) @[CorrelationFSMDecoupled.scala 115:21]
    reg yReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yReg) @[CorrelationFSMDecoupled.scala 116:21]
    reg resetReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), resetReg) @[CorrelationFSMDecoupled.scala 117:25]
    reg accReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), accReg) @[CorrelationFSMDecoupled.scala 118:23]
    node _T = eq(stateReg, UInt<1>("h0")) @[CorrelationFSMDecoupled.scala 121:27]
    node _T_1 = eq(stateReg, UInt<1>("h0")) @[CorrelationFSMDecoupled.scala 122:28]
    node _T_2 = eq(UInt<1>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits_x, xReg) @[CorrelationFSMDecoupled.scala 126:25 CorrelationFSMDecoupled.scala 127:14 CorrelationFSMDecoupled.scala 115:21]
    node _GEN_1 = mux(io_in_valid, io_in_bits_y, yReg) @[CorrelationFSMDecoupled.scala 126:25 CorrelationFSMDecoupled.scala 128:14 CorrelationFSMDecoupled.scala 116:21]
    node _GEN_2 = mux(io_in_valid, io_in_bits_reset, resetReg) @[CorrelationFSMDecoupled.scala 126:25 CorrelationFSMDecoupled.scala 129:18 CorrelationFSMDecoupled.scala 117:25]
    node _GEN_3 = mux(io_in_valid, UInt<1>("h1"), stateReg) @[CorrelationFSMDecoupled.scala 126:25 CorrelationFSMDecoupled.scala 131:18 CorrelationFSMDecoupled.scala 114:25]
    node _T_3 = eq(UInt<1>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_4 = mul(xReg, yReg) @[CorrelationFSMDecoupled.scala 140:33]
    node _T_5 = add(accReg, _T_4) @[CorrelationFSMDecoupled.scala 140:26]
    node _T_6 = tail(_T_5, 1) @[CorrelationFSMDecoupled.scala 140:26]
    node _T_7 = asSInt(_T_6) @[CorrelationFSMDecoupled.scala 140:26]
    node _GEN_4 = mux(resetReg, asSInt(UInt<1>("h0")), _T_7) @[CorrelationFSMDecoupled.scala 137:23 CorrelationFSMDecoupled.scala 138:16 CorrelationFSMDecoupled.scala 140:16]
    node _GEN_5 = mux(_T_3, UInt<1>("h0"), stateReg) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 135:16 CorrelationFSMDecoupled.scala 114:25]
    node _GEN_6 = mux(_T_3, _GEN_4, accReg) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 118:23]
    node _GEN_7 = mux(_T_2, _GEN_0, xReg) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 115:21]
    node _GEN_8 = mux(_T_2, _GEN_1, yReg) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 116:21]
    node _GEN_9 = mux(_T_2, _GEN_2, resetReg) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 117:25]
    node _GEN_10 = mux(_T_2, _GEN_3, _GEN_5) @[Conditional.scala 40:58]
    node _GEN_11 = mux(_T_2, accReg, _GEN_6) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 118:23]
    io_in_ready <= _T @[CorrelationFSMDecoupled.scala 121:15]
    io_out_valid <= _T_1 @[CorrelationFSMDecoupled.scala 122:16]
    io_out_bits <= accReg @[CorrelationFSMDecoupled.scala 120:15]
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_10) @[CorrelationFSMDecoupled.scala 114:25 CorrelationFSMDecoupled.scala 114:25]
    xReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_7) @[CorrelationFSMDecoupled.scala 115:21 CorrelationFSMDecoupled.scala 115:21]
    yReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_8) @[CorrelationFSMDecoupled.scala 116:21 CorrelationFSMDecoupled.scala 116:21]
    resetReg <= mux(reset, UInt<1>("h0"), _GEN_9) @[CorrelationFSMDecoupled.scala 117:25 CorrelationFSMDecoupled.scala 117:25]
    accReg <= mux(reset, asSInt(UInt<32>("h0")), asSInt(bits(_GEN_11, 31, 0))) @[CorrelationFSMDecoupled.scala 118:23 CorrelationFSMDecoupled.scala 118:23]

  module CorrelationFSMDecoupled :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits : SInt<32>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<32>

    inst pe of DecoupledMultiplyAndAccumulate @[CorrelationFSMDecoupled.scala 30:18]
    reg stateReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[CorrelationFSMDecoupled.scala 14:25]
    reg computingStageReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), computingStageReg) @[CorrelationFSMDecoupled.scala 17:34]
    reg x0Reg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), x0Reg) @[CorrelationFSMDecoupled.scala 19:22]
    reg x1Reg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), x1Reg) @[CorrelationFSMDecoupled.scala 20:22]
    reg x2Reg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), x2Reg) @[CorrelationFSMDecoupled.scala 21:22]
    reg w0Reg : SInt<2>, clock with :
      reset => (UInt<1>("h0"), w0Reg) @[CorrelationFSMDecoupled.scala 23:22]
    reg w1Reg : SInt<3>, clock with :
      reset => (UInt<1>("h0"), w1Reg) @[CorrelationFSMDecoupled.scala 24:22]
    reg w2Reg : SInt<3>, clock with :
      reset => (UInt<1>("h0"), w2Reg) @[CorrelationFSMDecoupled.scala 25:22]
    reg resReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), resReg) @[CorrelationFSMDecoupled.scala 27:23]
    node _T = eq(stateReg, UInt<3>("h0")) @[CorrelationFSMDecoupled.scala 32:27]
    node _T_1 = eq(stateReg, UInt<3>("h3")) @[CorrelationFSMDecoupled.scala 33:28]
    node _T_2 = eq(stateReg, UInt<3>("h1")) @[CorrelationFSMDecoupled.scala 38:31]
    node _T_3 = eq(stateReg, UInt<3>("h4")) @[CorrelationFSMDecoupled.scala 38:57]
    node _T_4 = or(_T_2, _T_3) @[CorrelationFSMDecoupled.scala 38:44]
    node _T_5 = eq(stateReg, UInt<3>("h2")) @[CorrelationFSMDecoupled.scala 39:31]
    node _T_6 = eq(UInt<3>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, x1Reg, x0Reg) @[CorrelationFSMDecoupled.scala 43:25 CorrelationFSMDecoupled.scala 44:15 CorrelationFSMDecoupled.scala 19:22]
    node _GEN_1 = mux(io_in_valid, x2Reg, x1Reg) @[CorrelationFSMDecoupled.scala 43:25 CorrelationFSMDecoupled.scala 45:15 CorrelationFSMDecoupled.scala 20:22]
    node _GEN_2 = mux(io_in_valid, io_in_bits, x2Reg) @[CorrelationFSMDecoupled.scala 43:25 CorrelationFSMDecoupled.scala 46:15 CorrelationFSMDecoupled.scala 21:22]
    node _GEN_3 = mux(io_in_valid, UInt<3>("h1"), stateReg) @[CorrelationFSMDecoupled.scala 43:25 CorrelationFSMDecoupled.scala 47:18 CorrelationFSMDecoupled.scala 14:25]
    node _GEN_4 = mux(io_in_valid, UInt<2>("h0"), computingStageReg) @[CorrelationFSMDecoupled.scala 43:25 CorrelationFSMDecoupled.scala 48:27 CorrelationFSMDecoupled.scala 17:34]
    node _T_7 = eq(UInt<3>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_8 = eq(UInt<2>("h0"), computingStageReg) @[Conditional.scala 37:30]
    node _T_9 = eq(UInt<2>("h1"), computingStageReg) @[Conditional.scala 37:30]
    node _T_10 = eq(UInt<2>("h2"), computingStageReg) @[Conditional.scala 37:30]
    node _GEN_5 = mux(_T_10, x2Reg, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 62:27 CorrelationFSMDecoupled.scala 35:19]
    node _GEN_6 = mux(_T_10, w2Reg, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 63:27 CorrelationFSMDecoupled.scala 36:19]
    node _GEN_7 = mux(_T_9, x1Reg, _GEN_5) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 58:27]
    node _GEN_8 = mux(_T_9, w1Reg, _GEN_6) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 59:27]
    node _GEN_9 = mux(_T_8, x0Reg, _GEN_7) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 54:27]
    node _GEN_10 = mux(_T_8, w0Reg, _GEN_8) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 55:27]
    node _GEN_11 = mux(pe.io_in_ready, UInt<3>("h2"), stateReg) @[CorrelationFSMDecoupled.scala 66:28 CorrelationFSMDecoupled.scala 67:18 CorrelationFSMDecoupled.scala 14:25]
    node _T_11 = eq(UInt<3>("h2"), stateReg) @[Conditional.scala 37:30]
    node _T_12 = eq(UInt<2>("h0"), computingStageReg) @[Conditional.scala 37:30]
    node _T_13 = eq(UInt<2>("h1"), computingStageReg) @[Conditional.scala 37:30]
    node _T_14 = eq(UInt<2>("h2"), computingStageReg) @[Conditional.scala 37:30]
    node _GEN_12 = mux(_T_14, UInt<3>("h3"), stateReg) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 84:22 CorrelationFSMDecoupled.scala 14:25]
    node _GEN_13 = mux(_T_13, UInt<2>("h2"), computingStageReg) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 80:31 CorrelationFSMDecoupled.scala 17:34]
    node _GEN_14 = mux(_T_13, UInt<3>("h1"), _GEN_12) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 81:22]
    node _GEN_15 = mux(_T_12, UInt<2>("h1"), _GEN_13) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 76:31]
    node _GEN_16 = mux(_T_12, UInt<3>("h1"), _GEN_14) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 77:22]
    node _GEN_17 = mux(pe.io_out_valid, pe.io_out_bits, resReg) @[CorrelationFSMDecoupled.scala 71:29 CorrelationFSMDecoupled.scala 72:16 CorrelationFSMDecoupled.scala 27:23]
    node _GEN_18 = mux(pe.io_out_valid, _GEN_15, computingStageReg) @[CorrelationFSMDecoupled.scala 71:29 CorrelationFSMDecoupled.scala 17:34]
    node _GEN_19 = mux(pe.io_out_valid, _GEN_16, stateReg) @[CorrelationFSMDecoupled.scala 71:29 CorrelationFSMDecoupled.scala 14:25]
    node _T_15 = eq(UInt<3>("h3"), stateReg) @[Conditional.scala 37:30]
    node _GEN_20 = mux(io_out_ready, UInt<3>("h4"), stateReg) @[CorrelationFSMDecoupled.scala 90:26 CorrelationFSMDecoupled.scala 91:18 CorrelationFSMDecoupled.scala 14:25]
    node _T_16 = eq(UInt<3>("h4"), stateReg) @[Conditional.scala 37:30]
    node _GEN_21 = mux(pe.io_in_ready, UInt<1>("h1"), UInt<1>("h0")) @[CorrelationFSMDecoupled.scala 95:28 CorrelationFSMDecoupled.scala 96:29 CorrelationFSMDecoupled.scala 37:23]
    node _GEN_22 = mux(pe.io_in_ready, UInt<3>("h0"), stateReg) @[CorrelationFSMDecoupled.scala 95:28 CorrelationFSMDecoupled.scala 97:18 CorrelationFSMDecoupled.scala 14:25]
    node _GEN_23 = mux(_T_16, _GEN_21, UInt<1>("h0")) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 37:23]
    node _GEN_24 = mux(_T_16, _GEN_22, stateReg) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 14:25]
    node _GEN_25 = mux(_T_15, _GEN_20, _GEN_24) @[Conditional.scala 39:67]
    node _GEN_26 = mux(_T_15, UInt<1>("h0"), _GEN_23) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 37:23]
    node _GEN_27 = mux(_T_11, _GEN_17, resReg) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 27:23]
    node _GEN_28 = mux(_T_11, _GEN_18, computingStageReg) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 17:34]
    node _GEN_29 = mux(_T_11, _GEN_19, _GEN_25) @[Conditional.scala 39:67]
    node _GEN_30 = mux(_T_11, UInt<1>("h0"), _GEN_26) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 37:23]
    node _GEN_31 = mux(_T_7, _GEN_9, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 35:19]
    node _GEN_32 = mux(_T_7, _GEN_10, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 36:19]
    node _GEN_33 = mux(_T_7, _GEN_11, _GEN_29) @[Conditional.scala 39:67]
    node _GEN_34 = mux(_T_7, resReg, _GEN_27) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 27:23]
    node _GEN_35 = mux(_T_7, computingStageReg, _GEN_28) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 17:34]
    node _GEN_36 = mux(_T_7, UInt<1>("h0"), _GEN_30) @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 37:23]
    node _GEN_37 = mux(_T_6, _GEN_0, x0Reg) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 19:22]
    node _GEN_38 = mux(_T_6, _GEN_1, x1Reg) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 20:22]
    node _GEN_39 = mux(_T_6, _GEN_2, x2Reg) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 21:22]
    node _GEN_40 = mux(_T_6, _GEN_3, _GEN_33) @[Conditional.scala 40:58]
    node _GEN_41 = mux(_T_6, _GEN_4, _GEN_35) @[Conditional.scala 40:58]
    node _GEN_42 = mux(_T_6, asSInt(UInt<1>("h0")), _GEN_31) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 35:19]
    node _GEN_43 = mux(_T_6, asSInt(UInt<1>("h0")), _GEN_32) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 36:19]
    node _GEN_44 = mux(_T_6, resReg, _GEN_34) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 27:23]
    node _GEN_45 = mux(_T_6, UInt<1>("h0"), _GEN_36) @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 37:23]
    io_in_ready <= _T @[CorrelationFSMDecoupled.scala 32:15]
    io_out_valid <= _T_1 @[CorrelationFSMDecoupled.scala 33:16]
    io_out_bits <= resReg @[CorrelationFSMDecoupled.scala 28:15]
    stateReg <= mux(reset, UInt<3>("h0"), _GEN_40) @[CorrelationFSMDecoupled.scala 14:25 CorrelationFSMDecoupled.scala 14:25]
    computingStageReg <= mux(reset, UInt<2>("h0"), _GEN_41) @[CorrelationFSMDecoupled.scala 17:34 CorrelationFSMDecoupled.scala 17:34]
    x0Reg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_37) @[CorrelationFSMDecoupled.scala 19:22 CorrelationFSMDecoupled.scala 19:22]
    x1Reg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_38) @[CorrelationFSMDecoupled.scala 20:22 CorrelationFSMDecoupled.scala 20:22]
    x2Reg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_39) @[CorrelationFSMDecoupled.scala 21:22 CorrelationFSMDecoupled.scala 21:22]
    w0Reg <= mux(reset, asSInt(UInt<2>("h1")), w0Reg) @[CorrelationFSMDecoupled.scala 23:22 CorrelationFSMDecoupled.scala 23:22 CorrelationFSMDecoupled.scala 23:22]
    w1Reg <= mux(reset, asSInt(UInt<3>("h2")), w1Reg) @[CorrelationFSMDecoupled.scala 24:22 CorrelationFSMDecoupled.scala 24:22 CorrelationFSMDecoupled.scala 24:22]
    w2Reg <= mux(reset, asSInt(UInt<3>("h3")), w2Reg) @[CorrelationFSMDecoupled.scala 25:22 CorrelationFSMDecoupled.scala 25:22 CorrelationFSMDecoupled.scala 25:22]
    resReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_44) @[CorrelationFSMDecoupled.scala 27:23 CorrelationFSMDecoupled.scala 27:23]
    pe.clock <= clock
    pe.reset <= reset
    pe.io_in_valid <= _T_4 @[CorrelationFSMDecoupled.scala 38:18]
    pe.io_in_bits_x <= _GEN_42
    pe.io_in_bits_y <= _GEN_43
    pe.io_in_bits_reset <= _GEN_45
    pe.io_out_ready <= _T_5 @[CorrelationFSMDecoupled.scala 39:19]
