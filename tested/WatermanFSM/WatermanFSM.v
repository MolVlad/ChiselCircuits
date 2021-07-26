module substituteElements(
  input  [1:0]  io_first,
  input  [1:0]  io_second,
  output [31:0] io_out
);
  wire [1:0] _GEN_0 = io_first == io_second ? $signed(2'sh1) : $signed(-2'sh1); // @[DNA.scala 28:33 DNA.scala 29:12 DNA.scala 31:12]
  assign io_out = {{30{_GEN_0[1]}},_GEN_0}; // @[DNA.scala 28:33 DNA.scala 29:12 DNA.scala 31:12]
endmodule
module calculateCell(
  input  [31:0] io_upper,
  input  [31:0] io_left,
  input  [31:0] io_diagonal,
  input  [1:0]  io_rowElement,
  input  [1:0]  io_columnElement,
  output [31:0] io_out
);
  wire [1:0] substituteElements_io_first; // @[DNA.scala 46:34]
  wire [1:0] substituteElements_io_second; // @[DNA.scala 46:34]
  wire [31:0] substituteElements_io_out; // @[DNA.scala 46:34]
  wire [31:0] diag = $signed(io_diagonal) + $signed(substituteElements_io_out); // @[DNA.scala 51:23]
  wire [31:0] upper = $signed(io_upper) - 32'sh2; // @[DNA.scala 52:21]
  wire [31:0] left = $signed(io_left) - 32'sh2; // @[DNA.scala 53:19]
  wire [31:0] diagUpper = $signed(diag) > $signed(upper) ? $signed(diag) : $signed(upper); // @[DNA.scala 55:23 DNA.scala 56:15 DNA.scala 58:15]
  wire [31:0] diagLeft = $signed(diag) > $signed(left) ? $signed(diag) : $signed(left); // @[DNA.scala 60:22 DNA.scala 61:14 DNA.scala 63:14]
  wire [31:0] max = $signed(diagLeft) > $signed(diagUpper) ? $signed(diagLeft) : $signed(diagUpper); // @[DNA.scala 65:31 DNA.scala 66:9 DNA.scala 68:9]
  substituteElements substituteElements ( // @[DNA.scala 46:34]
    .io_first(substituteElements_io_first),
    .io_second(substituteElements_io_second),
    .io_out(substituteElements_io_out)
  );
  assign io_out = $signed(max) > 32'sh0 ? $signed(max) : $signed(32'sh0); // @[DNA.scala 72:36 DNA.scala 73:14 DNA.scala 75:14]
  assign substituteElements_io_first = io_rowElement; // @[DNA.scala 47:31]
  assign substituteElements_io_second = io_columnElement; // @[DNA.scala 48:32]
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
  input  [1:0]  io_in_bits_T_0,
  input  [1:0]  io_in_bits_T_1,
  input  [1:0]  io_in_bits_T_2,
  input  [1:0]  io_in_bits_T_3,
  input  [1:0]  io_in_bits_T_4,
  input  [1:0]  io_in_bits_T_5,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_score,
  output [2:0]  io_out_bits_x,
  output [2:0]  io_out_bits_y
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] pe_io_upper; // @[WatermanFSM.scala 32:18]
  wire [31:0] pe_io_left; // @[WatermanFSM.scala 32:18]
  wire [31:0] pe_io_diagonal; // @[WatermanFSM.scala 32:18]
  wire [1:0] pe_io_rowElement; // @[WatermanFSM.scala 32:18]
  wire [1:0] pe_io_columnElement; // @[WatermanFSM.scala 32:18]
  wire [31:0] pe_io_out; // @[WatermanFSM.scala 32:18]
  reg [1:0] SReg_0; // @[WatermanFSM.scala 20:21]
  reg [1:0] SReg_1; // @[WatermanFSM.scala 20:21]
  reg [1:0] SReg_2; // @[WatermanFSM.scala 20:21]
  reg [1:0] SReg_3; // @[WatermanFSM.scala 20:21]
  reg [1:0] SReg_4; // @[WatermanFSM.scala 20:21]
  reg [1:0] SReg_5; // @[WatermanFSM.scala 20:21]
  reg [1:0] SReg_6; // @[WatermanFSM.scala 20:21]
  reg [1:0] TReg_0; // @[WatermanFSM.scala 21:21]
  reg [1:0] TReg_1; // @[WatermanFSM.scala 21:21]
  reg [1:0] TReg_2; // @[WatermanFSM.scala 21:21]
  reg [1:0] TReg_3; // @[WatermanFSM.scala 21:21]
  reg [1:0] TReg_4; // @[WatermanFSM.scala 21:21]
  reg [1:0] TReg_5; // @[WatermanFSM.scala 21:21]
  reg [31:0] rowsReg_0; // @[WatermanFSM.scala 22:24]
  reg [31:0] rowsReg_1; // @[WatermanFSM.scala 22:24]
  reg [31:0] rowsReg_2; // @[WatermanFSM.scala 22:24]
  reg [31:0] rowsReg_3; // @[WatermanFSM.scala 22:24]
  reg [31:0] rowsReg_4; // @[WatermanFSM.scala 22:24]
  reg [31:0] rowsReg_5; // @[WatermanFSM.scala 22:24]
  reg [31:0] columnsReg_1; // @[WatermanFSM.scala 23:27]
  reg [31:0] columnsReg_2; // @[WatermanFSM.scala 23:27]
  reg [31:0] columnsReg_3; // @[WatermanFSM.scala 23:27]
  reg [31:0] columnsReg_4; // @[WatermanFSM.scala 23:27]
  reg [31:0] columnsReg_5; // @[WatermanFSM.scala 23:27]
  reg [31:0] columnsReg_6; // @[WatermanFSM.scala 23:27]
  reg [31:0] columnsReg_7; // @[WatermanFSM.scala 23:27]
  reg [31:0] resultingColumnsReg_0; // @[WatermanFSM.scala 24:36]
  reg [31:0] resultingColumnsReg_1; // @[WatermanFSM.scala 24:36]
  reg [31:0] resultingColumnsReg_2; // @[WatermanFSM.scala 24:36]
  reg [31:0] resultingColumnsReg_3; // @[WatermanFSM.scala 24:36]
  reg [31:0] resultingColumnsReg_4; // @[WatermanFSM.scala 24:36]
  reg [31:0] resultingColumnsReg_5; // @[WatermanFSM.scala 24:36]
  reg [31:0] resultingColumnsReg_6; // @[WatermanFSM.scala 24:36]
  reg [1:0] stateReg; // @[WatermanFSM.scala 27:25]
  reg [3:0] cntColumnReg; // @[WatermanFSM.scala 28:29]
  reg [3:0] cntRowReg; // @[WatermanFSM.scala 29:26]
  reg [31:0] resReg; // @[WatermanFSM.scala 30:23]
  wire  _T_2 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_4 = ~reset; // @[WatermanFSM.scala 48:15]
  wire  _T_5 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [3:0] _T_7 = cntColumnReg + 4'h1; // @[WatermanFSM.scala 71:46]
  wire [31:0] _GEN_38 = 3'h1 == _T_7[2:0] ? $signed(columnsReg_1) : $signed(32'sh0); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_39 = 3'h2 == _T_7[2:0] ? $signed(columnsReg_2) : $signed(_GEN_38); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_40 = 3'h3 == _T_7[2:0] ? $signed(columnsReg_3) : $signed(_GEN_39); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_41 = 3'h4 == _T_7[2:0] ? $signed(columnsReg_4) : $signed(_GEN_40); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_42 = 3'h5 == _T_7[2:0] ? $signed(columnsReg_5) : $signed(_GEN_41); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_43 = 3'h6 == _T_7[2:0] ? $signed(columnsReg_6) : $signed(_GEN_42); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  wire [31:0] _GEN_46 = 3'h1 == cntColumnReg[2:0] ? $signed(columnsReg_1) : $signed(32'sh0); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_47 = 3'h2 == cntColumnReg[2:0] ? $signed(columnsReg_2) : $signed(_GEN_46); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_48 = 3'h3 == cntColumnReg[2:0] ? $signed(columnsReg_3) : $signed(_GEN_47); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_49 = 3'h4 == cntColumnReg[2:0] ? $signed(columnsReg_4) : $signed(_GEN_48); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_50 = 3'h5 == cntColumnReg[2:0] ? $signed(columnsReg_5) : $signed(_GEN_49); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_51 = 3'h6 == cntColumnReg[2:0] ? $signed(columnsReg_6) : $signed(_GEN_50); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  wire [31:0] _GEN_54 = 3'h1 == cntRowReg[2:0] ? $signed(rowsReg_1) : $signed(rowsReg_0); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_55 = 3'h2 == cntRowReg[2:0] ? $signed(rowsReg_2) : $signed(_GEN_54); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_56 = 3'h3 == cntRowReg[2:0] ? $signed(rowsReg_3) : $signed(_GEN_55); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [31:0] _GEN_57 = 3'h4 == cntRowReg[2:0] ? $signed(rowsReg_4) : $signed(_GEN_56); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  wire [1:0] _GEN_60 = 3'h1 == cntRowReg[2:0] ? TReg_1 : TReg_0; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_61 = 3'h2 == cntRowReg[2:0] ? TReg_2 : _GEN_60; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_62 = 3'h3 == cntRowReg[2:0] ? TReg_3 : _GEN_61; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_63 = 3'h4 == cntRowReg[2:0] ? TReg_4 : _GEN_62; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  wire [1:0] _GEN_66 = 3'h1 == cntColumnReg[2:0] ? SReg_1 : SReg_0; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_67 = 3'h2 == cntColumnReg[2:0] ? SReg_2 : _GEN_66; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_68 = 3'h3 == cntColumnReg[2:0] ? SReg_3 : _GEN_67; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_69 = 3'h4 == cntColumnReg[2:0] ? SReg_4 : _GEN_68; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire [1:0] _GEN_70 = 3'h5 == cntColumnReg[2:0] ? SReg_5 : _GEN_69; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  wire  _T_13 = 2'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_72 = 3'h0 == cntColumnReg[2:0] ? $signed(resReg) : $signed(resultingColumnsReg_0); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_73 = 3'h1 == cntColumnReg[2:0] ? $signed(resReg) : $signed(resultingColumnsReg_1); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_74 = 3'h2 == cntColumnReg[2:0] ? $signed(resReg) : $signed(resultingColumnsReg_2); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_75 = 3'h3 == cntColumnReg[2:0] ? $signed(resReg) : $signed(resultingColumnsReg_3); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_76 = 3'h4 == cntColumnReg[2:0] ? $signed(resReg) : $signed(resultingColumnsReg_4); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_77 = 3'h5 == cntColumnReg[2:0] ? $signed(resReg) : $signed(resultingColumnsReg_5); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_78 = 3'h6 == cntColumnReg[2:0] ? $signed(resReg) : $signed(resultingColumnsReg_6); // @[WatermanFSM.scala 82:43 WatermanFSM.scala 82:43 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_79 = 3'h0 == cntRowReg[2:0] ? $signed(resReg) : $signed(rowsReg_0); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 22:24]
  wire [31:0] _GEN_80 = 3'h1 == cntRowReg[2:0] ? $signed(resReg) : $signed(rowsReg_1); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 22:24]
  wire [31:0] _GEN_81 = 3'h2 == cntRowReg[2:0] ? $signed(resReg) : $signed(rowsReg_2); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 22:24]
  wire [31:0] _GEN_82 = 3'h3 == cntRowReg[2:0] ? $signed(resReg) : $signed(rowsReg_3); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 22:24]
  wire [31:0] _GEN_83 = 3'h4 == cntRowReg[2:0] ? $signed(resReg) : $signed(rowsReg_4); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 22:24]
  wire [31:0] _GEN_84 = 3'h5 == cntRowReg[2:0] ? $signed(resReg) : $signed(rowsReg_5); // @[WatermanFSM.scala 83:28 WatermanFSM.scala 83:28 WatermanFSM.scala 22:24]
  wire  _T_18 = cntColumnReg == 4'h6; // @[WatermanFSM.scala 86:28]
  wire  _T_20 = cntColumnReg == 4'h6 & cntRowReg == 4'h5; // @[WatermanFSM.scala 86:55]
  wire [3:0] _T_25 = cntRowReg + 4'h1; // @[WatermanFSM.scala 91:34]
  wire [3:0] _GEN_85 = _T_18 ? 4'h0 : _T_7; // @[WatermanFSM.scala 89:61 WatermanFSM.scala 90:24 WatermanFSM.scala 95:24]
  wire [3:0] _GEN_86 = _T_18 ? _T_25 : cntRowReg; // @[WatermanFSM.scala 89:61 WatermanFSM.scala 91:21 WatermanFSM.scala 29:26]
  wire [1:0] _GEN_87 = _T_18 ? 2'h2 : 2'h1; // @[WatermanFSM.scala 89:61 WatermanFSM.scala 93:20 WatermanFSM.scala 96:20]
  wire [1:0] _GEN_88 = cntColumnReg == 4'h6 & cntRowReg == 4'h5 ? 2'h0 : _GEN_87; // @[WatermanFSM.scala 86:94 WatermanFSM.scala 87:20]
  wire [3:0] _GEN_89 = cntColumnReg == 4'h6 & cntRowReg == 4'h5 ? cntColumnReg : _GEN_85; // @[WatermanFSM.scala 86:94 WatermanFSM.scala 28:29]
  wire [3:0] _GEN_90 = cntColumnReg == 4'h6 & cntRowReg == 4'h5 ? cntRowReg : _GEN_86; // @[WatermanFSM.scala 86:94 WatermanFSM.scala 29:26]
  wire [31:0] _GEN_91 = io_out_ready ? $signed(_GEN_72) : $signed(resultingColumnsReg_0); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_92 = io_out_ready ? $signed(_GEN_73) : $signed(resultingColumnsReg_1); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_93 = io_out_ready ? $signed(_GEN_74) : $signed(resultingColumnsReg_2); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_94 = io_out_ready ? $signed(_GEN_75) : $signed(resultingColumnsReg_3); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_95 = io_out_ready ? $signed(_GEN_76) : $signed(resultingColumnsReg_4); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_96 = io_out_ready ? $signed(_GEN_77) : $signed(resultingColumnsReg_5); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_97 = io_out_ready ? $signed(_GEN_78) : $signed(resultingColumnsReg_6); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 24:36]
  wire [31:0] _GEN_98 = io_out_ready ? $signed(_GEN_79) : $signed(rowsReg_0); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 22:24]
  wire [31:0] _GEN_99 = io_out_ready ? $signed(_GEN_80) : $signed(rowsReg_1); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 22:24]
  wire [31:0] _GEN_100 = io_out_ready ? $signed(_GEN_81) : $signed(rowsReg_2); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 22:24]
  wire [31:0] _GEN_101 = io_out_ready ? $signed(_GEN_82) : $signed(rowsReg_3); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 22:24]
  wire [31:0] _GEN_102 = io_out_ready ? $signed(_GEN_83) : $signed(rowsReg_4); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 22:24]
  wire [31:0] _GEN_103 = io_out_ready ? $signed(_GEN_84) : $signed(rowsReg_5); // @[WatermanFSM.scala 81:26 WatermanFSM.scala 22:24]
  wire [1:0] _GEN_104 = io_out_ready ? _GEN_88 : stateReg; // @[WatermanFSM.scala 81:26 WatermanFSM.scala 27:25]
  wire [3:0] _GEN_105 = io_out_ready ? _GEN_89 : cntColumnReg; // @[WatermanFSM.scala 81:26 WatermanFSM.scala 28:29]
  wire [3:0] _GEN_106 = io_out_ready ? _GEN_90 : cntRowReg; // @[WatermanFSM.scala 81:26 WatermanFSM.scala 29:26]
  wire  _T_30 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_107 = _T_30 ? $signed(resultingColumnsReg_0) : $signed(columnsReg_1); // @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
  wire [31:0] _GEN_108 = _T_30 ? $signed(resultingColumnsReg_1) : $signed(columnsReg_2); // @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
  wire [31:0] _GEN_109 = _T_30 ? $signed(resultingColumnsReg_2) : $signed(columnsReg_3); // @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
  wire [31:0] _GEN_110 = _T_30 ? $signed(resultingColumnsReg_3) : $signed(columnsReg_4); // @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
  wire [31:0] _GEN_111 = _T_30 ? $signed(resultingColumnsReg_4) : $signed(columnsReg_5); // @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
  wire [31:0] _GEN_112 = _T_30 ? $signed(resultingColumnsReg_5) : $signed(columnsReg_6); // @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
  wire [31:0] _GEN_113 = _T_30 ? $signed(resultingColumnsReg_6) : $signed(columnsReg_7); // @[Conditional.scala 39:67 WatermanFSM.scala 102:27 WatermanFSM.scala 23:27]
  wire [1:0] _GEN_114 = _T_30 ? 2'h1 : stateReg; // @[Conditional.scala 39:67 WatermanFSM.scala 104:16 WatermanFSM.scala 27:25]
  wire  _GEN_215 = ~_T_2 & ~_T_5 & _T_13 & io_out_ready; // @[WatermanFSM.scala 84:15]
  calculateCell pe ( // @[WatermanFSM.scala 32:18]
    .io_upper(pe_io_upper),
    .io_left(pe_io_left),
    .io_diagonal(pe_io_diagonal),
    .io_rowElement(pe_io_rowElement),
    .io_columnElement(pe_io_columnElement),
    .io_out(pe_io_out)
  );
  assign io_in_ready = stateReg == 2'h0; // @[WatermanFSM.scala 43:27]
  assign io_out_valid = stateReg == 2'h3; // @[WatermanFSM.scala 42:28]
  assign io_out_bits_score = resReg; // @[WatermanFSM.scala 41:21]
  assign io_out_bits_x = cntColumnReg[2:0]; // @[WatermanFSM.scala 39:17]
  assign io_out_bits_y = cntRowReg[2:0]; // @[WatermanFSM.scala 40:17]
  assign pe_io_upper = 3'h7 == _T_7[2:0] ? $signed(columnsReg_7) : $signed(_GEN_43); // @[WatermanFSM.scala 71:19 WatermanFSM.scala 71:19]
  assign pe_io_left = 3'h5 == cntRowReg[2:0] ? $signed(rowsReg_5) : $signed(_GEN_57); // @[WatermanFSM.scala 73:18 WatermanFSM.scala 73:18]
  assign pe_io_diagonal = 3'h7 == cntColumnReg[2:0] ? $signed(columnsReg_7) : $signed(_GEN_51); // @[WatermanFSM.scala 72:22 WatermanFSM.scala 72:22]
  assign pe_io_rowElement = 3'h5 == cntRowReg[2:0] ? TReg_5 : _GEN_63; // @[WatermanFSM.scala 74:24 WatermanFSM.scala 74:24]
  assign pe_io_columnElement = 3'h6 == cntColumnReg[2:0] ? SReg_6 : _GEN_70; // @[WatermanFSM.scala 75:27 WatermanFSM.scala 75:27]
  always @(posedge clock) begin
    if (reset) begin // @[WatermanFSM.scala 20:21]
      SReg_0 <= 2'h0; // @[WatermanFSM.scala 20:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        SReg_0 <= io_in_bits_S_0; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 20:21]
      SReg_1 <= 2'h0; // @[WatermanFSM.scala 20:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        SReg_1 <= io_in_bits_S_1; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 20:21]
      SReg_2 <= 2'h0; // @[WatermanFSM.scala 20:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        SReg_2 <= io_in_bits_S_2; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 20:21]
      SReg_3 <= 2'h0; // @[WatermanFSM.scala 20:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        SReg_3 <= io_in_bits_S_3; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 20:21]
      SReg_4 <= 2'h0; // @[WatermanFSM.scala 20:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        SReg_4 <= io_in_bits_S_4; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 20:21]
      SReg_5 <= 2'h0; // @[WatermanFSM.scala 20:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        SReg_5 <= io_in_bits_S_5; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 20:21]
      SReg_6 <= 2'h0; // @[WatermanFSM.scala 20:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        SReg_6 <= io_in_bits_S_6; // @[WatermanFSM.scala 50:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      TReg_0 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        TReg_0 <= io_in_bits_T_0; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      TReg_1 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        TReg_1 <= io_in_bits_T_1; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      TReg_2 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        TReg_2 <= io_in_bits_T_2; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      TReg_3 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        TReg_3 <= io_in_bits_T_3; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      TReg_4 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        TReg_4 <= io_in_bits_T_4; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 21:21]
      TReg_5 <= 2'h0; // @[WatermanFSM.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        TReg_5 <= io_in_bits_T_5; // @[WatermanFSM.scala 53:19]
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:24]
      rowsReg_0 <= 32'sh0; // @[WatermanFSM.scala 22:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        rowsReg_0 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        rowsReg_0 <= _GEN_98;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:24]
      rowsReg_1 <= 32'sh0; // @[WatermanFSM.scala 22:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        rowsReg_1 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        rowsReg_1 <= _GEN_99;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:24]
      rowsReg_2 <= 32'sh0; // @[WatermanFSM.scala 22:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        rowsReg_2 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        rowsReg_2 <= _GEN_100;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:24]
      rowsReg_3 <= 32'sh0; // @[WatermanFSM.scala 22:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        rowsReg_3 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        rowsReg_3 <= _GEN_101;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:24]
      rowsReg_4 <= 32'sh0; // @[WatermanFSM.scala 22:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        rowsReg_4 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        rowsReg_4 <= _GEN_102;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 22:24]
      rowsReg_5 <= 32'sh0; // @[WatermanFSM.scala 22:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        rowsReg_5 <= 32'sh0; // @[WatermanFSM.scala 59:22]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        rowsReg_5 <= _GEN_103;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:27]
      columnsReg_1 <= 32'sh0; // @[WatermanFSM.scala 23:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        columnsReg_1 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (!(_T_13)) begin // @[Conditional.scala 39:67]
        columnsReg_1 <= _GEN_107;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:27]
      columnsReg_2 <= 32'sh0; // @[WatermanFSM.scala 23:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        columnsReg_2 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (!(_T_13)) begin // @[Conditional.scala 39:67]
        columnsReg_2 <= _GEN_108;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:27]
      columnsReg_3 <= 32'sh0; // @[WatermanFSM.scala 23:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        columnsReg_3 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (!(_T_13)) begin // @[Conditional.scala 39:67]
        columnsReg_3 <= _GEN_109;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:27]
      columnsReg_4 <= 32'sh0; // @[WatermanFSM.scala 23:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        columnsReg_4 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (!(_T_13)) begin // @[Conditional.scala 39:67]
        columnsReg_4 <= _GEN_110;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:27]
      columnsReg_5 <= 32'sh0; // @[WatermanFSM.scala 23:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        columnsReg_5 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (!(_T_13)) begin // @[Conditional.scala 39:67]
        columnsReg_5 <= _GEN_111;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:27]
      columnsReg_6 <= 32'sh0; // @[WatermanFSM.scala 23:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        columnsReg_6 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (!(_T_13)) begin // @[Conditional.scala 39:67]
        columnsReg_6 <= _GEN_112;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 23:27]
      columnsReg_7 <= 32'sh0; // @[WatermanFSM.scala 23:27]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        columnsReg_7 <= 32'sh0; // @[WatermanFSM.scala 56:25]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (!(_T_13)) begin // @[Conditional.scala 39:67]
        columnsReg_7 <= _GEN_113;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:36]
      resultingColumnsReg_0 <= 32'sh0; // @[WatermanFSM.scala 24:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        resultingColumnsReg_0 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_0 <= _GEN_91;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:36]
      resultingColumnsReg_1 <= 32'sh0; // @[WatermanFSM.scala 24:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        resultingColumnsReg_1 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_1 <= _GEN_92;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:36]
      resultingColumnsReg_2 <= 32'sh0; // @[WatermanFSM.scala 24:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        resultingColumnsReg_2 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_2 <= _GEN_93;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:36]
      resultingColumnsReg_3 <= 32'sh0; // @[WatermanFSM.scala 24:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        resultingColumnsReg_3 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_3 <= _GEN_94;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:36]
      resultingColumnsReg_4 <= 32'sh0; // @[WatermanFSM.scala 24:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        resultingColumnsReg_4 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_4 <= _GEN_95;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:36]
      resultingColumnsReg_5 <= 32'sh0; // @[WatermanFSM.scala 24:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        resultingColumnsReg_5 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_5 <= _GEN_96;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 24:36]
      resultingColumnsReg_6 <= 32'sh0; // @[WatermanFSM.scala 24:36]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        resultingColumnsReg_6 <= 32'sh0; // @[WatermanFSM.scala 62:34]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        resultingColumnsReg_6 <= _GEN_97;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 27:25]
      stateReg <= 2'h0; // @[WatermanFSM.scala 27:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        stateReg <= 2'h1; // @[WatermanFSM.scala 67:18]
      end
    end else if (_T_5) begin // @[Conditional.scala 39:67]
      stateReg <= 2'h3; // @[WatermanFSM.scala 78:16]
    end else if (_T_13) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_104;
    end else begin
      stateReg <= _GEN_114;
    end
    if (reset) begin // @[WatermanFSM.scala 28:29]
      cntColumnReg <= 4'h0; // @[WatermanFSM.scala 28:29]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        cntColumnReg <= 4'h0; // @[WatermanFSM.scala 65:22]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        cntColumnReg <= _GEN_105;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 29:26]
      cntRowReg <= 4'h0; // @[WatermanFSM.scala 29:26]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanFSM.scala 47:25]
        cntRowReg <= 4'h0; // @[WatermanFSM.scala 66:19]
      end
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        cntRowReg <= _GEN_106;
      end
    end
    if (reset) begin // @[WatermanFSM.scala 30:23]
      resReg <= 32'sh0; // @[WatermanFSM.scala 30:23]
    end else if (!(_T_2)) begin // @[Conditional.scala 40:58]
      if (_T_5) begin // @[Conditional.scala 39:67]
        resReg <= pe_io_out; // @[WatermanFSM.scala 77:14]
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2 & io_in_valid & ~reset) begin
          $fwrite(32'h80000002,"\n"); // @[WatermanFSM.scala 48:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~_T_2 & ~_T_5 & _T_13 & io_out_ready & _T_4) begin
          $fwrite(32'h80000002,"%d ",resReg); // @[WatermanFSM.scala 84:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_215 & _T_20 & _T_4) begin
          $fwrite(32'h80000002,"\n"); // @[WatermanFSM.scala 88:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_215 & ~_T_20 & _T_18 & _T_4) begin
          $fwrite(32'h80000002,"\n"); // @[WatermanFSM.scala 92:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  TReg_0 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  TReg_1 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  TReg_2 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  TReg_3 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  TReg_4 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  TReg_5 = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  rowsReg_0 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  rowsReg_1 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  rowsReg_2 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  rowsReg_3 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  rowsReg_4 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  rowsReg_5 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  columnsReg_1 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  columnsReg_2 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  columnsReg_3 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  columnsReg_4 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  columnsReg_5 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  columnsReg_6 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  columnsReg_7 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  resultingColumnsReg_0 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  resultingColumnsReg_1 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  resultingColumnsReg_2 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  resultingColumnsReg_3 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  resultingColumnsReg_4 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  resultingColumnsReg_5 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  resultingColumnsReg_6 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  stateReg = _RAND_33[1:0];
  _RAND_34 = {1{`RANDOM}};
  cntColumnReg = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  cntRowReg = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  resReg = _RAND_36[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
