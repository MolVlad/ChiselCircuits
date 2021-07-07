circuit CorrelationFSMDoubleSync :
  module SynchronizedMultiplyAndAccumulate :
    input clock : Clock
    input reset : UInt<1>
    input io_x : SInt<32>
    input io_y : SInt<32>
    input io_reset : UInt<1>
    output io_out : SInt<32>

    reg xReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xReg) @[CorrelationFSMDoubleSync.scala 96:21]
    reg yReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yReg) @[CorrelationFSMDoubleSync.scala 97:21]
    reg resetReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), resetReg) @[CorrelationFSMDoubleSync.scala 98:25]
    reg accReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), accReg) @[CorrelationFSMDoubleSync.scala 100:23]
    node _T = mul(xReg, yReg) @[CorrelationFSMDoubleSync.scala 106:29]
    node _T_1 = add(accReg, _T) @[CorrelationFSMDoubleSync.scala 106:22]
    node _T_2 = tail(_T_1, 1) @[CorrelationFSMDoubleSync.scala 106:22]
    node _T_3 = asSInt(_T_2) @[CorrelationFSMDoubleSync.scala 106:22]
    node _GEN_0 = mux(resetReg, asSInt(UInt<1>("h0")), _T_3) @[CorrelationFSMDoubleSync.scala 103:19 CorrelationFSMDoubleSync.scala 104:12 CorrelationFSMDoubleSync.scala 106:12]
    io_out <= accReg @[CorrelationFSMDoubleSync.scala 101:10]
    xReg <= mux(reset, asSInt(UInt<1>("h0")), io_x) @[CorrelationFSMDoubleSync.scala 96:21 CorrelationFSMDoubleSync.scala 96:21 CorrelationFSMDoubleSync.scala 96:21]
    yReg <= mux(reset, asSInt(UInt<1>("h0")), io_y) @[CorrelationFSMDoubleSync.scala 97:21 CorrelationFSMDoubleSync.scala 97:21 CorrelationFSMDoubleSync.scala 97:21]
    resetReg <= mux(reset, UInt<1>("h0"), io_reset) @[CorrelationFSMDoubleSync.scala 98:25 CorrelationFSMDoubleSync.scala 98:25 CorrelationFSMDoubleSync.scala 98:25]
    accReg <= mux(reset, asSInt(UInt<32>("h0")), asSInt(bits(_GEN_0, 31, 0))) @[CorrelationFSMDoubleSync.scala 100:23 CorrelationFSMDoubleSync.scala 100:23]

  module CorrelationFSMDoubleSync :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits : SInt<32>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<32>

    inst pe of SynchronizedMultiplyAndAccumulate @[CorrelationFSMDoubleSync.scala 26:18]
    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[CorrelationFSMDoubleSync.scala 13:25]
    reg computingStageReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), computingStageReg) @[CorrelationFSMDoubleSync.scala 16:34]
    reg x0Reg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), x0Reg) @[CorrelationFSMDoubleSync.scala 18:22]
    reg x1Reg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), x1Reg) @[CorrelationFSMDoubleSync.scala 19:22]
    reg x2Reg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), x2Reg) @[CorrelationFSMDoubleSync.scala 20:22]
    reg w0Reg : SInt<2>, clock with :
      reset => (UInt<1>("h0"), w0Reg) @[CorrelationFSMDoubleSync.scala 22:22]
    reg w1Reg : SInt<3>, clock with :
      reset => (UInt<1>("h0"), w1Reg) @[CorrelationFSMDoubleSync.scala 23:22]
    reg w2Reg : SInt<3>, clock with :
      reset => (UInt<1>("h0"), w2Reg) @[CorrelationFSMDoubleSync.scala 24:22]
    node _T = eq(stateReg, UInt<2>("h0")) @[CorrelationFSMDoubleSync.scala 33:27]
    node _T_1 = eq(stateReg, UInt<2>("h3")) @[CorrelationFSMDoubleSync.scala 34:28]
    node _T_2 = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, x1Reg, x0Reg) @[CorrelationFSMDoubleSync.scala 38:25 CorrelationFSMDoubleSync.scala 39:15 CorrelationFSMDoubleSync.scala 18:22]
    node _GEN_1 = mux(io_in_valid, x2Reg, x1Reg) @[CorrelationFSMDoubleSync.scala 38:25 CorrelationFSMDoubleSync.scala 40:15 CorrelationFSMDoubleSync.scala 19:22]
    node _GEN_2 = mux(io_in_valid, io_in_bits, x2Reg) @[CorrelationFSMDoubleSync.scala 38:25 CorrelationFSMDoubleSync.scala 41:15 CorrelationFSMDoubleSync.scala 20:22]
    node _GEN_3 = mux(io_in_valid, UInt<2>("h1"), stateReg) @[CorrelationFSMDoubleSync.scala 38:25 CorrelationFSMDoubleSync.scala 42:18 CorrelationFSMDoubleSync.scala 13:25]
    node _GEN_4 = mux(io_in_valid, UInt<2>("h0"), computingStageReg) @[CorrelationFSMDoubleSync.scala 38:25 CorrelationFSMDoubleSync.scala 43:27 CorrelationFSMDoubleSync.scala 16:34]
    node _T_3 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<2>("h0"), computingStageReg) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<2>("h1"), computingStageReg) @[Conditional.scala 37:30]
    node _T_6 = eq(UInt<2>("h2"), computingStageReg) @[Conditional.scala 37:30]
    node _GEN_5 = mux(_T_6, x2Reg, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 57:19 CorrelationFSMDoubleSync.scala 28:11]
    node _GEN_6 = mux(_T_6, w2Reg, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 58:19 CorrelationFSMDoubleSync.scala 29:11]
    node _GEN_7 = mux(_T_5, x1Reg, _GEN_5) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 53:19]
    node _GEN_8 = mux(_T_5, w1Reg, _GEN_6) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 54:19]
    node _GEN_9 = mux(_T_4, x0Reg, _GEN_7) @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 49:19]
    node _GEN_10 = mux(_T_4, w0Reg, _GEN_8) @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 50:19]
    node _T_7 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _T_8 = eq(UInt<2>("h0"), computingStageReg) @[Conditional.scala 37:30]
    node _T_9 = eq(UInt<2>("h1"), computingStageReg) @[Conditional.scala 37:30]
    node _T_10 = eq(UInt<2>("h2"), computingStageReg) @[Conditional.scala 37:30]
    node _GEN_11 = mux(_T_10, UInt<2>("h3"), stateReg) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 75:20 CorrelationFSMDoubleSync.scala 13:25]
    node _GEN_12 = mux(_T_9, UInt<2>("h2"), computingStageReg) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 71:29 CorrelationFSMDoubleSync.scala 16:34]
    node _GEN_13 = mux(_T_9, UInt<2>("h1"), _GEN_11) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 72:20]
    node _GEN_14 = mux(_T_8, UInt<2>("h1"), _GEN_12) @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 67:29]
    node _GEN_15 = mux(_T_8, UInt<2>("h1"), _GEN_13) @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 68:20]
    node _T_11 = eq(UInt<2>("h3"), stateReg) @[Conditional.scala 37:30]
    node _GEN_16 = mux(io_out_ready, UInt<1>("h1"), UInt<1>("h0")) @[CorrelationFSMDoubleSync.scala 80:26 CorrelationFSMDoubleSync.scala 81:21 CorrelationFSMDoubleSync.scala 30:15]
    node _GEN_17 = mux(io_out_ready, UInt<2>("h0"), stateReg) @[CorrelationFSMDoubleSync.scala 80:26 CorrelationFSMDoubleSync.scala 82:18 CorrelationFSMDoubleSync.scala 13:25]
    node _GEN_18 = mux(_T_11, _GEN_16, UInt<1>("h0")) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 30:15]
    node _GEN_19 = mux(_T_11, _GEN_17, stateReg) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 13:25]
    node _GEN_20 = mux(_T_7, _GEN_14, computingStageReg) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 16:34]
    node _GEN_21 = mux(_T_7, _GEN_15, _GEN_19) @[Conditional.scala 39:67]
    node _GEN_22 = mux(_T_7, UInt<1>("h0"), _GEN_18) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 30:15]
    node _GEN_23 = mux(_T_3, _GEN_9, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 28:11]
    node _GEN_24 = mux(_T_3, _GEN_10, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 29:11]
    node _GEN_25 = mux(_T_3, UInt<2>("h2"), _GEN_21) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 62:16]
    node _GEN_26 = mux(_T_3, computingStageReg, _GEN_20) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 16:34]
    node _GEN_27 = mux(_T_3, UInt<1>("h0"), _GEN_22) @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 30:15]
    node _GEN_28 = mux(_T_2, _GEN_0, x0Reg) @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 18:22]
    node _GEN_29 = mux(_T_2, _GEN_1, x1Reg) @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 19:22]
    node _GEN_30 = mux(_T_2, _GEN_2, x2Reg) @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 20:22]
    node _GEN_31 = mux(_T_2, _GEN_3, _GEN_25) @[Conditional.scala 40:58]
    node _GEN_32 = mux(_T_2, _GEN_4, _GEN_26) @[Conditional.scala 40:58]
    node _GEN_33 = mux(_T_2, asSInt(UInt<1>("h0")), _GEN_23) @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 28:11]
    node _GEN_34 = mux(_T_2, asSInt(UInt<1>("h0")), _GEN_24) @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 29:11]
    node _GEN_35 = mux(_T_2, UInt<1>("h0"), _GEN_27) @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 30:15]
    io_in_ready <= _T @[CorrelationFSMDoubleSync.scala 33:15]
    io_out_valid <= _T_1 @[CorrelationFSMDoubleSync.scala 34:16]
    io_out_bits <= pe.io_out @[CorrelationFSMDoubleSync.scala 31:15]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_31) @[CorrelationFSMDoubleSync.scala 13:25 CorrelationFSMDoubleSync.scala 13:25]
    computingStageReg <= mux(reset, UInt<2>("h0"), _GEN_32) @[CorrelationFSMDoubleSync.scala 16:34 CorrelationFSMDoubleSync.scala 16:34]
    x0Reg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_28) @[CorrelationFSMDoubleSync.scala 18:22 CorrelationFSMDoubleSync.scala 18:22]
    x1Reg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_29) @[CorrelationFSMDoubleSync.scala 19:22 CorrelationFSMDoubleSync.scala 19:22]
    x2Reg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_30) @[CorrelationFSMDoubleSync.scala 20:22 CorrelationFSMDoubleSync.scala 20:22]
    w0Reg <= mux(reset, asSInt(UInt<2>("h1")), w0Reg) @[CorrelationFSMDoubleSync.scala 22:22 CorrelationFSMDoubleSync.scala 22:22 CorrelationFSMDoubleSync.scala 22:22]
    w1Reg <= mux(reset, asSInt(UInt<3>("h2")), w1Reg) @[CorrelationFSMDoubleSync.scala 23:22 CorrelationFSMDoubleSync.scala 23:22 CorrelationFSMDoubleSync.scala 23:22]
    w2Reg <= mux(reset, asSInt(UInt<3>("h3")), w2Reg) @[CorrelationFSMDoubleSync.scala 24:22 CorrelationFSMDoubleSync.scala 24:22 CorrelationFSMDoubleSync.scala 24:22]
    pe.clock <= clock
    pe.reset <= reset
    pe.io_x <= _GEN_33
    pe.io_y <= _GEN_34
    pe.io_reset <= _GEN_35
