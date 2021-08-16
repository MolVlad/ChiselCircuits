module substituteElements(
  input  [1:0]  io_first,
  input  [1:0]  io_second,
  output [31:0] io_out
);
  wire [1:0] _GEN_0 = io_first == io_second ? $signed(2'sh1) : $signed(-2'sh1); // @[WatermanFSM.scala 114:33 WatermanFSM.scala 115:12 WatermanFSM.scala 117:12]
  assign io_out = {{30{_GEN_0[1]}},_GEN_0}; // @[WatermanFSM.scala 114:33 WatermanFSM.scala 115:12 WatermanFSM.scala 117:12]
endmodule
module calculateCell(
  input  [31:0] io_upper,
  input  [31:0] io_left,
  input  [31:0] io_diagonal,
  input  [1:0]  io_rowElement,
  input  [1:0]  io_columnElement,
  output [31:0] io_out
);
  wire [1:0] substituteElements_io_first; // @[WatermanFSM.scala 132:34]
  wire [1:0] substituteElements_io_second; // @[WatermanFSM.scala 132:34]
  wire [31:0] substituteElements_io_out; // @[WatermanFSM.scala 132:34]
  wire [31:0] diag = $signed(io_diagonal) + $signed(substituteElements_io_out); // @[WatermanFSM.scala 137:23]
  wire [31:0] upper = $signed(io_upper) - 32'sh2; // @[WatermanFSM.scala 138:21]
  wire [31:0] left = $signed(io_left) - 32'sh2; // @[WatermanFSM.scala 139:19]
  wire [31:0] diagUpper = $signed(diag) > $signed(upper) ? $signed(diag) : $signed(upper); // @[WatermanFSM.scala 141:23 WatermanFSM.scala 142:15 WatermanFSM.scala 144:15]
  wire [31:0] diagLeft = $signed(diag) > $signed(left) ? $signed(diag) : $signed(left); // @[WatermanFSM.scala 146:22 WatermanFSM.scala 147:14 WatermanFSM.scala 149:14]
  wire [31:0] max = $signed(diagLeft) > $signed(diagUpper) ? $signed(diagLeft) : $signed(diagUpper); // @[WatermanFSM.scala 151:31 WatermanFSM.scala 152:9 WatermanFSM.scala 154:9]
  substituteElements substituteElements ( // @[WatermanFSM.scala 132:34]
    .io_first(substituteElements_io_first),
    .io_second(substituteElements_io_second),
    .io_out(substituteElements_io_out)
  );
  assign io_out = $signed(max) > 32'sh0 ? $signed(max) : $signed(32'sh0); // @[WatermanFSM.scala 158:36 WatermanFSM.scala 159:14 WatermanFSM.scala 161:14]
  assign substituteElements_io_first = io_rowElement; // @[WatermanFSM.scala 133:31]
  assign substituteElements_io_second = io_columnElement; // @[WatermanFSM.scala 134:32]
endmodule
module WatermanFSM(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [1:0]  io_in_bits_S_0,
  input  [1:0]  io_in_bits_S_1,
  input  [1:0]  io_in_bits_S_2,
  input  [1:0]  io_in_bits_S_3,
  input  [1:0]  io_in_bits_S_4,
  input  [1:0]  io_in_bits_S_5,
  input  [1:0]  io_in_bits_S_6,
  input  [1:0]  io_in_bits_S_7,
  input  [1:0]  io_in_bits_S_8,
  input  [1:0]  io_in_bits_S_9,
  input  [1:0]  io_in_bits_S_10,
  input  [1:0]  io_in_bits_S_11,
  input  [1:0]  io_in_bits_S_12,
  input  [1:0]  io_in_bits_S_13,
  input  [1:0]  io_in_bits_S_14,
  input  [1:0]  io_in_bits_S_15,
  input  [1:0]  io_in_bits_S_16,
  input  [1:0]  io_in_bits_S_17,
  input  [1:0]  io_in_bits_S_18,
  input  [1:0]  io_in_bits_S_19,
  input  [1:0]  io_in_bits_S_20,
  input  [1:0]  io_in_bits_T_0,
  input  [1:0]  io_in_bits_T_1,
  input  [1:0]  io_in_bits_T_2,
  input  [1:0]  io_in_bits_T_3,
  input  [1:0]  io_in_bits_T_4,
  input  [1:0]  io_in_bits_T_5,
  input  [1:0]  io_in_bits_T_6,
  input  [1:0]  io_in_bits_T_7,
  input  [1:0]  io_in_bits_T_8,
  input  [1:0]  io_in_bits_T_9,
  input  [1:0]  io_in_bits_T_10,
  input  [1:0]  io_in_bits_T_11,
  input  [1:0]  io_in_bits_T_12,
  input  [1:0]  io_in_bits_T_13,
  input  [1:0]  io_in_bits_T_14,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_score,
  output [4:0]  io_out_bits_x,
  output [3:0]  io_out_bits_y
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] pe_io_upper; // @[WatermanFSM.scala 33:18]
  wire [31:0] pe_io_left; // @[WatermanFSM.scala 33:18]
  wire [31:0] pe_io_diagonal; // @[WatermanFSM.scala 33:18]
  wire [1:0] pe_io_rowElement; // @[WatermanFSM.scala 33:18]
  wire [1:0] pe_io_columnElement; // @[WatermanFSM.scala 33:18]
  wire [31:0] pe_io_out; // @[WatermanFSM.scala 33:18]
  reg [1:0] SReg_0; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_1; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_2; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_3; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_4; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_5; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_6; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_7; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_8; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_9; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_10; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_11; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_12; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_13; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_14; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_15; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_16; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_17; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_18; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_19; // @[WatermanFSM.scala 21:21]
  reg [1:0] SReg_20; // @[WatermanFSM.scala 21:21]
  reg [1:0] TReg_0; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_1; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_2; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_3; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_4; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_5; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_6; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_7; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_8; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_9; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_10; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_11; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_12; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_13; // @[WatermanFSM.scala 22:21]
  reg [1:0] TReg_14; // @[WatermanFSM.scala 22:21]
  reg [31:0] rowsReg_0; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_1; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_2; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_3; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_4; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_5; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_6; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_7; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_8; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_9; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_10; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_11; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_12; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_13; // @[WatermanFSM.scala 23:24]
  reg [31:0] rowsReg_14; // @[WatermanFSM.scala 23:24]
  reg [31:0] columnsReg_1; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_2; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_3; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_4; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_5; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_6; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_7; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_8; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_9; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_10; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_11; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_12; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_13; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_14; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_15; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_16; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_17; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_18; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_19; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_20; // @[WatermanFSM.scala 24:27]
  reg [31:0] columnsReg_21; // @[WatermanFSM.scala 24:27]
  reg [31:0] resultingColumnsReg_0; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_1; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_2; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_3; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_4; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_5; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_6; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_7; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_8; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_9; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_10; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_11; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_12; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_13; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_14; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_15; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_16; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_17; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_18; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_19; // @[WatermanFSM.scala 25:36]
  reg [31:0] resultingColumnsReg_20; // @[WatermanFSM.scala 25:36]
  reg [1:0] stateReg; // @[WatermanFSM.scala 28:25]
  reg [5:0] cntColumnReg; // @[WatermanFSM.scala 29:29]
  reg [4:0] cntRowReg; // @[WatermanFSM.scala 30:26]
  reg [31:0] resReg; // @[WatermanFSM.scala 31:23]
  wire  _T_2 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_3 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [5:0] _T_5 = cntColumnReg + 6'h1; // @[WatermanFSM.scala 71:46]
  wire [31:0] _GEN_98 = 5'h1 == _T_5[4:0] ? $signed(columnsReg_1) : $signed(32'sh0); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_99 = 5'h2 == _T_5[4:0] ? $signed(columnsReg_2) : $signed(_GEN_98); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_100 = 5'h3 == _T_5[4:0] ? $signed(columnsReg_3) : $signed(_GEN_99); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_101 = 5'h4 == _T_5[4:0] ? $signed(columnsReg_4) : $signed(_GEN_100); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_102 = 5'h5 == _T_5[4:0] ? $signed(columnsReg_5) : $signed(_GEN_101); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_103 = 5'h6 == _T_5[4:0] ? $signed(columnsReg_6) : $signed(_GEN_102); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_104 = 5'h7 == _T_5[4:0] ? $signed(columnsReg_7) : $signed(_GEN_103); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_105 = 5'h8 == _T_5[4:0] ? $signed(columnsReg_8) : $signed(_GEN_104); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_106 = 5'h9 == _T_5[4:0] ? $signed(columnsReg_9) : $signed(_GEN_105); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_107 = 5'ha == _T_5[4:0] ? $signed(columnsReg_10) : $signed(_GEN_106); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_108 = 5'hb == _T_5[4:0] ? $signed(columnsReg_11) : $signed(_GEN_107); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_109 = 5'hc == _T_5[4:0] ? $signed(columnsReg_12) : $signed(_GEN_108); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_110 = 5'hd == _T_5[4:0] ? $signed(columnsReg_13) : $signed(_GEN_109); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_111 = 5'he == _T_5[4:0] ? $signed(columnsReg_14) : $signed(_GEN_110); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_112 = 5'hf == _T_5[4:0] ? $signed(columnsReg_15) : $signed(_GEN_111); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_113 = 5'h10 == _T_5[4:0] ? $signed(columnsReg_16) : $signed(_GEN_112); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_114 = 5'h11 == _T_5[4:0] ? $signed(columnsReg_17) : $signed(_GEN_113); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_115 = 5'h12 == _T_5[4:0] ? $signed(columnsReg_18) : $signed(_GEN_114); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_116 = 5'h13 == _T_5[4:0] ? $signed(columnsReg_19) : $signed(_GEN_115); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_117 = 5'h14 == _T_5[4:0] ? $signed(columnsReg_20) : $signed(_GEN_116); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_120 = 5'h1 == cntColumnReg[4:0] ? $signed(columnsReg_1) : $signed(32'sh0); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_121 = 5'h2 == cntColumnReg[4:0] ? $signed(columnsReg_2) : $signed(_GEN_120); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_122 = 5'h3 == cntColumnReg[4:0] ? $signed(columnsReg_3) : $signed(_GEN_121); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_123 = 5'h4 == cntColumnReg[4:0] ? $signed(columnsReg_4) : $signed(_GEN_122); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_124 = 5'h5 == cntColumnReg[4:0] ? $signed(columnsReg_5) : $signed(_GEN_123); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_125 = 5'h6 == cntColumnReg[4:0] ? $signed(columnsReg_6) : $signed(_GEN_124); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_126 = 5'h7 == cntColumnReg[4:0] ? $signed(columnsReg_7) : $signed(_GEN_125); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_127 = 5'h8 == cntColumnReg[4:0] ? $signed(columnsReg_8) : $signed(_GEN_126); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_128 = 5'h9 == cntColumnReg[4:0] ? $signed(columnsReg_9) : $signed(_GEN_127); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_129 = 5'ha == cntColumnReg[4:0] ? $signed(columnsReg_10) : $signed(_GEN_128); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_130 = 5'hb == cntColumnReg[4:0] ? $signed(columnsReg_11) : $signed(_GEN_129); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_131 = 5'hc == cntColumnReg[4:0] ? $signed(columnsReg_12) : $signed(_GEN_130); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_132 = 5'hd == cntColumnReg[4:0] ? $signed(columnsReg_13) : $signed(_GEN_131); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_133 = 5'he == cntColumnReg[4:0] ? $signed(columnsReg_14) : $signed(_GEN_132); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_134 = 5'hf == cntColumnReg[4:0] ? $signed(columnsReg_15) : $signed(_GEN_133); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_135 = 5'h10 == cntColumnReg[4:0] ? $signed(columnsReg_16) : $signed(_GEN_134); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_136 = 5'h11 == cntColumnReg[4:0] ? $signed(columnsReg_17) : $signed(_GEN_135); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_137 = 5'h12 == cntColumnReg[4:0] ? $signed(columnsReg_18) : $signed(_GEN_136); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_138 = 5'h13 == cntColumnReg[4:0] ? $signed(columnsReg_19) : $signed(_GEN_137); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_139 = 5'h14 == cntColumnReg[4:0] ? $signed(columnsReg_20) : $signed(_GEN_138); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_142 = 4'h1 == cntRowReg[3:0] ? $signed(rowsReg_1) : $signed(rowsReg_0); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_143 = 4'h2 == cntRowReg[3:0] ? $signed(rowsReg_2) : $signed(_GEN_142); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_144 = 4'h3 == cntRowReg[3:0] ? $signed(rowsReg_3) : $signed(_GEN_143); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_145 = 4'h4 == cntRowReg[3:0] ? $signed(rowsReg_4) : $signed(_GEN_144); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_146 = 4'h5 == cntRowReg[3:0] ? $signed(rowsReg_5) : $signed(_GEN_145); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_147 = 4'h6 == cntRowReg[3:0] ? $signed(rowsReg_6) : $signed(_GEN_146); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_148 = 4'h7 == cntRowReg[3:0] ? $signed(rowsReg_7) : $signed(_GEN_147); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_149 = 4'h8 == cntRowReg[3:0] ? $signed(rowsReg_8) : $signed(_GEN_148); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_150 = 4'h9 == cntRowReg[3:0] ? $signed(rowsReg_9) : $signed(_GEN_149); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_151 = 4'ha == cntRowReg[3:0] ? $signed(rowsReg_10) : $signed(_GEN_150); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_152 = 4'hb == cntRowReg[3:0] ? $signed(rowsReg_11) : $signed(_GEN_151); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_153 = 4'hc == cntRowReg[3:0] ? $signed(rowsReg_12) : $signed(_GEN_152); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_154 = 4'hd == cntRowReg[3:0] ? $signed(rowsReg_13) : $signed(_GEN_153); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [1:0] _GEN_157 = 4'h1 == cntRowReg[3:0] ? TReg_1 : TReg_0; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_158 = 4'h2 == cntRowReg[3:0] ? TReg_2 : _GEN_157; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_159 = 4'h3 == cntRowReg[3:0] ? TReg_3 : _GEN_158; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_160 = 4'h4 == cntRowReg[3:0] ? TReg_4 : _GEN_159; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_161 = 4'h5 == cntRowReg[3:0] ? TReg_5 : _GEN_160; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_162 = 4'h6 == cntRowReg[3:0] ? TReg_6 : _GEN_161; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_163 = 4'h7 == cntRowReg[3:0] ? TReg_7 : _GEN_162; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_164 = 4'h8 == cntRowReg[3:0] ? TReg_8 : _GEN_163; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_165 = 4'h9 == cntRowReg[3:0] ? TReg_9 : _GEN_164; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_166 = 4'ha == cntRowReg[3:0] ? TReg_10 : _GEN_165; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_167 = 4'hb == cntRowReg[3:0] ? TReg_11 : _GEN_166; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_168 = 4'hc == cntRowReg[3:0] ? TReg_12 : _GEN_167; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_169 = 4'hd == cntRowReg[3:0] ? TReg_13 : _GEN_168; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_172 = 5'h1 == cntColumnReg[4:0] ? SReg_1 : SReg_0; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_173 = 5'h2 == cntColumnReg[4:0] ? SReg_2 : _GEN_172; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_174 = 5'h3 == cntColumnReg[4:0] ? SReg_3 : _GEN_173; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_175 = 5'h4 == cntColumnReg[4:0] ? SReg_4 : _GEN_174; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_176 = 5'h5 == cntColumnReg[4:0] ? SReg_5 : _GEN_175; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_177 = 5'h6 == cntColumnReg[4:0] ? SReg_6 : _GEN_176; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_178 = 5'h7 == cntColumnReg[4:0] ? SReg_7 : _GEN_177; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_179 = 5'h8 == cntColumnReg[4:0] ? SReg_8 : _GEN_178; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_180 = 5'h9 == cntColumnReg[4:0] ? SReg_9 : _GEN_179; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_181 = 5'ha == cntColumnReg[4:0] ? SReg_10 : _GEN_180; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_182 = 5'hb == cntColumnReg[4:0] ? SReg_11 : _GEN_181; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_183 = 5'hc == cntColumnReg[4:0] ? SReg_12 : _GEN_182; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_184 = 5'hd == cntColumnReg[4:0] ? SReg_13 : _GEN_183; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_185 = 5'he == cntColumnReg[4:0] ? SReg_14 : _GEN_184; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_186 = 5'hf == cntColumnReg[4:0] ? SReg_15 : _GEN_185; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_187 = 5'h10 == cntColumnReg[4:0] ? SReg_16 : _GEN_186; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_188 = 5'h11 == cntColumnReg[4:0] ? SReg_17 : _GEN_187; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_189 = 5'h12 == cntColumnReg[4:0] ? SReg_18 : _GEN_188; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_190 = 5'h13 == cntColumnReg[4:0] ? SReg_19 : _GEN_189; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire  _T_11 = 2'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_192 = 5'h0 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_0); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_193 = 5'h1 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_1); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_194 = 5'h2 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_2); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_195 = 5'h3 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_3); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_196 = 5'h4 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_4); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_197 = 5'h5 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_5); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_198 = 5'h6 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_6); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_199 = 5'h7 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_7); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_200 = 5'h8 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_8); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_201 = 5'h9 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_9); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_202 = 5'ha == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_10); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_203 = 5'hb == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_11); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_204 = 5'hc == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_12); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_205 = 5'hd == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_13); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_206 = 5'he == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_14); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_207 = 5'hf == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_15); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_208 = 5'h10 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_16); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_209 = 5'h11 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_17); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_210 = 5'h12 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_18); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_211 = 5'h13 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_19); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_212 = 5'h14 == cntColumnReg[4:0] ? $signed(resReg) : $signed(resultingColumnsReg_20); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_213 = 4'h0 == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_0); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_214 = 4'h1 == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_1); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_215 = 4'h2 == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_2); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_216 = 4'h3 == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_3); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_217 = 4'h4 == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_4); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_218 = 4'h5 == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_5); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_219 = 4'h6 == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_6); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_220 = 4'h7 == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_7); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_221 = 4'h8 == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_8); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_222 = 4'h9 == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_9); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_223 = 4'ha == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_10); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_224 = 4'hb == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_11); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_225 = 4'hc == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_12); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_226 = 4'hd == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_13); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_227 = 4'he == cntRowReg[3:0] ? $signed(resReg) : $signed(rowsReg_14); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 23:24]
  wire  _T_14 = cntColumnReg == 6'h14; // @[WatermanFSM.scala 85:28]
  wire [4:0] _T_19 = cntRowReg + 5'h1; // @[WatermanFSM.scala 89:34]
  wire [5:0] _GEN_228 = _T_14 ? 6'h0 : _T_5; // @[WatermanFSM.scala 87:61 WatermanFSM.scala 88:24 WatermanFSM.scala 92:24]
  wire [4:0] _GEN_229 = _T_14 ? _T_19 : cntRowReg; // @[WatermanFSM.scala 87:61 WatermanFSM.scala 89:21 WatermanFSM.scala 30:26]
  wire [1:0] _GEN_230 = _T_14 ? 2'h2 : 2'h1; // @[WatermanFSM.scala 87:61 WatermanFSM.scala 90:20 WatermanFSM.scala 93:20]
  wire [1:0] _GEN_231 = cntColumnReg == 6'h14 & cntRowReg == 5'he ? 2'h0 : _GEN_230; // @[WatermanFSM.scala 85:94 WatermanFSM.scala 86:20]
  wire [5:0] _GEN_232 = cntColumnReg == 6'h14 & cntRowReg == 5'he ? cntColumnReg : _GEN_228; // @[WatermanFSM.scala 85:94 WatermanFSM.scala 29:29]
  wire [4:0] _GEN_233 = cntColumnReg == 6'h14 & cntRowReg == 5'he ? cntRowReg : _GEN_229; // @[WatermanFSM.scala 85:94 WatermanFSM.scala 30:26]
  wire [31:0] _GEN_234 = io_out_ready ? $signed(_GEN_192) : $signed(resultingColumnsReg_0); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_235 = io_out_ready ? $signed(_GEN_193) : $signed(resultingColumnsReg_1); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_236 = io_out_ready ? $signed(_GEN_194) : $signed(resultingColumnsReg_2); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_237 = io_out_ready ? $signed(_GEN_195) : $signed(resultingColumnsReg_3); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_238 = io_out_ready ? $signed(_GEN_196) : $signed(resultingColumnsReg_4); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_239 = io_out_ready ? $signed(_GEN_197) : $signed(resultingColumnsReg_5); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_240 = io_out_ready ? $signed(_GEN_198) : $signed(resultingColumnsReg_6); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_241 = io_out_ready ? $signed(_GEN_199) : $signed(resultingColumnsReg_7); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_242 = io_out_ready ? $signed(_GEN_200) : $signed(resultingColumnsReg_8); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_243 = io_out_ready ? $signed(_GEN_201) : $signed(resultingColumnsReg_9); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_244 = io_out_ready ? $signed(_GEN_202) : $signed(resultingColumnsReg_10); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_245 = io_out_ready ? $signed(_GEN_203) : $signed(resultingColumnsReg_11); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_246 = io_out_ready ? $signed(_GEN_204) : $signed(resultingColumnsReg_12); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_247 = io_out_ready ? $signed(_GEN_205) : $signed(resultingColumnsReg_13); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_248 = io_out_ready ? $signed(_GEN_206) : $signed(resultingColumnsReg_14); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_249 = io_out_ready ? $signed(_GEN_207) : $signed(resultingColumnsReg_15); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_250 = io_out_ready ? $signed(_GEN_208) : $signed(resultingColumnsReg_16); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_251 = io_out_ready ? $signed(_GEN_209) : $signed(resultingColumnsReg_17); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_252 = io_out_ready ? $signed(_GEN_210) : $signed(resultingColumnsReg_18); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_253 = io_out_ready ? $signed(_GEN_211) : $signed(resultingColumnsReg_19); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_254 = io_out_ready ? $signed(_GEN_212) : $signed(resultingColumnsReg_20); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 25:36]
  wire [31:0] _GEN_255 = io_out_ready ? $signed(_GEN_213) : $signed(rowsReg_0); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_256 = io_out_ready ? $signed(_GEN_214) : $signed(rowsReg_1); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_257 = io_out_ready ? $signed(_GEN_215) : $signed(rowsReg_2); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_258 = io_out_ready ? $signed(_GEN_216) : $signed(rowsReg_3); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_259 = io_out_ready ? $signed(_GEN_217) : $signed(rowsReg_4); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_260 = io_out_ready ? $signed(_GEN_218) : $signed(rowsReg_5); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_261 = io_out_ready ? $signed(_GEN_219) : $signed(rowsReg_6); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_262 = io_out_ready ? $signed(_GEN_220) : $signed(rowsReg_7); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_263 = io_out_ready ? $signed(_GEN_221) : $signed(rowsReg_8); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_264 = io_out_ready ? $signed(_GEN_222) : $signed(rowsReg_9); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_265 = io_out_ready ? $signed(_GEN_223) : $signed(rowsReg_10); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_266 = io_out_ready ? $signed(_GEN_224) : $signed(rowsReg_11); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_267 = io_out_ready ? $signed(_GEN_225) : $signed(rowsReg_12); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_268 = io_out_ready ? $signed(_GEN_226) : $signed(rowsReg_13); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [31:0] _GEN_269 = io_out_ready ? $signed(_GEN_227) : $signed(rowsReg_14); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 23:24]
  wire [1:0] _GEN_270 = io_out_ready ? _GEN_231 : stateReg; // @[WatermanFSM.scala 81:26 WatermanFSM.scala 28:25]
  wire [5:0] _GEN_271 = io_out_ready ? _GEN_232 : cntColumnReg; // @[WatermanFSM.scala 81:26 WatermanFSM.scala 29:29]
  wire [4:0] _GEN_272 = io_out_ready ? _GEN_233 : cntRowReg; // @[WatermanFSM.scala 81:26 WatermanFSM.scala 30:26]
  wire  _T_22 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_273 = _T_22 ? $signed(resultingColumnsReg_0) : $signed(columnsReg_1); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_274 = _T_22 ? $signed(resultingColumnsReg_1) : $signed(columnsReg_2); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_275 = _T_22 ? $signed(resultingColumnsReg_2) : $signed(columnsReg_3); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_276 = _T_22 ? $signed(resultingColumnsReg_3) : $signed(columnsReg_4); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_277 = _T_22 ? $signed(resultingColumnsReg_4) : $signed(columnsReg_5); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_278 = _T_22 ? $signed(resultingColumnsReg_5) : $signed(columnsReg_6); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_279 = _T_22 ? $signed(resultingColumnsReg_6) : $signed(columnsReg_7); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_280 = _T_22 ? $signed(resultingColumnsReg_7) : $signed(columnsReg_8); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_281 = _T_22 ? $signed(resultingColumnsReg_8) : $signed(columnsReg_9); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_282 = _T_22 ? $signed(resultingColumnsReg_9) : $signed(columnsReg_10); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_283 = _T_22 ? $signed(resultingColumnsReg_10) : $signed(columnsReg_11); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_284 = _T_22 ? $signed(resultingColumnsReg_11) : $signed(columnsReg_12); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_285 = _T_22 ? $signed(resultingColumnsReg_12) : $signed(columnsReg_13); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_286 = _T_22 ? $signed(resultingColumnsReg_13) : $signed(columnsReg_14); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_287 = _T_22 ? $signed(resultingColumnsReg_14) : $signed(columnsReg_15); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_288 = _T_22 ? $signed(resultingColumnsReg_15) : $signed(columnsReg_16); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_289 = _T_22 ? $signed(resultingColumnsReg_16) : $signed(columnsReg_17); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_290 = _T_22 ? $signed(resultingColumnsReg_17) : $signed(columnsReg_18); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_291 = _T_22 ? $signed(resultingColumnsReg_18) : $signed(columnsReg_19); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_292 = _T_22 ? $signed(resultingColumnsReg_19) : $signed(columnsReg_20); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [31:0] _GEN_293 = _T_22 ? $signed(resultingColumnsReg_20) : $signed(columnsReg_21); // @[Conditional.scala 39:67 WatermanFSM.scala 99:27 WatermanFSM.scala 24:27]
  wire [1:0] _GEN_294 = _T_22 ? 2'h1 : stateReg; // @[Conditional.scala 39:67 WatermanFSM.scala 101:16 WatermanFSM.scala 28:25]
  calculateCell pe ( // @[WatermanFSM.scala 33:18]
    .io_upper(pe_io_upper),
    .io_left(pe_io_left),
    .io_diagonal(pe_io_diagonal),
    .io_rowElement(pe_io_rowElement),
    .io_columnElement(pe_io_columnElement),
    .io_out(pe_io_out)
  );
  assign io_in_ready = stateReg == 2'h0; // @[WatermanFSM.scala 44:27]
  assign io_out_valid = stateReg == 2'h3; // @[WatermanFSM.scala 43:28]
  assign io_out_bits_score = resReg; // @[WatermanFSM.scala 42:21]
  assign io_out_bits_x = cntColumnReg[4:0]; // @[WatermanFSM.scala 40:17]
  assign io_out_bits_y = cntRowReg[3:0]; // @[WatermanFSM.scala 41:17]
  assign pe_io_upper = 5'h15 == _T_5[4:0] ? $signed(columnsReg_21) : $signed(_GEN_117); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  assign pe_io_left = 4'he == cntRowReg[3:0] ? $signed(rowsReg_14) : $signed(_GEN_154); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  assign pe_io_diagonal = 5'h15 == cntColumnReg[4:0] ? $signed(columnsReg_21) : $signed(_GEN_139); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  assign pe_io_rowElement = 4'he == cntRowReg[3:0] ? TReg_14 : _GEN_169; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  assign pe_io_columnElement = 5'h14 == cntColumnReg[4:0] ? SReg_20 : _GEN_190; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  always @(posedge clock) begin
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_0 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_0 <= io_in_bits_S_0; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_1 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_1 <= io_in_bits_S_1; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_2 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_2 <= io_in_bits_S_2; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_3 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_3 <= io_in_bits_S_3; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_4 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_4 <= io_in_bits_S_4; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_5 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_5 <= io_in_bits_S_5; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_6 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_6 <= io_in_bits_S_6; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_7 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_7 <= io_in_bits_S_7; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_8 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_8 <= io_in_bits_S_8; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_9 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_9 <= io_in_bits_S_9; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_10 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_10 <= io_in_bits_S_10; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_11 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_11 <= io_in_bits_S_11; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_12 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_12 <= io_in_bits_S_12; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_13 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_13 <= io_in_bits_S_13; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_14 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_14 <= io_in_bits_S_14; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_15 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_15 <= io_in_bits_S_15; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_16 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_16 <= io_in_bits_S_16; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_17 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_17 <= io_in_bits_S_17; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_18 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_18 <= io_in_bits_S_18; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_19 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_19 <= io_in_bits_S_19; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      SReg_20 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        SReg_20 <= io_in_bits_S_20; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_0 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_0 <= io_in_bits_T_0; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_1 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_1 <= io_in_bits_T_1; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_2 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_2 <= io_in_bits_T_2; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_3 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_3 <= io_in_bits_T_3; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_4 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_4 <= io_in_bits_T_4; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_5 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_5 <= io_in_bits_T_5; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_6 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_6 <= io_in_bits_T_6; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_7 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_7 <= io_in_bits_T_7; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_8 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_8 <= io_in_bits_T_8; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_9 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_9 <= io_in_bits_T_9; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_10 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_10 <= io_in_bits_T_10; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_11 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_11 <= io_in_bits_T_11; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_12 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_12 <= io_in_bits_T_12; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_13 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_13 <= io_in_bits_T_13; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:21]
      TReg_14 <= 2'h0; // @[WatermanFSM.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        TReg_14 <= io_in_bits_T_14; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_0 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_0 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_0 <= _GEN_255;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_1 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_1 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_1 <= _GEN_256;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_2 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_2 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_2 <= _GEN_257;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_3 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_3 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_3 <= _GEN_258;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_4 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_4 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_4 <= _GEN_259;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_5 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_5 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_5 <= _GEN_260;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_6 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_6 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_6 <= _GEN_261;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_7 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_7 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_7 <= _GEN_262;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_8 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_8 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_8 <= _GEN_263;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_9 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_9 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_9 <= _GEN_264;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_10 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_10 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_10 <= _GEN_265;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_11 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_11 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_11 <= _GEN_266;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_12 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_12 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_12 <= _GEN_267;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_13 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_13 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_13 <= _GEN_268;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:24]
      rowsReg_14 <= 32'sh0; // @[WatermanFSM.scala 23:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        rowsReg_14 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        rowsReg_14 <= _GEN_269;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_1 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_1 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_1 <= _GEN_273;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_2 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_2 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_2 <= _GEN_274;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_3 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_3 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_3 <= _GEN_275;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_4 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_4 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_4 <= _GEN_276;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_5 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_5 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_5 <= _GEN_277;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_6 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_6 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_6 <= _GEN_278;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_7 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_7 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_7 <= _GEN_279;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_8 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_8 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_8 <= _GEN_280;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_9 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_9 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_9 <= _GEN_281;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_10 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_10 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_10 <= _GEN_282;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_11 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_11 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_11 <= _GEN_283;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_12 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_12 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_12 <= _GEN_284;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_13 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_13 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_13 <= _GEN_285;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_14 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_14 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_14 <= _GEN_286;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_15 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_15 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_15 <= _GEN_287;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_16 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_16 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_16 <= _GEN_288;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_17 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_17 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_17 <= _GEN_289;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_18 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_18 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_18 <= _GEN_290;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_19 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_19 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_19 <= _GEN_291;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_20 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_20 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_20 <= _GEN_292;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:27]
      columnsReg_21 <= 32'sh0; // @[WatermanFSM.scala 24:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        columnsReg_21 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_11)) begin // @[Conditional.scala 39:67]
        columnsReg_21 <= _GEN_293;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_0 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_0 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_0 <= _GEN_234;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_1 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_1 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_1 <= _GEN_235;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_2 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_2 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_2 <= _GEN_236;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_3 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_3 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_3 <= _GEN_237;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_4 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_4 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_4 <= _GEN_238;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_5 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_5 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_5 <= _GEN_239;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_6 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_6 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_6 <= _GEN_240;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_7 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_7 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_7 <= _GEN_241;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_8 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_8 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_8 <= _GEN_242;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_9 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_9 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_9 <= _GEN_243;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_10 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_10 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_10 <= _GEN_244;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_11 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_11 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_11 <= _GEN_245;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_12 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_12 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_12 <= _GEN_246;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_13 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_13 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_13 <= _GEN_247;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_14 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_14 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_14 <= _GEN_248;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_15 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_15 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_15 <= _GEN_249;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_16 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_16 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_16 <= _GEN_250;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_17 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_17 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_17 <= _GEN_251;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_18 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_18 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_18 <= _GEN_252;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_19 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_19 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_19 <= _GEN_253;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 25:36]
      resultingColumnsReg_20 <= 32'sh0; // @[WatermanFSM.scala 25:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        resultingColumnsReg_20 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_20 <= _GEN_254;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 28:25]
      stateReg <= 2'h0; // @[WatermanFSM.scala 28:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        stateReg <= 2'h1; // @[WatermanFSM.scala 67:18]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      stateReg <= 2'h3; // @[WatermanFSM.scala 78:16]
    end else if (_T_11) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_270;
    end else begin
      stateReg <= _GEN_294;
    end
    if (reset) begin // @[WatermanFSM.scala 29:29]
      cntColumnReg <= 6'h0; // @[WatermanFSM.scala 29:29]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        cntColumnReg <= 6'h0; // @[WatermanFSM.scala 65:22]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        cntColumnReg <= _GEN_271;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 30:26]
      cntRowReg <= 5'h0; // @[WatermanFSM.scala 30:26]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 48:25]
        cntRowReg <= 5'h0; // @[WatermanFSM.scala 66:19]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        cntRowReg <= _GEN_272;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 31:23]
      resReg <= 32'sh0; // @[WatermanFSM.scala 31:23]
    end else if (!(_T_2)) begin // @[Conditional.scala 40:58]
      if (_T_3) begin // @[Conditional.scala 39:67]
        resReg <= pe_io_out; // @[WatermanFSM.scala 77:14]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  SReg_0 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  SReg_1 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  SReg_2 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  SReg_3 = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  SReg_4 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  SReg_5 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  SReg_6 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  SReg_7 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  SReg_8 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  SReg_9 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  SReg_10 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  SReg_11 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  SReg_12 = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  SReg_13 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  SReg_14 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  SReg_15 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  SReg_16 = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  SReg_17 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  SReg_18 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  SReg_19 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  SReg_20 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  TReg_0 = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  TReg_1 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  TReg_2 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  TReg_3 = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  TReg_4 = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  TReg_5 = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  TReg_6 = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  TReg_7 = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  TReg_8 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  TReg_9 = _RAND_30[1:0];
  _RAND_31 = {1{`RANDOM}};
  TReg_10 = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  TReg_11 = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  TReg_12 = _RAND_33[1:0];
  _RAND_34 = {1{`RANDOM}};
  TReg_13 = _RAND_34[1:0];
  _RAND_35 = {1{`RANDOM}};
  TReg_14 = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  rowsReg_0 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  rowsReg_1 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  rowsReg_2 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  rowsReg_3 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  rowsReg_4 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  rowsReg_5 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  rowsReg_6 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  rowsReg_7 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  rowsReg_8 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  rowsReg_9 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  rowsReg_10 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  rowsReg_11 = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  rowsReg_12 = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  rowsReg_13 = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  rowsReg_14 = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  columnsReg_1 = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  columnsReg_2 = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  columnsReg_3 = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  columnsReg_4 = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  columnsReg_5 = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  columnsReg_6 = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  columnsReg_7 = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  columnsReg_8 = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  columnsReg_9 = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  columnsReg_10 = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  columnsReg_11 = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  columnsReg_12 = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  columnsReg_13 = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  columnsReg_14 = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  columnsReg_15 = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  columnsReg_16 = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  columnsReg_17 = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  columnsReg_18 = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  columnsReg_19 = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  columnsReg_20 = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  columnsReg_21 = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  resultingColumnsReg_0 = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  resultingColumnsReg_1 = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  resultingColumnsReg_2 = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  resultingColumnsReg_3 = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  resultingColumnsReg_4 = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  resultingColumnsReg_5 = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  resultingColumnsReg_6 = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  resultingColumnsReg_7 = _RAND_79[31:0];
  _RAND_80 = {1{`RANDOM}};
  resultingColumnsReg_8 = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  resultingColumnsReg_9 = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  resultingColumnsReg_10 = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  resultingColumnsReg_11 = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  resultingColumnsReg_12 = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  resultingColumnsReg_13 = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  resultingColumnsReg_14 = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  resultingColumnsReg_15 = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  resultingColumnsReg_16 = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  resultingColumnsReg_17 = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  resultingColumnsReg_18 = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  resultingColumnsReg_19 = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  resultingColumnsReg_20 = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  stateReg = _RAND_93[1:0];
  _RAND_94 = {1{`RANDOM}};
  cntColumnReg = _RAND_94[5:0];
  _RAND_95 = {1{`RANDOM}};
  cntRowReg = _RAND_95[4:0];
  _RAND_96 = {1{`RANDOM}};
  resReg = _RAND_96[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
