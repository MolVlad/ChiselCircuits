circuit WatermanSystolic :
  module substituteElements :
    input clock : Clock
    input reset : UInt<1>
    input io_first : UInt<2>
    input io_second : UInt<2>
    output io_out : SInt<32>

    node _T = eq(io_first, io_second) @[DNA.scala 28:18]
    node _GEN_0 = mux(_T, asSInt(UInt<2>("h1")), asSInt(UInt<2>("h3"))) @[DNA.scala 28:33 DNA.scala 29:12 DNA.scala 31:12]
    io_out <= _GEN_0

  module processingElementDecoupled :
    input clock : Clock
    input reset : UInt<1>
    output io_fromPreviousPE_ready : UInt<1>
    input io_fromPreviousPE_valid : UInt<1>
    input io_fromPreviousPE_bits_upper : SInt<32>
    input io_fromPreviousPE_bits_diagonal : SInt<32>
    input io_fromPreviousPE_bits_columnElement : UInt<2>
    input io_rowElement : UInt<2>
    input io_reset : UInt<1>
    input io_number : UInt<32>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits_score : SInt<32>
    output io_out_bits_x : UInt<2>
    output io_out_bits_y : UInt<2>
    input io_toNextPE_ready : UInt<1>
    output io_toNextPE_valid : UInt<1>
    output io_toNextPE_bits_upper : SInt<32>
    output io_toNextPE_bits_diagonal : SInt<32>
    output io_toNextPE_bits_columnElement : UInt<2>

    inst substituteElements of substituteElements @[WatermanSystolic.scala 122:34]
    reg stateReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[WatermanSystolic.scala 112:25]
    reg toNextPeValidReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), toNextPeValidReg) @[WatermanSystolic.scala 113:33]
    reg scoreValidReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), scoreValidReg) @[WatermanSystolic.scala 114:30]
    reg previousScore : SInt<32>, clock with :
      reset => (UInt<1>("h0"), previousScore) @[WatermanSystolic.scala 115:30]
    reg leftReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), leftReg) @[WatermanSystolic.scala 116:24]
    reg diagReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), diagReg) @[WatermanSystolic.scala 117:24]
    reg upperReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), upperReg) @[WatermanSystolic.scala 118:25]
    reg columnElementReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), columnElementReg) @[WatermanSystolic.scala 119:33]
    reg stepReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stepReg) @[WatermanSystolic.scala 120:24]
    node _T = add(diagReg, substituteElements.io_out) @[WatermanSystolic.scala 127:19]
    node _T_1 = tail(_T, 1) @[WatermanSystolic.scala 127:19]
    node _T_2 = asSInt(_T_1) @[WatermanSystolic.scala 127:19]
    node _T_3 = sub(upperReg, asSInt(UInt<3>("h2"))) @[WatermanSystolic.scala 128:21]
    node _T_4 = tail(_T_3, 1) @[WatermanSystolic.scala 128:21]
    node _T_5 = asSInt(_T_4) @[WatermanSystolic.scala 128:21]
    node _T_6 = sub(leftReg, asSInt(UInt<3>("h2"))) @[WatermanSystolic.scala 129:19]
    node _T_7 = tail(_T_6, 1) @[WatermanSystolic.scala 129:19]
    node _T_8 = asSInt(_T_7) @[WatermanSystolic.scala 129:19]
    node _T_9 = eq(stateReg, UInt<1>("h0")) @[WatermanSystolic.scala 131:39]
    node diag = _T_2 @[WatermanSystolic.scala 125:31 WatermanSystolic.scala 127:8]
    node upper = _T_5 @[WatermanSystolic.scala 125:31 WatermanSystolic.scala 128:9]
    node _T_10 = gt(diag, upper) @[WatermanSystolic.scala 141:13]
    node _GEN_0 = mux(_T_10, diag, upper) @[WatermanSystolic.scala 141:22 WatermanSystolic.scala 142:17 WatermanSystolic.scala 144:17]
    node left = _T_8 @[WatermanSystolic.scala 125:31 WatermanSystolic.scala 129:8]
    node _T_11 = gt(diag, left) @[WatermanSystolic.scala 146:13]
    node _GEN_1 = mux(_T_11, diag, left) @[WatermanSystolic.scala 146:21 WatermanSystolic.scala 147:16 WatermanSystolic.scala 149:16]
    node diagOrLeft = _GEN_1 @[WatermanSystolic.scala 126:49]
    node diagOrUpper = _GEN_0 @[WatermanSystolic.scala 126:49]
    node _T_12 = gt(diagOrLeft, diagOrUpper) @[WatermanSystolic.scala 151:19]
    node _GEN_2 = mux(_T_12, diagOrLeft, diagOrUpper) @[WatermanSystolic.scala 151:34 WatermanSystolic.scala 152:9 WatermanSystolic.scala 154:9]
    node max = _GEN_2 @[WatermanSystolic.scala 126:49]
    node _T_13 = gt(max, asSInt(UInt<1>("h0"))) @[WatermanSystolic.scala 158:14]
    node _GEN_3 = mux(_T_13, max, asSInt(UInt<1>("h0"))) @[WatermanSystolic.scala 158:35 WatermanSystolic.scala 159:13 WatermanSystolic.scala 161:13]
    node _T_14 = eq(UInt<1>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_4 = mux(io_fromPreviousPE_valid, io_fromPreviousPE_bits_upper, upperReg) @[WatermanSystolic.scala 175:39 WatermanSystolic.scala 176:20 WatermanSystolic.scala 118:25]
    node _GEN_5 = mux(io_fromPreviousPE_valid, io_fromPreviousPE_bits_diagonal, diagReg) @[WatermanSystolic.scala 175:39 WatermanSystolic.scala 177:19 WatermanSystolic.scala 117:24]
    node _GEN_6 = mux(io_fromPreviousPE_valid, io_fromPreviousPE_bits_columnElement, columnElementReg) @[WatermanSystolic.scala 175:39 WatermanSystolic.scala 178:28 WatermanSystolic.scala 119:33]
    node _GEN_7 = mux(io_fromPreviousPE_valid, UInt<1>("h1"), scoreValidReg) @[WatermanSystolic.scala 175:39 WatermanSystolic.scala 180:25 WatermanSystolic.scala 114:30]
    node _GEN_8 = mux(io_fromPreviousPE_valid, UInt<1>("h1"), toNextPeValidReg) @[WatermanSystolic.scala 175:39 WatermanSystolic.scala 181:28 WatermanSystolic.scala 113:33]
    node _GEN_9 = mux(io_fromPreviousPE_valid, UInt<1>("h1"), stateReg) @[WatermanSystolic.scala 175:39 WatermanSystolic.scala 182:20 WatermanSystolic.scala 112:25]
    node _T_15 = eq(UInt<1>("h1"), stateReg) @[Conditional.scala 37:30]
    node _GEN_10 = mux(io_out_ready, UInt<1>("h0"), scoreValidReg) @[WatermanSystolic.scala 186:28 WatermanSystolic.scala 187:25 WatermanSystolic.scala 114:30]
    node _GEN_11 = mux(io_toNextPE_ready, UInt<1>("h0"), toNextPeValidReg) @[WatermanSystolic.scala 189:33 WatermanSystolic.scala 190:28 WatermanSystolic.scala 113:33]
    node _T_16 = or(scoreValidReg, toNextPeValidReg) @[WatermanSystolic.scala 192:30]
    node _T_17 = eq(_T_16, UInt<1>("h0")) @[WatermanSystolic.scala 192:14]
    node _T_18 = add(stepReg, UInt<1>("h1")) @[WatermanSystolic.scala 195:30]
    node _T_19 = tail(_T_18, 1) @[WatermanSystolic.scala 195:30]
    node score = _GEN_3 @[WatermanSystolic.scala 126:49]
    node _GEN_12 = mux(_T_17, score, previousScore) @[WatermanSystolic.scala 192:52 WatermanSystolic.scala 193:25 WatermanSystolic.scala 115:30]
    node _GEN_13 = mux(_T_17, UInt<1>("h0"), stateReg) @[WatermanSystolic.scala 192:52 WatermanSystolic.scala 194:20 WatermanSystolic.scala 112:25]
    node _GEN_14 = mux(_T_17, _T_19, stepReg) @[WatermanSystolic.scala 192:52 WatermanSystolic.scala 195:19 WatermanSystolic.scala 120:24]
    node _GEN_15 = mux(_T_17, score, leftReg) @[WatermanSystolic.scala 192:52 WatermanSystolic.scala 196:19 WatermanSystolic.scala 116:24]
    node _GEN_16 = mux(_T_15, _GEN_10, scoreValidReg) @[Conditional.scala 39:67 WatermanSystolic.scala 114:30]
    node _GEN_17 = mux(_T_15, _GEN_11, toNextPeValidReg) @[Conditional.scala 39:67 WatermanSystolic.scala 113:33]
    node _GEN_18 = mux(_T_15, _GEN_12, previousScore) @[Conditional.scala 39:67 WatermanSystolic.scala 115:30]
    node _GEN_19 = mux(_T_15, _GEN_13, stateReg) @[Conditional.scala 39:67 WatermanSystolic.scala 112:25]
    node _GEN_20 = mux(_T_15, _GEN_14, stepReg) @[Conditional.scala 39:67 WatermanSystolic.scala 120:24]
    node _GEN_21 = mux(_T_15, _GEN_15, leftReg) @[Conditional.scala 39:67 WatermanSystolic.scala 116:24]
    node _GEN_22 = mux(_T_14, _GEN_4, upperReg) @[Conditional.scala 40:58 WatermanSystolic.scala 118:25]
    node _GEN_23 = mux(_T_14, _GEN_5, diagReg) @[Conditional.scala 40:58 WatermanSystolic.scala 117:24]
    node _GEN_24 = mux(_T_14, _GEN_6, columnElementReg) @[Conditional.scala 40:58 WatermanSystolic.scala 119:33]
    node _GEN_25 = mux(_T_14, _GEN_7, _GEN_16) @[Conditional.scala 40:58]
    node _GEN_26 = mux(_T_14, _GEN_8, _GEN_17) @[Conditional.scala 40:58]
    node _GEN_27 = mux(_T_14, _GEN_9, _GEN_19) @[Conditional.scala 40:58]
    node _GEN_28 = mux(_T_14, previousScore, _GEN_18) @[Conditional.scala 40:58 WatermanSystolic.scala 115:30]
    node _GEN_29 = mux(_T_14, stepReg, _GEN_20) @[Conditional.scala 40:58 WatermanSystolic.scala 120:24]
    node _GEN_30 = mux(_T_14, leftReg, _GEN_21) @[Conditional.scala 40:58 WatermanSystolic.scala 116:24]
    node _GEN_31 = mux(io_reset, asSInt(UInt<1>("h0")), _GEN_28) @[WatermanSystolic.scala 167:18 WatermanSystolic.scala 168:19]
    node _GEN_32 = mux(io_reset, asSInt(UInt<1>("h0")), _GEN_30) @[WatermanSystolic.scala 167:18 WatermanSystolic.scala 169:13]
    node _GEN_33 = mux(io_reset, UInt<1>("h0"), _GEN_29) @[WatermanSystolic.scala 167:18 WatermanSystolic.scala 170:13]
    node _GEN_34 = mux(io_reset, UInt<1>("h0"), _GEN_27) @[WatermanSystolic.scala 167:18 WatermanSystolic.scala 171:14]
    node _GEN_35 = mux(io_reset, upperReg, _GEN_22) @[WatermanSystolic.scala 167:18 WatermanSystolic.scala 118:25]
    node _GEN_36 = mux(io_reset, diagReg, _GEN_23) @[WatermanSystolic.scala 167:18 WatermanSystolic.scala 117:24]
    node _GEN_37 = mux(io_reset, columnElementReg, _GEN_24) @[WatermanSystolic.scala 167:18 WatermanSystolic.scala 119:33]
    node _GEN_38 = mux(io_reset, scoreValidReg, _GEN_25) @[WatermanSystolic.scala 167:18 WatermanSystolic.scala 114:30]
    node _GEN_39 = mux(io_reset, toNextPeValidReg, _GEN_26) @[WatermanSystolic.scala 167:18 WatermanSystolic.scala 113:33]
    io_fromPreviousPE_ready <= _T_9 @[WatermanSystolic.scala 131:27]
    io_out_valid <= scoreValidReg @[WatermanSystolic.scala 133:16]
    io_out_bits_score <= score @[WatermanSystolic.scala 134:21]
    io_out_bits_x <= stepReg @[WatermanSystolic.scala 136:17]
    io_out_bits_y <= bits(io_number, 1, 0) @[WatermanSystolic.scala 135:17]
    io_toNextPE_valid <= toNextPeValidReg @[WatermanSystolic.scala 132:21]
    io_toNextPE_bits_upper <= score @[WatermanSystolic.scala 137:26]
    io_toNextPE_bits_diagonal <= previousScore @[WatermanSystolic.scala 138:29]
    io_toNextPE_bits_columnElement <= columnElementReg @[WatermanSystolic.scala 139:34]
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_34) @[WatermanSystolic.scala 112:25 WatermanSystolic.scala 112:25]
    toNextPeValidReg <= mux(reset, UInt<1>("h0"), _GEN_39) @[WatermanSystolic.scala 113:33 WatermanSystolic.scala 113:33]
    scoreValidReg <= mux(reset, UInt<1>("h0"), _GEN_38) @[WatermanSystolic.scala 114:30 WatermanSystolic.scala 114:30]
    previousScore <= mux(reset, asSInt(UInt<32>("h0")), _GEN_31) @[WatermanSystolic.scala 115:30 WatermanSystolic.scala 115:30]
    leftReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_32) @[WatermanSystolic.scala 116:24 WatermanSystolic.scala 116:24]
    diagReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_36) @[WatermanSystolic.scala 117:24 WatermanSystolic.scala 117:24]
    upperReg <= mux(reset, asSInt(UInt<32>("h0")), _GEN_35) @[WatermanSystolic.scala 118:25 WatermanSystolic.scala 118:25]
    columnElementReg <= mux(reset, UInt<1>("h0"), _GEN_37) @[WatermanSystolic.scala 119:33 WatermanSystolic.scala 119:33]
    stepReg <= mux(reset, UInt<2>("h0"), _GEN_33) @[WatermanSystolic.scala 120:24 WatermanSystolic.scala 120:24]
    substituteElements.clock <= clock
    substituteElements.reset <= reset
    substituteElements.io_first <= io_rowElement @[WatermanSystolic.scala 123:31]
    substituteElements.io_second <= columnElementReg @[WatermanSystolic.scala 124:32]

  module WatermanSystolic :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits_S_0 : UInt<2>
    input io_in_bits_S_1 : UInt<2>
    input io_in_bits_S_2 : UInt<2>
    input io_in_bits_S_3 : UInt<2>
    input io_in_bits_T_0 : UInt<2>
    input io_in_bits_T_1 : UInt<2>
    input io_in_bits_T_2 : UInt<2>
    input io_in_bits_T_3 : UInt<2>
    input io_out_0_ready : UInt<1>
    output io_out_0_valid : UInt<1>
    output io_out_0_bits_score : SInt<32>
    output io_out_0_bits_x : UInt<2>
    output io_out_0_bits_y : UInt<2>
    input io_out_1_ready : UInt<1>
    output io_out_1_valid : UInt<1>
    output io_out_1_bits_score : SInt<32>
    output io_out_1_bits_x : UInt<2>
    output io_out_1_bits_y : UInt<2>
    input io_out_2_ready : UInt<1>
    output io_out_2_valid : UInt<1>
    output io_out_2_bits_score : SInt<32>
    output io_out_2_bits_x : UInt<2>
    output io_out_2_bits_y : UInt<2>
    input io_out_3_ready : UInt<1>
    output io_out_3_valid : UInt<1>
    output io_out_3_bits_score : SInt<32>
    output io_out_3_bits_x : UInt<2>
    output io_out_3_bits_y : UInt<2>

    inst processingElementDecoupled of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_1 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_2 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_3 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[WatermanSystolic.scala 18:25]
    reg stepReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stepReg) @[WatermanSystolic.scala 19:24]
    reg TReg_0 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_0) @[WatermanSystolic.scala 20:21]
    reg TReg_1 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_1) @[WatermanSystolic.scala 20:21]
    reg TReg_2 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_2) @[WatermanSystolic.scala 20:21]
    reg TReg_3 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_3) @[WatermanSystolic.scala 20:21]
    reg SReg_0 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_0) @[WatermanSystolic.scala 21:21]
    reg SReg_1 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_1) @[WatermanSystolic.scala 21:21]
    reg SReg_2 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_2) @[WatermanSystolic.scala 21:21]
    reg SReg_3 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_3) @[WatermanSystolic.scala 21:21]
    reg resetReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), resetReg) @[WatermanSystolic.scala 22:25]
    node _T = eq(stateReg, UInt<2>("h1")) @[WatermanSystolic.scala 31:47]
    node _T_1 = eq(stateReg, UInt<2>("h0")) @[WatermanSystolic.scala 54:27]
    node _T_2 = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits_S_0, SReg_0) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_1 = mux(io_in_valid, io_in_bits_S_1, SReg_1) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_2 = mux(io_in_valid, io_in_bits_S_2, SReg_2) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_3 = mux(io_in_valid, io_in_bits_S_3, SReg_3) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_4 = mux(io_in_valid, io_in_bits_T_0, TReg_0) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_5 = mux(io_in_valid, io_in_bits_T_1, TReg_1) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_6 = mux(io_in_valid, io_in_bits_T_2, TReg_2) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_7 = mux(io_in_valid, io_in_bits_T_3, TReg_3) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_8 = mux(io_in_valid, UInt<1>("h0"), resetReg) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 65:18 WatermanSystolic.scala 22:25]
    node _GEN_9 = mux(io_in_valid, UInt<1>("h0"), stepReg) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 66:17 WatermanSystolic.scala 19:24]
    node _GEN_10 = mux(io_in_valid, UInt<2>("h1"), stateReg) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 67:18 WatermanSystolic.scala 18:25]
    node _T_3 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_4 = add(stepReg, UInt<1>("h1")) @[WatermanSystolic.scala 75:28]
    node _T_5 = tail(_T_4, 1) @[WatermanSystolic.scala 75:28]
    node _T_6 = eq(stepReg, UInt<2>("h3")) @[WatermanSystolic.scala 76:22]
    node _GEN_11 = mux(_T_6, UInt<2>("h2"), stateReg) @[WatermanSystolic.scala 76:49 WatermanSystolic.scala 77:20 WatermanSystolic.scala 18:25]
    node PEs_0_fromPreviousPE_ready = processingElementDecoupled.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node _GEN_12 = mux(PEs_0_fromPreviousPE_ready, SReg_1, SReg_0) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_13 = mux(PEs_0_fromPreviousPE_ready, SReg_2, SReg_1) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_14 = mux(PEs_0_fromPreviousPE_ready, SReg_3, SReg_2) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_15 = mux(PEs_0_fromPreviousPE_ready, _T_5, stepReg) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 75:17 WatermanSystolic.scala 19:24]
    node _GEN_16 = mux(PEs_0_fromPreviousPE_ready, _GEN_11, stateReg) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 18:25]
    node _T_7 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node PEs_3_out_bits_x = processingElementDecoupled_3.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node _T_8 = eq(PEs_3_out_bits_x, UInt<2>("h3")) @[WatermanSystolic.scala 82:79]
    node PEs_3_out_valid = processingElementDecoupled_3.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node _T_9 = and(PEs_3_out_valid, _T_8) @[WatermanSystolic.scala 82:44]
    node _GEN_17 = mux(_T_9, UInt<1>("h1"), resetReg) @[WatermanSystolic.scala 82:104 WatermanSystolic.scala 83:18 WatermanSystolic.scala 22:25]
    node _GEN_18 = mux(_T_9, UInt<2>("h0"), stateReg) @[WatermanSystolic.scala 82:104 WatermanSystolic.scala 84:18 WatermanSystolic.scala 18:25]
    node _GEN_19 = mux(_T_7, _GEN_17, resetReg) @[Conditional.scala 39:67 WatermanSystolic.scala 22:25]
    node _GEN_20 = mux(_T_7, _GEN_18, stateReg) @[Conditional.scala 39:67 WatermanSystolic.scala 18:25]
    node _GEN_21 = mux(_T_3, _GEN_12, SReg_0) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_22 = mux(_T_3, _GEN_13, SReg_1) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_23 = mux(_T_3, _GEN_14, SReg_2) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_24 = mux(_T_3, _GEN_15, stepReg) @[Conditional.scala 39:67 WatermanSystolic.scala 19:24]
    node _GEN_25 = mux(_T_3, _GEN_16, _GEN_20) @[Conditional.scala 39:67]
    node _GEN_26 = mux(_T_3, resetReg, _GEN_19) @[Conditional.scala 39:67 WatermanSystolic.scala 22:25]
    node _GEN_27 = mux(_T_2, _GEN_0, _GEN_21) @[Conditional.scala 40:58]
    node _GEN_28 = mux(_T_2, _GEN_1, _GEN_22) @[Conditional.scala 40:58]
    node _GEN_29 = mux(_T_2, _GEN_2, _GEN_23) @[Conditional.scala 40:58]
    node _GEN_30 = mux(_T_2, _GEN_3, SReg_3) @[Conditional.scala 40:58 WatermanSystolic.scala 21:21]
    node _GEN_31 = mux(_T_2, _GEN_4, TReg_0) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_32 = mux(_T_2, _GEN_5, TReg_1) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_33 = mux(_T_2, _GEN_6, TReg_2) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_34 = mux(_T_2, _GEN_7, TReg_3) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_35 = mux(_T_2, _GEN_8, _GEN_26) @[Conditional.scala 40:58]
    node _GEN_36 = mux(_T_2, _GEN_9, _GEN_24) @[Conditional.scala 40:58]
    node _GEN_37 = mux(_T_2, _GEN_10, _GEN_25) @[Conditional.scala 40:58]
    node _WIRE__0 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__1 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__2 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__3 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE_1_0 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_1 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_2 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_3 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node PEs_0_fromPreviousPE_valid = _T @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 31:35]
    node PEs_0_fromPreviousPE_bits_upper = pad(asSInt(UInt<1>("h0")), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 33:40]
    node PEs_0_fromPreviousPE_bits_diagonal = pad(asSInt(UInt<1>("h0")), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 34:43]
    node PEs_0_fromPreviousPE_bits_columnElement = SReg_0 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 32:48]
    node PEs_0_rowElement = TReg_0 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_0_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_0_number = pad(UInt<1>("h0"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_0_out_ready = io_out_0_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_0_out_valid = processingElementDecoupled.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_0_out_bits_score = processingElementDecoupled.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_0_out_bits_x = processingElementDecoupled.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_0_out_bits_y = processingElementDecoupled.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_1_fromPreviousPE_ready = processingElementDecoupled_1.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_0_toNextPE_ready = PEs_1_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_0_toNextPE_valid = processingElementDecoupled.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_0_toNextPE_bits_upper = processingElementDecoupled.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_0_toNextPE_bits_diagonal = processingElementDecoupled.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_0_toNextPE_bits_columnElement = processingElementDecoupled.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_1_fromPreviousPE_valid = PEs_0_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_1_fromPreviousPE_bits_upper = PEs_0_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_1_fromPreviousPE_bits_diagonal = PEs_0_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_1_fromPreviousPE_bits_columnElement = PEs_0_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_1_rowElement = TReg_1 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_1_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_1_number = pad(UInt<1>("h1"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_1_out_ready = io_out_1_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_1_out_valid = processingElementDecoupled_1.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_1_out_bits_score = processingElementDecoupled_1.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_1_out_bits_x = processingElementDecoupled_1.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_1_out_bits_y = processingElementDecoupled_1.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_2_fromPreviousPE_ready = processingElementDecoupled_2.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_1_toNextPE_ready = PEs_2_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_1_toNextPE_valid = processingElementDecoupled_1.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_1_toNextPE_bits_upper = processingElementDecoupled_1.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_1_toNextPE_bits_diagonal = processingElementDecoupled_1.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_1_toNextPE_bits_columnElement = processingElementDecoupled_1.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_2_fromPreviousPE_valid = PEs_1_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_2_fromPreviousPE_bits_upper = PEs_1_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_2_fromPreviousPE_bits_diagonal = PEs_1_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_2_fromPreviousPE_bits_columnElement = PEs_1_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_2_rowElement = TReg_2 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_2_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_2_number = pad(UInt<2>("h2"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_2_out_ready = io_out_2_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_2_out_valid = processingElementDecoupled_2.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_2_out_bits_score = processingElementDecoupled_2.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_2_out_bits_x = processingElementDecoupled_2.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_2_out_bits_y = processingElementDecoupled_2.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_fromPreviousPE_ready = processingElementDecoupled_3.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_2_toNextPE_ready = PEs_3_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_2_toNextPE_valid = processingElementDecoupled_2.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_2_toNextPE_bits_upper = processingElementDecoupled_2.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_2_toNextPE_bits_diagonal = processingElementDecoupled_2.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_2_toNextPE_bits_columnElement = processingElementDecoupled_2.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_fromPreviousPE_valid = PEs_2_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_3_fromPreviousPE_bits_upper = PEs_2_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_3_fromPreviousPE_bits_diagonal = PEs_2_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_3_fromPreviousPE_bits_columnElement = PEs_2_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_3_rowElement = TReg_3 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_3_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_3_number = pad(UInt<2>("h3"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_3_out_ready = io_out_3_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_3_out_bits_score = processingElementDecoupled_3.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_out_bits_y = processingElementDecoupled_3.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_toNextPE_ready = UInt<1>("h1") @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 28:38]
    node PEs_3_toNextPE_valid = processingElementDecoupled_3.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_toNextPE_bits_upper = processingElementDecoupled_3.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_toNextPE_bits_diagonal = processingElementDecoupled_3.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_toNextPE_bits_columnElement = processingElementDecoupled_3.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    io_in_ready <= _T_1 @[WatermanSystolic.scala 54:15]
    io_out_0_valid <= PEs_0_out_valid @[WatermanSystolic.scala 50:21]
    io_out_0_bits_score <= PEs_0_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_0_bits_x <= PEs_0_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_0_bits_y <= PEs_0_out_bits_y @[WatermanSystolic.scala 48:22]
    io_out_1_valid <= PEs_1_out_valid @[WatermanSystolic.scala 50:21]
    io_out_1_bits_score <= PEs_1_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_1_bits_x <= PEs_1_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_1_bits_y <= PEs_1_out_bits_y @[WatermanSystolic.scala 48:22]
    io_out_2_valid <= PEs_2_out_valid @[WatermanSystolic.scala 50:21]
    io_out_2_bits_score <= PEs_2_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_2_bits_x <= PEs_2_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_2_bits_y <= PEs_2_out_bits_y @[WatermanSystolic.scala 48:22]
    io_out_3_valid <= PEs_3_out_valid @[WatermanSystolic.scala 50:21]
    io_out_3_bits_score <= PEs_3_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_3_bits_x <= PEs_3_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_3_bits_y <= PEs_3_out_bits_y @[WatermanSystolic.scala 48:22]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_37) @[WatermanSystolic.scala 18:25 WatermanSystolic.scala 18:25]
    stepReg <= mux(reset, UInt<2>("h0"), _GEN_36) @[WatermanSystolic.scala 19:24 WatermanSystolic.scala 19:24]
    TReg_0 <= mux(reset, _WIRE__0, _GEN_31) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_1 <= mux(reset, _WIRE__1, _GEN_32) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_2 <= mux(reset, _WIRE__2, _GEN_33) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_3 <= mux(reset, _WIRE__3, _GEN_34) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    SReg_0 <= mux(reset, _WIRE_1_0, _GEN_27) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_1 <= mux(reset, _WIRE_1_1, _GEN_28) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_2 <= mux(reset, _WIRE_1_2, _GEN_29) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_3 <= mux(reset, _WIRE_1_3, _GEN_30) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    resetReg <= mux(reset, UInt<1>("h0"), _GEN_35) @[WatermanSystolic.scala 22:25 WatermanSystolic.scala 22:25]
    processingElementDecoupled.clock <= clock
    processingElementDecoupled.reset <= reset
    processingElementDecoupled.io_fromPreviousPE_valid <= PEs_0_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled.io_fromPreviousPE_bits_upper <= PEs_0_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled.io_fromPreviousPE_bits_diagonal <= PEs_0_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled.io_fromPreviousPE_bits_columnElement <= PEs_0_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled.io_rowElement <= PEs_0_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled.io_reset <= PEs_0_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled.io_number <= PEs_0_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled.io_out_ready <= PEs_0_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled.io_toNextPE_ready <= PEs_0_toNextPE_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_1.clock <= clock
    processingElementDecoupled_1.reset <= reset
    processingElementDecoupled_1.io_fromPreviousPE_valid <= PEs_1_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_1.io_fromPreviousPE_bits_upper <= PEs_1_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_1.io_fromPreviousPE_bits_diagonal <= PEs_1_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_1.io_fromPreviousPE_bits_columnElement <= PEs_1_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_1.io_rowElement <= PEs_1_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_1.io_reset <= PEs_1_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_1.io_number <= PEs_1_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_1.io_out_ready <= PEs_1_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_1.io_toNextPE_ready <= PEs_1_toNextPE_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_2.clock <= clock
    processingElementDecoupled_2.reset <= reset
    processingElementDecoupled_2.io_fromPreviousPE_valid <= PEs_2_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_2.io_fromPreviousPE_bits_upper <= PEs_2_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_2.io_fromPreviousPE_bits_diagonal <= PEs_2_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_2.io_fromPreviousPE_bits_columnElement <= PEs_2_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_2.io_rowElement <= PEs_2_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_2.io_reset <= PEs_2_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_2.io_number <= PEs_2_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_2.io_out_ready <= PEs_2_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_2.io_toNextPE_ready <= PEs_2_toNextPE_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_3.clock <= clock
    processingElementDecoupled_3.reset <= reset
    processingElementDecoupled_3.io_fromPreviousPE_valid <= PEs_3_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_3.io_fromPreviousPE_bits_upper <= PEs_3_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_3.io_fromPreviousPE_bits_diagonal <= PEs_3_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_3.io_fromPreviousPE_bits_columnElement <= PEs_3_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_3.io_rowElement <= PEs_3_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_3.io_reset <= PEs_3_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_3.io_number <= PEs_3_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_3.io_out_ready <= PEs_3_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_3.io_toNextPE_ready <= PEs_3_toNextPE_ready @[WatermanSystolic.scala 24:20]
