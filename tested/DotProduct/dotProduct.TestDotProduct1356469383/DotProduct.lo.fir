circuit DotProduct :
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
      reset => (UInt<1>("h0"), stateReg) @[DotProduct.scala 93:25]
    reg xReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xReg) @[DotProduct.scala 94:21]
    reg yReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yReg) @[DotProduct.scala 95:21]
    reg resetReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), resetReg) @[DotProduct.scala 96:25]
    reg accReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), accReg) @[DotProduct.scala 97:23]
    node _T = eq(stateReg, UInt<1>("h0")) @[DotProduct.scala 100:27]
    node _T_1 = eq(stateReg, UInt<1>("h0")) @[DotProduct.scala 101:28]
    node _T_2 = eq(UInt<1>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits_x, xReg) @[DotProduct.scala 105:25 DotProduct.scala 106:14 DotProduct.scala 94:21]
    node _GEN_1 = mux(io_in_valid, io_in_bits_y, yReg) @[DotProduct.scala 105:25 DotProduct.scala 107:14 DotProduct.scala 95:21]
    node _GEN_2 = mux(io_in_valid, io_in_bits_reset, resetReg) @[DotProduct.scala 105:25 DotProduct.scala 108:18 DotProduct.scala 96:25]
    node _GEN_3 = mux(io_in_valid, UInt<1>("h1"), stateReg) @[DotProduct.scala 105:25 DotProduct.scala 110:18 DotProduct.scala 93:25]
    node _T_3 = eq(UInt<1>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_4 = mul(xReg, yReg) @[DotProduct.scala 119:33]
    node _T_5 = add(accReg, _T_4) @[DotProduct.scala 119:26]
    node _T_6 = tail(_T_5, 1) @[DotProduct.scala 119:26]
    node _T_7 = asSInt(_T_6) @[DotProduct.scala 119:26]
    node _GEN_4 = mux(resetReg, asSInt(UInt<1>("h0")), _T_7) @[DotProduct.scala 116:23 DotProduct.scala 117:16 DotProduct.scala 119:16]
    node _GEN_5 = mux(_T_3, UInt<1>("h0"), stateReg) @[Conditional.scala 39:67 DotProduct.scala 114:16 DotProduct.scala 93:25]
    node _GEN_6 = mux(_T_3, _GEN_4, accReg) @[Conditional.scala 39:67 DotProduct.scala 97:23]
    node _GEN_7 = mux(_T_2, _GEN_0, xReg) @[Conditional.scala 40:58 DotProduct.scala 94:21]
    node _GEN_8 = mux(_T_2, _GEN_1, yReg) @[Conditional.scala 40:58 DotProduct.scala 95:21]
    node _GEN_9 = mux(_T_2, _GEN_2, resetReg) @[Conditional.scala 40:58 DotProduct.scala 96:25]
    node _GEN_10 = mux(_T_2, _GEN_3, _GEN_5) @[Conditional.scala 40:58]
    node _GEN_11 = mux(_T_2, accReg, _GEN_6) @[Conditional.scala 40:58 DotProduct.scala 97:23]
    io_in_ready <= _T @[DotProduct.scala 100:15]
    io_out_valid <= _T_1 @[DotProduct.scala 101:16]
    io_out_bits <= accReg @[DotProduct.scala 99:15]
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_10) @[DotProduct.scala 93:25 DotProduct.scala 93:25]
    xReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_7) @[DotProduct.scala 94:21 DotProduct.scala 94:21]
    yReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_8) @[DotProduct.scala 95:21 DotProduct.scala 95:21]
    resetReg <= mux(reset, UInt<1>("h0"), _GEN_9) @[DotProduct.scala 96:25 DotProduct.scala 96:25]
    accReg <= mux(reset, asSInt(UInt<32>("h0")), asSInt(bits(_GEN_11, 31, 0))) @[DotProduct.scala 97:23 DotProduct.scala 97:23]

  module DotProduct :
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

    inst pe of DecoupledMultiplyAndAccumulate @[DotProduct.scala 23:18]
    reg xRegs_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xRegs_0) @[DotProduct.scala 15:22]
    reg xRegs_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xRegs_1) @[DotProduct.scala 15:22]
    reg xRegs_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xRegs_2) @[DotProduct.scala 15:22]
    reg xRegs_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), xRegs_3) @[DotProduct.scala 15:22]
    reg yRegs_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yRegs_0) @[DotProduct.scala 16:22]
    reg yRegs_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yRegs_1) @[DotProduct.scala 16:22]
    reg yRegs_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yRegs_2) @[DotProduct.scala 16:22]
    reg yRegs_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), yRegs_3) @[DotProduct.scala 16:22]
    reg stateReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[DotProduct.scala 19:25]
    reg cntReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[DotProduct.scala 20:23]
    node _T = eq(stateReg, UInt<3>("h1")) @[DotProduct.scala 28:31]
    node _T_1 = eq(stateReg, UInt<3>("h4")) @[DotProduct.scala 28:57]
    node _T_2 = or(_T, _T_1) @[DotProduct.scala 28:44]
    node _T_3 = eq(stateReg, UInt<3>("h2")) @[DotProduct.scala 29:31]
    node _T_4 = eq(stateReg, UInt<3>("h0")) @[DotProduct.scala 32:27]
    node _T_5 = eq(stateReg, UInt<3>("h3")) @[DotProduct.scala 33:28]
    node _T_6 = eq(UInt<3>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits_x_0, xRegs_0) @[DotProduct.scala 37:25 DotProduct.scala 39:20 DotProduct.scala 15:22]
    node _GEN_1 = mux(io_in_valid, io_in_bits_x_1, xRegs_1) @[DotProduct.scala 37:25 DotProduct.scala 39:20 DotProduct.scala 15:22]
    node _GEN_2 = mux(io_in_valid, io_in_bits_x_2, xRegs_2) @[DotProduct.scala 37:25 DotProduct.scala 39:20 DotProduct.scala 15:22]
    node _GEN_3 = mux(io_in_valid, io_in_bits_x_3, xRegs_3) @[DotProduct.scala 37:25 DotProduct.scala 39:20 DotProduct.scala 15:22]
    node _GEN_4 = mux(io_in_valid, io_in_bits_y_0, yRegs_0) @[DotProduct.scala 37:25 DotProduct.scala 42:20 DotProduct.scala 16:22]
    node _GEN_5 = mux(io_in_valid, io_in_bits_y_1, yRegs_1) @[DotProduct.scala 37:25 DotProduct.scala 42:20 DotProduct.scala 16:22]
    node _GEN_6 = mux(io_in_valid, io_in_bits_y_2, yRegs_2) @[DotProduct.scala 37:25 DotProduct.scala 42:20 DotProduct.scala 16:22]
    node _GEN_7 = mux(io_in_valid, io_in_bits_y_3, yRegs_3) @[DotProduct.scala 37:25 DotProduct.scala 42:20 DotProduct.scala 16:22]
    node _GEN_8 = mux(io_in_valid, UInt<1>("h0"), cntReg) @[DotProduct.scala 37:25 DotProduct.scala 44:16 DotProduct.scala 20:23]
    node _GEN_9 = mux(io_in_valid, UInt<3>("h1"), stateReg) @[DotProduct.scala 37:25 DotProduct.scala 45:18 DotProduct.scala 19:25]
    node _T_7 = eq(UInt<3>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_8 = bits(cntReg, 1, 0)
    node _GEN_10 = validif(eq(UInt<1>("h0"), _T_8), xRegs_0) @[DotProduct.scala 51:25 DotProduct.scala 51:25]
    node _GEN_11 = mux(eq(UInt<1>("h1"), _T_8), xRegs_1, _GEN_10) @[DotProduct.scala 51:25 DotProduct.scala 51:25]
    node _GEN_12 = mux(eq(UInt<2>("h2"), _T_8), xRegs_2, _GEN_11) @[DotProduct.scala 51:25 DotProduct.scala 51:25]
    node _GEN_13 = mux(eq(UInt<2>("h3"), _T_8), xRegs_3, _GEN_12) @[DotProduct.scala 51:25 DotProduct.scala 51:25]
    node _T_9 = bits(cntReg, 1, 0)
    node _GEN_14 = validif(eq(UInt<1>("h0"), _T_9), yRegs_0) @[DotProduct.scala 52:25 DotProduct.scala 52:25]
    node _GEN_15 = mux(eq(UInt<1>("h1"), _T_9), yRegs_1, _GEN_14) @[DotProduct.scala 52:25 DotProduct.scala 52:25]
    node _GEN_16 = mux(eq(UInt<2>("h2"), _T_9), yRegs_2, _GEN_15) @[DotProduct.scala 52:25 DotProduct.scala 52:25]
    node _GEN_17 = mux(eq(UInt<2>("h3"), _T_9), yRegs_3, _GEN_16) @[DotProduct.scala 52:25 DotProduct.scala 52:25]
    node _xRegs_T_8 = _GEN_13 @[DotProduct.scala 51:25]
    node _GEN_18 = mux(pe.io_in_ready, _xRegs_T_8, asSInt(UInt<1>("h0"))) @[DotProduct.scala 50:7 DotProduct.scala 51:25 DotProduct.scala 25:19]
    node _yRegs_T_9 = _GEN_17 @[DotProduct.scala 52:25]
    node _GEN_19 = mux(pe.io_in_ready, _yRegs_T_9, asSInt(UInt<1>("h0"))) @[DotProduct.scala 50:7 DotProduct.scala 52:25 DotProduct.scala 26:19]
    node _GEN_20 = mux(pe.io_in_ready, UInt<3>("h2"), stateReg) @[DotProduct.scala 50:7 DotProduct.scala 54:18 DotProduct.scala 19:25]
    node _T_10 = eq(UInt<3>("h2"), stateReg) @[Conditional.scala 37:30]
    node _T_11 = add(cntReg, UInt<1>("h1")) @[DotProduct.scala 59:26]
    node _T_12 = tail(_T_11, 1) @[DotProduct.scala 59:26]
    node _T_13 = eq(cntReg, UInt<2>("h3")) @[DotProduct.scala 61:21]
    node _GEN_21 = mux(_T_13, UInt<3>("h3"), UInt<3>("h1")) @[DotProduct.scala 61:34 DotProduct.scala 62:20 DotProduct.scala 64:20]
    node _GEN_22 = mux(pe.io_out_valid, _T_12, cntReg) @[DotProduct.scala 58:29 DotProduct.scala 59:16 DotProduct.scala 20:23]
    node _GEN_23 = mux(pe.io_out_valid, _GEN_21, stateReg) @[DotProduct.scala 58:29 DotProduct.scala 19:25]
    node _T_14 = eq(UInt<3>("h3"), stateReg) @[Conditional.scala 37:30]
    node _GEN_24 = mux(io_out_ready, UInt<3>("h4"), stateReg) @[DotProduct.scala 69:26 DotProduct.scala 70:18 DotProduct.scala 19:25]
    node _T_15 = eq(UInt<3>("h4"), stateReg) @[Conditional.scala 37:30]
    node _GEN_25 = mux(pe.io_in_ready, UInt<1>("h1"), UInt<1>("h0")) @[DotProduct.scala 74:28 DotProduct.scala 75:29 DotProduct.scala 27:23]
    node _GEN_26 = mux(pe.io_in_ready, UInt<3>("h0"), stateReg) @[DotProduct.scala 74:28 DotProduct.scala 76:18 DotProduct.scala 19:25]
    node _GEN_27 = mux(_T_15, _GEN_25, UInt<1>("h0")) @[Conditional.scala 39:67 DotProduct.scala 27:23]
    node _GEN_28 = mux(_T_15, _GEN_26, stateReg) @[Conditional.scala 39:67 DotProduct.scala 19:25]
    node _GEN_29 = mux(_T_14, _GEN_24, _GEN_28) @[Conditional.scala 39:67]
    node _GEN_30 = mux(_T_14, UInt<1>("h0"), _GEN_27) @[Conditional.scala 39:67 DotProduct.scala 27:23]
    node _GEN_31 = mux(_T_10, _GEN_22, cntReg) @[Conditional.scala 39:67 DotProduct.scala 20:23]
    node _GEN_32 = mux(_T_10, _GEN_23, _GEN_29) @[Conditional.scala 39:67]
    node _GEN_33 = mux(_T_10, UInt<1>("h0"), _GEN_30) @[Conditional.scala 39:67 DotProduct.scala 27:23]
    node _GEN_34 = mux(_T_7, _GEN_18, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 DotProduct.scala 25:19]
    node _GEN_35 = mux(_T_7, _GEN_19, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 DotProduct.scala 26:19]
    node _GEN_36 = mux(_T_7, _GEN_20, _GEN_32) @[Conditional.scala 39:67]
    node _GEN_37 = mux(_T_7, cntReg, _GEN_31) @[Conditional.scala 39:67 DotProduct.scala 20:23]
    node _GEN_38 = mux(_T_7, UInt<1>("h0"), _GEN_33) @[Conditional.scala 39:67 DotProduct.scala 27:23]
    node _GEN_39 = mux(_T_6, _GEN_0, xRegs_0) @[Conditional.scala 40:58 DotProduct.scala 15:22]
    node _GEN_40 = mux(_T_6, _GEN_1, xRegs_1) @[Conditional.scala 40:58 DotProduct.scala 15:22]
    node _GEN_41 = mux(_T_6, _GEN_2, xRegs_2) @[Conditional.scala 40:58 DotProduct.scala 15:22]
    node _GEN_42 = mux(_T_6, _GEN_3, xRegs_3) @[Conditional.scala 40:58 DotProduct.scala 15:22]
    node _GEN_43 = mux(_T_6, _GEN_4, yRegs_0) @[Conditional.scala 40:58 DotProduct.scala 16:22]
    node _GEN_44 = mux(_T_6, _GEN_5, yRegs_1) @[Conditional.scala 40:58 DotProduct.scala 16:22]
    node _GEN_45 = mux(_T_6, _GEN_6, yRegs_2) @[Conditional.scala 40:58 DotProduct.scala 16:22]
    node _GEN_46 = mux(_T_6, _GEN_7, yRegs_3) @[Conditional.scala 40:58 DotProduct.scala 16:22]
    node _GEN_47 = mux(_T_6, _GEN_8, _GEN_37) @[Conditional.scala 40:58]
    node _GEN_48 = mux(_T_6, _GEN_9, _GEN_36) @[Conditional.scala 40:58]
    node _GEN_49 = mux(_T_6, asSInt(UInt<1>("h0")), _GEN_34) @[Conditional.scala 40:58 DotProduct.scala 25:19]
    node _GEN_50 = mux(_T_6, asSInt(UInt<1>("h0")), _GEN_35) @[Conditional.scala 40:58 DotProduct.scala 26:19]
    node _GEN_51 = mux(_T_6, UInt<1>("h0"), _GEN_38) @[Conditional.scala 40:58 DotProduct.scala 27:23]
    node _WIRE__0 = asSInt(UInt<32>("h0")) @[DotProduct.scala 15:30 DotProduct.scala 15:30]
    node _WIRE__1 = asSInt(UInt<32>("h0")) @[DotProduct.scala 15:30 DotProduct.scala 15:30]
    node _WIRE__2 = asSInt(UInt<32>("h0")) @[DotProduct.scala 15:30 DotProduct.scala 15:30]
    node _WIRE__3 = asSInt(UInt<32>("h0")) @[DotProduct.scala 15:30 DotProduct.scala 15:30]
    node _WIRE_1_0 = asSInt(UInt<32>("h0")) @[DotProduct.scala 16:30 DotProduct.scala 16:30]
    node _WIRE_1_1 = asSInt(UInt<32>("h0")) @[DotProduct.scala 16:30 DotProduct.scala 16:30]
    node _WIRE_1_2 = asSInt(UInt<32>("h0")) @[DotProduct.scala 16:30 DotProduct.scala 16:30]
    node _WIRE_1_3 = asSInt(UInt<32>("h0")) @[DotProduct.scala 16:30 DotProduct.scala 16:30]
    io_in_ready <= _T_4 @[DotProduct.scala 32:15]
    io_out_valid <= _T_5 @[DotProduct.scala 33:16]
    io_out_bits <= pe.io_out_bits @[DotProduct.scala 31:15]
    xRegs_0 <= mux(reset, _WIRE__0, _GEN_39) @[DotProduct.scala 15:22 DotProduct.scala 15:22]
    xRegs_1 <= mux(reset, _WIRE__1, _GEN_40) @[DotProduct.scala 15:22 DotProduct.scala 15:22]
    xRegs_2 <= mux(reset, _WIRE__2, _GEN_41) @[DotProduct.scala 15:22 DotProduct.scala 15:22]
    xRegs_3 <= mux(reset, _WIRE__3, _GEN_42) @[DotProduct.scala 15:22 DotProduct.scala 15:22]
    yRegs_0 <= mux(reset, _WIRE_1_0, _GEN_43) @[DotProduct.scala 16:22 DotProduct.scala 16:22]
    yRegs_1 <= mux(reset, _WIRE_1_1, _GEN_44) @[DotProduct.scala 16:22 DotProduct.scala 16:22]
    yRegs_2 <= mux(reset, _WIRE_1_2, _GEN_45) @[DotProduct.scala 16:22 DotProduct.scala 16:22]
    yRegs_3 <= mux(reset, _WIRE_1_3, _GEN_46) @[DotProduct.scala 16:22 DotProduct.scala 16:22]
    stateReg <= mux(reset, UInt<3>("h0"), _GEN_48) @[DotProduct.scala 19:25 DotProduct.scala 19:25]
    cntReg <= mux(reset, UInt<3>("h0"), _GEN_47) @[DotProduct.scala 20:23 DotProduct.scala 20:23]
    pe.clock <= clock
    pe.reset <= reset
    pe.io_in_valid <= _T_2 @[DotProduct.scala 28:18]
    pe.io_in_bits_x <= _GEN_49
    pe.io_in_bits_y <= _GEN_50
    pe.io_in_bits_reset <= _GEN_51
    pe.io_out_ready <= _T_3 @[DotProduct.scala 29:19]
