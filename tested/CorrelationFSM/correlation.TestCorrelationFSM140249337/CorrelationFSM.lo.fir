circuit CorrelationFSM :
  module MultiplyAndAccumulate :
    input clock : Clock
    input reset : UInt<1>
    input io_x : SInt<32>
    input io_y : SInt<32>
    input io_reset : UInt<1>
    output io_out : SInt<32>

    reg accReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), accReg) @[CorrelationFSM.scala 83:23]
    node _T = mul(io_x, io_y) @[CorrelationFSM.scala 89:29]
    node _T_1 = add(accReg, _T) @[CorrelationFSM.scala 89:22]
    node _T_2 = tail(_T_1, 1) @[CorrelationFSM.scala 89:22]
    node _T_3 = asSInt(_T_2) @[CorrelationFSM.scala 89:22]
    node _GEN_0 = mux(io_reset, asSInt(UInt<1>("h0")), _T_3) @[CorrelationFSM.scala 86:19 CorrelationFSM.scala 87:12 CorrelationFSM.scala 89:12]
    io_out <= accReg @[CorrelationFSM.scala 84:10]
    accReg <= mux(reset, asSInt(UInt<32>("h0")), asSInt(bits(_GEN_0, 31, 0))) @[CorrelationFSM.scala 83:23 CorrelationFSM.scala 83:23]

  module CorrelationFSM :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits : SInt<32>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<32>

    inst pe of MultiplyAndAccumulate @[CorrelationFSM.scala 27:18]
    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[CorrelationFSM.scala 14:25]
    reg computingStageReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), computingStageReg) @[CorrelationFSM.scala 17:34]
    reg x0Reg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), x0Reg) @[CorrelationFSM.scala 19:22]
    reg x1Reg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), x1Reg) @[CorrelationFSM.scala 20:22]
    reg x2Reg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), x2Reg) @[CorrelationFSM.scala 21:22]
    reg w0Reg : SInt<2>, clock with :
      reset => (UInt<1>("h0"), w0Reg) @[CorrelationFSM.scala 23:22]
    reg w1Reg : SInt<3>, clock with :
      reset => (UInt<1>("h0"), w1Reg) @[CorrelationFSM.scala 24:22]
    reg w2Reg : SInt<3>, clock with :
      reset => (UInt<1>("h0"), w2Reg) @[CorrelationFSM.scala 25:22]
    node _T = eq(stateReg, UInt<2>("h0")) @[CorrelationFSM.scala 34:27]
    node _T_1 = eq(stateReg, UInt<2>("h2")) @[CorrelationFSM.scala 35:28]
    node _T_2 = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, x1Reg, x0Reg) @[CorrelationFSM.scala 39:25 CorrelationFSM.scala 40:15 CorrelationFSM.scala 19:22]
    node _GEN_1 = mux(io_in_valid, x2Reg, x1Reg) @[CorrelationFSM.scala 39:25 CorrelationFSM.scala 41:15 CorrelationFSM.scala 20:22]
    node _GEN_2 = mux(io_in_valid, io_in_bits, x2Reg) @[CorrelationFSM.scala 39:25 CorrelationFSM.scala 42:15 CorrelationFSM.scala 21:22]
    node _GEN_3 = mux(io_in_valid, UInt<2>("h1"), stateReg) @[CorrelationFSM.scala 39:25 CorrelationFSM.scala 43:18 CorrelationFSM.scala 14:25]
    node _GEN_4 = mux(io_in_valid, UInt<2>("h0"), computingStageReg) @[CorrelationFSM.scala 39:25 CorrelationFSM.scala 44:27 CorrelationFSM.scala 17:34]
    node _T_3 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<2>("h0"), computingStageReg) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<2>("h1"), computingStageReg) @[Conditional.scala 37:30]
    node _T_6 = eq(UInt<2>("h2"), computingStageReg) @[Conditional.scala 37:30]
    node _GEN_5 = mux(_T_6, x2Reg, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 CorrelationFSM.scala 60:19 CorrelationFSM.scala 29:11]
    node _GEN_6 = mux(_T_6, w2Reg, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 CorrelationFSM.scala 61:19 CorrelationFSM.scala 30:11]
    node _GEN_7 = mux(_T_6, UInt<2>("h2"), stateReg) @[Conditional.scala 39:67 CorrelationFSM.scala 62:20 CorrelationFSM.scala 14:25]
    node _GEN_8 = mux(_T_5, x1Reg, _GEN_5) @[Conditional.scala 39:67 CorrelationFSM.scala 55:19]
    node _GEN_9 = mux(_T_5, w1Reg, _GEN_6) @[Conditional.scala 39:67 CorrelationFSM.scala 56:19]
    node _GEN_10 = mux(_T_5, UInt<2>("h2"), computingStageReg) @[Conditional.scala 39:67 CorrelationFSM.scala 57:29 CorrelationFSM.scala 17:34]
    node _GEN_11 = mux(_T_5, stateReg, _GEN_7) @[Conditional.scala 39:67 CorrelationFSM.scala 14:25]
    node _GEN_12 = mux(_T_4, x0Reg, _GEN_8) @[Conditional.scala 40:58 CorrelationFSM.scala 50:19]
    node _GEN_13 = mux(_T_4, w0Reg, _GEN_9) @[Conditional.scala 40:58 CorrelationFSM.scala 51:19]
    node _GEN_14 = mux(_T_4, UInt<2>("h1"), _GEN_10) @[Conditional.scala 40:58 CorrelationFSM.scala 52:29]
    node _GEN_15 = mux(_T_4, stateReg, _GEN_11) @[Conditional.scala 40:58 CorrelationFSM.scala 14:25]
    node _T_7 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _GEN_16 = mux(io_out_ready, UInt<1>("h1"), UInt<1>("h0")) @[CorrelationFSM.scala 67:26 CorrelationFSM.scala 68:21 CorrelationFSM.scala 31:15]
    node _GEN_17 = mux(io_out_ready, UInt<2>("h0"), stateReg) @[CorrelationFSM.scala 67:26 CorrelationFSM.scala 69:18 CorrelationFSM.scala 14:25]
    node _GEN_18 = mux(_T_7, _GEN_16, UInt<1>("h0")) @[Conditional.scala 39:67 CorrelationFSM.scala 31:15]
    node _GEN_19 = mux(_T_7, _GEN_17, stateReg) @[Conditional.scala 39:67 CorrelationFSM.scala 14:25]
    node _GEN_20 = mux(_T_3, _GEN_12, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 CorrelationFSM.scala 29:11]
    node _GEN_21 = mux(_T_3, _GEN_13, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 CorrelationFSM.scala 30:11]
    node _GEN_22 = mux(_T_3, _GEN_14, computingStageReg) @[Conditional.scala 39:67 CorrelationFSM.scala 17:34]
    node _GEN_23 = mux(_T_3, _GEN_15, _GEN_19) @[Conditional.scala 39:67]
    node _GEN_24 = mux(_T_3, UInt<1>("h0"), _GEN_18) @[Conditional.scala 39:67 CorrelationFSM.scala 31:15]
    node _GEN_25 = mux(_T_2, _GEN_0, x0Reg) @[Conditional.scala 40:58 CorrelationFSM.scala 19:22]
    node _GEN_26 = mux(_T_2, _GEN_1, x1Reg) @[Conditional.scala 40:58 CorrelationFSM.scala 20:22]
    node _GEN_27 = mux(_T_2, _GEN_2, x2Reg) @[Conditional.scala 40:58 CorrelationFSM.scala 21:22]
    node _GEN_28 = mux(_T_2, _GEN_3, _GEN_23) @[Conditional.scala 40:58]
    node _GEN_29 = mux(_T_2, _GEN_4, _GEN_22) @[Conditional.scala 40:58]
    node _GEN_30 = mux(_T_2, asSInt(UInt<1>("h0")), _GEN_20) @[Conditional.scala 40:58 CorrelationFSM.scala 29:11]
    node _GEN_31 = mux(_T_2, asSInt(UInt<1>("h0")), _GEN_21) @[Conditional.scala 40:58 CorrelationFSM.scala 30:11]
    node _GEN_32 = mux(_T_2, UInt<1>("h0"), _GEN_24) @[Conditional.scala 40:58 CorrelationFSM.scala 31:15]
    io_in_ready <= _T @[CorrelationFSM.scala 34:15]
    io_out_valid <= _T_1 @[CorrelationFSM.scala 35:16]
    io_out_bits <= pe.io_out @[CorrelationFSM.scala 32:15]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_28) @[CorrelationFSM.scala 14:25 CorrelationFSM.scala 14:25]
    computingStageReg <= mux(reset, UInt<2>("h0"), _GEN_29) @[CorrelationFSM.scala 17:34 CorrelationFSM.scala 17:34]
    x0Reg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_25) @[CorrelationFSM.scala 19:22 CorrelationFSM.scala 19:22]
    x1Reg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_26) @[CorrelationFSM.scala 20:22 CorrelationFSM.scala 20:22]
    x2Reg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_27) @[CorrelationFSM.scala 21:22 CorrelationFSM.scala 21:22]
    w0Reg <= mux(reset, asSInt(UInt<2>("h1")), w0Reg) @[CorrelationFSM.scala 23:22 CorrelationFSM.scala 23:22 CorrelationFSM.scala 23:22]
    w1Reg <= mux(reset, asSInt(UInt<3>("h2")), w1Reg) @[CorrelationFSM.scala 24:22 CorrelationFSM.scala 24:22 CorrelationFSM.scala 24:22]
    w2Reg <= mux(reset, asSInt(UInt<3>("h3")), w2Reg) @[CorrelationFSM.scala 25:22 CorrelationFSM.scala 25:22 CorrelationFSM.scala 25:22]
    pe.clock <= clock
    pe.reset <= reset
    pe.io_x <= _GEN_30
    pe.io_y <= _GEN_31
    pe.io_reset <= _GEN_32
