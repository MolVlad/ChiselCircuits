circuit WatermanFSM :
  module substituteElements :
    input clock : Clock
    input reset : UInt<1>
    input io_first : UInt<2>
    input io_second : UInt<2>
    output io_out : SInt<32>

    node _T = eq(io_first, io_second) @[DNA.scala 28:18]
    node _GEN_0 = mux(_T, asSInt(UInt<2>("h1")), asSInt(UInt<2>("h3"))) @[DNA.scala 28:33 DNA.scala 29:12 DNA.scala 31:12]
    io_out <= _GEN_0

  module calculateCell :
    input clock : Clock
    input reset : UInt<1>
    input io_upper : SInt<32>
    input io_left : SInt<32>
    input io_diagonal : SInt<32>
    input io_rowElement : UInt<2>
    input io_columnElement : UInt<2>
    output io_out : SInt<32>

    inst substituteElements of substituteElements @[DNA.scala 46:34]
    node _T = add(io_diagonal, substituteElements.io_out) @[DNA.scala 51:23]
    node _T_1 = tail(_T, 1) @[DNA.scala 51:23]
    node _T_2 = asSInt(_T_1) @[DNA.scala 51:23]
    node _T_3 = sub(io_upper, asSInt(UInt<3>("h2"))) @[DNA.scala 52:21]
    node _T_4 = tail(_T_3, 1) @[DNA.scala 52:21]
    node _T_5 = asSInt(_T_4) @[DNA.scala 52:21]
    node _T_6 = sub(io_left, asSInt(UInt<3>("h2"))) @[DNA.scala 53:19]
    node _T_7 = tail(_T_6, 1) @[DNA.scala 53:19]
    node _T_8 = asSInt(_T_7) @[DNA.scala 53:19]
    node diag = _T_2 @[DNA.scala 50:57 DNA.scala 51:8]
    node upper = _T_5 @[DNA.scala 50:57 DNA.scala 52:9]
    node _T_9 = gt(diag, upper) @[DNA.scala 55:14]
    node _GEN_0 = mux(_T_9, diag, upper) @[DNA.scala 55:23 DNA.scala 56:15 DNA.scala 58:15]
    node left = _T_8 @[DNA.scala 50:57 DNA.scala 53:8]
    node _T_10 = gt(diag, left) @[DNA.scala 60:14]
    node _GEN_1 = mux(_T_10, diag, left) @[DNA.scala 60:22 DNA.scala 61:14 DNA.scala 63:14]
    node diagLeft = _GEN_1 @[DNA.scala 50:57]
    node diagUpper = _GEN_0 @[DNA.scala 50:57]
    node _T_11 = gt(diagLeft, diagUpper) @[DNA.scala 65:18]
    node _GEN_2 = mux(_T_11, diagLeft, diagUpper) @[DNA.scala 65:31 DNA.scala 66:9 DNA.scala 68:9]
    node max = _GEN_2 @[DNA.scala 50:57]
    node _T_12 = gt(max, asSInt(UInt<1>("h0"))) @[DNA.scala 72:15]
    node _GEN_3 = mux(_T_12, max, asSInt(UInt<1>("h0"))) @[DNA.scala 72:36 DNA.scala 73:14 DNA.scala 75:14]
    io_out <= _GEN_3
    substituteElements.clock <= clock
    substituteElements.reset <= reset
    substituteElements.io_first <= io_rowElement @[DNA.scala 47:31]
    substituteElements.io_second <= io_columnElement @[DNA.scala 48:32]

  module WatermanFSM :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits_S_0 : UInt<2>
    input io_in_bits_S_1 : UInt<2>
    input io_in_bits_S_2 : UInt<2>
    input io_in_bits_S_3 : UInt<2>
    input io_in_bits_S_4 : UInt<2>
    input io_in_bits_S_5 : UInt<2>
    input io_in_bits_S_6 : UInt<2>
    input io_in_bits_T_0 : UInt<2>
    input io_in_bits_T_1 : UInt<2>
    input io_in_bits_T_2 : UInt<2>
    input io_in_bits_T_3 : UInt<2>
    input io_in_bits_T_4 : UInt<2>
    input io_in_bits_T_5 : UInt<2>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits_score : SInt<32>
    output io_out_bits_x : UInt<3>
    output io_out_bits_y : UInt<3>

    inst pe of calculateCell @[WatermanFSM.scala 32:18]
    reg SReg_0 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_0) @[WatermanFSM.scala 20:21]
    reg SReg_1 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_1) @[WatermanFSM.scala 20:21]
    reg SReg_2 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_2) @[WatermanFSM.scala 20:21]
    reg SReg_3 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_3) @[WatermanFSM.scala 20:21]
    reg SReg_4 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_4) @[WatermanFSM.scala 20:21]
    reg SReg_5 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_5) @[WatermanFSM.scala 20:21]
    reg SReg_6 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_6) @[WatermanFSM.scala 20:21]
    reg TReg_0 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_0) @[WatermanFSM.scala 21:21]
    reg TReg_1 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_1) @[WatermanFSM.scala 21:21]
    reg TReg_2 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_2) @[WatermanFSM.scala 21:21]
    reg TReg_3 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_3) @[WatermanFSM.scala 21:21]
    reg TReg_4 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_4) @[WatermanFSM.scala 21:21]
    reg TReg_5 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_5) @[WatermanFSM.scala 21:21]
    reg rowsReg_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), rowsReg_0) @[WatermanFSM.scala 22:24]
    reg rowsReg_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), rowsReg_1) @[WatermanFSM.scala 22:24]
    reg rowsReg_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), rowsReg_2) @[WatermanFSM.scala 22:24]
    reg rowsReg_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), rowsReg_3) @[WatermanFSM.scala 22:24]
    reg rowsReg_4 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), rowsReg_4) @[WatermanFSM.scala 22:24]
    reg rowsReg_5 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), rowsReg_5) @[WatermanFSM.scala 22:24]
    reg columnsReg_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), columnsReg_0) @[WatermanFSM.scala 23:27]
    reg columnsReg_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), columnsReg_1) @[WatermanFSM.scala 23:27]
    reg columnsReg_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), columnsReg_2) @[WatermanFSM.scala 23:27]
    reg columnsReg_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), columnsReg_3) @[WatermanFSM.scala 23:27]
    reg columnsReg_4 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), columnsReg_4) @[WatermanFSM.scala 23:27]
    reg columnsReg_5 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), columnsReg_5) @[WatermanFSM.scala 23:27]
    reg columnsReg_6 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), columnsReg_6) @[WatermanFSM.scala 23:27]
    reg columnsReg_7 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), columnsReg_7) @[WatermanFSM.scala 23:27]
    reg resultingColumnsReg_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), resultingColumnsReg_0) @[WatermanFSM.scala 24:36]
    reg resultingColumnsReg_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), resultingColumnsReg_1) @[WatermanFSM.scala 24:36]
    reg resultingColumnsReg_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), resultingColumnsReg_2) @[WatermanFSM.scala 24:36]
    reg resultingColumnsReg_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), resultingColumnsReg_3) @[WatermanFSM.scala 24:36]
    reg resultingColumnsReg_4 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), resultingColumnsReg_4) @[WatermanFSM.scala 24:36]
    reg resultingColumnsReg_5 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), resultingColumnsReg_5) @[WatermanFSM.scala 24:36]
    reg resultingColumnsReg_6 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), resultingColumnsReg_6) @[WatermanFSM.scala 24:36]
    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[WatermanFSM.scala 27:25]
    reg cntColumnReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), cntColumnReg) @[WatermanFSM.scala 28:29]
    reg cntRowReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), cntRowReg) @[WatermanFSM.scala 29:26]
    reg resReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), resReg) @[WatermanFSM.scala 30:23]
    node _T = eq(stateReg, UInt<2>("h3")) @[WatermanFSM.scala 42:28]
    node _T_1 = eq(stateReg, UInt<2>("h0")) @[WatermanFSM.scala 43:27]
    node _T_2 = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _T_3 = bits(reset, 0, 0) @[WatermanFSM.scala 48:15]
    node _T_4 = eq(_T_3, UInt<1>("h0")) @[WatermanFSM.scala 48:15]
    node _GEN_0 = mux(io_in_valid, io_in_bits_S_0, SReg_0) @[WatermanFSM.scala 47:25 WatermanFSM.scala 50:19 WatermanFSM.scala 20:21]
    node _GEN_1 = mux(io_in_valid, io_in_bits_S_1, SReg_1) @[WatermanFSM.scala 47:25 WatermanFSM.scala 50:19 WatermanFSM.scala 20:21]
    node _GEN_2 = mux(io_in_valid, io_in_bits_S_2, SReg_2) @[WatermanFSM.scala 47:25 WatermanFSM.scala 50:19 WatermanFSM.scala 20:21]
    node _GEN_3 = mux(io_in_valid, io_in_bits_S_3, SReg_3) @[WatermanFSM.scala 47:25 WatermanFSM.scala 50:19 WatermanFSM.scala 20:21]
    node _GEN_4 = mux(io_in_valid, io_in_bits_S_4, SReg_4) @[WatermanFSM.scala 47:25 WatermanFSM.scala 50:19 WatermanFSM.scala 20:21]
    node _GEN_5 = mux(io_in_valid, io_in_bits_S_5, SReg_5) @[WatermanFSM.scala 47:25 WatermanFSM.scala 50:19 WatermanFSM.scala 20:21]
    node _GEN_6 = mux(io_in_valid, io_in_bits_S_6, SReg_6) @[WatermanFSM.scala 47:25 WatermanFSM.scala 50:19 WatermanFSM.scala 20:21]
    node _GEN_7 = mux(io_in_valid, io_in_bits_T_0, TReg_0) @[WatermanFSM.scala 47:25 WatermanFSM.scala 53:19 WatermanFSM.scala 21:21]
    node _GEN_8 = mux(io_in_valid, io_in_bits_T_1, TReg_1) @[WatermanFSM.scala 47:25 WatermanFSM.scala 53:19 WatermanFSM.scala 21:21]
    node _GEN_9 = mux(io_in_valid, io_in_bits_T_2, TReg_2) @[WatermanFSM.scala 47:25 WatermanFSM.scala 53:19 WatermanFSM.scala 21:21]
    node _GEN_10 = mux(io_in_valid, io_in_bits_T_3, TReg_3) @[WatermanFSM.scala 47:25 WatermanFSM.scala 53:19 WatermanFSM.scala 21:21]
    node _GEN_11 = mux(io_in_valid, io_in_bits_T_4, TReg_4) @[WatermanFSM.scala 47:25 WatermanFSM.scala 53:19 WatermanFSM.scala 21:21]
    node _GEN_12 = mux(io_in_valid, io_in_bits_T_5, TReg_5) @[WatermanFSM.scala 47:25 WatermanFSM.scala 53:19 WatermanFSM.scala 21:21]
    node _GEN_13 = mux(io_in_valid, asSInt(UInt<1>("h0")), columnsReg_0) @[WatermanFSM.scala 47:25 WatermanFSM.scala 56:25 WatermanFSM.scala 23:27]
    node _GEN_14 = mux(io_in_valid, asSInt(UInt<1>("h0")), columnsReg_1) @[WatermanFSM.scala 47:25 WatermanFSM.scala 56:25 WatermanFSM.scala 23:27]
    node _GEN_15 = mux(io_in_valid, asSInt(UInt<1>("h0")), columnsReg_2) @[WatermanFSM.scala 47:25 WatermanFSM.scala 56:25 WatermanFSM.scala 23:27]
    node _GEN_16 = mux(io_in_valid, asSInt(UInt<1>("h0")), columnsReg_3) @[WatermanFSM.scala 47:25 WatermanFSM.scala 56:25 WatermanFSM.scala 23:27]
    node _GEN_17 = mux(io_in_valid, asSInt(UInt<1>("h0")), columnsReg_4) @[WatermanFSM.scala 47:25 WatermanFSM.scala 56:25 WatermanFSM.scala 23:27]
    node _GEN_18 = mux(io_in_valid, asSInt(UInt<1>("h0")), columnsReg_5) @[WatermanFSM.scala 47:25 WatermanFSM.scala 56:25 WatermanFSM.scala 23:27]
    node _GEN_19 = mux(io_in_valid, asSInt(UInt<1>("h0")), columnsReg_6) @[WatermanFSM.scala 47:25 WatermanFSM.scala 56:25 WatermanFSM.scala 23:27]
    node _GEN_20 = mux(io_in_valid, asSInt(UInt<1>("h0")), columnsReg_7) @[WatermanFSM.scala 47:25 WatermanFSM.scala 56:25 WatermanFSM.scala 23:27]
    node _GEN_21 = mux(io_in_valid, asSInt(UInt<1>("h0")), rowsReg_0) @[WatermanFSM.scala 47:25 WatermanFSM.scala 59:22 WatermanFSM.scala 22:24]
    node _GEN_22 = mux(io_in_valid, asSInt(UInt<1>("h0")), rowsReg_1) @[WatermanFSM.scala 47:25 WatermanFSM.scala 59:22 WatermanFSM.scala 22:24]
    node _GEN_23 = mux(io_in_valid, asSInt(UInt<1>("h0")), rowsReg_2) @[WatermanFSM.scala 47:25 WatermanFSM.scala 59:22 WatermanFSM.scala 22:24]
    node _GEN_24 = mux(io_in_valid, asSInt(UInt<1>("h0")), rowsReg_3) @[WatermanFSM.scala 47:25 WatermanFSM.scala 59:22 WatermanFSM.scala 22:24]
    node _GEN_25 = mux(io_in_valid, asSInt(UInt<1>("h0")), rowsReg_4) @[WatermanFSM.scala 47:25 WatermanFSM.scala 59:22 WatermanFSM.scala 22:24]
    node _GEN_26 = mux(io_in_valid, asSInt(UInt<1>("h0")), rowsReg_5) @[WatermanFSM.scala 47:25 WatermanFSM.scala 59:22 WatermanFSM.scala 22:24]
    node _GEN_27 = mux(io_in_valid, asSInt(UInt<1>("h0")), resultingColumnsReg_0) @[WatermanFSM.scala 47:25 WatermanFSM.scala 62:34 WatermanFSM.scala 24:36]
    node _GEN_28 = mux(io_in_valid, asSInt(UInt<1>("h0")), resultingColumnsReg_1) @[WatermanFSM.scala 47:25 WatermanFSM.scala 62:34 WatermanFSM.scala 24:36]
    node _GEN_29 = mux(io_in_valid, asSInt(UInt<1>("h0")), resultingColumnsReg_2) @[WatermanFSM.scala 47:25 WatermanFSM.scala 62:34 WatermanFSM.scala 24:36]
    node _GEN_30 = mux(io_in_valid, asSInt(UInt<1>("h0")), resultingColumnsReg_3) @[WatermanFSM.scala 47:25 WatermanFSM.scala 62:34 WatermanFSM.scala 24:36]
    node _GEN_31 = mux(io_in_valid, asSInt(UInt<1>("h0")), resultingColumnsReg_4) @[WatermanFSM.scala 47:25 WatermanFSM.scala 62:34 WatermanFSM.scala 24:36]
    node _GEN_32 = mux(io_in_valid, asSInt(UInt<1>("h0")), resultingColumnsReg_5) @[WatermanFSM.scala 47:25 WatermanFSM.scala 62:34 WatermanFSM.scala 24:36]
    node _GEN_33 = mux(io_in_valid, asSInt(UInt<1>("h0")), resultingColumnsReg_6) @[WatermanFSM.scala 47:25 WatermanFSM.scala 62:34 WatermanFSM.scala 24:36]
    node _GEN_34 = mux(io_in_valid, UInt<1>("h0"), cntColumnReg) @[WatermanFSM.scala 47:25 WatermanFSM.scala 65:22 WatermanFSM.scala 28:29]
    node _GEN_35 = mux(io_in_valid, UInt<1>("h0"), cntRowReg) @[WatermanFSM.scala 47:25 WatermanFSM.scala 66:19 WatermanFSM.scala 29:26]
    node _GEN_36 = mux(io_in_valid, UInt<2>("h1"), stateReg) @[WatermanFSM.scala 47:25 WatermanFSM.scala 67:18 WatermanFSM.scala 27:25]
    node _T_5 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_6 = add(cntColumnReg, UInt<1>("h1")) @[WatermanFSM.scala 71:46]
    node _T_7 = tail(_T_6, 1) @[WatermanFSM.scala 71:46]
    node _T_8 = bits(_T_7, 2, 0)
    node _GEN_37 = validif(eq(UInt<1>("h0"), _T_8), columnsReg_0) @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
    node _GEN_38 = mux(eq(UInt<1>("h1"), _T_8), columnsReg_1, _GEN_37) @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
    node _GEN_39 = mux(eq(UInt<2>("h2"), _T_8), columnsReg_2, _GEN_38) @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
    node _GEN_40 = mux(eq(UInt<2>("h3"), _T_8), columnsReg_3, _GEN_39) @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
    node _GEN_41 = mux(eq(UInt<3>("h4"), _T_8), columnsReg_4, _GEN_40) @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
    node _GEN_42 = mux(eq(UInt<3>("h5"), _T_8), columnsReg_5, _GEN_41) @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
    node _GEN_43 = mux(eq(UInt<3>("h6"), _T_8), columnsReg_6, _GEN_42) @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
    node _GEN_44 = mux(eq(UInt<3>("h7"), _T_8), columnsReg_7, _GEN_43) @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
    node _T_9 = bits(cntColumnReg, 2, 0)
    node _GEN_45 = validif(eq(UInt<1>("h0"), _T_9), columnsReg_0) @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
    node _GEN_46 = mux(eq(UInt<1>("h1"), _T_9), columnsReg_1, _GEN_45) @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
    node _GEN_47 = mux(eq(UInt<2>("h2"), _T_9), columnsReg_2, _GEN_46) @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
    node _GEN_48 = mux(eq(UInt<2>("h3"), _T_9), columnsReg_3, _GEN_47) @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
    node _GEN_49 = mux(eq(UInt<3>("h4"), _T_9), columnsReg_4, _GEN_48) @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
    node _GEN_50 = mux(eq(UInt<3>("h5"), _T_9), columnsReg_5, _GEN_49) @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
    node _GEN_51 = mux(eq(UInt<3>("h6"), _T_9), columnsReg_6, _GEN_50) @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
    node _GEN_52 = mux(eq(UInt<3>("h7"), _T_9), columnsReg_7, _GEN_51) @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
    node _T_10 = bits(cntRowReg, 2, 0)
    node _GEN_53 = validif(eq(UInt<1>("h0"), _T_10), rowsReg_0) @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
    node _GEN_54 = mux(eq(UInt<1>("h1"), _T_10), rowsReg_1, _GEN_53) @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
    node _GEN_55 = mux(eq(UInt<2>("h2"), _T_10), rowsReg_2, _GEN_54) @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
    node _GEN_56 = mux(eq(UInt<2>("h3"), _T_10), rowsReg_3, _GEN_55) @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
    node _GEN_57 = mux(eq(UInt<3>("h4"), _T_10), rowsReg_4, _GEN_56) @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
    node _GEN_58 = mux(eq(UInt<3>("h5"), _T_10), rowsReg_5, _GEN_57) @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
    node _T_11 = bits(cntRowReg, 2, 0)
    node _GEN_59 = validif(eq(UInt<1>("h0"), _T_11), TReg_0) @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
    node _GEN_60 = mux(eq(UInt<1>("h1"), _T_11), TReg_1, _GEN_59) @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
    node _GEN_61 = mux(eq(UInt<2>("h2"), _T_11), TReg_2, _GEN_60) @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
    node _GEN_62 = mux(eq(UInt<2>("h3"), _T_11), TReg_3, _GEN_61) @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
    node _GEN_63 = mux(eq(UInt<3>("h4"), _T_11), TReg_4, _GEN_62) @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
    node _GEN_64 = mux(eq(UInt<3>("h5"), _T_11), TReg_5, _GEN_63) @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
    node _T_12 = bits(cntColumnReg, 2, 0)
    node _GEN_65 = validif(eq(UInt<1>("h0"), _T_12), SReg_0) @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
    node _GEN_66 = mux(eq(UInt<1>("h1"), _T_12), SReg_1, _GEN_65) @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
    node _GEN_67 = mux(eq(UInt<2>("h2"), _T_12), SReg_2, _GEN_66) @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
    node _GEN_68 = mux(eq(UInt<2>("h3"), _T_12), SReg_3, _GEN_67) @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
    node _GEN_69 = mux(eq(UInt<3>("h4"), _T_12), SReg_4, _GEN_68) @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
    node _GEN_70 = mux(eq(UInt<3>("h5"), _T_12), SReg_5, _GEN_69) @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
    node _GEN_71 = mux(eq(UInt<3>("h6"), _T_12), SReg_6, _GEN_70) @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
    node _T_13 = eq(UInt<2>("h3"), stateReg) @[Conditional.scala 37:30]
    node _T_14 = bits(cntColumnReg, 2, 0)
    node _resultingColumnsReg_T_14 = resReg @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43]
    node _GEN_72 = mux(eq(UInt<1>("h0"), _T_14), _resultingColumnsReg_T_14, resultingColumnsReg_0) @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
    node _GEN_73 = mux(eq(UInt<1>("h1"), _T_14), _resultingColumnsReg_T_14, resultingColumnsReg_1) @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
    node _GEN_74 = mux(eq(UInt<2>("h2"), _T_14), _resultingColumnsReg_T_14, resultingColumnsReg_2) @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
    node _GEN_75 = mux(eq(UInt<2>("h3"), _T_14), _resultingColumnsReg_T_14, resultingColumnsReg_3) @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
    node _GEN_76 = mux(eq(UInt<3>("h4"), _T_14), _resultingColumnsReg_T_14, resultingColumnsReg_4) @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
    node _GEN_77 = mux(eq(UInt<3>("h5"), _T_14), _resultingColumnsReg_T_14, resultingColumnsReg_5) @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
    node _GEN_78 = mux(eq(UInt<3>("h6"), _T_14), _resultingColumnsReg_T_14, resultingColumnsReg_6) @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
    node _T_15 = bits(cntRowReg, 2, 0)
    node _rowsReg_T_15 = resReg @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28]
    node _GEN_79 = mux(eq(UInt<1>("h0"), _T_15), _rowsReg_T_15, rowsReg_0) @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 22:24]
    node _GEN_80 = mux(eq(UInt<1>("h1"), _T_15), _rowsReg_T_15, rowsReg_1) @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 22:24]
    node _GEN_81 = mux(eq(UInt<2>("h2"), _T_15), _rowsReg_T_15, rowsReg_2) @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 22:24]
    node _GEN_82 = mux(eq(UInt<2>("h3"), _T_15), _rowsReg_T_15, rowsReg_3) @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 22:24]
    node _GEN_83 = mux(eq(UInt<3>("h4"), _T_15), _rowsReg_T_15, rowsReg_4) @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 22:24]
    node _GEN_84 = mux(eq(UInt<3>("h5"), _T_15), _rowsReg_T_15, rowsReg_5) @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 22:24]
    node _T_16 = bits(reset, 0, 0) @[WatermanFSM.scala 84:15]
    node _T_17 = eq(_T_16, UInt<1>("h0")) @[WatermanFSM.scala 84:15]
    node _T_18 = eq(cntColumnReg, UInt<3>("h6")) @[WatermanFSM.scala 86:28]
    node _T_19 = eq(cntRowReg, UInt<3>("h5")) @[WatermanFSM.scala 86:69]
    node _T_20 = and(_T_18, _T_19) @[WatermanFSM.scala 86:55]
    node _T_21 = bits(reset, 0, 0) @[WatermanFSM.scala 88:17]
    node _T_22 = eq(_T_21, UInt<1>("h0")) @[WatermanFSM.scala 88:17]
    node _T_23 = eq(cntColumnReg, UInt<3>("h6")) @[WatermanFSM.scala 89:34]
    node _T_24 = add(cntRowReg, UInt<1>("h1")) @[WatermanFSM.scala 91:34]
    node _T_25 = tail(_T_24, 1) @[WatermanFSM.scala 91:34]
    node _T_26 = bits(reset, 0, 0) @[WatermanFSM.scala 92:17]
    node _T_27 = eq(_T_26, UInt<1>("h0")) @[WatermanFSM.scala 92:17]
    node _T_28 = add(cntColumnReg, UInt<1>("h1")) @[WatermanFSM.scala 95:40]
    node _T_29 = tail(_T_28, 1) @[WatermanFSM.scala 95:40]
    node _GEN_85 = mux(_T_23, UInt<1>("h0"), _T_29) @[WatermanFSM.scala 89:61 WatermanFSM.scala 90:24 WatermanFSM.scala 95:24]
    node _GEN_86 = mux(_T_23, _T_25, cntRowReg) @[WatermanFSM.scala 89:61 WatermanFSM.scala 91:21 WatermanFSM.scala 29:26]
    node _GEN_87 = mux(_T_23, UInt<2>("h2"), UInt<2>("h1")) @[WatermanFSM.scala 89:61 WatermanFSM.scala 93:20 WatermanFSM.scala 96:20]
    node _GEN_88 = mux(_T_20, UInt<2>("h0"), _GEN_87) @[WatermanFSM.scala 86:94 WatermanFSM.scala 87:20]
    node _GEN_89 = mux(_T_20, cntColumnReg, _GEN_85) @[WatermanFSM.scala 86:94 WatermanFSM.scala 28:29]
    node _GEN_90 = mux(_T_20, cntRowReg, _GEN_86) @[WatermanFSM.scala 86:94 WatermanFSM.scala 29:26]
    node _GEN_91 = mux(io_out_ready, _GEN_72, resultingColumnsReg_0) @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
    node _GEN_92 = mux(io_out_ready, _GEN_73, resultingColumnsReg_1) @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
    node _GEN_93 = mux(io_out_ready, _GEN_74, resultingColumnsReg_2) @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
    node _GEN_94 = mux(io_out_ready, _GEN_75, resultingColumnsReg_3) @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
    node _GEN_95 = mux(io_out_ready, _GEN_76, resultingColumnsReg_4) @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
    node _GEN_96 = mux(io_out_ready, _GEN_77, resultingColumnsReg_5) @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
    node _GEN_97 = mux(io_out_ready, _GEN_78, resultingColumnsReg_6) @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
    node _GEN_98 = mux(io_out_ready, _GEN_79, rowsReg_0) @[WatermanFSM.scala 81:26 WatermanFSM.scala 22:24]
    node _GEN_99 = mux(io_out_ready, _GEN_80, rowsReg_1) @[WatermanFSM.scala 81:26 WatermanFSM.scala 22:24]
    node _GEN_100 = mux(io_out_ready, _GEN_81, rowsReg_2) @[WatermanFSM.scala 81:26 WatermanFSM.scala 22:24]
    node _GEN_101 = mux(io_out_ready, _GEN_82, rowsReg_3) @[WatermanFSM.scala 81:26 WatermanFSM.scala 22:24]
    node _GEN_102 = mux(io_out_ready, _GEN_83, rowsReg_4) @[WatermanFSM.scala 81:26 WatermanFSM.scala 22:24]
    node _GEN_103 = mux(io_out_ready, _GEN_84, rowsReg_5) @[WatermanFSM.scala 81:26 WatermanFSM.scala 22:24]
    node _GEN_104 = mux(io_out_ready, _GEN_88, stateReg) @[WatermanFSM.scala 81:26 WatermanFSM.scala 27:25]
    node _GEN_105 = mux(io_out_ready, _GEN_89, cntColumnReg) @[WatermanFSM.scala 81:26 WatermanFSM.scala 28:29]
    node _GEN_106 = mux(io_out_ready, _GEN_90, cntRowReg) @[WatermanFSM.scala 81:26 WatermanFSM.scala 29:26]
    node _T_30 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _GEN_107 = mux(_T_30, resultingColumnsReg_0, columnsReg_1) @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
    node _GEN_108 = mux(_T_30, resultingColumnsReg_1, columnsReg_2) @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
    node _GEN_109 = mux(_T_30, resultingColumnsReg_2, columnsReg_3) @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
    node _GEN_110 = mux(_T_30, resultingColumnsReg_3, columnsReg_4) @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
    node _GEN_111 = mux(_T_30, resultingColumnsReg_4, columnsReg_5) @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
    node _GEN_112 = mux(_T_30, resultingColumnsReg_5, columnsReg_6) @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
    node _GEN_113 = mux(_T_30, resultingColumnsReg_6, columnsReg_7) @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
    node _GEN_114 = mux(_T_30, UInt<2>("h1"), stateReg) @[Conditional.scala 39:67 WatermanFSM.scala 104:16 WatermanFSM.scala 27:25]
    node _GEN_115 = mux(_T_13, _GEN_91, resultingColumnsReg_0) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_116 = mux(_T_13, _GEN_92, resultingColumnsReg_1) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_117 = mux(_T_13, _GEN_93, resultingColumnsReg_2) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_118 = mux(_T_13, _GEN_94, resultingColumnsReg_3) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_119 = mux(_T_13, _GEN_95, resultingColumnsReg_4) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_120 = mux(_T_13, _GEN_96, resultingColumnsReg_5) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_121 = mux(_T_13, _GEN_97, resultingColumnsReg_6) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_122 = mux(_T_13, _GEN_98, rowsReg_0) @[Conditional.scala 39:67 WatermanFSM.scala 22:24]
    node _GEN_123 = mux(_T_13, _GEN_99, rowsReg_1) @[Conditional.scala 39:67 WatermanFSM.scala 22:24]
    node _GEN_124 = mux(_T_13, _GEN_100, rowsReg_2) @[Conditional.scala 39:67 WatermanFSM.scala 22:24]
    node _GEN_125 = mux(_T_13, _GEN_101, rowsReg_3) @[Conditional.scala 39:67 WatermanFSM.scala 22:24]
    node _GEN_126 = mux(_T_13, _GEN_102, rowsReg_4) @[Conditional.scala 39:67 WatermanFSM.scala 22:24]
    node _GEN_127 = mux(_T_13, _GEN_103, rowsReg_5) @[Conditional.scala 39:67 WatermanFSM.scala 22:24]
    node _GEN_128 = mux(_T_13, _GEN_104, _GEN_114) @[Conditional.scala 39:67]
    node _GEN_129 = mux(_T_13, _GEN_105, cntColumnReg) @[Conditional.scala 39:67 WatermanFSM.scala 28:29]
    node _GEN_130 = mux(_T_13, _GEN_106, cntRowReg) @[Conditional.scala 39:67 WatermanFSM.scala 29:26]
    node _GEN_131 = mux(_T_13, columnsReg_1, _GEN_107) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _GEN_132 = mux(_T_13, columnsReg_2, _GEN_108) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _GEN_133 = mux(_T_13, columnsReg_3, _GEN_109) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _GEN_134 = mux(_T_13, columnsReg_4, _GEN_110) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _GEN_135 = mux(_T_13, columnsReg_5, _GEN_111) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _GEN_136 = mux(_T_13, columnsReg_6, _GEN_112) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _GEN_137 = mux(_T_13, columnsReg_7, _GEN_113) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _columnsReg_T_8 = _GEN_44 @[WatermanFSM.scala 71:19]
    node _GEN_138 = validif(_T_5, _columnsReg_T_8) @[Conditional.scala 39:67 WatermanFSM.scala 71:19]
    node _columnsReg_T_9 = _GEN_52 @[WatermanFSM.scala 72:22]
    node _GEN_139 = validif(_T_5, _columnsReg_T_9) @[Conditional.scala 39:67 WatermanFSM.scala 72:22]
    node _rowsReg_T_10 = _GEN_58 @[WatermanFSM.scala 73:18]
    node _GEN_140 = validif(_T_5, _rowsReg_T_10) @[Conditional.scala 39:67 WatermanFSM.scala 73:18]
    node _TReg_T_11 = _GEN_64 @[WatermanFSM.scala 74:24]
    node _GEN_141 = validif(_T_5, _TReg_T_11) @[Conditional.scala 39:67 WatermanFSM.scala 74:24]
    node _SReg_T_12 = _GEN_71 @[WatermanFSM.scala 75:27]
    node _GEN_142 = validif(_T_5, _SReg_T_12) @[Conditional.scala 39:67 WatermanFSM.scala 75:27]
    node _GEN_143 = mux(_T_5, pe.io_out, resReg) @[Conditional.scala 39:67 WatermanFSM.scala 77:14 WatermanFSM.scala 30:23]
    node _GEN_144 = mux(_T_5, UInt<2>("h3"), _GEN_128) @[Conditional.scala 39:67 WatermanFSM.scala 78:16]
    node _GEN_145 = mux(_T_5, resultingColumnsReg_0, _GEN_115) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_146 = mux(_T_5, resultingColumnsReg_1, _GEN_116) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_147 = mux(_T_5, resultingColumnsReg_2, _GEN_117) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_148 = mux(_T_5, resultingColumnsReg_3, _GEN_118) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_149 = mux(_T_5, resultingColumnsReg_4, _GEN_119) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_150 = mux(_T_5, resultingColumnsReg_5, _GEN_120) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_151 = mux(_T_5, resultingColumnsReg_6, _GEN_121) @[Conditional.scala 39:67 WatermanFSM.scala 24:36]
    node _GEN_152 = mux(_T_5, rowsReg_0, _GEN_122) @[Conditional.scala 39:67 WatermanFSM.scala 22:24]
    node _GEN_153 = mux(_T_5, rowsReg_1, _GEN_123) @[Conditional.scala 39:67 WatermanFSM.scala 22:24]
    node _GEN_154 = mux(_T_5, rowsReg_2, _GEN_124) @[Conditional.scala 39:67 WatermanFSM.scala 22:24]
    node _GEN_155 = mux(_T_5, rowsReg_3, _GEN_125) @[Conditional.scala 39:67 WatermanFSM.scala 22:24]
    node _GEN_156 = mux(_T_5, rowsReg_4, _GEN_126) @[Conditional.scala 39:67 WatermanFSM.scala 22:24]
    node _GEN_157 = mux(_T_5, rowsReg_5, _GEN_127) @[Conditional.scala 39:67 WatermanFSM.scala 22:24]
    node _GEN_158 = mux(_T_5, cntColumnReg, _GEN_129) @[Conditional.scala 39:67 WatermanFSM.scala 28:29]
    node _GEN_159 = mux(_T_5, cntRowReg, _GEN_130) @[Conditional.scala 39:67 WatermanFSM.scala 29:26]
    node _GEN_160 = mux(_T_5, columnsReg_1, _GEN_131) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _GEN_161 = mux(_T_5, columnsReg_2, _GEN_132) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _GEN_162 = mux(_T_5, columnsReg_3, _GEN_133) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _GEN_163 = mux(_T_5, columnsReg_4, _GEN_134) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _GEN_164 = mux(_T_5, columnsReg_5, _GEN_135) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _GEN_165 = mux(_T_5, columnsReg_6, _GEN_136) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _GEN_166 = mux(_T_5, columnsReg_7, _GEN_137) @[Conditional.scala 39:67 WatermanFSM.scala 23:27]
    node _GEN_167 = mux(_T_2, _GEN_0, SReg_0) @[Conditional.scala 40:58 WatermanFSM.scala 20:21]
    node _GEN_168 = mux(_T_2, _GEN_1, SReg_1) @[Conditional.scala 40:58 WatermanFSM.scala 20:21]
    node _GEN_169 = mux(_T_2, _GEN_2, SReg_2) @[Conditional.scala 40:58 WatermanFSM.scala 20:21]
    node _GEN_170 = mux(_T_2, _GEN_3, SReg_3) @[Conditional.scala 40:58 WatermanFSM.scala 20:21]
    node _GEN_171 = mux(_T_2, _GEN_4, SReg_4) @[Conditional.scala 40:58 WatermanFSM.scala 20:21]
    node _GEN_172 = mux(_T_2, _GEN_5, SReg_5) @[Conditional.scala 40:58 WatermanFSM.scala 20:21]
    node _GEN_173 = mux(_T_2, _GEN_6, SReg_6) @[Conditional.scala 40:58 WatermanFSM.scala 20:21]
    node _GEN_174 = mux(_T_2, _GEN_7, TReg_0) @[Conditional.scala 40:58 WatermanFSM.scala 21:21]
    node _GEN_175 = mux(_T_2, _GEN_8, TReg_1) @[Conditional.scala 40:58 WatermanFSM.scala 21:21]
    node _GEN_176 = mux(_T_2, _GEN_9, TReg_2) @[Conditional.scala 40:58 WatermanFSM.scala 21:21]
    node _GEN_177 = mux(_T_2, _GEN_10, TReg_3) @[Conditional.scala 40:58 WatermanFSM.scala 21:21]
    node _GEN_178 = mux(_T_2, _GEN_11, TReg_4) @[Conditional.scala 40:58 WatermanFSM.scala 21:21]
    node _GEN_179 = mux(_T_2, _GEN_12, TReg_5) @[Conditional.scala 40:58 WatermanFSM.scala 21:21]
    node _GEN_180 = mux(_T_2, _GEN_13, columnsReg_0) @[Conditional.scala 40:58 WatermanFSM.scala 23:27]
    node _GEN_181 = mux(_T_2, _GEN_14, _GEN_160) @[Conditional.scala 40:58]
    node _GEN_182 = mux(_T_2, _GEN_15, _GEN_161) @[Conditional.scala 40:58]
    node _GEN_183 = mux(_T_2, _GEN_16, _GEN_162) @[Conditional.scala 40:58]
    node _GEN_184 = mux(_T_2, _GEN_17, _GEN_163) @[Conditional.scala 40:58]
    node _GEN_185 = mux(_T_2, _GEN_18, _GEN_164) @[Conditional.scala 40:58]
    node _GEN_186 = mux(_T_2, _GEN_19, _GEN_165) @[Conditional.scala 40:58]
    node _GEN_187 = mux(_T_2, _GEN_20, _GEN_166) @[Conditional.scala 40:58]
    node _GEN_188 = mux(_T_2, _GEN_21, _GEN_152) @[Conditional.scala 40:58]
    node _GEN_189 = mux(_T_2, _GEN_22, _GEN_153) @[Conditional.scala 40:58]
    node _GEN_190 = mux(_T_2, _GEN_23, _GEN_154) @[Conditional.scala 40:58]
    node _GEN_191 = mux(_T_2, _GEN_24, _GEN_155) @[Conditional.scala 40:58]
    node _GEN_192 = mux(_T_2, _GEN_25, _GEN_156) @[Conditional.scala 40:58]
    node _GEN_193 = mux(_T_2, _GEN_26, _GEN_157) @[Conditional.scala 40:58]
    node _GEN_194 = mux(_T_2, _GEN_27, _GEN_145) @[Conditional.scala 40:58]
    node _GEN_195 = mux(_T_2, _GEN_28, _GEN_146) @[Conditional.scala 40:58]
    node _GEN_196 = mux(_T_2, _GEN_29, _GEN_147) @[Conditional.scala 40:58]
    node _GEN_197 = mux(_T_2, _GEN_30, _GEN_148) @[Conditional.scala 40:58]
    node _GEN_198 = mux(_T_2, _GEN_31, _GEN_149) @[Conditional.scala 40:58]
    node _GEN_199 = mux(_T_2, _GEN_32, _GEN_150) @[Conditional.scala 40:58]
    node _GEN_200 = mux(_T_2, _GEN_33, _GEN_151) @[Conditional.scala 40:58]
    node _GEN_201 = mux(_T_2, _GEN_34, _GEN_158) @[Conditional.scala 40:58]
    node _GEN_202 = mux(_T_2, _GEN_35, _GEN_159) @[Conditional.scala 40:58]
    node _GEN_203 = mux(_T_2, _GEN_36, _GEN_144) @[Conditional.scala 40:58]
    node _GEN_204 = validif(eq(_T_2, UInt<1>("h0")), _GEN_138) @[Conditional.scala 40:58]
    node _GEN_205 = validif(eq(_T_2, UInt<1>("h0")), _GEN_139) @[Conditional.scala 40:58]
    node _GEN_206 = validif(eq(_T_2, UInt<1>("h0")), _GEN_140) @[Conditional.scala 40:58]
    node _GEN_207 = validif(eq(_T_2, UInt<1>("h0")), _GEN_141) @[Conditional.scala 40:58]
    node _GEN_208 = validif(eq(_T_2, UInt<1>("h0")), _GEN_142) @[Conditional.scala 40:58]
    node _GEN_209 = mux(_T_2, resReg, _GEN_143) @[Conditional.scala 40:58 WatermanFSM.scala 30:23]
    node _WIRE__0 = pad(UInt<1>("h0"), 2) @[WatermanFSM.scala 20:29 WatermanFSM.scala 20:29]
    node _WIRE__1 = pad(UInt<1>("h0"), 2) @[WatermanFSM.scala 20:29 WatermanFSM.scala 20:29]
    node _WIRE__2 = pad(UInt<1>("h0"), 2) @[WatermanFSM.scala 20:29 WatermanFSM.scala 20:29]
    node _WIRE__3 = pad(UInt<1>("h0"), 2) @[WatermanFSM.scala 20:29 WatermanFSM.scala 20:29]
    node _WIRE__4 = pad(UInt<1>("h0"), 2) @[WatermanFSM.scala 20:29 WatermanFSM.scala 20:29]
    node _WIRE__5 = pad(UInt<1>("h0"), 2) @[WatermanFSM.scala 20:29 WatermanFSM.scala 20:29]
    node _WIRE__6 = pad(UInt<1>("h0"), 2) @[WatermanFSM.scala 20:29 WatermanFSM.scala 20:29]
    node _WIRE_1_0 = pad(UInt<1>("h0"), 2) @[WatermanFSM.scala 21:29 WatermanFSM.scala 21:29]
    node _WIRE_1_1 = pad(UInt<1>("h0"), 2) @[WatermanFSM.scala 21:29 WatermanFSM.scala 21:29]
    node _WIRE_1_2 = pad(UInt<1>("h0"), 2) @[WatermanFSM.scala 21:29 WatermanFSM.scala 21:29]
    node _WIRE_1_3 = pad(UInt<1>("h0"), 2) @[WatermanFSM.scala 21:29 WatermanFSM.scala 21:29]
    node _WIRE_1_4 = pad(UInt<1>("h0"), 2) @[WatermanFSM.scala 21:29 WatermanFSM.scala 21:29]
    node _WIRE_1_5 = pad(UInt<1>("h0"), 2) @[WatermanFSM.scala 21:29 WatermanFSM.scala 21:29]
    node _WIRE_2_0 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 22:32 WatermanFSM.scala 22:32]
    node _WIRE_2_1 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 22:32 WatermanFSM.scala 22:32]
    node _WIRE_2_2 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 22:32 WatermanFSM.scala 22:32]
    node _WIRE_2_3 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 22:32 WatermanFSM.scala 22:32]
    node _WIRE_2_4 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 22:32 WatermanFSM.scala 22:32]
    node _WIRE_2_5 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 22:32 WatermanFSM.scala 22:32]
    node _WIRE_3_0 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 23:35 WatermanFSM.scala 23:35]
    node _WIRE_3_1 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 23:35 WatermanFSM.scala 23:35]
    node _WIRE_3_2 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 23:35 WatermanFSM.scala 23:35]
    node _WIRE_3_3 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 23:35 WatermanFSM.scala 23:35]
    node _WIRE_3_4 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 23:35 WatermanFSM.scala 23:35]
    node _WIRE_3_5 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 23:35 WatermanFSM.scala 23:35]
    node _WIRE_3_6 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 23:35 WatermanFSM.scala 23:35]
    node _WIRE_3_7 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 23:35 WatermanFSM.scala 23:35]
    node _WIRE_4_0 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 24:44 WatermanFSM.scala 24:44]
    node _WIRE_4_1 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 24:44 WatermanFSM.scala 24:44]
    node _WIRE_4_2 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 24:44 WatermanFSM.scala 24:44]
    node _WIRE_4_3 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 24:44 WatermanFSM.scala 24:44]
    node _WIRE_4_4 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 24:44 WatermanFSM.scala 24:44]
    node _WIRE_4_5 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 24:44 WatermanFSM.scala 24:44]
    node _WIRE_4_6 = asSInt(UInt<32>("h0")) @[WatermanFSM.scala 24:44 WatermanFSM.scala 24:44]
    io_in_ready <= _T_1 @[WatermanFSM.scala 43:15]
    io_out_valid <= _T @[WatermanFSM.scala 42:16]
    io_out_bits_score <= resReg @[WatermanFSM.scala 41:21]
    io_out_bits_x <= bits(cntColumnReg, 2, 0) @[WatermanFSM.scala 39:17]
    io_out_bits_y <= bits(cntRowReg, 2, 0) @[WatermanFSM.scala 40:17]
    SReg_0 <= mux(reset, _WIRE__0, _GEN_167) @[WatermanFSM.scala 20:21 WatermanFSM.scala 20:21]
    SReg_1 <= mux(reset, _WIRE__1, _GEN_168) @[WatermanFSM.scala 20:21 WatermanFSM.scala 20:21]
    SReg_2 <= mux(reset, _WIRE__2, _GEN_169) @[WatermanFSM.scala 20:21 WatermanFSM.scala 20:21]
    SReg_3 <= mux(reset, _WIRE__3, _GEN_170) @[WatermanFSM.scala 20:21 WatermanFSM.scala 20:21]
    SReg_4 <= mux(reset, _WIRE__4, _GEN_171) @[WatermanFSM.scala 20:21 WatermanFSM.scala 20:21]
    SReg_5 <= mux(reset, _WIRE__5, _GEN_172) @[WatermanFSM.scala 20:21 WatermanFSM.scala 20:21]
    SReg_6 <= mux(reset, _WIRE__6, _GEN_173) @[WatermanFSM.scala 20:21 WatermanFSM.scala 20:21]
    TReg_0 <= mux(reset, _WIRE_1_0, _GEN_174) @[WatermanFSM.scala 21:21 WatermanFSM.scala 21:21]
    TReg_1 <= mux(reset, _WIRE_1_1, _GEN_175) @[WatermanFSM.scala 21:21 WatermanFSM.scala 21:21]
    TReg_2 <= mux(reset, _WIRE_1_2, _GEN_176) @[WatermanFSM.scala 21:21 WatermanFSM.scala 21:21]
    TReg_3 <= mux(reset, _WIRE_1_3, _GEN_177) @[WatermanFSM.scala 21:21 WatermanFSM.scala 21:21]
    TReg_4 <= mux(reset, _WIRE_1_4, _GEN_178) @[WatermanFSM.scala 21:21 WatermanFSM.scala 21:21]
    TReg_5 <= mux(reset, _WIRE_1_5, _GEN_179) @[WatermanFSM.scala 21:21 WatermanFSM.scala 21:21]
    rowsReg_0 <= mux(reset, _WIRE_2_0, _GEN_188) @[WatermanFSM.scala 22:24 WatermanFSM.scala 22:24]
    rowsReg_1 <= mux(reset, _WIRE_2_1, _GEN_189) @[WatermanFSM.scala 22:24 WatermanFSM.scala 22:24]
    rowsReg_2 <= mux(reset, _WIRE_2_2, _GEN_190) @[WatermanFSM.scala 22:24 WatermanFSM.scala 22:24]
    rowsReg_3 <= mux(reset, _WIRE_2_3, _GEN_191) @[WatermanFSM.scala 22:24 WatermanFSM.scala 22:24]
    rowsReg_4 <= mux(reset, _WIRE_2_4, _GEN_192) @[WatermanFSM.scala 22:24 WatermanFSM.scala 22:24]
    rowsReg_5 <= mux(reset, _WIRE_2_5, _GEN_193) @[WatermanFSM.scala 22:24 WatermanFSM.scala 22:24]
    columnsReg_0 <= mux(reset, _WIRE_3_0, _GEN_180) @[WatermanFSM.scala 23:27 WatermanFSM.scala 23:27]
    columnsReg_1 <= mux(reset, _WIRE_3_1, _GEN_181) @[WatermanFSM.scala 23:27 WatermanFSM.scala 23:27]
    columnsReg_2 <= mux(reset, _WIRE_3_2, _GEN_182) @[WatermanFSM.scala 23:27 WatermanFSM.scala 23:27]
    columnsReg_3 <= mux(reset, _WIRE_3_3, _GEN_183) @[WatermanFSM.scala 23:27 WatermanFSM.scala 23:27]
    columnsReg_4 <= mux(reset, _WIRE_3_4, _GEN_184) @[WatermanFSM.scala 23:27 WatermanFSM.scala 23:27]
    columnsReg_5 <= mux(reset, _WIRE_3_5, _GEN_185) @[WatermanFSM.scala 23:27 WatermanFSM.scala 23:27]
    columnsReg_6 <= mux(reset, _WIRE_3_6, _GEN_186) @[WatermanFSM.scala 23:27 WatermanFSM.scala 23:27]
    columnsReg_7 <= mux(reset, _WIRE_3_7, _GEN_187) @[WatermanFSM.scala 23:27 WatermanFSM.scala 23:27]
    resultingColumnsReg_0 <= mux(reset, _WIRE_4_0, _GEN_194) @[WatermanFSM.scala 24:36 WatermanFSM.scala 24:36]
    resultingColumnsReg_1 <= mux(reset, _WIRE_4_1, _GEN_195) @[WatermanFSM.scala 24:36 WatermanFSM.scala 24:36]
    resultingColumnsReg_2 <= mux(reset, _WIRE_4_2, _GEN_196) @[WatermanFSM.scala 24:36 WatermanFSM.scala 24:36]
    resultingColumnsReg_3 <= mux(reset, _WIRE_4_3, _GEN_197) @[WatermanFSM.scala 24:36 WatermanFSM.scala 24:36]
    resultingColumnsReg_4 <= mux(reset, _WIRE_4_4, _GEN_198) @[WatermanFSM.scala 24:36 WatermanFSM.scala 24:36]
    resultingColumnsReg_5 <= mux(reset, _WIRE_4_5, _GEN_199) @[WatermanFSM.scala 24:36 WatermanFSM.scala 24:36]
    resultingColumnsReg_6 <= mux(reset, _WIRE_4_6, _GEN_200) @[WatermanFSM.scala 24:36 WatermanFSM.scala 24:36]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_203) @[WatermanFSM.scala 27:25 WatermanFSM.scala 27:25]
    cntColumnReg <= mux(reset, UInt<4>("h0"), _GEN_201) @[WatermanFSM.scala 28:29 WatermanFSM.scala 28:29]
    cntRowReg <= mux(reset, UInt<4>("h0"), _GEN_202) @[WatermanFSM.scala 29:26 WatermanFSM.scala 29:26]
    resReg <= mux(reset, asSInt(UInt<1>("h0")), _GEN_209) @[WatermanFSM.scala 30:23 WatermanFSM.scala 30:23]
    pe.clock <= clock
    pe.reset <= reset
    pe.io_upper <= _GEN_204
    pe.io_left <= _GEN_206
    pe.io_diagonal <= _GEN_205
    pe.io_rowElement <= _GEN_207
    pe.io_columnElement <= _GEN_208
    printf(clock, and(and(and(and(UInt<1>("h1"), _T_2), io_in_valid), _T_4), UInt<1>("h1")), "\n") @[WatermanFSM.scala 48:15]
    printf(clock, and(and(and(and(and(and(UInt<1>("h1"), eq(_T_2, UInt<1>("h0"))), eq(_T_5, UInt<1>("h0"))), _T_13), io_out_ready), _T_17), UInt<1>("h1")), "%d ", resReg) @[WatermanFSM.scala 84:15]
    printf(clock, and(and(and(and(and(and(and(UInt<1>("h1"), eq(_T_2, UInt<1>("h0"))), eq(_T_5, UInt<1>("h0"))), _T_13), io_out_ready), _T_20), _T_22), UInt<1>("h1")), "\n") @[WatermanFSM.scala 88:17]
    printf(clock, and(and(and(and(and(and(and(and(UInt<1>("h1"), eq(_T_2, UInt<1>("h0"))), eq(_T_5, UInt<1>("h0"))), _T_13), io_out_ready), eq(_T_20, UInt<1>("h0"))), _T_23), _T_27), UInt<1>("h1")), "\n") @[WatermanFSM.scala 92:17]
