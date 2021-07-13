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
    output io_out_bits_x : UInt<5>
    output io_out_bits_y : UInt<4>
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
    reg stepReg : UInt<5>, clock with :
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
    io_out_bits_y <= bits(io_number, 3, 0) @[WatermanSystolic.scala 135:17]
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
    stepReg <= mux(reset, UInt<5>("h0"), _GEN_33) @[WatermanSystolic.scala 120:24 WatermanSystolic.scala 120:24]
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
    input io_in_bits_S_4 : UInt<2>
    input io_in_bits_S_5 : UInt<2>
    input io_in_bits_S_6 : UInt<2>
    input io_in_bits_S_7 : UInt<2>
    input io_in_bits_S_8 : UInt<2>
    input io_in_bits_S_9 : UInt<2>
    input io_in_bits_S_10 : UInt<2>
    input io_in_bits_S_11 : UInt<2>
    input io_in_bits_S_12 : UInt<2>
    input io_in_bits_S_13 : UInt<2>
    input io_in_bits_S_14 : UInt<2>
    input io_in_bits_S_15 : UInt<2>
    input io_in_bits_S_16 : UInt<2>
    input io_in_bits_S_17 : UInt<2>
    input io_in_bits_S_18 : UInt<2>
    input io_in_bits_S_19 : UInt<2>
    input io_in_bits_S_20 : UInt<2>
    input io_in_bits_T_0 : UInt<2>
    input io_in_bits_T_1 : UInt<2>
    input io_in_bits_T_2 : UInt<2>
    input io_in_bits_T_3 : UInt<2>
    input io_in_bits_T_4 : UInt<2>
    input io_in_bits_T_5 : UInt<2>
    input io_in_bits_T_6 : UInt<2>
    input io_in_bits_T_7 : UInt<2>
    input io_in_bits_T_8 : UInt<2>
    input io_in_bits_T_9 : UInt<2>
    input io_in_bits_T_10 : UInt<2>
    input io_in_bits_T_11 : UInt<2>
    input io_in_bits_T_12 : UInt<2>
    input io_in_bits_T_13 : UInt<2>
    input io_in_bits_T_14 : UInt<2>
    input io_out_0_ready : UInt<1>
    output io_out_0_valid : UInt<1>
    output io_out_0_bits_score : SInt<32>
    output io_out_0_bits_x : UInt<5>
    output io_out_0_bits_y : UInt<4>
    input io_out_1_ready : UInt<1>
    output io_out_1_valid : UInt<1>
    output io_out_1_bits_score : SInt<32>
    output io_out_1_bits_x : UInt<5>
    output io_out_1_bits_y : UInt<4>
    input io_out_2_ready : UInt<1>
    output io_out_2_valid : UInt<1>
    output io_out_2_bits_score : SInt<32>
    output io_out_2_bits_x : UInt<5>
    output io_out_2_bits_y : UInt<4>
    input io_out_3_ready : UInt<1>
    output io_out_3_valid : UInt<1>
    output io_out_3_bits_score : SInt<32>
    output io_out_3_bits_x : UInt<5>
    output io_out_3_bits_y : UInt<4>
    input io_out_4_ready : UInt<1>
    output io_out_4_valid : UInt<1>
    output io_out_4_bits_score : SInt<32>
    output io_out_4_bits_x : UInt<5>
    output io_out_4_bits_y : UInt<4>
    input io_out_5_ready : UInt<1>
    output io_out_5_valid : UInt<1>
    output io_out_5_bits_score : SInt<32>
    output io_out_5_bits_x : UInt<5>
    output io_out_5_bits_y : UInt<4>
    input io_out_6_ready : UInt<1>
    output io_out_6_valid : UInt<1>
    output io_out_6_bits_score : SInt<32>
    output io_out_6_bits_x : UInt<5>
    output io_out_6_bits_y : UInt<4>
    input io_out_7_ready : UInt<1>
    output io_out_7_valid : UInt<1>
    output io_out_7_bits_score : SInt<32>
    output io_out_7_bits_x : UInt<5>
    output io_out_7_bits_y : UInt<4>
    input io_out_8_ready : UInt<1>
    output io_out_8_valid : UInt<1>
    output io_out_8_bits_score : SInt<32>
    output io_out_8_bits_x : UInt<5>
    output io_out_8_bits_y : UInt<4>
    input io_out_9_ready : UInt<1>
    output io_out_9_valid : UInt<1>
    output io_out_9_bits_score : SInt<32>
    output io_out_9_bits_x : UInt<5>
    output io_out_9_bits_y : UInt<4>
    input io_out_10_ready : UInt<1>
    output io_out_10_valid : UInt<1>
    output io_out_10_bits_score : SInt<32>
    output io_out_10_bits_x : UInt<5>
    output io_out_10_bits_y : UInt<4>
    input io_out_11_ready : UInt<1>
    output io_out_11_valid : UInt<1>
    output io_out_11_bits_score : SInt<32>
    output io_out_11_bits_x : UInt<5>
    output io_out_11_bits_y : UInt<4>
    input io_out_12_ready : UInt<1>
    output io_out_12_valid : UInt<1>
    output io_out_12_bits_score : SInt<32>
    output io_out_12_bits_x : UInt<5>
    output io_out_12_bits_y : UInt<4>
    input io_out_13_ready : UInt<1>
    output io_out_13_valid : UInt<1>
    output io_out_13_bits_score : SInt<32>
    output io_out_13_bits_x : UInt<5>
    output io_out_13_bits_y : UInt<4>
    input io_out_14_ready : UInt<1>
    output io_out_14_valid : UInt<1>
    output io_out_14_bits_score : SInt<32>
    output io_out_14_bits_x : UInt<5>
    output io_out_14_bits_y : UInt<4>

    inst processingElementDecoupled of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_1 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_2 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_3 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_4 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_5 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_6 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_7 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_8 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_9 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_10 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_11 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_12 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_13 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    inst processingElementDecoupled_14 of processingElementDecoupled @[WatermanSystolic.scala 25:11]
    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[WatermanSystolic.scala 18:25]
    reg stepReg : UInt<5>, clock with :
      reset => (UInt<1>("h0"), stepReg) @[WatermanSystolic.scala 19:24]
    reg TReg_0 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_0) @[WatermanSystolic.scala 20:21]
    reg TReg_1 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_1) @[WatermanSystolic.scala 20:21]
    reg TReg_2 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_2) @[WatermanSystolic.scala 20:21]
    reg TReg_3 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_3) @[WatermanSystolic.scala 20:21]
    reg TReg_4 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_4) @[WatermanSystolic.scala 20:21]
    reg TReg_5 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_5) @[WatermanSystolic.scala 20:21]
    reg TReg_6 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_6) @[WatermanSystolic.scala 20:21]
    reg TReg_7 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_7) @[WatermanSystolic.scala 20:21]
    reg TReg_8 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_8) @[WatermanSystolic.scala 20:21]
    reg TReg_9 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_9) @[WatermanSystolic.scala 20:21]
    reg TReg_10 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_10) @[WatermanSystolic.scala 20:21]
    reg TReg_11 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_11) @[WatermanSystolic.scala 20:21]
    reg TReg_12 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_12) @[WatermanSystolic.scala 20:21]
    reg TReg_13 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_13) @[WatermanSystolic.scala 20:21]
    reg TReg_14 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TReg_14) @[WatermanSystolic.scala 20:21]
    reg SReg_0 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_0) @[WatermanSystolic.scala 21:21]
    reg SReg_1 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_1) @[WatermanSystolic.scala 21:21]
    reg SReg_2 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_2) @[WatermanSystolic.scala 21:21]
    reg SReg_3 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_3) @[WatermanSystolic.scala 21:21]
    reg SReg_4 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_4) @[WatermanSystolic.scala 21:21]
    reg SReg_5 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_5) @[WatermanSystolic.scala 21:21]
    reg SReg_6 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_6) @[WatermanSystolic.scala 21:21]
    reg SReg_7 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_7) @[WatermanSystolic.scala 21:21]
    reg SReg_8 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_8) @[WatermanSystolic.scala 21:21]
    reg SReg_9 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_9) @[WatermanSystolic.scala 21:21]
    reg SReg_10 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_10) @[WatermanSystolic.scala 21:21]
    reg SReg_11 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_11) @[WatermanSystolic.scala 21:21]
    reg SReg_12 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_12) @[WatermanSystolic.scala 21:21]
    reg SReg_13 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_13) @[WatermanSystolic.scala 21:21]
    reg SReg_14 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_14) @[WatermanSystolic.scala 21:21]
    reg SReg_15 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_15) @[WatermanSystolic.scala 21:21]
    reg SReg_16 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_16) @[WatermanSystolic.scala 21:21]
    reg SReg_17 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_17) @[WatermanSystolic.scala 21:21]
    reg SReg_18 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_18) @[WatermanSystolic.scala 21:21]
    reg SReg_19 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_19) @[WatermanSystolic.scala 21:21]
    reg SReg_20 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), SReg_20) @[WatermanSystolic.scala 21:21]
    reg resetReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), resetReg) @[WatermanSystolic.scala 22:25]
    node _T = eq(stateReg, UInt<2>("h1")) @[WatermanSystolic.scala 31:47]
    node _T_1 = eq(stateReg, UInt<2>("h0")) @[WatermanSystolic.scala 54:27]
    node _T_2 = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in_valid, io_in_bits_S_0, SReg_0) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_1 = mux(io_in_valid, io_in_bits_S_1, SReg_1) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_2 = mux(io_in_valid, io_in_bits_S_2, SReg_2) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_3 = mux(io_in_valid, io_in_bits_S_3, SReg_3) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_4 = mux(io_in_valid, io_in_bits_S_4, SReg_4) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_5 = mux(io_in_valid, io_in_bits_S_5, SReg_5) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_6 = mux(io_in_valid, io_in_bits_S_6, SReg_6) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_7 = mux(io_in_valid, io_in_bits_S_7, SReg_7) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_8 = mux(io_in_valid, io_in_bits_S_8, SReg_8) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_9 = mux(io_in_valid, io_in_bits_S_9, SReg_9) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_10 = mux(io_in_valid, io_in_bits_S_10, SReg_10) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_11 = mux(io_in_valid, io_in_bits_S_11, SReg_11) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_12 = mux(io_in_valid, io_in_bits_S_12, SReg_12) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_13 = mux(io_in_valid, io_in_bits_S_13, SReg_13) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_14 = mux(io_in_valid, io_in_bits_S_14, SReg_14) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_15 = mux(io_in_valid, io_in_bits_S_15, SReg_15) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_16 = mux(io_in_valid, io_in_bits_S_16, SReg_16) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_17 = mux(io_in_valid, io_in_bits_S_17, SReg_17) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_18 = mux(io_in_valid, io_in_bits_S_18, SReg_18) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_19 = mux(io_in_valid, io_in_bits_S_19, SReg_19) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_20 = mux(io_in_valid, io_in_bits_S_20, SReg_20) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 60:19 WatermanSystolic.scala 21:21]
    node _GEN_21 = mux(io_in_valid, io_in_bits_T_0, TReg_0) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_22 = mux(io_in_valid, io_in_bits_T_1, TReg_1) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_23 = mux(io_in_valid, io_in_bits_T_2, TReg_2) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_24 = mux(io_in_valid, io_in_bits_T_3, TReg_3) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_25 = mux(io_in_valid, io_in_bits_T_4, TReg_4) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_26 = mux(io_in_valid, io_in_bits_T_5, TReg_5) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_27 = mux(io_in_valid, io_in_bits_T_6, TReg_6) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_28 = mux(io_in_valid, io_in_bits_T_7, TReg_7) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_29 = mux(io_in_valid, io_in_bits_T_8, TReg_8) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_30 = mux(io_in_valid, io_in_bits_T_9, TReg_9) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_31 = mux(io_in_valid, io_in_bits_T_10, TReg_10) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_32 = mux(io_in_valid, io_in_bits_T_11, TReg_11) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_33 = mux(io_in_valid, io_in_bits_T_12, TReg_12) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_34 = mux(io_in_valid, io_in_bits_T_13, TReg_13) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_35 = mux(io_in_valid, io_in_bits_T_14, TReg_14) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 63:19 WatermanSystolic.scala 20:21]
    node _GEN_36 = mux(io_in_valid, UInt<1>("h0"), resetReg) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 65:18 WatermanSystolic.scala 22:25]
    node _GEN_37 = mux(io_in_valid, UInt<1>("h0"), stepReg) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 66:17 WatermanSystolic.scala 19:24]
    node _GEN_38 = mux(io_in_valid, UInt<2>("h1"), stateReg) @[WatermanSystolic.scala 58:25 WatermanSystolic.scala 67:18 WatermanSystolic.scala 18:25]
    node _T_3 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_4 = add(stepReg, UInt<1>("h1")) @[WatermanSystolic.scala 75:28]
    node _T_5 = tail(_T_4, 1) @[WatermanSystolic.scala 75:28]
    node _T_6 = eq(stepReg, UInt<5>("h14")) @[WatermanSystolic.scala 76:22]
    node _GEN_39 = mux(_T_6, UInt<2>("h2"), stateReg) @[WatermanSystolic.scala 76:49 WatermanSystolic.scala 77:20 WatermanSystolic.scala 18:25]
    node PEs_0_fromPreviousPE_ready = processingElementDecoupled.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node _GEN_40 = mux(PEs_0_fromPreviousPE_ready, SReg_1, SReg_0) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_41 = mux(PEs_0_fromPreviousPE_ready, SReg_2, SReg_1) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_42 = mux(PEs_0_fromPreviousPE_ready, SReg_3, SReg_2) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_43 = mux(PEs_0_fromPreviousPE_ready, SReg_4, SReg_3) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_44 = mux(PEs_0_fromPreviousPE_ready, SReg_5, SReg_4) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_45 = mux(PEs_0_fromPreviousPE_ready, SReg_6, SReg_5) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_46 = mux(PEs_0_fromPreviousPE_ready, SReg_7, SReg_6) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_47 = mux(PEs_0_fromPreviousPE_ready, SReg_8, SReg_7) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_48 = mux(PEs_0_fromPreviousPE_ready, SReg_9, SReg_8) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_49 = mux(PEs_0_fromPreviousPE_ready, SReg_10, SReg_9) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_50 = mux(PEs_0_fromPreviousPE_ready, SReg_11, SReg_10) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_51 = mux(PEs_0_fromPreviousPE_ready, SReg_12, SReg_11) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_52 = mux(PEs_0_fromPreviousPE_ready, SReg_13, SReg_12) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_53 = mux(PEs_0_fromPreviousPE_ready, SReg_14, SReg_13) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_54 = mux(PEs_0_fromPreviousPE_ready, SReg_15, SReg_14) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_55 = mux(PEs_0_fromPreviousPE_ready, SReg_16, SReg_15) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_56 = mux(PEs_0_fromPreviousPE_ready, SReg_17, SReg_16) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_57 = mux(PEs_0_fromPreviousPE_ready, SReg_18, SReg_17) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_58 = mux(PEs_0_fromPreviousPE_ready, SReg_19, SReg_18) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_59 = mux(PEs_0_fromPreviousPE_ready, SReg_20, SReg_19) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 73:19 WatermanSystolic.scala 21:21]
    node _GEN_60 = mux(PEs_0_fromPreviousPE_ready, _T_5, stepReg) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 75:17 WatermanSystolic.scala 19:24]
    node _GEN_61 = mux(PEs_0_fromPreviousPE_ready, _GEN_39, stateReg) @[WatermanSystolic.scala 71:41 WatermanSystolic.scala 18:25]
    node _T_7 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node PEs_14_out_bits_x = processingElementDecoupled_14.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node _T_8 = eq(PEs_14_out_bits_x, UInt<4>("he")) @[WatermanSystolic.scala 82:79]
    node PEs_14_out_valid = processingElementDecoupled_14.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node _T_9 = and(PEs_14_out_valid, _T_8) @[WatermanSystolic.scala 82:44]
    node _GEN_62 = mux(_T_9, UInt<1>("h1"), resetReg) @[WatermanSystolic.scala 82:104 WatermanSystolic.scala 83:18 WatermanSystolic.scala 22:25]
    node _GEN_63 = mux(_T_9, UInt<2>("h0"), stateReg) @[WatermanSystolic.scala 82:104 WatermanSystolic.scala 84:18 WatermanSystolic.scala 18:25]
    node _GEN_64 = mux(_T_7, _GEN_62, resetReg) @[Conditional.scala 39:67 WatermanSystolic.scala 22:25]
    node _GEN_65 = mux(_T_7, _GEN_63, stateReg) @[Conditional.scala 39:67 WatermanSystolic.scala 18:25]
    node _GEN_66 = mux(_T_3, _GEN_40, SReg_0) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_67 = mux(_T_3, _GEN_41, SReg_1) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_68 = mux(_T_3, _GEN_42, SReg_2) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_69 = mux(_T_3, _GEN_43, SReg_3) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_70 = mux(_T_3, _GEN_44, SReg_4) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_71 = mux(_T_3, _GEN_45, SReg_5) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_72 = mux(_T_3, _GEN_46, SReg_6) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_73 = mux(_T_3, _GEN_47, SReg_7) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_74 = mux(_T_3, _GEN_48, SReg_8) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_75 = mux(_T_3, _GEN_49, SReg_9) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_76 = mux(_T_3, _GEN_50, SReg_10) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_77 = mux(_T_3, _GEN_51, SReg_11) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_78 = mux(_T_3, _GEN_52, SReg_12) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_79 = mux(_T_3, _GEN_53, SReg_13) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_80 = mux(_T_3, _GEN_54, SReg_14) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_81 = mux(_T_3, _GEN_55, SReg_15) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_82 = mux(_T_3, _GEN_56, SReg_16) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_83 = mux(_T_3, _GEN_57, SReg_17) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_84 = mux(_T_3, _GEN_58, SReg_18) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_85 = mux(_T_3, _GEN_59, SReg_19) @[Conditional.scala 39:67 WatermanSystolic.scala 21:21]
    node _GEN_86 = mux(_T_3, _GEN_60, stepReg) @[Conditional.scala 39:67 WatermanSystolic.scala 19:24]
    node _GEN_87 = mux(_T_3, _GEN_61, _GEN_65) @[Conditional.scala 39:67]
    node _GEN_88 = mux(_T_3, resetReg, _GEN_64) @[Conditional.scala 39:67 WatermanSystolic.scala 22:25]
    node _GEN_89 = mux(_T_2, _GEN_0, _GEN_66) @[Conditional.scala 40:58]
    node _GEN_90 = mux(_T_2, _GEN_1, _GEN_67) @[Conditional.scala 40:58]
    node _GEN_91 = mux(_T_2, _GEN_2, _GEN_68) @[Conditional.scala 40:58]
    node _GEN_92 = mux(_T_2, _GEN_3, _GEN_69) @[Conditional.scala 40:58]
    node _GEN_93 = mux(_T_2, _GEN_4, _GEN_70) @[Conditional.scala 40:58]
    node _GEN_94 = mux(_T_2, _GEN_5, _GEN_71) @[Conditional.scala 40:58]
    node _GEN_95 = mux(_T_2, _GEN_6, _GEN_72) @[Conditional.scala 40:58]
    node _GEN_96 = mux(_T_2, _GEN_7, _GEN_73) @[Conditional.scala 40:58]
    node _GEN_97 = mux(_T_2, _GEN_8, _GEN_74) @[Conditional.scala 40:58]
    node _GEN_98 = mux(_T_2, _GEN_9, _GEN_75) @[Conditional.scala 40:58]
    node _GEN_99 = mux(_T_2, _GEN_10, _GEN_76) @[Conditional.scala 40:58]
    node _GEN_100 = mux(_T_2, _GEN_11, _GEN_77) @[Conditional.scala 40:58]
    node _GEN_101 = mux(_T_2, _GEN_12, _GEN_78) @[Conditional.scala 40:58]
    node _GEN_102 = mux(_T_2, _GEN_13, _GEN_79) @[Conditional.scala 40:58]
    node _GEN_103 = mux(_T_2, _GEN_14, _GEN_80) @[Conditional.scala 40:58]
    node _GEN_104 = mux(_T_2, _GEN_15, _GEN_81) @[Conditional.scala 40:58]
    node _GEN_105 = mux(_T_2, _GEN_16, _GEN_82) @[Conditional.scala 40:58]
    node _GEN_106 = mux(_T_2, _GEN_17, _GEN_83) @[Conditional.scala 40:58]
    node _GEN_107 = mux(_T_2, _GEN_18, _GEN_84) @[Conditional.scala 40:58]
    node _GEN_108 = mux(_T_2, _GEN_19, _GEN_85) @[Conditional.scala 40:58]
    node _GEN_109 = mux(_T_2, _GEN_20, SReg_20) @[Conditional.scala 40:58 WatermanSystolic.scala 21:21]
    node _GEN_110 = mux(_T_2, _GEN_21, TReg_0) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_111 = mux(_T_2, _GEN_22, TReg_1) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_112 = mux(_T_2, _GEN_23, TReg_2) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_113 = mux(_T_2, _GEN_24, TReg_3) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_114 = mux(_T_2, _GEN_25, TReg_4) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_115 = mux(_T_2, _GEN_26, TReg_5) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_116 = mux(_T_2, _GEN_27, TReg_6) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_117 = mux(_T_2, _GEN_28, TReg_7) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_118 = mux(_T_2, _GEN_29, TReg_8) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_119 = mux(_T_2, _GEN_30, TReg_9) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_120 = mux(_T_2, _GEN_31, TReg_10) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_121 = mux(_T_2, _GEN_32, TReg_11) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_122 = mux(_T_2, _GEN_33, TReg_12) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_123 = mux(_T_2, _GEN_34, TReg_13) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_124 = mux(_T_2, _GEN_35, TReg_14) @[Conditional.scala 40:58 WatermanSystolic.scala 20:21]
    node _GEN_125 = mux(_T_2, _GEN_36, _GEN_88) @[Conditional.scala 40:58]
    node _GEN_126 = mux(_T_2, _GEN_37, _GEN_86) @[Conditional.scala 40:58]
    node _GEN_127 = mux(_T_2, _GEN_38, _GEN_87) @[Conditional.scala 40:58]
    node _WIRE__0 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__1 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__2 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__3 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__4 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__5 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__6 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__7 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__8 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__9 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__10 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__11 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__12 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__13 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE__14 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 20:29 WatermanSystolic.scala 20:29]
    node _WIRE_1_0 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_1 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_2 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_3 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_4 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_5 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_6 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_7 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_8 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_9 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_10 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_11 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_12 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_13 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_14 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_15 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_16 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_17 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_18 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_19 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
    node _WIRE_1_20 = pad(UInt<1>("h0"), 2) @[WatermanSystolic.scala 21:29 WatermanSystolic.scala 21:29]
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
    node PEs_3_out_valid = processingElementDecoupled_3.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_out_bits_score = processingElementDecoupled_3.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_out_bits_x = processingElementDecoupled_3.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_out_bits_y = processingElementDecoupled_3.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_4_fromPreviousPE_ready = processingElementDecoupled_4.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_toNextPE_ready = PEs_4_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_3_toNextPE_valid = processingElementDecoupled_3.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_toNextPE_bits_upper = processingElementDecoupled_3.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_toNextPE_bits_diagonal = processingElementDecoupled_3.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_3_toNextPE_bits_columnElement = processingElementDecoupled_3.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_4_fromPreviousPE_valid = PEs_3_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_4_fromPreviousPE_bits_upper = PEs_3_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_4_fromPreviousPE_bits_diagonal = PEs_3_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_4_fromPreviousPE_bits_columnElement = PEs_3_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_4_rowElement = TReg_4 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_4_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_4_number = pad(UInt<3>("h4"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_4_out_ready = io_out_4_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_4_out_valid = processingElementDecoupled_4.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_4_out_bits_score = processingElementDecoupled_4.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_4_out_bits_x = processingElementDecoupled_4.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_4_out_bits_y = processingElementDecoupled_4.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_5_fromPreviousPE_ready = processingElementDecoupled_5.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_4_toNextPE_ready = PEs_5_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_4_toNextPE_valid = processingElementDecoupled_4.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_4_toNextPE_bits_upper = processingElementDecoupled_4.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_4_toNextPE_bits_diagonal = processingElementDecoupled_4.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_4_toNextPE_bits_columnElement = processingElementDecoupled_4.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_5_fromPreviousPE_valid = PEs_4_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_5_fromPreviousPE_bits_upper = PEs_4_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_5_fromPreviousPE_bits_diagonal = PEs_4_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_5_fromPreviousPE_bits_columnElement = PEs_4_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_5_rowElement = TReg_5 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_5_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_5_number = pad(UInt<3>("h5"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_5_out_ready = io_out_5_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_5_out_valid = processingElementDecoupled_5.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_5_out_bits_score = processingElementDecoupled_5.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_5_out_bits_x = processingElementDecoupled_5.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_5_out_bits_y = processingElementDecoupled_5.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_6_fromPreviousPE_ready = processingElementDecoupled_6.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_5_toNextPE_ready = PEs_6_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_5_toNextPE_valid = processingElementDecoupled_5.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_5_toNextPE_bits_upper = processingElementDecoupled_5.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_5_toNextPE_bits_diagonal = processingElementDecoupled_5.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_5_toNextPE_bits_columnElement = processingElementDecoupled_5.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_6_fromPreviousPE_valid = PEs_5_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_6_fromPreviousPE_bits_upper = PEs_5_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_6_fromPreviousPE_bits_diagonal = PEs_5_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_6_fromPreviousPE_bits_columnElement = PEs_5_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_6_rowElement = TReg_6 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_6_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_6_number = pad(UInt<3>("h6"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_6_out_ready = io_out_6_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_6_out_valid = processingElementDecoupled_6.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_6_out_bits_score = processingElementDecoupled_6.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_6_out_bits_x = processingElementDecoupled_6.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_6_out_bits_y = processingElementDecoupled_6.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_7_fromPreviousPE_ready = processingElementDecoupled_7.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_6_toNextPE_ready = PEs_7_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_6_toNextPE_valid = processingElementDecoupled_6.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_6_toNextPE_bits_upper = processingElementDecoupled_6.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_6_toNextPE_bits_diagonal = processingElementDecoupled_6.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_6_toNextPE_bits_columnElement = processingElementDecoupled_6.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_7_fromPreviousPE_valid = PEs_6_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_7_fromPreviousPE_bits_upper = PEs_6_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_7_fromPreviousPE_bits_diagonal = PEs_6_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_7_fromPreviousPE_bits_columnElement = PEs_6_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_7_rowElement = TReg_7 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_7_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_7_number = pad(UInt<3>("h7"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_7_out_ready = io_out_7_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_7_out_valid = processingElementDecoupled_7.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_7_out_bits_score = processingElementDecoupled_7.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_7_out_bits_x = processingElementDecoupled_7.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_7_out_bits_y = processingElementDecoupled_7.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_8_fromPreviousPE_ready = processingElementDecoupled_8.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_7_toNextPE_ready = PEs_8_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_7_toNextPE_valid = processingElementDecoupled_7.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_7_toNextPE_bits_upper = processingElementDecoupled_7.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_7_toNextPE_bits_diagonal = processingElementDecoupled_7.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_7_toNextPE_bits_columnElement = processingElementDecoupled_7.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_8_fromPreviousPE_valid = PEs_7_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_8_fromPreviousPE_bits_upper = PEs_7_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_8_fromPreviousPE_bits_diagonal = PEs_7_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_8_fromPreviousPE_bits_columnElement = PEs_7_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_8_rowElement = TReg_8 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_8_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_8_number = pad(UInt<4>("h8"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_8_out_ready = io_out_8_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_8_out_valid = processingElementDecoupled_8.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_8_out_bits_score = processingElementDecoupled_8.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_8_out_bits_x = processingElementDecoupled_8.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_8_out_bits_y = processingElementDecoupled_8.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_9_fromPreviousPE_ready = processingElementDecoupled_9.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_8_toNextPE_ready = PEs_9_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_8_toNextPE_valid = processingElementDecoupled_8.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_8_toNextPE_bits_upper = processingElementDecoupled_8.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_8_toNextPE_bits_diagonal = processingElementDecoupled_8.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_8_toNextPE_bits_columnElement = processingElementDecoupled_8.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_9_fromPreviousPE_valid = PEs_8_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_9_fromPreviousPE_bits_upper = PEs_8_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_9_fromPreviousPE_bits_diagonal = PEs_8_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_9_fromPreviousPE_bits_columnElement = PEs_8_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_9_rowElement = TReg_9 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_9_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_9_number = pad(UInt<4>("h9"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_9_out_ready = io_out_9_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_9_out_valid = processingElementDecoupled_9.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_9_out_bits_score = processingElementDecoupled_9.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_9_out_bits_x = processingElementDecoupled_9.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_9_out_bits_y = processingElementDecoupled_9.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_10_fromPreviousPE_ready = processingElementDecoupled_10.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_9_toNextPE_ready = PEs_10_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_9_toNextPE_valid = processingElementDecoupled_9.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_9_toNextPE_bits_upper = processingElementDecoupled_9.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_9_toNextPE_bits_diagonal = processingElementDecoupled_9.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_9_toNextPE_bits_columnElement = processingElementDecoupled_9.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_10_fromPreviousPE_valid = PEs_9_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_10_fromPreviousPE_bits_upper = PEs_9_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_10_fromPreviousPE_bits_diagonal = PEs_9_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_10_fromPreviousPE_bits_columnElement = PEs_9_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_10_rowElement = TReg_10 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_10_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_10_number = pad(UInt<4>("ha"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_10_out_ready = io_out_10_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_10_out_valid = processingElementDecoupled_10.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_10_out_bits_score = processingElementDecoupled_10.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_10_out_bits_x = processingElementDecoupled_10.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_10_out_bits_y = processingElementDecoupled_10.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_11_fromPreviousPE_ready = processingElementDecoupled_11.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_10_toNextPE_ready = PEs_11_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_10_toNextPE_valid = processingElementDecoupled_10.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_10_toNextPE_bits_upper = processingElementDecoupled_10.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_10_toNextPE_bits_diagonal = processingElementDecoupled_10.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_10_toNextPE_bits_columnElement = processingElementDecoupled_10.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_11_fromPreviousPE_valid = PEs_10_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_11_fromPreviousPE_bits_upper = PEs_10_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_11_fromPreviousPE_bits_diagonal = PEs_10_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_11_fromPreviousPE_bits_columnElement = PEs_10_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_11_rowElement = TReg_11 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_11_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_11_number = pad(UInt<4>("hb"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_11_out_ready = io_out_11_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_11_out_valid = processingElementDecoupled_11.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_11_out_bits_score = processingElementDecoupled_11.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_11_out_bits_x = processingElementDecoupled_11.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_11_out_bits_y = processingElementDecoupled_11.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_12_fromPreviousPE_ready = processingElementDecoupled_12.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_11_toNextPE_ready = PEs_12_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_11_toNextPE_valid = processingElementDecoupled_11.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_11_toNextPE_bits_upper = processingElementDecoupled_11.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_11_toNextPE_bits_diagonal = processingElementDecoupled_11.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_11_toNextPE_bits_columnElement = processingElementDecoupled_11.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_12_fromPreviousPE_valid = PEs_11_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_12_fromPreviousPE_bits_upper = PEs_11_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_12_fromPreviousPE_bits_diagonal = PEs_11_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_12_fromPreviousPE_bits_columnElement = PEs_11_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_12_rowElement = TReg_12 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_12_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_12_number = pad(UInt<4>("hc"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_12_out_ready = io_out_12_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_12_out_valid = processingElementDecoupled_12.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_12_out_bits_score = processingElementDecoupled_12.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_12_out_bits_x = processingElementDecoupled_12.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_12_out_bits_y = processingElementDecoupled_12.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_13_fromPreviousPE_ready = processingElementDecoupled_13.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_12_toNextPE_ready = PEs_13_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_12_toNextPE_valid = processingElementDecoupled_12.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_12_toNextPE_bits_upper = processingElementDecoupled_12.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_12_toNextPE_bits_diagonal = processingElementDecoupled_12.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_12_toNextPE_bits_columnElement = processingElementDecoupled_12.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_13_fromPreviousPE_valid = PEs_12_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_13_fromPreviousPE_bits_upper = PEs_12_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_13_fromPreviousPE_bits_diagonal = PEs_12_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_13_fromPreviousPE_bits_columnElement = PEs_12_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_13_rowElement = TReg_13 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_13_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_13_number = pad(UInt<4>("hd"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_13_out_ready = io_out_13_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_13_out_valid = processingElementDecoupled_13.io_out_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_13_out_bits_score = processingElementDecoupled_13.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_13_out_bits_x = processingElementDecoupled_13.io_out_bits_x @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_13_out_bits_y = processingElementDecoupled_13.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_14_fromPreviousPE_ready = processingElementDecoupled_14.io_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_13_toNextPE_ready = PEs_14_fromPreviousPE_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 36:33]
    node PEs_13_toNextPE_valid = processingElementDecoupled_13.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_13_toNextPE_bits_upper = processingElementDecoupled_13.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_13_toNextPE_bits_diagonal = processingElementDecoupled_13.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_13_toNextPE_bits_columnElement = processingElementDecoupled_13.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_14_fromPreviousPE_valid = PEs_13_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 37:35]
    node PEs_14_fromPreviousPE_bits_upper = PEs_13_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 38:40]
    node PEs_14_fromPreviousPE_bits_diagonal = PEs_13_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 39:43]
    node PEs_14_fromPreviousPE_bits_columnElement = PEs_13_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 40:48]
    node PEs_14_rowElement = TReg_14 @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
    node PEs_14_reset = resetReg @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
    node PEs_14_number = pad(UInt<4>("he"), 32) @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
    node PEs_14_out_ready = io_out_14_ready @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
    node PEs_14_out_bits_score = processingElementDecoupled_14.io_out_bits_score @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_14_out_bits_y = processingElementDecoupled_14.io_out_bits_y @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_14_toNextPE_ready = UInt<1>("h1") @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 28:38]
    node PEs_14_toNextPE_valid = processingElementDecoupled_14.io_toNextPE_valid @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_14_toNextPE_bits_upper = processingElementDecoupled_14.io_toNextPE_bits_upper @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_14_toNextPE_bits_diagonal = processingElementDecoupled_14.io_toNextPE_bits_diagonal @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
    node PEs_14_toNextPE_bits_columnElement = processingElementDecoupled_14.io_toNextPE_bits_columnElement @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
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
    io_out_4_valid <= PEs_4_out_valid @[WatermanSystolic.scala 50:21]
    io_out_4_bits_score <= PEs_4_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_4_bits_x <= PEs_4_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_4_bits_y <= PEs_4_out_bits_y @[WatermanSystolic.scala 48:22]
    io_out_5_valid <= PEs_5_out_valid @[WatermanSystolic.scala 50:21]
    io_out_5_bits_score <= PEs_5_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_5_bits_x <= PEs_5_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_5_bits_y <= PEs_5_out_bits_y @[WatermanSystolic.scala 48:22]
    io_out_6_valid <= PEs_6_out_valid @[WatermanSystolic.scala 50:21]
    io_out_6_bits_score <= PEs_6_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_6_bits_x <= PEs_6_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_6_bits_y <= PEs_6_out_bits_y @[WatermanSystolic.scala 48:22]
    io_out_7_valid <= PEs_7_out_valid @[WatermanSystolic.scala 50:21]
    io_out_7_bits_score <= PEs_7_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_7_bits_x <= PEs_7_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_7_bits_y <= PEs_7_out_bits_y @[WatermanSystolic.scala 48:22]
    io_out_8_valid <= PEs_8_out_valid @[WatermanSystolic.scala 50:21]
    io_out_8_bits_score <= PEs_8_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_8_bits_x <= PEs_8_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_8_bits_y <= PEs_8_out_bits_y @[WatermanSystolic.scala 48:22]
    io_out_9_valid <= PEs_9_out_valid @[WatermanSystolic.scala 50:21]
    io_out_9_bits_score <= PEs_9_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_9_bits_x <= PEs_9_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_9_bits_y <= PEs_9_out_bits_y @[WatermanSystolic.scala 48:22]
    io_out_10_valid <= PEs_10_out_valid @[WatermanSystolic.scala 50:21]
    io_out_10_bits_score <= PEs_10_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_10_bits_x <= PEs_10_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_10_bits_y <= PEs_10_out_bits_y @[WatermanSystolic.scala 48:22]
    io_out_11_valid <= PEs_11_out_valid @[WatermanSystolic.scala 50:21]
    io_out_11_bits_score <= PEs_11_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_11_bits_x <= PEs_11_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_11_bits_y <= PEs_11_out_bits_y @[WatermanSystolic.scala 48:22]
    io_out_12_valid <= PEs_12_out_valid @[WatermanSystolic.scala 50:21]
    io_out_12_bits_score <= PEs_12_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_12_bits_x <= PEs_12_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_12_bits_y <= PEs_12_out_bits_y @[WatermanSystolic.scala 48:22]
    io_out_13_valid <= PEs_13_out_valid @[WatermanSystolic.scala 50:21]
    io_out_13_bits_score <= PEs_13_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_13_bits_x <= PEs_13_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_13_bits_y <= PEs_13_out_bits_y @[WatermanSystolic.scala 48:22]
    io_out_14_valid <= PEs_14_out_valid @[WatermanSystolic.scala 50:21]
    io_out_14_bits_score <= PEs_14_out_bits_score @[WatermanSystolic.scala 49:26]
    io_out_14_bits_x <= PEs_14_out_bits_x @[WatermanSystolic.scala 47:22]
    io_out_14_bits_y <= PEs_14_out_bits_y @[WatermanSystolic.scala 48:22]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_127) @[WatermanSystolic.scala 18:25 WatermanSystolic.scala 18:25]
    stepReg <= mux(reset, UInt<5>("h0"), _GEN_126) @[WatermanSystolic.scala 19:24 WatermanSystolic.scala 19:24]
    TReg_0 <= mux(reset, _WIRE__0, _GEN_110) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_1 <= mux(reset, _WIRE__1, _GEN_111) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_2 <= mux(reset, _WIRE__2, _GEN_112) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_3 <= mux(reset, _WIRE__3, _GEN_113) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_4 <= mux(reset, _WIRE__4, _GEN_114) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_5 <= mux(reset, _WIRE__5, _GEN_115) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_6 <= mux(reset, _WIRE__6, _GEN_116) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_7 <= mux(reset, _WIRE__7, _GEN_117) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_8 <= mux(reset, _WIRE__8, _GEN_118) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_9 <= mux(reset, _WIRE__9, _GEN_119) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_10 <= mux(reset, _WIRE__10, _GEN_120) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_11 <= mux(reset, _WIRE__11, _GEN_121) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_12 <= mux(reset, _WIRE__12, _GEN_122) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_13 <= mux(reset, _WIRE__13, _GEN_123) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    TReg_14 <= mux(reset, _WIRE__14, _GEN_124) @[WatermanSystolic.scala 20:21 WatermanSystolic.scala 20:21]
    SReg_0 <= mux(reset, _WIRE_1_0, _GEN_89) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_1 <= mux(reset, _WIRE_1_1, _GEN_90) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_2 <= mux(reset, _WIRE_1_2, _GEN_91) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_3 <= mux(reset, _WIRE_1_3, _GEN_92) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_4 <= mux(reset, _WIRE_1_4, _GEN_93) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_5 <= mux(reset, _WIRE_1_5, _GEN_94) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_6 <= mux(reset, _WIRE_1_6, _GEN_95) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_7 <= mux(reset, _WIRE_1_7, _GEN_96) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_8 <= mux(reset, _WIRE_1_8, _GEN_97) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_9 <= mux(reset, _WIRE_1_9, _GEN_98) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_10 <= mux(reset, _WIRE_1_10, _GEN_99) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_11 <= mux(reset, _WIRE_1_11, _GEN_100) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_12 <= mux(reset, _WIRE_1_12, _GEN_101) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_13 <= mux(reset, _WIRE_1_13, _GEN_102) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_14 <= mux(reset, _WIRE_1_14, _GEN_103) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_15 <= mux(reset, _WIRE_1_15, _GEN_104) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_16 <= mux(reset, _WIRE_1_16, _GEN_105) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_17 <= mux(reset, _WIRE_1_17, _GEN_106) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_18 <= mux(reset, _WIRE_1_18, _GEN_107) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_19 <= mux(reset, _WIRE_1_19, _GEN_108) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    SReg_20 <= mux(reset, _WIRE_1_20, _GEN_109) @[WatermanSystolic.scala 21:21 WatermanSystolic.scala 21:21]
    resetReg <= mux(reset, UInt<1>("h0"), _GEN_125) @[WatermanSystolic.scala 22:25 WatermanSystolic.scala 22:25]
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
    processingElementDecoupled_4.clock <= clock
    processingElementDecoupled_4.reset <= reset
    processingElementDecoupled_4.io_fromPreviousPE_valid <= PEs_4_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_4.io_fromPreviousPE_bits_upper <= PEs_4_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_4.io_fromPreviousPE_bits_diagonal <= PEs_4_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_4.io_fromPreviousPE_bits_columnElement <= PEs_4_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_4.io_rowElement <= PEs_4_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_4.io_reset <= PEs_4_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_4.io_number <= PEs_4_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_4.io_out_ready <= PEs_4_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_4.io_toNextPE_ready <= PEs_4_toNextPE_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_5.clock <= clock
    processingElementDecoupled_5.reset <= reset
    processingElementDecoupled_5.io_fromPreviousPE_valid <= PEs_5_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_5.io_fromPreviousPE_bits_upper <= PEs_5_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_5.io_fromPreviousPE_bits_diagonal <= PEs_5_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_5.io_fromPreviousPE_bits_columnElement <= PEs_5_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_5.io_rowElement <= PEs_5_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_5.io_reset <= PEs_5_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_5.io_number <= PEs_5_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_5.io_out_ready <= PEs_5_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_5.io_toNextPE_ready <= PEs_5_toNextPE_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_6.clock <= clock
    processingElementDecoupled_6.reset <= reset
    processingElementDecoupled_6.io_fromPreviousPE_valid <= PEs_6_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_6.io_fromPreviousPE_bits_upper <= PEs_6_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_6.io_fromPreviousPE_bits_diagonal <= PEs_6_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_6.io_fromPreviousPE_bits_columnElement <= PEs_6_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_6.io_rowElement <= PEs_6_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_6.io_reset <= PEs_6_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_6.io_number <= PEs_6_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_6.io_out_ready <= PEs_6_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_6.io_toNextPE_ready <= PEs_6_toNextPE_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_7.clock <= clock
    processingElementDecoupled_7.reset <= reset
    processingElementDecoupled_7.io_fromPreviousPE_valid <= PEs_7_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_7.io_fromPreviousPE_bits_upper <= PEs_7_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_7.io_fromPreviousPE_bits_diagonal <= PEs_7_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_7.io_fromPreviousPE_bits_columnElement <= PEs_7_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_7.io_rowElement <= PEs_7_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_7.io_reset <= PEs_7_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_7.io_number <= PEs_7_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_7.io_out_ready <= PEs_7_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_7.io_toNextPE_ready <= PEs_7_toNextPE_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_8.clock <= clock
    processingElementDecoupled_8.reset <= reset
    processingElementDecoupled_8.io_fromPreviousPE_valid <= PEs_8_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_8.io_fromPreviousPE_bits_upper <= PEs_8_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_8.io_fromPreviousPE_bits_diagonal <= PEs_8_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_8.io_fromPreviousPE_bits_columnElement <= PEs_8_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_8.io_rowElement <= PEs_8_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_8.io_reset <= PEs_8_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_8.io_number <= PEs_8_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_8.io_out_ready <= PEs_8_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_8.io_toNextPE_ready <= PEs_8_toNextPE_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_9.clock <= clock
    processingElementDecoupled_9.reset <= reset
    processingElementDecoupled_9.io_fromPreviousPE_valid <= PEs_9_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_9.io_fromPreviousPE_bits_upper <= PEs_9_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_9.io_fromPreviousPE_bits_diagonal <= PEs_9_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_9.io_fromPreviousPE_bits_columnElement <= PEs_9_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_9.io_rowElement <= PEs_9_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_9.io_reset <= PEs_9_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_9.io_number <= PEs_9_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_9.io_out_ready <= PEs_9_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_9.io_toNextPE_ready <= PEs_9_toNextPE_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_10.clock <= clock
    processingElementDecoupled_10.reset <= reset
    processingElementDecoupled_10.io_fromPreviousPE_valid <= PEs_10_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_10.io_fromPreviousPE_bits_upper <= PEs_10_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_10.io_fromPreviousPE_bits_diagonal <= PEs_10_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_10.io_fromPreviousPE_bits_columnElement <= PEs_10_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_10.io_rowElement <= PEs_10_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_10.io_reset <= PEs_10_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_10.io_number <= PEs_10_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_10.io_out_ready <= PEs_10_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_10.io_toNextPE_ready <= PEs_10_toNextPE_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_11.clock <= clock
    processingElementDecoupled_11.reset <= reset
    processingElementDecoupled_11.io_fromPreviousPE_valid <= PEs_11_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_11.io_fromPreviousPE_bits_upper <= PEs_11_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_11.io_fromPreviousPE_bits_diagonal <= PEs_11_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_11.io_fromPreviousPE_bits_columnElement <= PEs_11_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_11.io_rowElement <= PEs_11_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_11.io_reset <= PEs_11_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_11.io_number <= PEs_11_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_11.io_out_ready <= PEs_11_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_11.io_toNextPE_ready <= PEs_11_toNextPE_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_12.clock <= clock
    processingElementDecoupled_12.reset <= reset
    processingElementDecoupled_12.io_fromPreviousPE_valid <= PEs_12_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_12.io_fromPreviousPE_bits_upper <= PEs_12_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_12.io_fromPreviousPE_bits_diagonal <= PEs_12_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_12.io_fromPreviousPE_bits_columnElement <= PEs_12_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_12.io_rowElement <= PEs_12_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_12.io_reset <= PEs_12_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_12.io_number <= PEs_12_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_12.io_out_ready <= PEs_12_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_12.io_toNextPE_ready <= PEs_12_toNextPE_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_13.clock <= clock
    processingElementDecoupled_13.reset <= reset
    processingElementDecoupled_13.io_fromPreviousPE_valid <= PEs_13_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_13.io_fromPreviousPE_bits_upper <= PEs_13_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_13.io_fromPreviousPE_bits_diagonal <= PEs_13_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_13.io_fromPreviousPE_bits_columnElement <= PEs_13_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_13.io_rowElement <= PEs_13_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_13.io_reset <= PEs_13_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_13.io_number <= PEs_13_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_13.io_out_ready <= PEs_13_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_13.io_toNextPE_ready <= PEs_13_toNextPE_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_14.clock <= clock
    processingElementDecoupled_14.reset <= reset
    processingElementDecoupled_14.io_fromPreviousPE_valid <= PEs_14_fromPreviousPE_valid @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_14.io_fromPreviousPE_bits_upper <= PEs_14_fromPreviousPE_bits_upper @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_14.io_fromPreviousPE_bits_diagonal <= PEs_14_fromPreviousPE_bits_diagonal @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_14.io_fromPreviousPE_bits_columnElement <= PEs_14_fromPreviousPE_bits_columnElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_14.io_rowElement <= PEs_14_rowElement @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_14.io_reset <= PEs_14_reset @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_14.io_number <= PEs_14_number @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_14.io_out_ready <= PEs_14_out_ready @[WatermanSystolic.scala 24:20]
    processingElementDecoupled_14.io_toNextPE_ready <= PEs_14_toNextPE_ready @[WatermanSystolic.scala 24:20]
