circuit CorrelationSystolicDecoupled :
  module DecoupledPE :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits_x : SInt<32>
    input io_in_bits_w : SInt<32>
    input io_in_bits_prev : SInt<32>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<32>

    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[CorrelationSystolicDecoupled.scala 82:25]
    reg xReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xReg) @[CorrelationSystolicDecoupled.scala 83:21]
    reg wReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), wReg) @[CorrelationSystolicDecoupled.scala 84:21]
    reg prevReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), prevReg) @[CorrelationSystolicDecoupled.scala 85:24]
    reg accReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), accReg) @[CorrelationSystolicDecoupled.scala 86:23]
    reg resReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), resReg) @[CorrelationSystolicDecoupled.scala 87:23]
    node _T = eq(stateReg, UInt<2>("h0")) @[CorrelationSystolicDecoupled.scala 90:27]
    node _T_1 = eq(stateReg, UInt<2>("h2")) @[CorrelationSystolicDecoupled.scala 91:28]
    node _T_2 = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits_x, xReg) @[CorrelationSystolicDecoupled.scala 95:25 CorrelationSystolicDecoupled.scala 96:14 CorrelationSystolicDecoupled.scala 83:21]
    node _GEN_1 = mux(io_in_valid, io_in_bits_w, wReg) @[CorrelationSystolicDecoupled.scala 95:25 CorrelationSystolicDecoupled.scala 97:14 CorrelationSystolicDecoupled.scala 84:21]
    node _GEN_2 = mux(io_in_valid, io_in_bits_prev, prevReg) @[CorrelationSystolicDecoupled.scala 95:25 CorrelationSystolicDecoupled.scala 98:17 CorrelationSystolicDecoupled.scala 85:24]
    node _GEN_3 = mux(io_in_valid, UInt<2>("h1"), stateReg) @[CorrelationSystolicDecoupled.scala 95:25 CorrelationSystolicDecoupled.scala 100:18 CorrelationSystolicDecoupled.scala 82:25]
    node _T_3 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_4 = mul(xReg, wReg) @[CorrelationSystolicDecoupled.scala 106:31]
    node _T_5 = add(accReg, _T_4) @[CorrelationSystolicDecoupled.scala 106:24]
    node _T_6 = tail(_T_5, 1) @[CorrelationSystolicDecoupled.scala 106:24]
    node _T_7 = asSInt(_T_6) @[CorrelationSystolicDecoupled.scala 106:24]
    node _T_8 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _GEN_4 = mux(io_out_ready, UInt<2>("h0"), stateReg) @[CorrelationSystolicDecoupled.scala 109:26 CorrelationSystolicDecoupled.scala 110:18 CorrelationSystolicDecoupled.scala 82:25]
    node _GEN_5 = mux(_T_8, _GEN_4, stateReg) @[Conditional.scala 39:67 CorrelationSystolicDecoupled.scala 82:25]
    node _GEN_6 = mux(_T_3, UInt<2>("h2"), _GEN_5) @[Conditional.scala 39:67 CorrelationSystolicDecoupled.scala 104:16]
    node _GEN_7 = mux(_T_3, prevReg, accReg) @[Conditional.scala 39:67 CorrelationSystolicDecoupled.scala 105:14 CorrelationSystolicDecoupled.scala 86:23]
    node _GEN_8 = mux(_T_3, _T_7, resReg) @[Conditional.scala 39:67 CorrelationSystolicDecoupled.scala 106:14 CorrelationSystolicDecoupled.scala 87:23]
    node _GEN_9 = mux(_T_2, _GEN_0, xReg) @[Conditional.scala 40:58 CorrelationSystolicDecoupled.scala 83:21]
    node _GEN_10 = mux(_T_2, _GEN_1, wReg) @[Conditional.scala 40:58 CorrelationSystolicDecoupled.scala 84:21]
    node _GEN_11 = mux(_T_2, _GEN_2, prevReg) @[Conditional.scala 40:58 CorrelationSystolicDecoupled.scala 85:24]
    node _GEN_12 = mux(_T_2, _GEN_3, _GEN_6) @[Conditional.scala 40:58]
    node _GEN_13 = mux(_T_2, accReg, _GEN_7) @[Conditional.scala 40:58 CorrelationSystolicDecoupled.scala 86:23]
    node _GEN_14 = mux(_T_2, resReg, _GEN_8) @[Conditional.scala 40:58 CorrelationSystolicDecoupled.scala 87:23]
    io_in_ready <= _T @[CorrelationSystolicDecoupled.scala 90:15]
    io_out_valid <= _T_1 @[CorrelationSystolicDecoupled.scala 91:16]
    io_out_bits <= resReg @[CorrelationSystolicDecoupled.scala 89:15]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_12) @[CorrelationSystolicDecoupled.scala 82:25 CorrelationSystolicDecoupled.scala 82:25]
    xReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_9) @[CorrelationSystolicDecoupled.scala 83:21 CorrelationSystolicDecoupled.scala 83:21]
    wReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_10) @[CorrelationSystolicDecoupled.scala 84:21 CorrelationSystolicDecoupled.scala 84:21]
    prevReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_11) @[CorrelationSystolicDecoupled.scala 85:24 CorrelationSystolicDecoupled.scala 85:24]
    accReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_13) @[CorrelationSystolicDecoupled.scala 86:23 CorrelationSystolicDecoupled.scala 86:23]
    resReg <= mux(reset, asSInt(UInt<32>("h0")), asSInt(bits(_GEN_14, 31, 0))) @[CorrelationSystolicDecoupled.scala 87:23 CorrelationSystolicDecoupled.scala 87:23]

  module CorrelationSystolicDecoupled :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits : SInt<32>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<32>

    inst pe0 of DecoupledPE @[CorrelationSystolicDecoupled.scala 20:19]
    inst pe1 of DecoupledPE @[CorrelationSystolicDecoupled.scala 21:19]
    inst pe2 of DecoupledPE @[CorrelationSystolicDecoupled.scala 22:19]
    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[CorrelationSystolicDecoupled.scala 13:25]
    reg resReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), resReg) @[CorrelationSystolicDecoupled.scala 15:23]
    node _T = eq(stateReg, UInt<2>("h0")) @[CorrelationSystolicDecoupled.scala 17:27]
    node _T_1 = eq(stateReg, UInt<2>("h3")) @[CorrelationSystolicDecoupled.scala 18:28]
    reg xReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xReg) @[CorrelationSystolicDecoupled.scala 32:21]
    node _T_2 = eq(stateReg, UInt<2>("h1")) @[CorrelationSystolicDecoupled.scala 37:31]
    node _T_3 = eq(stateReg, UInt<2>("h2")) @[CorrelationSystolicDecoupled.scala 43:32]
    node _T_4 = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits, xReg) @[CorrelationSystolicDecoupled.scala 47:25 CorrelationSystolicDecoupled.scala 48:14 CorrelationSystolicDecoupled.scala 32:21]
    node _GEN_1 = mux(io_in_valid, UInt<2>("h1"), stateReg) @[CorrelationSystolicDecoupled.scala 47:25 CorrelationSystolicDecoupled.scala 49:18 CorrelationSystolicDecoupled.scala 13:25]
    node _T_5 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _GEN_2 = mux(pe0.io_in_ready, UInt<2>("h2"), stateReg) @[CorrelationSystolicDecoupled.scala 53:29 CorrelationSystolicDecoupled.scala 54:18 CorrelationSystolicDecoupled.scala 13:25]
    node _T_6 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _GEN_3 = mux(pe2.io_out_valid, pe2.io_out_bits, resReg) @[CorrelationSystolicDecoupled.scala 58:30 CorrelationSystolicDecoupled.scala 59:16 CorrelationSystolicDecoupled.scala 15:23]
    node _GEN_4 = mux(pe2.io_out_valid, UInt<2>("h3"), stateReg) @[CorrelationSystolicDecoupled.scala 58:30 CorrelationSystolicDecoupled.scala 60:18 CorrelationSystolicDecoupled.scala 13:25]
    node _T_7 = eq(UInt<2>("h3"), stateReg) @[Conditional.scala 37:30]
    node _GEN_5 = mux(io_out_ready, UInt<2>("h0"), stateReg) @[CorrelationSystolicDecoupled.scala 64:26 CorrelationSystolicDecoupled.scala 65:18 CorrelationSystolicDecoupled.scala 13:25]
    node _GEN_6 = mux(_T_7, _GEN_5, stateReg) @[Conditional.scala 39:67 CorrelationSystolicDecoupled.scala 13:25]
    node _GEN_7 = mux(_T_6, _GEN_3, resReg) @[Conditional.scala 39:67 CorrelationSystolicDecoupled.scala 15:23]
    node _GEN_8 = mux(_T_6, _GEN_4, _GEN_6) @[Conditional.scala 39:67]
    node _GEN_9 = mux(_T_5, _GEN_2, _GEN_8) @[Conditional.scala 39:67]
    node _GEN_10 = mux(_T_5, resReg, _GEN_7) @[Conditional.scala 39:67 CorrelationSystolicDecoupled.scala 15:23]
    node _GEN_11 = mux(_T_4, _GEN_0, xReg) @[Conditional.scala 40:58 CorrelationSystolicDecoupled.scala 32:21]
    node _GEN_12 = mux(_T_4, _GEN_1, _GEN_9) @[Conditional.scala 40:58]
    node _GEN_13 = mux(_T_4, resReg, _GEN_10) @[Conditional.scala 40:58 CorrelationSystolicDecoupled.scala 15:23]
    io_in_ready <= _T @[CorrelationSystolicDecoupled.scala 17:15]
    io_out_valid <= _T_1 @[CorrelationSystolicDecoupled.scala 18:16]
    io_out_bits <= resReg @[CorrelationSystolicDecoupled.scala 16:15]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_12) @[CorrelationSystolicDecoupled.scala 13:25 CorrelationSystolicDecoupled.scala 13:25]
    resReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_13) @[CorrelationSystolicDecoupled.scala 15:23 CorrelationSystolicDecoupled.scala 15:23]
    pe0.clock <= clock
    pe0.reset <= reset
    pe0.io_in_valid <= _T_2 @[CorrelationSystolicDecoupled.scala 37:19]
    pe0.io_in_bits_x <= xReg @[CorrelationSystolicDecoupled.scala 33:20]
    pe0.io_in_bits_w <= asSInt(UInt<2>("h1")) @[CorrelationSystolicDecoupled.scala 28:20]
    pe0.io_in_bits_prev <= asSInt(UInt<1>("h0")) @[CorrelationSystolicDecoupled.scala 24:23]
    pe0.io_out_ready <= pe1.io_in_ready @[CorrelationSystolicDecoupled.scala 41:20]
    pe1.clock <= clock
    pe1.reset <= reset
    pe1.io_in_valid <= pe0.io_out_valid @[CorrelationSystolicDecoupled.scala 38:19]
    pe1.io_in_bits_x <= xReg @[CorrelationSystolicDecoupled.scala 34:20]
    pe1.io_in_bits_w <= asSInt(UInt<3>("h2")) @[CorrelationSystolicDecoupled.scala 29:20]
    pe1.io_in_bits_prev <= pe0.io_out_bits @[CorrelationSystolicDecoupled.scala 25:23]
    pe1.io_out_ready <= pe2.io_in_ready @[CorrelationSystolicDecoupled.scala 42:20]
    pe2.clock <= clock
    pe2.reset <= reset
    pe2.io_in_valid <= pe1.io_out_valid @[CorrelationSystolicDecoupled.scala 39:19]
    pe2.io_in_bits_x <= xReg @[CorrelationSystolicDecoupled.scala 35:20]
    pe2.io_in_bits_w <= asSInt(UInt<3>("h3")) @[CorrelationSystolicDecoupled.scala 30:20]
    pe2.io_in_bits_prev <= pe1.io_out_bits @[CorrelationSystolicDecoupled.scala 26:23]
    pe2.io_out_ready <= _T_3 @[CorrelationSystolicDecoupled.scala 43:20]
    xReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_11) @[CorrelationSystolicDecoupled.scala 32:21 CorrelationSystolicDecoupled.scala 32:21]
