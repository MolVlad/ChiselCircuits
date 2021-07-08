circuit DotProductDecoupled :
  module FastDecoupledMultiplyAndAccumulate :
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

    reg accReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), accReg) @[DotProductDecoupled.scala 135:23]
    node _T = mul(io_in_bits_x, io_in_bits_y) @[DotProductDecoupled.scala 145:39]
    node _T_1 = add(accReg, _T) @[DotProductDecoupled.scala 145:24]
    node _T_2 = tail(_T_1, 1) @[DotProductDecoupled.scala 145:24]
    node _T_3 = asSInt(_T_2) @[DotProductDecoupled.scala 145:24]
    node _GEN_0 = mux(io_in_bits_reset, asSInt(UInt<1>("h0")), _T_3) @[DotProductDecoupled.scala 142:29 DotProductDecoupled.scala 143:14 DotProductDecoupled.scala 145:14]
    node _GEN_1 = mux(io_in_valid, _GEN_0, accReg) @[DotProductDecoupled.scala 141:21 DotProductDecoupled.scala 135:23]
    io_in_ready <= UInt<1>("h1") @[DotProductDecoupled.scala 138:15]
    io_out_valid <= UInt<1>("h1") @[DotProductDecoupled.scala 139:16]
    io_out_bits <= accReg @[DotProductDecoupled.scala 137:15]
    accReg <= mux(reset, asSInt(UInt<32>("h0")), asSInt(bits(_GEN_1, 31, 0))) @[DotProductDecoupled.scala 135:23 DotProductDecoupled.scala 135:23]

  module DotProductDecoupled :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits_x_0 : SInt<32>
    input io_in_bits_x_1 : SInt<32>
    input io_in_bits_x_2 : SInt<32>
    input io_in_bits_x_3 : SInt<32>
    input io_in_bits_y_0 : SInt<32>
    input io_in_bits_y_1 : SInt<32>
    input io_in_bits_y_2 : SInt<32>
    input io_in_bits_y_3 : SInt<32>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<32>

    inst pe of FastDecoupledMultiplyAndAccumulate @[DotProductDecoupled.scala 22:18]
    reg xRegs_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xRegs_0) @[DotProductDecoupled.scala 15:22]
    reg xRegs_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xRegs_1) @[DotProductDecoupled.scala 15:22]
    reg xRegs_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xRegs_2) @[DotProductDecoupled.scala 15:22]
    reg xRegs_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xRegs_3) @[DotProductDecoupled.scala 15:22]
    reg yRegs_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yRegs_0) @[DotProductDecoupled.scala 16:22]
    reg yRegs_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yRegs_1) @[DotProductDecoupled.scala 16:22]
    reg yRegs_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yRegs_2) @[DotProductDecoupled.scala 16:22]
    reg yRegs_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yRegs_3) @[DotProductDecoupled.scala 16:22]
    reg stateReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[DotProductDecoupled.scala 19:25]
    reg cntReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[DotProductDecoupled.scala 20:23]
    node _T = eq(stateReg, UInt<3>("h1")) @[DotProductDecoupled.scala 28:31]
    node _T_1 = eq(stateReg, UInt<3>("h4")) @[DotProductDecoupled.scala 28:57]
    node _T_2 = or(_T, _T_1) @[DotProductDecoupled.scala 28:44]
    node _T_3 = eq(stateReg, UInt<3>("h2")) @[DotProductDecoupled.scala 29:31]
    node _T_4 = eq(stateReg, UInt<3>("h0")) @[DotProductDecoupled.scala 32:27]
    node _T_5 = eq(stateReg, UInt<3>("h3")) @[DotProductDecoupled.scala 33:28]
    node _T_6 = eq(UInt<3>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits_x_0, xRegs_0) @[DotProductDecoupled.scala 37:25 DotProductDecoupled.scala 39:20 DotProductDecoupled.scala 15:22]
    node _GEN_1 = mux(io_in_valid, io_in_bits_x_1, xRegs_1) @[DotProductDecoupled.scala 37:25 DotProductDecoupled.scala 39:20 DotProductDecoupled.scala 15:22]
    node _GEN_2 = mux(io_in_valid, io_in_bits_x_2, xRegs_2) @[DotProductDecoupled.scala 37:25 DotProductDecoupled.scala 39:20 DotProductDecoupled.scala 15:22]
    node _GEN_3 = mux(io_in_valid, io_in_bits_x_3, xRegs_3) @[DotProductDecoupled.scala 37:25 DotProductDecoupled.scala 39:20 DotProductDecoupled.scala 15:22]
    node _GEN_4 = mux(io_in_valid, io_in_bits_y_0, yRegs_0) @[DotProductDecoupled.scala 37:25 DotProductDecoupled.scala 42:20 DotProductDecoupled.scala 16:22]
    node _GEN_5 = mux(io_in_valid, io_in_bits_y_1, yRegs_1) @[DotProductDecoupled.scala 37:25 DotProductDecoupled.scala 42:20 DotProductDecoupled.scala 16:22]
    node _GEN_6 = mux(io_in_valid, io_in_bits_y_2, yRegs_2) @[DotProductDecoupled.scala 37:25 DotProductDecoupled.scala 42:20 DotProductDecoupled.scala 16:22]
    node _GEN_7 = mux(io_in_valid, io_in_bits_y_3, yRegs_3) @[DotProductDecoupled.scala 37:25 DotProductDecoupled.scala 42:20 DotProductDecoupled.scala 16:22]
    node _GEN_8 = mux(io_in_valid, UInt<1>("h0"), cntReg) @[DotProductDecoupled.scala 37:25 DotProductDecoupled.scala 44:16 DotProductDecoupled.scala 20:23]
    node _GEN_9 = mux(io_in_valid, UInt<3>("h1"), stateReg) @[DotProductDecoupled.scala 37:25 DotProductDecoupled.scala 45:18 DotProductDecoupled.scala 19:25]
    node _T_7 = eq(UInt<3>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_8 = bits(cntReg, 1, 0)
    node _GEN_10 = validif(eq(UInt<1>("h0"), _T_8), xRegs_0) @[DotProductDecoupled.scala 51:25 DotProductDecoupled.scala 51:25]
    node _GEN_11 = mux(eq(UInt<1>("h1"), _T_8), xRegs_1, _GEN_10) @[DotProductDecoupled.scala 51:25 DotProductDecoupled.scala 51:25]
    node _GEN_12 = mux(eq(UInt<2>("h2"), _T_8), xRegs_2, _GEN_11) @[DotProductDecoupled.scala 51:25 DotProductDecoupled.scala 51:25]
    node _GEN_13 = mux(eq(UInt<2>("h3"), _T_8), xRegs_3, _GEN_12) @[DotProductDecoupled.scala 51:25 DotProductDecoupled.scala 51:25]
    node _T_9 = bits(cntReg, 1, 0)
    node _GEN_14 = validif(eq(UInt<1>("h0"), _T_9), yRegs_0) @[DotProductDecoupled.scala 52:25 DotProductDecoupled.scala 52:25]
    node _GEN_15 = mux(eq(UInt<1>("h1"), _T_9), yRegs_1, _GEN_14) @[DotProductDecoupled.scala 52:25 DotProductDecoupled.scala 52:25]
    node _GEN_16 = mux(eq(UInt<2>("h2"), _T_9), yRegs_2, _GEN_15) @[DotProductDecoupled.scala 52:25 DotProductDecoupled.scala 52:25]
    node _GEN_17 = mux(eq(UInt<2>("h3"), _T_9), yRegs_3, _GEN_16) @[DotProductDecoupled.scala 52:25 DotProductDecoupled.scala 52:25]
    node _xRegs_T_8 = _GEN_13 @[DotProductDecoupled.scala 51:25]
    node _GEN_18 = mux(pe.io_in_ready, _xRegs_T_8, asSInt(UInt<1>("h0"))) @[DotProductDecoupled.scala 50:7 DotProductDecoupled.scala 51:25 DotProductDecoupled.scala 25:19]
    node _yRegs_T_9 = _GEN_17 @[DotProductDecoupled.scala 52:25]
    node _GEN_19 = mux(pe.io_in_ready, _yRegs_T_9, asSInt(UInt<1>("h0"))) @[DotProductDecoupled.scala 50:7 DotProductDecoupled.scala 52:25 DotProductDecoupled.scala 26:19]
    node _GEN_20 = mux(pe.io_in_ready, UInt<3>("h2"), stateReg) @[DotProductDecoupled.scala 50:7 DotProductDecoupled.scala 54:18 DotProductDecoupled.scala 19:25]
    node _T_10 = eq(UInt<3>("h2"), stateReg) @[Conditional.scala 37:30]
    node _T_11 = add(cntReg, UInt<1>("h1")) @[DotProductDecoupled.scala 59:26]
    node _T_12 = tail(_T_11, 1) @[DotProductDecoupled.scala 59:26]
    node _T_13 = eq(cntReg, UInt<2>("h3")) @[DotProductDecoupled.scala 61:21]
    node _GEN_21 = mux(_T_13, UInt<3>("h3"), UInt<3>("h1")) @[DotProductDecoupled.scala 61:34 DotProductDecoupled.scala 62:20 DotProductDecoupled.scala 64:20]
    node _GEN_22 = mux(pe.io_out_valid, _T_12, cntReg) @[DotProductDecoupled.scala 58:29 DotProductDecoupled.scala 59:16 DotProductDecoupled.scala 20:23]
    node _GEN_23 = mux(pe.io_out_valid, _GEN_21, stateReg) @[DotProductDecoupled.scala 58:29 DotProductDecoupled.scala 19:25]
    node _T_14 = eq(UInt<3>("h3"), stateReg) @[Conditional.scala 37:30]
    node _GEN_24 = mux(io_out_ready, UInt<3>("h4"), stateReg) @[DotProductDecoupled.scala 69:26 DotProductDecoupled.scala 70:18 DotProductDecoupled.scala 19:25]
    node _T_15 = eq(UInt<3>("h4"), stateReg) @[Conditional.scala 37:30]
    node _GEN_25 = mux(pe.io_in_ready, UInt<1>("h1"), UInt<1>("h0")) @[DotProductDecoupled.scala 74:28 DotProductDecoupled.scala 75:29 DotProductDecoupled.scala 27:23]
    node _GEN_26 = mux(pe.io_in_ready, UInt<3>("h0"), stateReg) @[DotProductDecoupled.scala 74:28 DotProductDecoupled.scala 76:18 DotProductDecoupled.scala 19:25]
    node _GEN_27 = mux(_T_15, _GEN_25, UInt<1>("h0")) @[Conditional.scala 39:67 DotProductDecoupled.scala 27:23]
    node _GEN_28 = mux(_T_15, _GEN_26, stateReg) @[Conditional.scala 39:67 DotProductDecoupled.scala 19:25]
    node _GEN_29 = mux(_T_14, _GEN_24, _GEN_28) @[Conditional.scala 39:67]
    node _GEN_30 = mux(_T_14, UInt<1>("h0"), _GEN_27) @[Conditional.scala 39:67 DotProductDecoupled.scala 27:23]
    node _GEN_31 = mux(_T_10, _GEN_22, cntReg) @[Conditional.scala 39:67 DotProductDecoupled.scala 20:23]
    node _GEN_32 = mux(_T_10, _GEN_23, _GEN_29) @[Conditional.scala 39:67]
    node _GEN_33 = mux(_T_10, UInt<1>("h0"), _GEN_30) @[Conditional.scala 39:67 DotProductDecoupled.scala 27:23]
    node _GEN_34 = mux(_T_7, _GEN_18, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 DotProductDecoupled.scala 25:19]
    node _GEN_35 = mux(_T_7, _GEN_19, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 DotProductDecoupled.scala 26:19]
    node _GEN_36 = mux(_T_7, _GEN_20, _GEN_32) @[Conditional.scala 39:67]
    node _GEN_37 = mux(_T_7, cntReg, _GEN_31) @[Conditional.scala 39:67 DotProductDecoupled.scala 20:23]
    node _GEN_38 = mux(_T_7, UInt<1>("h0"), _GEN_33) @[Conditional.scala 39:67 DotProductDecoupled.scala 27:23]
    node _GEN_39 = mux(_T_6, _GEN_0, xRegs_0) @[Conditional.scala 40:58 DotProductDecoupled.scala 15:22]
    node _GEN_40 = mux(_T_6, _GEN_1, xRegs_1) @[Conditional.scala 40:58 DotProductDecoupled.scala 15:22]
    node _GEN_41 = mux(_T_6, _GEN_2, xRegs_2) @[Conditional.scala 40:58 DotProductDecoupled.scala 15:22]
    node _GEN_42 = mux(_T_6, _GEN_3, xRegs_3) @[Conditional.scala 40:58 DotProductDecoupled.scala 15:22]
    node _GEN_43 = mux(_T_6, _GEN_4, yRegs_0) @[Conditional.scala 40:58 DotProductDecoupled.scala 16:22]
    node _GEN_44 = mux(_T_6, _GEN_5, yRegs_1) @[Conditional.scala 40:58 DotProductDecoupled.scala 16:22]
    node _GEN_45 = mux(_T_6, _GEN_6, yRegs_2) @[Conditional.scala 40:58 DotProductDecoupled.scala 16:22]
    node _GEN_46 = mux(_T_6, _GEN_7, yRegs_3) @[Conditional.scala 40:58 DotProductDecoupled.scala 16:22]
    node _GEN_47 = mux(_T_6, _GEN_8, _GEN_37) @[Conditional.scala 40:58]
    node _GEN_48 = mux(_T_6, _GEN_9, _GEN_36) @[Conditional.scala 40:58]
    node _GEN_49 = mux(_T_6, asSInt(UInt<1>("h0")), _GEN_34) @[Conditional.scala 40:58 DotProductDecoupled.scala 25:19]
    node _GEN_50 = mux(_T_6, asSInt(UInt<1>("h0")), _GEN_35) @[Conditional.scala 40:58 DotProductDecoupled.scala 26:19]
    node _GEN_51 = mux(_T_6, UInt<1>("h0"), _GEN_38) @[Conditional.scala 40:58 DotProductDecoupled.scala 27:23]
    node _WIRE__0 = asSInt(UInt<32>("h0")) @[DotProductDecoupled.scala 15:30 DotProductDecoupled.scala 15:30]
    node _WIRE__1 = asSInt(UInt<32>("h0")) @[DotProductDecoupled.scala 15:30 DotProductDecoupled.scala 15:30]
    node _WIRE__2 = asSInt(UInt<32>("h0")) @[DotProductDecoupled.scala 15:30 DotProductDecoupled.scala 15:30]
    node _WIRE__3 = asSInt(UInt<32>("h0")) @[DotProductDecoupled.scala 15:30 DotProductDecoupled.scala 15:30]
    node _WIRE_1_0 = asSInt(UInt<32>("h0")) @[DotProductDecoupled.scala 16:30 DotProductDecoupled.scala 16:30]
    node _WIRE_1_1 = asSInt(UInt<32>("h0")) @[DotProductDecoupled.scala 16:30 DotProductDecoupled.scala 16:30]
    node _WIRE_1_2 = asSInt(UInt<32>("h0")) @[DotProductDecoupled.scala 16:30 DotProductDecoupled.scala 16:30]
    node _WIRE_1_3 = asSInt(UInt<32>("h0")) @[DotProductDecoupled.scala 16:30 DotProductDecoupled.scala 16:30]
    io_in_ready <= _T_4 @[DotProductDecoupled.scala 32:15]
    io_out_valid <= _T_5 @[DotProductDecoupled.scala 33:16]
    io_out_bits <= pe.io_out_bits @[DotProductDecoupled.scala 31:15]
    xRegs_0 <= mux(reset, _WIRE__0, _GEN_39) @[DotProductDecoupled.scala 15:22 DotProductDecoupled.scala 15:22]
    xRegs_1 <= mux(reset, _WIRE__1, _GEN_40) @[DotProductDecoupled.scala 15:22 DotProductDecoupled.scala 15:22]
    xRegs_2 <= mux(reset, _WIRE__2, _GEN_41) @[DotProductDecoupled.scala 15:22 DotProductDecoupled.scala 15:22]
    xRegs_3 <= mux(reset, _WIRE__3, _GEN_42) @[DotProductDecoupled.scala 15:22 DotProductDecoupled.scala 15:22]
    yRegs_0 <= mux(reset, _WIRE_1_0, _GEN_43) @[DotProductDecoupled.scala 16:22 DotProductDecoupled.scala 16:22]
    yRegs_1 <= mux(reset, _WIRE_1_1, _GEN_44) @[DotProductDecoupled.scala 16:22 DotProductDecoupled.scala 16:22]
    yRegs_2 <= mux(reset, _WIRE_1_2, _GEN_45) @[DotProductDecoupled.scala 16:22 DotProductDecoupled.scala 16:22]
    yRegs_3 <= mux(reset, _WIRE_1_3, _GEN_46) @[DotProductDecoupled.scala 16:22 DotProductDecoupled.scala 16:22]
    stateReg <= mux(reset, UInt<3>("h0"), _GEN_48) @[DotProductDecoupled.scala 19:25 DotProductDecoupled.scala 19:25]
    cntReg <= mux(reset, UInt<3>("h0"), _GEN_47) @[DotProductDecoupled.scala 20:23 DotProductDecoupled.scala 20:23]
    pe.clock <= clock
    pe.reset <= reset
    pe.io_in_valid <= _T_2 @[DotProductDecoupled.scala 28:18]
    pe.io_in_bits_x <= _GEN_49
    pe.io_in_bits_y <= _GEN_50
    pe.io_in_bits_reset <= _GEN_51
    pe.io_out_ready <= _T_3 @[DotProductDecoupled.scala 29:19]
