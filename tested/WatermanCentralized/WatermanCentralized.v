module substituteElements(
  input  [1:0]  io_first,
  input  [1:0]  io_second,
  output [31:0] io_out
);
  wire [1:0] _GEN_0 = io_first == io_second ? $signed(2'sh1) : $signed(-2'sh1); // @[DNA.scala 27:33 DNA.scala 28:12 DNA.scala 30:12]
  assign io_out = {{30{_GEN_0[1]}},_GEN_0}; // @[DNA.scala 27:33 DNA.scala 28:12 DNA.scala 30:12]
endmodule
module calculateCell(
  input  [31:0] io_upper,
  input  [31:0] io_left,
  input  [31:0] io_diagonal,
  input  [1:0]  io_rowElement,
  input  [1:0]  io_columnElement,
  output [31:0] io_out
);
  wire [1:0] substituteElements_io_first; // @[DNA.scala 45:34]
  wire [1:0] substituteElements_io_second; // @[DNA.scala 45:34]
  wire [31:0] substituteElements_io_out; // @[DNA.scala 45:34]
  wire [31:0] diag = $signed(io_diagonal) + $signed(substituteElements_io_out); // @[DNA.scala 50:23]
  wire [31:0] upper = $signed(io_upper) - 32'sh2; // @[DNA.scala 51:21]
  wire [31:0] left = $signed(io_left) - 32'sh2; // @[DNA.scala 52:19]
  wire [31:0] diagUpper = $signed(diag) > $signed(upper) ? $signed(diag) : $signed(upper); // @[DNA.scala 54:23 DNA.scala 55:15 DNA.scala 57:15]
  wire [31:0] diagLeft = $signed(diag) > $signed(left) ? $signed(diag) : $signed(left); // @[DNA.scala 59:22 DNA.scala 60:14 DNA.scala 62:14]
  wire [31:0] max = $signed(diagLeft) > $signed(diagUpper) ? $signed(diagLeft) : $signed(diagUpper); // @[DNA.scala 64:31 DNA.scala 65:9 DNA.scala 67:9]
  substituteElements substituteElements ( // @[DNA.scala 45:34]
    .io_first(substituteElements_io_first),
    .io_second(substituteElements_io_second),
    .io_out(substituteElements_io_out)
  );
  assign io_out = $signed(max) > 32'sh0 ? $signed(max) : $signed(32'sh0); // @[DNA.scala 71:36 DNA.scala 72:14 DNA.scala 74:14]
  assign substituteElements_io_first = io_rowElement; // @[DNA.scala 46:31]
  assign substituteElements_io_second = io_columnElement; // @[DNA.scala 47:32]
endmodule
module VectorElemOr(
  input   io_input_0,
  input   io_input_1,
  input   io_input_2,
  input   io_input_3,
  input   io_input_4,
  input   io_input_5,
  input   io_input_6,
  input   io_input_7,
  input   io_input_8,
  input   io_input_9,
  input   io_input_10,
  input   io_input_11,
  input   io_input_12,
  input   io_input_13,
  input   io_input_14,
  output  io_out
);
  assign io_out = io_input_0 | io_input_1 | io_input_2 | io_input_3 | io_input_4 | io_input_5 | io_input_6 | io_input_7
     | io_input_8 | io_input_9 | io_input_10 | io_input_11 | io_input_12 | io_input_13 | io_input_14; // @[WatermanCentralized.scala 124:31]
endmodule
module WatermanCentralized(
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
  input         io_out_0_ready,
  output        io_out_0_valid,
  output [31:0] io_out_0_bits_score,
  output [4:0]  io_out_0_bits_x,
  output [3:0]  io_out_0_bits_y,
  input         io_out_1_ready,
  output        io_out_1_valid,
  output [31:0] io_out_1_bits_score,
  output [4:0]  io_out_1_bits_x,
  output [3:0]  io_out_1_bits_y,
  input         io_out_2_ready,
  output        io_out_2_valid,
  output [31:0] io_out_2_bits_score,
  output [4:0]  io_out_2_bits_x,
  output [3:0]  io_out_2_bits_y,
  input         io_out_3_ready,
  output        io_out_3_valid,
  output [31:0] io_out_3_bits_score,
  output [4:0]  io_out_3_bits_x,
  output [3:0]  io_out_3_bits_y,
  input         io_out_4_ready,
  output        io_out_4_valid,
  output [31:0] io_out_4_bits_score,
  output [4:0]  io_out_4_bits_x,
  output [3:0]  io_out_4_bits_y,
  input         io_out_5_ready,
  output        io_out_5_valid,
  output [31:0] io_out_5_bits_score,
  output [4:0]  io_out_5_bits_x,
  output [3:0]  io_out_5_bits_y,
  input         io_out_6_ready,
  output        io_out_6_valid,
  output [31:0] io_out_6_bits_score,
  output [4:0]  io_out_6_bits_x,
  output [3:0]  io_out_6_bits_y,
  input         io_out_7_ready,
  output        io_out_7_valid,
  output [31:0] io_out_7_bits_score,
  output [4:0]  io_out_7_bits_x,
  output [3:0]  io_out_7_bits_y,
  input         io_out_8_ready,
  output        io_out_8_valid,
  output [31:0] io_out_8_bits_score,
  output [4:0]  io_out_8_bits_x,
  output [3:0]  io_out_8_bits_y,
  input         io_out_9_ready,
  output        io_out_9_valid,
  output [31:0] io_out_9_bits_score,
  output [4:0]  io_out_9_bits_x,
  output [3:0]  io_out_9_bits_y,
  input         io_out_10_ready,
  output        io_out_10_valid,
  output [31:0] io_out_10_bits_score,
  output [4:0]  io_out_10_bits_x,
  output [3:0]  io_out_10_bits_y,
  input         io_out_11_ready,
  output        io_out_11_valid,
  output [31:0] io_out_11_bits_score,
  output [4:0]  io_out_11_bits_x,
  output [3:0]  io_out_11_bits_y,
  input         io_out_12_ready,
  output        io_out_12_valid,
  output [31:0] io_out_12_bits_score,
  output [4:0]  io_out_12_bits_x,
  output [3:0]  io_out_12_bits_y,
  input         io_out_13_ready,
  output        io_out_13_valid,
  output [31:0] io_out_13_bits_score,
  output [4:0]  io_out_13_bits_x,
  output [3:0]  io_out_13_bits_y,
  input         io_out_14_ready,
  output        io_out_14_valid,
  output [31:0] io_out_14_bits_score,
  output [4:0]  io_out_14_bits_x,
  output [3:0]  io_out_14_bits_y
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
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] calculateCell_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_1_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_1_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_1_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_1_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_1_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_1_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_2_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_2_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_2_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_2_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_2_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_2_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_3_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_3_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_3_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_3_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_3_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_3_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_4_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_4_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_4_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_4_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_4_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_4_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_5_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_5_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_5_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_5_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_5_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_5_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_6_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_6_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_6_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_6_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_6_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_6_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_7_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_7_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_7_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_7_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_7_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_7_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_8_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_8_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_8_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_8_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_8_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_8_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_9_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_9_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_9_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_9_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_9_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_9_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_10_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_10_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_10_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_10_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_10_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_10_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_11_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_11_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_11_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_11_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_11_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_11_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_12_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_12_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_12_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_12_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_12_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_12_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_13_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_13_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_13_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_13_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_13_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_13_io_out; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_14_io_upper; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_14_io_left; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_14_io_diagonal; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_14_io_rowElement; // @[WatermanCentralized.scala 31:11]
  wire [1:0] calculateCell_14_io_columnElement; // @[WatermanCentralized.scala 31:11]
  wire [31:0] calculateCell_14_io_out; // @[WatermanCentralized.scala 31:11]
  wire  leftForOutput_io_input_0; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_1; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_2; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_3; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_4; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_5; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_6; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_7; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_8; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_9; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_10; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_11; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_12; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_13; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_input_14; // @[WatermanCentralized.scala 42:29]
  wire  leftForOutput_io_out; // @[WatermanCentralized.scala 42:29]
  reg [1:0] SReg_0; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_1; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_2; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_3; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_4; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_5; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_6; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_7; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_8; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_9; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_10; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_11; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_12; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_13; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_14; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_15; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_16; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_17; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_18; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_19; // @[WatermanCentralized.scala 17:21]
  reg [1:0] SReg_20; // @[WatermanCentralized.scala 17:21]
  reg [31:0] columnsReg_0; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_1; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_2; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_3; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_4; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_5; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_6; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_7; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_8; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_9; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_10; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_11; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_12; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_13; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_14; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_15; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_16; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_17; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_18; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_19; // @[WatermanCentralized.scala 18:27]
  reg [31:0] columnsReg_20; // @[WatermanCentralized.scala 18:27]
  reg [1:0] TReg_0; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_1; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_2; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_3; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_4; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_5; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_6; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_7; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_8; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_9; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_10; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_11; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_12; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_13; // @[WatermanCentralized.scala 19:21]
  reg [1:0] TReg_14; // @[WatermanCentralized.scala 19:21]
  reg [31:0] rowsReg_0; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_1; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_2; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_3; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_4; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_5; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_6; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_7; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_8; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_9; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_10; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_11; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_12; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_13; // @[WatermanCentralized.scala 20:24]
  reg [31:0] rowsReg_14; // @[WatermanCentralized.scala 20:24]
  reg [31:0] resReg_0; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_1; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_2; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_3; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_4; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_5; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_6; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_7; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_8; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_9; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_10; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_11; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_12; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_13; // @[WatermanCentralized.scala 21:23]
  reg [31:0] resReg_14; // @[WatermanCentralized.scala 21:23]
  reg [31:0] diagReg_1; // @[WatermanCentralized.scala 22:24]
  reg [31:0] diagReg_2; // @[WatermanCentralized.scala 22:24]
  reg [31:0] diagReg_3; // @[WatermanCentralized.scala 22:24]
  reg [31:0] diagReg_4; // @[WatermanCentralized.scala 22:24]
  reg [31:0] diagReg_5; // @[WatermanCentralized.scala 22:24]
  reg [31:0] diagReg_6; // @[WatermanCentralized.scala 22:24]
  reg [31:0] diagReg_7; // @[WatermanCentralized.scala 22:24]
  reg [31:0] diagReg_8; // @[WatermanCentralized.scala 22:24]
  reg [31:0] diagReg_9; // @[WatermanCentralized.scala 22:24]
  reg [31:0] diagReg_10; // @[WatermanCentralized.scala 22:24]
  reg [31:0] diagReg_11; // @[WatermanCentralized.scala 22:24]
  reg [31:0] diagReg_12; // @[WatermanCentralized.scala 22:24]
  reg [31:0] diagReg_13; // @[WatermanCentralized.scala 22:24]
  reg [31:0] diagReg_14; // @[WatermanCentralized.scala 22:24]
  reg [31:0] intermDiagReg_1; // @[WatermanCentralized.scala 23:30]
  reg [31:0] intermDiagReg_2; // @[WatermanCentralized.scala 23:30]
  reg [31:0] intermDiagReg_3; // @[WatermanCentralized.scala 23:30]
  reg [31:0] intermDiagReg_4; // @[WatermanCentralized.scala 23:30]
  reg [31:0] intermDiagReg_5; // @[WatermanCentralized.scala 23:30]
  reg [31:0] intermDiagReg_6; // @[WatermanCentralized.scala 23:30]
  reg [31:0] intermDiagReg_7; // @[WatermanCentralized.scala 23:30]
  reg [31:0] intermDiagReg_8; // @[WatermanCentralized.scala 23:30]
  reg [31:0] intermDiagReg_9; // @[WatermanCentralized.scala 23:30]
  reg [31:0] intermDiagReg_10; // @[WatermanCentralized.scala 23:30]
  reg [31:0] intermDiagReg_11; // @[WatermanCentralized.scala 23:30]
  reg [31:0] intermDiagReg_12; // @[WatermanCentralized.scala 23:30]
  reg [31:0] intermDiagReg_13; // @[WatermanCentralized.scala 23:30]
  reg [31:0] intermDiagReg_14; // @[WatermanCentralized.scala 23:30]
  reg  outValidReg_0; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_1; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_2; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_3; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_4; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_5; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_6; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_7; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_8; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_9; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_10; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_11; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_12; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_13; // @[WatermanCentralized.scala 24:28]
  reg  outValidReg_14; // @[WatermanCentralized.scala 24:28]
  reg [6:0] stepReg; // @[WatermanCentralized.scala 25:24]
  reg [1:0] stateReg; // @[WatermanCentralized.scala 28:25]
  wire [6:0] _T_2 = $signed(stepReg) - 7'sh0; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_6 = 7'sh0 - $signed(_T_2); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_8 = $signed(_T_2) < 7'sh0 ? $signed(_T_6) : $signed(_T_2); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_1 = 5'h1 == _T_8[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_2 = 5'h2 == _T_8[4:0] ? $signed(columnsReg_2) : $signed(_GEN_1); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_3 = 5'h3 == _T_8[4:0] ? $signed(columnsReg_3) : $signed(_GEN_2); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_4 = 5'h4 == _T_8[4:0] ? $signed(columnsReg_4) : $signed(_GEN_3); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_5 = 5'h5 == _T_8[4:0] ? $signed(columnsReg_5) : $signed(_GEN_4); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_6 = 5'h6 == _T_8[4:0] ? $signed(columnsReg_6) : $signed(_GEN_5); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_7 = 5'h7 == _T_8[4:0] ? $signed(columnsReg_7) : $signed(_GEN_6); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_8 = 5'h8 == _T_8[4:0] ? $signed(columnsReg_8) : $signed(_GEN_7); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_9 = 5'h9 == _T_8[4:0] ? $signed(columnsReg_9) : $signed(_GEN_8); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_10 = 5'ha == _T_8[4:0] ? $signed(columnsReg_10) : $signed(_GEN_9); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_11 = 5'hb == _T_8[4:0] ? $signed(columnsReg_11) : $signed(_GEN_10); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_12 = 5'hc == _T_8[4:0] ? $signed(columnsReg_12) : $signed(_GEN_11); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_13 = 5'hd == _T_8[4:0] ? $signed(columnsReg_13) : $signed(_GEN_12); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_14 = 5'he == _T_8[4:0] ? $signed(columnsReg_14) : $signed(_GEN_13); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_15 = 5'hf == _T_8[4:0] ? $signed(columnsReg_15) : $signed(_GEN_14); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_16 = 5'h10 == _T_8[4:0] ? $signed(columnsReg_16) : $signed(_GEN_15); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_17 = 5'h11 == _T_8[4:0] ? $signed(columnsReg_17) : $signed(_GEN_16); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_18 = 5'h12 == _T_8[4:0] ? $signed(columnsReg_18) : $signed(_GEN_17); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_19 = 5'h13 == _T_8[4:0] ? $signed(columnsReg_19) : $signed(_GEN_18); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_22 = 5'h1 == _T_8[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_23 = 5'h2 == _T_8[4:0] ? SReg_2 : _GEN_22; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_24 = 5'h3 == _T_8[4:0] ? SReg_3 : _GEN_23; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_25 = 5'h4 == _T_8[4:0] ? SReg_4 : _GEN_24; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_26 = 5'h5 == _T_8[4:0] ? SReg_5 : _GEN_25; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_27 = 5'h6 == _T_8[4:0] ? SReg_6 : _GEN_26; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_28 = 5'h7 == _T_8[4:0] ? SReg_7 : _GEN_27; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_29 = 5'h8 == _T_8[4:0] ? SReg_8 : _GEN_28; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_30 = 5'h9 == _T_8[4:0] ? SReg_9 : _GEN_29; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_31 = 5'ha == _T_8[4:0] ? SReg_10 : _GEN_30; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_32 = 5'hb == _T_8[4:0] ? SReg_11 : _GEN_31; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_33 = 5'hc == _T_8[4:0] ? SReg_12 : _GEN_32; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_34 = 5'hd == _T_8[4:0] ? SReg_13 : _GEN_33; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_35 = 5'he == _T_8[4:0] ? SReg_14 : _GEN_34; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_36 = 5'hf == _T_8[4:0] ? SReg_15 : _GEN_35; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_37 = 5'h10 == _T_8[4:0] ? SReg_16 : _GEN_36; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_38 = 5'h11 == _T_8[4:0] ? SReg_17 : _GEN_37; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_39 = 5'h12 == _T_8[4:0] ? SReg_18 : _GEN_38; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_40 = 5'h13 == _T_8[4:0] ? SReg_19 : _GEN_39; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_22 = $signed(stepReg) - 7'sh1; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_26 = 7'sh0 - $signed(_T_22); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_28 = $signed(_T_22) < 7'sh0 ? $signed(_T_26) : $signed(_T_22); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_43 = 5'h1 == _T_28[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_44 = 5'h2 == _T_28[4:0] ? $signed(columnsReg_2) : $signed(_GEN_43); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_45 = 5'h3 == _T_28[4:0] ? $signed(columnsReg_3) : $signed(_GEN_44); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_46 = 5'h4 == _T_28[4:0] ? $signed(columnsReg_4) : $signed(_GEN_45); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_47 = 5'h5 == _T_28[4:0] ? $signed(columnsReg_5) : $signed(_GEN_46); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_48 = 5'h6 == _T_28[4:0] ? $signed(columnsReg_6) : $signed(_GEN_47); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_49 = 5'h7 == _T_28[4:0] ? $signed(columnsReg_7) : $signed(_GEN_48); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_50 = 5'h8 == _T_28[4:0] ? $signed(columnsReg_8) : $signed(_GEN_49); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_51 = 5'h9 == _T_28[4:0] ? $signed(columnsReg_9) : $signed(_GEN_50); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_52 = 5'ha == _T_28[4:0] ? $signed(columnsReg_10) : $signed(_GEN_51); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_53 = 5'hb == _T_28[4:0] ? $signed(columnsReg_11) : $signed(_GEN_52); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_54 = 5'hc == _T_28[4:0] ? $signed(columnsReg_12) : $signed(_GEN_53); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_55 = 5'hd == _T_28[4:0] ? $signed(columnsReg_13) : $signed(_GEN_54); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_56 = 5'he == _T_28[4:0] ? $signed(columnsReg_14) : $signed(_GEN_55); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_57 = 5'hf == _T_28[4:0] ? $signed(columnsReg_15) : $signed(_GEN_56); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_58 = 5'h10 == _T_28[4:0] ? $signed(columnsReg_16) : $signed(_GEN_57); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_59 = 5'h11 == _T_28[4:0] ? $signed(columnsReg_17) : $signed(_GEN_58); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_60 = 5'h12 == _T_28[4:0] ? $signed(columnsReg_18) : $signed(_GEN_59); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_61 = 5'h13 == _T_28[4:0] ? $signed(columnsReg_19) : $signed(_GEN_60); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_64 = 5'h1 == _T_28[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_65 = 5'h2 == _T_28[4:0] ? SReg_2 : _GEN_64; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_66 = 5'h3 == _T_28[4:0] ? SReg_3 : _GEN_65; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_67 = 5'h4 == _T_28[4:0] ? SReg_4 : _GEN_66; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_68 = 5'h5 == _T_28[4:0] ? SReg_5 : _GEN_67; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_69 = 5'h6 == _T_28[4:0] ? SReg_6 : _GEN_68; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_70 = 5'h7 == _T_28[4:0] ? SReg_7 : _GEN_69; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_71 = 5'h8 == _T_28[4:0] ? SReg_8 : _GEN_70; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_72 = 5'h9 == _T_28[4:0] ? SReg_9 : _GEN_71; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_73 = 5'ha == _T_28[4:0] ? SReg_10 : _GEN_72; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_74 = 5'hb == _T_28[4:0] ? SReg_11 : _GEN_73; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_75 = 5'hc == _T_28[4:0] ? SReg_12 : _GEN_74; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_76 = 5'hd == _T_28[4:0] ? SReg_13 : _GEN_75; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_77 = 5'he == _T_28[4:0] ? SReg_14 : _GEN_76; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_78 = 5'hf == _T_28[4:0] ? SReg_15 : _GEN_77; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_79 = 5'h10 == _T_28[4:0] ? SReg_16 : _GEN_78; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_80 = 5'h11 == _T_28[4:0] ? SReg_17 : _GEN_79; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_81 = 5'h12 == _T_28[4:0] ? SReg_18 : _GEN_80; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_82 = 5'h13 == _T_28[4:0] ? SReg_19 : _GEN_81; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_42 = $signed(stepReg) - 7'sh2; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_46 = 7'sh0 - $signed(_T_42); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_48 = $signed(_T_42) < 7'sh0 ? $signed(_T_46) : $signed(_T_42); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_85 = 5'h1 == _T_48[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_86 = 5'h2 == _T_48[4:0] ? $signed(columnsReg_2) : $signed(_GEN_85); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_87 = 5'h3 == _T_48[4:0] ? $signed(columnsReg_3) : $signed(_GEN_86); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_88 = 5'h4 == _T_48[4:0] ? $signed(columnsReg_4) : $signed(_GEN_87); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_89 = 5'h5 == _T_48[4:0] ? $signed(columnsReg_5) : $signed(_GEN_88); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_90 = 5'h6 == _T_48[4:0] ? $signed(columnsReg_6) : $signed(_GEN_89); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_91 = 5'h7 == _T_48[4:0] ? $signed(columnsReg_7) : $signed(_GEN_90); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_92 = 5'h8 == _T_48[4:0] ? $signed(columnsReg_8) : $signed(_GEN_91); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_93 = 5'h9 == _T_48[4:0] ? $signed(columnsReg_9) : $signed(_GEN_92); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_94 = 5'ha == _T_48[4:0] ? $signed(columnsReg_10) : $signed(_GEN_93); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_95 = 5'hb == _T_48[4:0] ? $signed(columnsReg_11) : $signed(_GEN_94); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_96 = 5'hc == _T_48[4:0] ? $signed(columnsReg_12) : $signed(_GEN_95); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_97 = 5'hd == _T_48[4:0] ? $signed(columnsReg_13) : $signed(_GEN_96); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_98 = 5'he == _T_48[4:0] ? $signed(columnsReg_14) : $signed(_GEN_97); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_99 = 5'hf == _T_48[4:0] ? $signed(columnsReg_15) : $signed(_GEN_98); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_100 = 5'h10 == _T_48[4:0] ? $signed(columnsReg_16) : $signed(_GEN_99); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_101 = 5'h11 == _T_48[4:0] ? $signed(columnsReg_17) : $signed(_GEN_100); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_102 = 5'h12 == _T_48[4:0] ? $signed(columnsReg_18) : $signed(_GEN_101); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_103 = 5'h13 == _T_48[4:0] ? $signed(columnsReg_19) : $signed(_GEN_102); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_106 = 5'h1 == _T_48[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_107 = 5'h2 == _T_48[4:0] ? SReg_2 : _GEN_106; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_108 = 5'h3 == _T_48[4:0] ? SReg_3 : _GEN_107; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_109 = 5'h4 == _T_48[4:0] ? SReg_4 : _GEN_108; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_110 = 5'h5 == _T_48[4:0] ? SReg_5 : _GEN_109; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_111 = 5'h6 == _T_48[4:0] ? SReg_6 : _GEN_110; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_112 = 5'h7 == _T_48[4:0] ? SReg_7 : _GEN_111; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_113 = 5'h8 == _T_48[4:0] ? SReg_8 : _GEN_112; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_114 = 5'h9 == _T_48[4:0] ? SReg_9 : _GEN_113; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_115 = 5'ha == _T_48[4:0] ? SReg_10 : _GEN_114; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_116 = 5'hb == _T_48[4:0] ? SReg_11 : _GEN_115; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_117 = 5'hc == _T_48[4:0] ? SReg_12 : _GEN_116; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_118 = 5'hd == _T_48[4:0] ? SReg_13 : _GEN_117; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_119 = 5'he == _T_48[4:0] ? SReg_14 : _GEN_118; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_120 = 5'hf == _T_48[4:0] ? SReg_15 : _GEN_119; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_121 = 5'h10 == _T_48[4:0] ? SReg_16 : _GEN_120; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_122 = 5'h11 == _T_48[4:0] ? SReg_17 : _GEN_121; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_123 = 5'h12 == _T_48[4:0] ? SReg_18 : _GEN_122; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_124 = 5'h13 == _T_48[4:0] ? SReg_19 : _GEN_123; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_62 = $signed(stepReg) - 7'sh3; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_66 = 7'sh0 - $signed(_T_62); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_68 = $signed(_T_62) < 7'sh0 ? $signed(_T_66) : $signed(_T_62); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_127 = 5'h1 == _T_68[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_128 = 5'h2 == _T_68[4:0] ? $signed(columnsReg_2) : $signed(_GEN_127); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_129 = 5'h3 == _T_68[4:0] ? $signed(columnsReg_3) : $signed(_GEN_128); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_130 = 5'h4 == _T_68[4:0] ? $signed(columnsReg_4) : $signed(_GEN_129); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_131 = 5'h5 == _T_68[4:0] ? $signed(columnsReg_5) : $signed(_GEN_130); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_132 = 5'h6 == _T_68[4:0] ? $signed(columnsReg_6) : $signed(_GEN_131); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_133 = 5'h7 == _T_68[4:0] ? $signed(columnsReg_7) : $signed(_GEN_132); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_134 = 5'h8 == _T_68[4:0] ? $signed(columnsReg_8) : $signed(_GEN_133); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_135 = 5'h9 == _T_68[4:0] ? $signed(columnsReg_9) : $signed(_GEN_134); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_136 = 5'ha == _T_68[4:0] ? $signed(columnsReg_10) : $signed(_GEN_135); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_137 = 5'hb == _T_68[4:0] ? $signed(columnsReg_11) : $signed(_GEN_136); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_138 = 5'hc == _T_68[4:0] ? $signed(columnsReg_12) : $signed(_GEN_137); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_139 = 5'hd == _T_68[4:0] ? $signed(columnsReg_13) : $signed(_GEN_138); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_140 = 5'he == _T_68[4:0] ? $signed(columnsReg_14) : $signed(_GEN_139); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_141 = 5'hf == _T_68[4:0] ? $signed(columnsReg_15) : $signed(_GEN_140); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_142 = 5'h10 == _T_68[4:0] ? $signed(columnsReg_16) : $signed(_GEN_141); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_143 = 5'h11 == _T_68[4:0] ? $signed(columnsReg_17) : $signed(_GEN_142); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_144 = 5'h12 == _T_68[4:0] ? $signed(columnsReg_18) : $signed(_GEN_143); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_145 = 5'h13 == _T_68[4:0] ? $signed(columnsReg_19) : $signed(_GEN_144); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_148 = 5'h1 == _T_68[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_149 = 5'h2 == _T_68[4:0] ? SReg_2 : _GEN_148; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_150 = 5'h3 == _T_68[4:0] ? SReg_3 : _GEN_149; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_151 = 5'h4 == _T_68[4:0] ? SReg_4 : _GEN_150; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_152 = 5'h5 == _T_68[4:0] ? SReg_5 : _GEN_151; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_153 = 5'h6 == _T_68[4:0] ? SReg_6 : _GEN_152; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_154 = 5'h7 == _T_68[4:0] ? SReg_7 : _GEN_153; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_155 = 5'h8 == _T_68[4:0] ? SReg_8 : _GEN_154; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_156 = 5'h9 == _T_68[4:0] ? SReg_9 : _GEN_155; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_157 = 5'ha == _T_68[4:0] ? SReg_10 : _GEN_156; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_158 = 5'hb == _T_68[4:0] ? SReg_11 : _GEN_157; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_159 = 5'hc == _T_68[4:0] ? SReg_12 : _GEN_158; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_160 = 5'hd == _T_68[4:0] ? SReg_13 : _GEN_159; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_161 = 5'he == _T_68[4:0] ? SReg_14 : _GEN_160; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_162 = 5'hf == _T_68[4:0] ? SReg_15 : _GEN_161; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_163 = 5'h10 == _T_68[4:0] ? SReg_16 : _GEN_162; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_164 = 5'h11 == _T_68[4:0] ? SReg_17 : _GEN_163; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_165 = 5'h12 == _T_68[4:0] ? SReg_18 : _GEN_164; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_166 = 5'h13 == _T_68[4:0] ? SReg_19 : _GEN_165; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_82 = $signed(stepReg) - 7'sh4; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_86 = 7'sh0 - $signed(_T_82); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_88 = $signed(_T_82) < 7'sh0 ? $signed(_T_86) : $signed(_T_82); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_169 = 5'h1 == _T_88[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_170 = 5'h2 == _T_88[4:0] ? $signed(columnsReg_2) : $signed(_GEN_169); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_171 = 5'h3 == _T_88[4:0] ? $signed(columnsReg_3) : $signed(_GEN_170); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_172 = 5'h4 == _T_88[4:0] ? $signed(columnsReg_4) : $signed(_GEN_171); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_173 = 5'h5 == _T_88[4:0] ? $signed(columnsReg_5) : $signed(_GEN_172); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_174 = 5'h6 == _T_88[4:0] ? $signed(columnsReg_6) : $signed(_GEN_173); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_175 = 5'h7 == _T_88[4:0] ? $signed(columnsReg_7) : $signed(_GEN_174); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_176 = 5'h8 == _T_88[4:0] ? $signed(columnsReg_8) : $signed(_GEN_175); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_177 = 5'h9 == _T_88[4:0] ? $signed(columnsReg_9) : $signed(_GEN_176); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_178 = 5'ha == _T_88[4:0] ? $signed(columnsReg_10) : $signed(_GEN_177); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_179 = 5'hb == _T_88[4:0] ? $signed(columnsReg_11) : $signed(_GEN_178); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_180 = 5'hc == _T_88[4:0] ? $signed(columnsReg_12) : $signed(_GEN_179); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_181 = 5'hd == _T_88[4:0] ? $signed(columnsReg_13) : $signed(_GEN_180); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_182 = 5'he == _T_88[4:0] ? $signed(columnsReg_14) : $signed(_GEN_181); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_183 = 5'hf == _T_88[4:0] ? $signed(columnsReg_15) : $signed(_GEN_182); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_184 = 5'h10 == _T_88[4:0] ? $signed(columnsReg_16) : $signed(_GEN_183); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_185 = 5'h11 == _T_88[4:0] ? $signed(columnsReg_17) : $signed(_GEN_184); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_186 = 5'h12 == _T_88[4:0] ? $signed(columnsReg_18) : $signed(_GEN_185); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_187 = 5'h13 == _T_88[4:0] ? $signed(columnsReg_19) : $signed(_GEN_186); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_190 = 5'h1 == _T_88[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_191 = 5'h2 == _T_88[4:0] ? SReg_2 : _GEN_190; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_192 = 5'h3 == _T_88[4:0] ? SReg_3 : _GEN_191; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_193 = 5'h4 == _T_88[4:0] ? SReg_4 : _GEN_192; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_194 = 5'h5 == _T_88[4:0] ? SReg_5 : _GEN_193; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_195 = 5'h6 == _T_88[4:0] ? SReg_6 : _GEN_194; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_196 = 5'h7 == _T_88[4:0] ? SReg_7 : _GEN_195; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_197 = 5'h8 == _T_88[4:0] ? SReg_8 : _GEN_196; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_198 = 5'h9 == _T_88[4:0] ? SReg_9 : _GEN_197; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_199 = 5'ha == _T_88[4:0] ? SReg_10 : _GEN_198; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_200 = 5'hb == _T_88[4:0] ? SReg_11 : _GEN_199; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_201 = 5'hc == _T_88[4:0] ? SReg_12 : _GEN_200; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_202 = 5'hd == _T_88[4:0] ? SReg_13 : _GEN_201; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_203 = 5'he == _T_88[4:0] ? SReg_14 : _GEN_202; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_204 = 5'hf == _T_88[4:0] ? SReg_15 : _GEN_203; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_205 = 5'h10 == _T_88[4:0] ? SReg_16 : _GEN_204; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_206 = 5'h11 == _T_88[4:0] ? SReg_17 : _GEN_205; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_207 = 5'h12 == _T_88[4:0] ? SReg_18 : _GEN_206; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_208 = 5'h13 == _T_88[4:0] ? SReg_19 : _GEN_207; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_102 = $signed(stepReg) - 7'sh5; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_106 = 7'sh0 - $signed(_T_102); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_108 = $signed(_T_102) < 7'sh0 ? $signed(_T_106) : $signed(_T_102); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_211 = 5'h1 == _T_108[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_212 = 5'h2 == _T_108[4:0] ? $signed(columnsReg_2) : $signed(_GEN_211); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_213 = 5'h3 == _T_108[4:0] ? $signed(columnsReg_3) : $signed(_GEN_212); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_214 = 5'h4 == _T_108[4:0] ? $signed(columnsReg_4) : $signed(_GEN_213); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_215 = 5'h5 == _T_108[4:0] ? $signed(columnsReg_5) : $signed(_GEN_214); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_216 = 5'h6 == _T_108[4:0] ? $signed(columnsReg_6) : $signed(_GEN_215); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_217 = 5'h7 == _T_108[4:0] ? $signed(columnsReg_7) : $signed(_GEN_216); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_218 = 5'h8 == _T_108[4:0] ? $signed(columnsReg_8) : $signed(_GEN_217); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_219 = 5'h9 == _T_108[4:0] ? $signed(columnsReg_9) : $signed(_GEN_218); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_220 = 5'ha == _T_108[4:0] ? $signed(columnsReg_10) : $signed(_GEN_219); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_221 = 5'hb == _T_108[4:0] ? $signed(columnsReg_11) : $signed(_GEN_220); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_222 = 5'hc == _T_108[4:0] ? $signed(columnsReg_12) : $signed(_GEN_221); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_223 = 5'hd == _T_108[4:0] ? $signed(columnsReg_13) : $signed(_GEN_222); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_224 = 5'he == _T_108[4:0] ? $signed(columnsReg_14) : $signed(_GEN_223); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_225 = 5'hf == _T_108[4:0] ? $signed(columnsReg_15) : $signed(_GEN_224); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_226 = 5'h10 == _T_108[4:0] ? $signed(columnsReg_16) : $signed(_GEN_225); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_227 = 5'h11 == _T_108[4:0] ? $signed(columnsReg_17) : $signed(_GEN_226); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_228 = 5'h12 == _T_108[4:0] ? $signed(columnsReg_18) : $signed(_GEN_227); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_229 = 5'h13 == _T_108[4:0] ? $signed(columnsReg_19) : $signed(_GEN_228); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_232 = 5'h1 == _T_108[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_233 = 5'h2 == _T_108[4:0] ? SReg_2 : _GEN_232; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_234 = 5'h3 == _T_108[4:0] ? SReg_3 : _GEN_233; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_235 = 5'h4 == _T_108[4:0] ? SReg_4 : _GEN_234; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_236 = 5'h5 == _T_108[4:0] ? SReg_5 : _GEN_235; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_237 = 5'h6 == _T_108[4:0] ? SReg_6 : _GEN_236; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_238 = 5'h7 == _T_108[4:0] ? SReg_7 : _GEN_237; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_239 = 5'h8 == _T_108[4:0] ? SReg_8 : _GEN_238; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_240 = 5'h9 == _T_108[4:0] ? SReg_9 : _GEN_239; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_241 = 5'ha == _T_108[4:0] ? SReg_10 : _GEN_240; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_242 = 5'hb == _T_108[4:0] ? SReg_11 : _GEN_241; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_243 = 5'hc == _T_108[4:0] ? SReg_12 : _GEN_242; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_244 = 5'hd == _T_108[4:0] ? SReg_13 : _GEN_243; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_245 = 5'he == _T_108[4:0] ? SReg_14 : _GEN_244; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_246 = 5'hf == _T_108[4:0] ? SReg_15 : _GEN_245; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_247 = 5'h10 == _T_108[4:0] ? SReg_16 : _GEN_246; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_248 = 5'h11 == _T_108[4:0] ? SReg_17 : _GEN_247; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_249 = 5'h12 == _T_108[4:0] ? SReg_18 : _GEN_248; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_250 = 5'h13 == _T_108[4:0] ? SReg_19 : _GEN_249; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_122 = $signed(stepReg) - 7'sh6; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_126 = 7'sh0 - $signed(_T_122); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_128 = $signed(_T_122) < 7'sh0 ? $signed(_T_126) : $signed(_T_122); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_253 = 5'h1 == _T_128[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_254 = 5'h2 == _T_128[4:0] ? $signed(columnsReg_2) : $signed(_GEN_253); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_255 = 5'h3 == _T_128[4:0] ? $signed(columnsReg_3) : $signed(_GEN_254); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_256 = 5'h4 == _T_128[4:0] ? $signed(columnsReg_4) : $signed(_GEN_255); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_257 = 5'h5 == _T_128[4:0] ? $signed(columnsReg_5) : $signed(_GEN_256); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_258 = 5'h6 == _T_128[4:0] ? $signed(columnsReg_6) : $signed(_GEN_257); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_259 = 5'h7 == _T_128[4:0] ? $signed(columnsReg_7) : $signed(_GEN_258); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_260 = 5'h8 == _T_128[4:0] ? $signed(columnsReg_8) : $signed(_GEN_259); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_261 = 5'h9 == _T_128[4:0] ? $signed(columnsReg_9) : $signed(_GEN_260); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_262 = 5'ha == _T_128[4:0] ? $signed(columnsReg_10) : $signed(_GEN_261); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_263 = 5'hb == _T_128[4:0] ? $signed(columnsReg_11) : $signed(_GEN_262); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_264 = 5'hc == _T_128[4:0] ? $signed(columnsReg_12) : $signed(_GEN_263); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_265 = 5'hd == _T_128[4:0] ? $signed(columnsReg_13) : $signed(_GEN_264); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_266 = 5'he == _T_128[4:0] ? $signed(columnsReg_14) : $signed(_GEN_265); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_267 = 5'hf == _T_128[4:0] ? $signed(columnsReg_15) : $signed(_GEN_266); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_268 = 5'h10 == _T_128[4:0] ? $signed(columnsReg_16) : $signed(_GEN_267); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_269 = 5'h11 == _T_128[4:0] ? $signed(columnsReg_17) : $signed(_GEN_268); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_270 = 5'h12 == _T_128[4:0] ? $signed(columnsReg_18) : $signed(_GEN_269); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_271 = 5'h13 == _T_128[4:0] ? $signed(columnsReg_19) : $signed(_GEN_270); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_274 = 5'h1 == _T_128[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_275 = 5'h2 == _T_128[4:0] ? SReg_2 : _GEN_274; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_276 = 5'h3 == _T_128[4:0] ? SReg_3 : _GEN_275; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_277 = 5'h4 == _T_128[4:0] ? SReg_4 : _GEN_276; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_278 = 5'h5 == _T_128[4:0] ? SReg_5 : _GEN_277; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_279 = 5'h6 == _T_128[4:0] ? SReg_6 : _GEN_278; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_280 = 5'h7 == _T_128[4:0] ? SReg_7 : _GEN_279; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_281 = 5'h8 == _T_128[4:0] ? SReg_8 : _GEN_280; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_282 = 5'h9 == _T_128[4:0] ? SReg_9 : _GEN_281; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_283 = 5'ha == _T_128[4:0] ? SReg_10 : _GEN_282; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_284 = 5'hb == _T_128[4:0] ? SReg_11 : _GEN_283; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_285 = 5'hc == _T_128[4:0] ? SReg_12 : _GEN_284; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_286 = 5'hd == _T_128[4:0] ? SReg_13 : _GEN_285; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_287 = 5'he == _T_128[4:0] ? SReg_14 : _GEN_286; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_288 = 5'hf == _T_128[4:0] ? SReg_15 : _GEN_287; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_289 = 5'h10 == _T_128[4:0] ? SReg_16 : _GEN_288; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_290 = 5'h11 == _T_128[4:0] ? SReg_17 : _GEN_289; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_291 = 5'h12 == _T_128[4:0] ? SReg_18 : _GEN_290; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_292 = 5'h13 == _T_128[4:0] ? SReg_19 : _GEN_291; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_142 = $signed(stepReg) - 7'sh7; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_146 = 7'sh0 - $signed(_T_142); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_148 = $signed(_T_142) < 7'sh0 ? $signed(_T_146) : $signed(_T_142); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_295 = 5'h1 == _T_148[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_296 = 5'h2 == _T_148[4:0] ? $signed(columnsReg_2) : $signed(_GEN_295); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_297 = 5'h3 == _T_148[4:0] ? $signed(columnsReg_3) : $signed(_GEN_296); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_298 = 5'h4 == _T_148[4:0] ? $signed(columnsReg_4) : $signed(_GEN_297); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_299 = 5'h5 == _T_148[4:0] ? $signed(columnsReg_5) : $signed(_GEN_298); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_300 = 5'h6 == _T_148[4:0] ? $signed(columnsReg_6) : $signed(_GEN_299); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_301 = 5'h7 == _T_148[4:0] ? $signed(columnsReg_7) : $signed(_GEN_300); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_302 = 5'h8 == _T_148[4:0] ? $signed(columnsReg_8) : $signed(_GEN_301); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_303 = 5'h9 == _T_148[4:0] ? $signed(columnsReg_9) : $signed(_GEN_302); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_304 = 5'ha == _T_148[4:0] ? $signed(columnsReg_10) : $signed(_GEN_303); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_305 = 5'hb == _T_148[4:0] ? $signed(columnsReg_11) : $signed(_GEN_304); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_306 = 5'hc == _T_148[4:0] ? $signed(columnsReg_12) : $signed(_GEN_305); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_307 = 5'hd == _T_148[4:0] ? $signed(columnsReg_13) : $signed(_GEN_306); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_308 = 5'he == _T_148[4:0] ? $signed(columnsReg_14) : $signed(_GEN_307); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_309 = 5'hf == _T_148[4:0] ? $signed(columnsReg_15) : $signed(_GEN_308); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_310 = 5'h10 == _T_148[4:0] ? $signed(columnsReg_16) : $signed(_GEN_309); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_311 = 5'h11 == _T_148[4:0] ? $signed(columnsReg_17) : $signed(_GEN_310); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_312 = 5'h12 == _T_148[4:0] ? $signed(columnsReg_18) : $signed(_GEN_311); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_313 = 5'h13 == _T_148[4:0] ? $signed(columnsReg_19) : $signed(_GEN_312); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_316 = 5'h1 == _T_148[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_317 = 5'h2 == _T_148[4:0] ? SReg_2 : _GEN_316; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_318 = 5'h3 == _T_148[4:0] ? SReg_3 : _GEN_317; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_319 = 5'h4 == _T_148[4:0] ? SReg_4 : _GEN_318; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_320 = 5'h5 == _T_148[4:0] ? SReg_5 : _GEN_319; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_321 = 5'h6 == _T_148[4:0] ? SReg_6 : _GEN_320; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_322 = 5'h7 == _T_148[4:0] ? SReg_7 : _GEN_321; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_323 = 5'h8 == _T_148[4:0] ? SReg_8 : _GEN_322; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_324 = 5'h9 == _T_148[4:0] ? SReg_9 : _GEN_323; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_325 = 5'ha == _T_148[4:0] ? SReg_10 : _GEN_324; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_326 = 5'hb == _T_148[4:0] ? SReg_11 : _GEN_325; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_327 = 5'hc == _T_148[4:0] ? SReg_12 : _GEN_326; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_328 = 5'hd == _T_148[4:0] ? SReg_13 : _GEN_327; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_329 = 5'he == _T_148[4:0] ? SReg_14 : _GEN_328; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_330 = 5'hf == _T_148[4:0] ? SReg_15 : _GEN_329; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_331 = 5'h10 == _T_148[4:0] ? SReg_16 : _GEN_330; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_332 = 5'h11 == _T_148[4:0] ? SReg_17 : _GEN_331; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_333 = 5'h12 == _T_148[4:0] ? SReg_18 : _GEN_332; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_334 = 5'h13 == _T_148[4:0] ? SReg_19 : _GEN_333; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_162 = $signed(stepReg) - 7'sh8; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_166 = 7'sh0 - $signed(_T_162); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_168 = $signed(_T_162) < 7'sh0 ? $signed(_T_166) : $signed(_T_162); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_337 = 5'h1 == _T_168[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_338 = 5'h2 == _T_168[4:0] ? $signed(columnsReg_2) : $signed(_GEN_337); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_339 = 5'h3 == _T_168[4:0] ? $signed(columnsReg_3) : $signed(_GEN_338); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_340 = 5'h4 == _T_168[4:0] ? $signed(columnsReg_4) : $signed(_GEN_339); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_341 = 5'h5 == _T_168[4:0] ? $signed(columnsReg_5) : $signed(_GEN_340); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_342 = 5'h6 == _T_168[4:0] ? $signed(columnsReg_6) : $signed(_GEN_341); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_343 = 5'h7 == _T_168[4:0] ? $signed(columnsReg_7) : $signed(_GEN_342); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_344 = 5'h8 == _T_168[4:0] ? $signed(columnsReg_8) : $signed(_GEN_343); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_345 = 5'h9 == _T_168[4:0] ? $signed(columnsReg_9) : $signed(_GEN_344); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_346 = 5'ha == _T_168[4:0] ? $signed(columnsReg_10) : $signed(_GEN_345); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_347 = 5'hb == _T_168[4:0] ? $signed(columnsReg_11) : $signed(_GEN_346); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_348 = 5'hc == _T_168[4:0] ? $signed(columnsReg_12) : $signed(_GEN_347); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_349 = 5'hd == _T_168[4:0] ? $signed(columnsReg_13) : $signed(_GEN_348); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_350 = 5'he == _T_168[4:0] ? $signed(columnsReg_14) : $signed(_GEN_349); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_351 = 5'hf == _T_168[4:0] ? $signed(columnsReg_15) : $signed(_GEN_350); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_352 = 5'h10 == _T_168[4:0] ? $signed(columnsReg_16) : $signed(_GEN_351); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_353 = 5'h11 == _T_168[4:0] ? $signed(columnsReg_17) : $signed(_GEN_352); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_354 = 5'h12 == _T_168[4:0] ? $signed(columnsReg_18) : $signed(_GEN_353); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_355 = 5'h13 == _T_168[4:0] ? $signed(columnsReg_19) : $signed(_GEN_354); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_358 = 5'h1 == _T_168[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_359 = 5'h2 == _T_168[4:0] ? SReg_2 : _GEN_358; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_360 = 5'h3 == _T_168[4:0] ? SReg_3 : _GEN_359; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_361 = 5'h4 == _T_168[4:0] ? SReg_4 : _GEN_360; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_362 = 5'h5 == _T_168[4:0] ? SReg_5 : _GEN_361; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_363 = 5'h6 == _T_168[4:0] ? SReg_6 : _GEN_362; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_364 = 5'h7 == _T_168[4:0] ? SReg_7 : _GEN_363; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_365 = 5'h8 == _T_168[4:0] ? SReg_8 : _GEN_364; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_366 = 5'h9 == _T_168[4:0] ? SReg_9 : _GEN_365; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_367 = 5'ha == _T_168[4:0] ? SReg_10 : _GEN_366; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_368 = 5'hb == _T_168[4:0] ? SReg_11 : _GEN_367; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_369 = 5'hc == _T_168[4:0] ? SReg_12 : _GEN_368; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_370 = 5'hd == _T_168[4:0] ? SReg_13 : _GEN_369; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_371 = 5'he == _T_168[4:0] ? SReg_14 : _GEN_370; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_372 = 5'hf == _T_168[4:0] ? SReg_15 : _GEN_371; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_373 = 5'h10 == _T_168[4:0] ? SReg_16 : _GEN_372; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_374 = 5'h11 == _T_168[4:0] ? SReg_17 : _GEN_373; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_375 = 5'h12 == _T_168[4:0] ? SReg_18 : _GEN_374; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_376 = 5'h13 == _T_168[4:0] ? SReg_19 : _GEN_375; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_182 = $signed(stepReg) - 7'sh9; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_186 = 7'sh0 - $signed(_T_182); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_188 = $signed(_T_182) < 7'sh0 ? $signed(_T_186) : $signed(_T_182); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_379 = 5'h1 == _T_188[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_380 = 5'h2 == _T_188[4:0] ? $signed(columnsReg_2) : $signed(_GEN_379); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_381 = 5'h3 == _T_188[4:0] ? $signed(columnsReg_3) : $signed(_GEN_380); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_382 = 5'h4 == _T_188[4:0] ? $signed(columnsReg_4) : $signed(_GEN_381); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_383 = 5'h5 == _T_188[4:0] ? $signed(columnsReg_5) : $signed(_GEN_382); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_384 = 5'h6 == _T_188[4:0] ? $signed(columnsReg_6) : $signed(_GEN_383); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_385 = 5'h7 == _T_188[4:0] ? $signed(columnsReg_7) : $signed(_GEN_384); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_386 = 5'h8 == _T_188[4:0] ? $signed(columnsReg_8) : $signed(_GEN_385); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_387 = 5'h9 == _T_188[4:0] ? $signed(columnsReg_9) : $signed(_GEN_386); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_388 = 5'ha == _T_188[4:0] ? $signed(columnsReg_10) : $signed(_GEN_387); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_389 = 5'hb == _T_188[4:0] ? $signed(columnsReg_11) : $signed(_GEN_388); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_390 = 5'hc == _T_188[4:0] ? $signed(columnsReg_12) : $signed(_GEN_389); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_391 = 5'hd == _T_188[4:0] ? $signed(columnsReg_13) : $signed(_GEN_390); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_392 = 5'he == _T_188[4:0] ? $signed(columnsReg_14) : $signed(_GEN_391); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_393 = 5'hf == _T_188[4:0] ? $signed(columnsReg_15) : $signed(_GEN_392); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_394 = 5'h10 == _T_188[4:0] ? $signed(columnsReg_16) : $signed(_GEN_393); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_395 = 5'h11 == _T_188[4:0] ? $signed(columnsReg_17) : $signed(_GEN_394); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_396 = 5'h12 == _T_188[4:0] ? $signed(columnsReg_18) : $signed(_GEN_395); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_397 = 5'h13 == _T_188[4:0] ? $signed(columnsReg_19) : $signed(_GEN_396); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_400 = 5'h1 == _T_188[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_401 = 5'h2 == _T_188[4:0] ? SReg_2 : _GEN_400; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_402 = 5'h3 == _T_188[4:0] ? SReg_3 : _GEN_401; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_403 = 5'h4 == _T_188[4:0] ? SReg_4 : _GEN_402; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_404 = 5'h5 == _T_188[4:0] ? SReg_5 : _GEN_403; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_405 = 5'h6 == _T_188[4:0] ? SReg_6 : _GEN_404; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_406 = 5'h7 == _T_188[4:0] ? SReg_7 : _GEN_405; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_407 = 5'h8 == _T_188[4:0] ? SReg_8 : _GEN_406; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_408 = 5'h9 == _T_188[4:0] ? SReg_9 : _GEN_407; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_409 = 5'ha == _T_188[4:0] ? SReg_10 : _GEN_408; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_410 = 5'hb == _T_188[4:0] ? SReg_11 : _GEN_409; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_411 = 5'hc == _T_188[4:0] ? SReg_12 : _GEN_410; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_412 = 5'hd == _T_188[4:0] ? SReg_13 : _GEN_411; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_413 = 5'he == _T_188[4:0] ? SReg_14 : _GEN_412; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_414 = 5'hf == _T_188[4:0] ? SReg_15 : _GEN_413; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_415 = 5'h10 == _T_188[4:0] ? SReg_16 : _GEN_414; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_416 = 5'h11 == _T_188[4:0] ? SReg_17 : _GEN_415; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_417 = 5'h12 == _T_188[4:0] ? SReg_18 : _GEN_416; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_418 = 5'h13 == _T_188[4:0] ? SReg_19 : _GEN_417; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_202 = $signed(stepReg) - 7'sha; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_206 = 7'sh0 - $signed(_T_202); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_208 = $signed(_T_202) < 7'sh0 ? $signed(_T_206) : $signed(_T_202); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_421 = 5'h1 == _T_208[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_422 = 5'h2 == _T_208[4:0] ? $signed(columnsReg_2) : $signed(_GEN_421); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_423 = 5'h3 == _T_208[4:0] ? $signed(columnsReg_3) : $signed(_GEN_422); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_424 = 5'h4 == _T_208[4:0] ? $signed(columnsReg_4) : $signed(_GEN_423); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_425 = 5'h5 == _T_208[4:0] ? $signed(columnsReg_5) : $signed(_GEN_424); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_426 = 5'h6 == _T_208[4:0] ? $signed(columnsReg_6) : $signed(_GEN_425); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_427 = 5'h7 == _T_208[4:0] ? $signed(columnsReg_7) : $signed(_GEN_426); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_428 = 5'h8 == _T_208[4:0] ? $signed(columnsReg_8) : $signed(_GEN_427); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_429 = 5'h9 == _T_208[4:0] ? $signed(columnsReg_9) : $signed(_GEN_428); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_430 = 5'ha == _T_208[4:0] ? $signed(columnsReg_10) : $signed(_GEN_429); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_431 = 5'hb == _T_208[4:0] ? $signed(columnsReg_11) : $signed(_GEN_430); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_432 = 5'hc == _T_208[4:0] ? $signed(columnsReg_12) : $signed(_GEN_431); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_433 = 5'hd == _T_208[4:0] ? $signed(columnsReg_13) : $signed(_GEN_432); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_434 = 5'he == _T_208[4:0] ? $signed(columnsReg_14) : $signed(_GEN_433); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_435 = 5'hf == _T_208[4:0] ? $signed(columnsReg_15) : $signed(_GEN_434); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_436 = 5'h10 == _T_208[4:0] ? $signed(columnsReg_16) : $signed(_GEN_435); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_437 = 5'h11 == _T_208[4:0] ? $signed(columnsReg_17) : $signed(_GEN_436); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_438 = 5'h12 == _T_208[4:0] ? $signed(columnsReg_18) : $signed(_GEN_437); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_439 = 5'h13 == _T_208[4:0] ? $signed(columnsReg_19) : $signed(_GEN_438); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_442 = 5'h1 == _T_208[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_443 = 5'h2 == _T_208[4:0] ? SReg_2 : _GEN_442; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_444 = 5'h3 == _T_208[4:0] ? SReg_3 : _GEN_443; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_445 = 5'h4 == _T_208[4:0] ? SReg_4 : _GEN_444; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_446 = 5'h5 == _T_208[4:0] ? SReg_5 : _GEN_445; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_447 = 5'h6 == _T_208[4:0] ? SReg_6 : _GEN_446; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_448 = 5'h7 == _T_208[4:0] ? SReg_7 : _GEN_447; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_449 = 5'h8 == _T_208[4:0] ? SReg_8 : _GEN_448; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_450 = 5'h9 == _T_208[4:0] ? SReg_9 : _GEN_449; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_451 = 5'ha == _T_208[4:0] ? SReg_10 : _GEN_450; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_452 = 5'hb == _T_208[4:0] ? SReg_11 : _GEN_451; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_453 = 5'hc == _T_208[4:0] ? SReg_12 : _GEN_452; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_454 = 5'hd == _T_208[4:0] ? SReg_13 : _GEN_453; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_455 = 5'he == _T_208[4:0] ? SReg_14 : _GEN_454; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_456 = 5'hf == _T_208[4:0] ? SReg_15 : _GEN_455; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_457 = 5'h10 == _T_208[4:0] ? SReg_16 : _GEN_456; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_458 = 5'h11 == _T_208[4:0] ? SReg_17 : _GEN_457; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_459 = 5'h12 == _T_208[4:0] ? SReg_18 : _GEN_458; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_460 = 5'h13 == _T_208[4:0] ? SReg_19 : _GEN_459; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_222 = $signed(stepReg) - 7'shb; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_226 = 7'sh0 - $signed(_T_222); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_228 = $signed(_T_222) < 7'sh0 ? $signed(_T_226) : $signed(_T_222); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_463 = 5'h1 == _T_228[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_464 = 5'h2 == _T_228[4:0] ? $signed(columnsReg_2) : $signed(_GEN_463); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_465 = 5'h3 == _T_228[4:0] ? $signed(columnsReg_3) : $signed(_GEN_464); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_466 = 5'h4 == _T_228[4:0] ? $signed(columnsReg_4) : $signed(_GEN_465); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_467 = 5'h5 == _T_228[4:0] ? $signed(columnsReg_5) : $signed(_GEN_466); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_468 = 5'h6 == _T_228[4:0] ? $signed(columnsReg_6) : $signed(_GEN_467); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_469 = 5'h7 == _T_228[4:0] ? $signed(columnsReg_7) : $signed(_GEN_468); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_470 = 5'h8 == _T_228[4:0] ? $signed(columnsReg_8) : $signed(_GEN_469); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_471 = 5'h9 == _T_228[4:0] ? $signed(columnsReg_9) : $signed(_GEN_470); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_472 = 5'ha == _T_228[4:0] ? $signed(columnsReg_10) : $signed(_GEN_471); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_473 = 5'hb == _T_228[4:0] ? $signed(columnsReg_11) : $signed(_GEN_472); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_474 = 5'hc == _T_228[4:0] ? $signed(columnsReg_12) : $signed(_GEN_473); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_475 = 5'hd == _T_228[4:0] ? $signed(columnsReg_13) : $signed(_GEN_474); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_476 = 5'he == _T_228[4:0] ? $signed(columnsReg_14) : $signed(_GEN_475); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_477 = 5'hf == _T_228[4:0] ? $signed(columnsReg_15) : $signed(_GEN_476); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_478 = 5'h10 == _T_228[4:0] ? $signed(columnsReg_16) : $signed(_GEN_477); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_479 = 5'h11 == _T_228[4:0] ? $signed(columnsReg_17) : $signed(_GEN_478); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_480 = 5'h12 == _T_228[4:0] ? $signed(columnsReg_18) : $signed(_GEN_479); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_481 = 5'h13 == _T_228[4:0] ? $signed(columnsReg_19) : $signed(_GEN_480); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_484 = 5'h1 == _T_228[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_485 = 5'h2 == _T_228[4:0] ? SReg_2 : _GEN_484; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_486 = 5'h3 == _T_228[4:0] ? SReg_3 : _GEN_485; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_487 = 5'h4 == _T_228[4:0] ? SReg_4 : _GEN_486; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_488 = 5'h5 == _T_228[4:0] ? SReg_5 : _GEN_487; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_489 = 5'h6 == _T_228[4:0] ? SReg_6 : _GEN_488; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_490 = 5'h7 == _T_228[4:0] ? SReg_7 : _GEN_489; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_491 = 5'h8 == _T_228[4:0] ? SReg_8 : _GEN_490; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_492 = 5'h9 == _T_228[4:0] ? SReg_9 : _GEN_491; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_493 = 5'ha == _T_228[4:0] ? SReg_10 : _GEN_492; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_494 = 5'hb == _T_228[4:0] ? SReg_11 : _GEN_493; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_495 = 5'hc == _T_228[4:0] ? SReg_12 : _GEN_494; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_496 = 5'hd == _T_228[4:0] ? SReg_13 : _GEN_495; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_497 = 5'he == _T_228[4:0] ? SReg_14 : _GEN_496; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_498 = 5'hf == _T_228[4:0] ? SReg_15 : _GEN_497; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_499 = 5'h10 == _T_228[4:0] ? SReg_16 : _GEN_498; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_500 = 5'h11 == _T_228[4:0] ? SReg_17 : _GEN_499; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_501 = 5'h12 == _T_228[4:0] ? SReg_18 : _GEN_500; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_502 = 5'h13 == _T_228[4:0] ? SReg_19 : _GEN_501; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_242 = $signed(stepReg) - 7'shc; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_246 = 7'sh0 - $signed(_T_242); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_248 = $signed(_T_242) < 7'sh0 ? $signed(_T_246) : $signed(_T_242); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_505 = 5'h1 == _T_248[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_506 = 5'h2 == _T_248[4:0] ? $signed(columnsReg_2) : $signed(_GEN_505); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_507 = 5'h3 == _T_248[4:0] ? $signed(columnsReg_3) : $signed(_GEN_506); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_508 = 5'h4 == _T_248[4:0] ? $signed(columnsReg_4) : $signed(_GEN_507); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_509 = 5'h5 == _T_248[4:0] ? $signed(columnsReg_5) : $signed(_GEN_508); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_510 = 5'h6 == _T_248[4:0] ? $signed(columnsReg_6) : $signed(_GEN_509); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_511 = 5'h7 == _T_248[4:0] ? $signed(columnsReg_7) : $signed(_GEN_510); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_512 = 5'h8 == _T_248[4:0] ? $signed(columnsReg_8) : $signed(_GEN_511); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_513 = 5'h9 == _T_248[4:0] ? $signed(columnsReg_9) : $signed(_GEN_512); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_514 = 5'ha == _T_248[4:0] ? $signed(columnsReg_10) : $signed(_GEN_513); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_515 = 5'hb == _T_248[4:0] ? $signed(columnsReg_11) : $signed(_GEN_514); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_516 = 5'hc == _T_248[4:0] ? $signed(columnsReg_12) : $signed(_GEN_515); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_517 = 5'hd == _T_248[4:0] ? $signed(columnsReg_13) : $signed(_GEN_516); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_518 = 5'he == _T_248[4:0] ? $signed(columnsReg_14) : $signed(_GEN_517); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_519 = 5'hf == _T_248[4:0] ? $signed(columnsReg_15) : $signed(_GEN_518); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_520 = 5'h10 == _T_248[4:0] ? $signed(columnsReg_16) : $signed(_GEN_519); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_521 = 5'h11 == _T_248[4:0] ? $signed(columnsReg_17) : $signed(_GEN_520); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_522 = 5'h12 == _T_248[4:0] ? $signed(columnsReg_18) : $signed(_GEN_521); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_523 = 5'h13 == _T_248[4:0] ? $signed(columnsReg_19) : $signed(_GEN_522); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_526 = 5'h1 == _T_248[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_527 = 5'h2 == _T_248[4:0] ? SReg_2 : _GEN_526; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_528 = 5'h3 == _T_248[4:0] ? SReg_3 : _GEN_527; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_529 = 5'h4 == _T_248[4:0] ? SReg_4 : _GEN_528; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_530 = 5'h5 == _T_248[4:0] ? SReg_5 : _GEN_529; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_531 = 5'h6 == _T_248[4:0] ? SReg_6 : _GEN_530; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_532 = 5'h7 == _T_248[4:0] ? SReg_7 : _GEN_531; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_533 = 5'h8 == _T_248[4:0] ? SReg_8 : _GEN_532; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_534 = 5'h9 == _T_248[4:0] ? SReg_9 : _GEN_533; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_535 = 5'ha == _T_248[4:0] ? SReg_10 : _GEN_534; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_536 = 5'hb == _T_248[4:0] ? SReg_11 : _GEN_535; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_537 = 5'hc == _T_248[4:0] ? SReg_12 : _GEN_536; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_538 = 5'hd == _T_248[4:0] ? SReg_13 : _GEN_537; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_539 = 5'he == _T_248[4:0] ? SReg_14 : _GEN_538; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_540 = 5'hf == _T_248[4:0] ? SReg_15 : _GEN_539; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_541 = 5'h10 == _T_248[4:0] ? SReg_16 : _GEN_540; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_542 = 5'h11 == _T_248[4:0] ? SReg_17 : _GEN_541; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_543 = 5'h12 == _T_248[4:0] ? SReg_18 : _GEN_542; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_544 = 5'h13 == _T_248[4:0] ? SReg_19 : _GEN_543; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_262 = $signed(stepReg) - 7'shd; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_266 = 7'sh0 - $signed(_T_262); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_268 = $signed(_T_262) < 7'sh0 ? $signed(_T_266) : $signed(_T_262); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_547 = 5'h1 == _T_268[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_548 = 5'h2 == _T_268[4:0] ? $signed(columnsReg_2) : $signed(_GEN_547); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_549 = 5'h3 == _T_268[4:0] ? $signed(columnsReg_3) : $signed(_GEN_548); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_550 = 5'h4 == _T_268[4:0] ? $signed(columnsReg_4) : $signed(_GEN_549); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_551 = 5'h5 == _T_268[4:0] ? $signed(columnsReg_5) : $signed(_GEN_550); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_552 = 5'h6 == _T_268[4:0] ? $signed(columnsReg_6) : $signed(_GEN_551); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_553 = 5'h7 == _T_268[4:0] ? $signed(columnsReg_7) : $signed(_GEN_552); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_554 = 5'h8 == _T_268[4:0] ? $signed(columnsReg_8) : $signed(_GEN_553); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_555 = 5'h9 == _T_268[4:0] ? $signed(columnsReg_9) : $signed(_GEN_554); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_556 = 5'ha == _T_268[4:0] ? $signed(columnsReg_10) : $signed(_GEN_555); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_557 = 5'hb == _T_268[4:0] ? $signed(columnsReg_11) : $signed(_GEN_556); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_558 = 5'hc == _T_268[4:0] ? $signed(columnsReg_12) : $signed(_GEN_557); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_559 = 5'hd == _T_268[4:0] ? $signed(columnsReg_13) : $signed(_GEN_558); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_560 = 5'he == _T_268[4:0] ? $signed(columnsReg_14) : $signed(_GEN_559); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_561 = 5'hf == _T_268[4:0] ? $signed(columnsReg_15) : $signed(_GEN_560); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_562 = 5'h10 == _T_268[4:0] ? $signed(columnsReg_16) : $signed(_GEN_561); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_563 = 5'h11 == _T_268[4:0] ? $signed(columnsReg_17) : $signed(_GEN_562); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_564 = 5'h12 == _T_268[4:0] ? $signed(columnsReg_18) : $signed(_GEN_563); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_565 = 5'h13 == _T_268[4:0] ? $signed(columnsReg_19) : $signed(_GEN_564); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_568 = 5'h1 == _T_268[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_569 = 5'h2 == _T_268[4:0] ? SReg_2 : _GEN_568; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_570 = 5'h3 == _T_268[4:0] ? SReg_3 : _GEN_569; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_571 = 5'h4 == _T_268[4:0] ? SReg_4 : _GEN_570; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_572 = 5'h5 == _T_268[4:0] ? SReg_5 : _GEN_571; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_573 = 5'h6 == _T_268[4:0] ? SReg_6 : _GEN_572; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_574 = 5'h7 == _T_268[4:0] ? SReg_7 : _GEN_573; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_575 = 5'h8 == _T_268[4:0] ? SReg_8 : _GEN_574; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_576 = 5'h9 == _T_268[4:0] ? SReg_9 : _GEN_575; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_577 = 5'ha == _T_268[4:0] ? SReg_10 : _GEN_576; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_578 = 5'hb == _T_268[4:0] ? SReg_11 : _GEN_577; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_579 = 5'hc == _T_268[4:0] ? SReg_12 : _GEN_578; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_580 = 5'hd == _T_268[4:0] ? SReg_13 : _GEN_579; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_581 = 5'he == _T_268[4:0] ? SReg_14 : _GEN_580; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_582 = 5'hf == _T_268[4:0] ? SReg_15 : _GEN_581; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_583 = 5'h10 == _T_268[4:0] ? SReg_16 : _GEN_582; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_584 = 5'h11 == _T_268[4:0] ? SReg_17 : _GEN_583; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_585 = 5'h12 == _T_268[4:0] ? SReg_18 : _GEN_584; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_586 = 5'h13 == _T_268[4:0] ? SReg_19 : _GEN_585; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [6:0] _T_282 = $signed(stepReg) - 7'she; // @[WatermanCentralized.scala 35:41]
  wire [6:0] _T_286 = 7'sh0 - $signed(_T_282); // @[WatermanCentralized.scala 35:48]
  wire [6:0] _T_288 = $signed(_T_282) < 7'sh0 ? $signed(_T_286) : $signed(_T_282); // @[WatermanCentralized.scala 35:52]
  wire [31:0] _GEN_589 = 5'h1 == _T_288[4:0] ? $signed(columnsReg_1) : $signed(columnsReg_0); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_590 = 5'h2 == _T_288[4:0] ? $signed(columnsReg_2) : $signed(_GEN_589); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_591 = 5'h3 == _T_288[4:0] ? $signed(columnsReg_3) : $signed(_GEN_590); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_592 = 5'h4 == _T_288[4:0] ? $signed(columnsReg_4) : $signed(_GEN_591); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_593 = 5'h5 == _T_288[4:0] ? $signed(columnsReg_5) : $signed(_GEN_592); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_594 = 5'h6 == _T_288[4:0] ? $signed(columnsReg_6) : $signed(_GEN_593); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_595 = 5'h7 == _T_288[4:0] ? $signed(columnsReg_7) : $signed(_GEN_594); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_596 = 5'h8 == _T_288[4:0] ? $signed(columnsReg_8) : $signed(_GEN_595); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_597 = 5'h9 == _T_288[4:0] ? $signed(columnsReg_9) : $signed(_GEN_596); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_598 = 5'ha == _T_288[4:0] ? $signed(columnsReg_10) : $signed(_GEN_597); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_599 = 5'hb == _T_288[4:0] ? $signed(columnsReg_11) : $signed(_GEN_598); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_600 = 5'hc == _T_288[4:0] ? $signed(columnsReg_12) : $signed(_GEN_599); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_601 = 5'hd == _T_288[4:0] ? $signed(columnsReg_13) : $signed(_GEN_600); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_602 = 5'he == _T_288[4:0] ? $signed(columnsReg_14) : $signed(_GEN_601); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_603 = 5'hf == _T_288[4:0] ? $signed(columnsReg_15) : $signed(_GEN_602); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_604 = 5'h10 == _T_288[4:0] ? $signed(columnsReg_16) : $signed(_GEN_603); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_605 = 5'h11 == _T_288[4:0] ? $signed(columnsReg_17) : $signed(_GEN_604); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_606 = 5'h12 == _T_288[4:0] ? $signed(columnsReg_18) : $signed(_GEN_605); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [31:0] _GEN_607 = 5'h13 == _T_288[4:0] ? $signed(columnsReg_19) : $signed(_GEN_606); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  wire [1:0] _GEN_610 = 5'h1 == _T_288[4:0] ? SReg_1 : SReg_0; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_611 = 5'h2 == _T_288[4:0] ? SReg_2 : _GEN_610; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_612 = 5'h3 == _T_288[4:0] ? SReg_3 : _GEN_611; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_613 = 5'h4 == _T_288[4:0] ? SReg_4 : _GEN_612; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_614 = 5'h5 == _T_288[4:0] ? SReg_5 : _GEN_613; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_615 = 5'h6 == _T_288[4:0] ? SReg_6 : _GEN_614; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_616 = 5'h7 == _T_288[4:0] ? SReg_7 : _GEN_615; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_617 = 5'h8 == _T_288[4:0] ? SReg_8 : _GEN_616; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_618 = 5'h9 == _T_288[4:0] ? SReg_9 : _GEN_617; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_619 = 5'ha == _T_288[4:0] ? SReg_10 : _GEN_618; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_620 = 5'hb == _T_288[4:0] ? SReg_11 : _GEN_619; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_621 = 5'hc == _T_288[4:0] ? SReg_12 : _GEN_620; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_622 = 5'hd == _T_288[4:0] ? SReg_13 : _GEN_621; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_623 = 5'he == _T_288[4:0] ? SReg_14 : _GEN_622; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_624 = 5'hf == _T_288[4:0] ? SReg_15 : _GEN_623; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_625 = 5'h10 == _T_288[4:0] ? SReg_16 : _GEN_624; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_626 = 5'h11 == _T_288[4:0] ? SReg_17 : _GEN_625; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_627 = 5'h12 == _T_288[4:0] ? SReg_18 : _GEN_626; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire [1:0] _GEN_628 = 5'h13 == _T_288[4:0] ? SReg_19 : _GEN_627; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  wire  _T_436 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_437 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [6:0] _T_440 = $signed(stepReg) - 7'sh15; // @[WatermanCentralized.scala 72:31]
  wire [6:0] _T_443 = $signed(_T_440) + 7'sh1; // @[WatermanCentralized.scala 72:49]
  wire  _T_446 = 7'sh0 >= $signed(_T_443) & 7'sh0 <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_0_out = calculateCell_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_735 = 7'sh0 >= $signed(_T_443) & 7'sh0 <= $signed(stepReg) | outValidReg_0; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_455 = 7'sh1 >= $signed(_T_443) & 7'sh1 <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_1_out = calculateCell_1_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_737 = 7'sh1 >= $signed(_T_443) & 7'sh1 <= $signed(stepReg) | outValidReg_1; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_464 = 7'sh2 >= $signed(_T_443) & 7'sh2 <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_2_out = calculateCell_2_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_739 = 7'sh2 >= $signed(_T_443) & 7'sh2 <= $signed(stepReg) | outValidReg_2; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_473 = 7'sh3 >= $signed(_T_443) & 7'sh3 <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_3_out = calculateCell_3_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_741 = 7'sh3 >= $signed(_T_443) & 7'sh3 <= $signed(stepReg) | outValidReg_3; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_482 = 7'sh4 >= $signed(_T_443) & 7'sh4 <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_4_out = calculateCell_4_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_743 = 7'sh4 >= $signed(_T_443) & 7'sh4 <= $signed(stepReg) | outValidReg_4; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_491 = 7'sh5 >= $signed(_T_443) & 7'sh5 <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_5_out = calculateCell_5_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_745 = 7'sh5 >= $signed(_T_443) & 7'sh5 <= $signed(stepReg) | outValidReg_5; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_500 = 7'sh6 >= $signed(_T_443) & 7'sh6 <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_6_out = calculateCell_6_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_747 = 7'sh6 >= $signed(_T_443) & 7'sh6 <= $signed(stepReg) | outValidReg_6; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_509 = 7'sh7 >= $signed(_T_443) & 7'sh7 <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_7_out = calculateCell_7_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_749 = 7'sh7 >= $signed(_T_443) & 7'sh7 <= $signed(stepReg) | outValidReg_7; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_518 = 7'sh8 >= $signed(_T_443) & 7'sh8 <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_8_out = calculateCell_8_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_751 = 7'sh8 >= $signed(_T_443) & 7'sh8 <= $signed(stepReg) | outValidReg_8; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_527 = 7'sh9 >= $signed(_T_443) & 7'sh9 <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_9_out = calculateCell_9_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_753 = 7'sh9 >= $signed(_T_443) & 7'sh9 <= $signed(stepReg) | outValidReg_9; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_536 = 7'sha >= $signed(_T_443) & 7'sha <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_10_out = calculateCell_10_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_755 = 7'sha >= $signed(_T_443) & 7'sha <= $signed(stepReg) | outValidReg_10; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_545 = 7'shb >= $signed(_T_443) & 7'shb <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_11_out = calculateCell_11_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_757 = 7'shb >= $signed(_T_443) & 7'shb <= $signed(stepReg) | outValidReg_11; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_554 = 7'shc >= $signed(_T_443) & 7'shc <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_12_out = calculateCell_12_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_759 = 7'shc >= $signed(_T_443) & 7'shc <= $signed(stepReg) | outValidReg_12; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_563 = 7'shd >= $signed(_T_443) & 7'shd <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_13_out = calculateCell_13_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_761 = 7'shd >= $signed(_T_443) & 7'shd <= $signed(stepReg) | outValidReg_13; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_572 = 7'she >= $signed(_T_443) & 7'she <= $signed(stepReg); // @[WatermanCentralized.scala 72:57]
  wire [31:0] PEs_14_out = calculateCell_14_io_out; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 30:20]
  wire  _GEN_763 = 7'she >= $signed(_T_443) & 7'she <= $signed(stepReg) | outValidReg_14; // @[WatermanCentralized.scala 72:78 WatermanCentralized.scala 74:26 WatermanCentralized.scala 24:28]
  wire  _T_573 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire  _GEN_764 = io_out_0_ready ? 1'h0 : outValidReg_0; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_765 = _T_446 ? _GEN_764 : outValidReg_0; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_766 = io_out_1_ready ? 1'h0 : outValidReg_1; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_767 = _T_455 ? _GEN_766 : outValidReg_1; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_768 = io_out_2_ready ? 1'h0 : outValidReg_2; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_769 = _T_464 ? _GEN_768 : outValidReg_2; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_770 = io_out_3_ready ? 1'h0 : outValidReg_3; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_771 = _T_473 ? _GEN_770 : outValidReg_3; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_772 = io_out_4_ready ? 1'h0 : outValidReg_4; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_773 = _T_482 ? _GEN_772 : outValidReg_4; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_774 = io_out_5_ready ? 1'h0 : outValidReg_5; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_775 = _T_491 ? _GEN_774 : outValidReg_5; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_776 = io_out_6_ready ? 1'h0 : outValidReg_6; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_777 = _T_500 ? _GEN_776 : outValidReg_6; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_778 = io_out_7_ready ? 1'h0 : outValidReg_7; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_779 = _T_509 ? _GEN_778 : outValidReg_7; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_780 = io_out_8_ready ? 1'h0 : outValidReg_8; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_781 = _T_518 ? _GEN_780 : outValidReg_8; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_782 = io_out_9_ready ? 1'h0 : outValidReg_9; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_783 = _T_527 ? _GEN_782 : outValidReg_9; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_784 = io_out_10_ready ? 1'h0 : outValidReg_10; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_785 = _T_536 ? _GEN_784 : outValidReg_10; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_786 = io_out_11_ready ? 1'h0 : outValidReg_11; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_787 = _T_545 ? _GEN_786 : outValidReg_11; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_788 = io_out_12_ready ? 1'h0 : outValidReg_12; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_789 = _T_554 ? _GEN_788 : outValidReg_12; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_790 = io_out_13_ready ? 1'h0 : outValidReg_13; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_791 = _T_563 ? _GEN_790 : outValidReg_13; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_792 = io_out_14_ready ? 1'h0 : outValidReg_14; // @[WatermanCentralized.scala 83:35 WatermanCentralized.scala 84:30 WatermanCentralized.scala 24:28]
  wire  _GEN_793 = _T_572 ? _GEN_792 : outValidReg_14; // @[WatermanCentralized.scala 82:80 WatermanCentralized.scala 24:28]
  wire  _GEN_794 = leftForOutput_io_out ? _GEN_765 : outValidReg_0; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_795 = leftForOutput_io_out ? _GEN_767 : outValidReg_1; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_796 = leftForOutput_io_out ? _GEN_769 : outValidReg_2; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_797 = leftForOutput_io_out ? _GEN_771 : outValidReg_3; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_798 = leftForOutput_io_out ? _GEN_773 : outValidReg_4; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_799 = leftForOutput_io_out ? _GEN_775 : outValidReg_5; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_800 = leftForOutput_io_out ? _GEN_777 : outValidReg_6; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_801 = leftForOutput_io_out ? _GEN_779 : outValidReg_7; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_802 = leftForOutput_io_out ? _GEN_781 : outValidReg_8; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_803 = leftForOutput_io_out ? _GEN_783 : outValidReg_9; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_804 = leftForOutput_io_out ? _GEN_785 : outValidReg_10; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_805 = leftForOutput_io_out ? _GEN_787 : outValidReg_11; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_806 = leftForOutput_io_out ? _GEN_789 : outValidReg_12; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_807 = leftForOutput_io_out ? _GEN_791 : outValidReg_13; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire  _GEN_808 = leftForOutput_io_out ? _GEN_793 : outValidReg_14; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 24:28]
  wire [1:0] _GEN_809 = leftForOutput_io_out ? stateReg : 2'h3; // @[WatermanCentralized.scala 80:34 WatermanCentralized.scala 28:25 WatermanCentralized.scala 89:18]
  wire  _T_709 = 2'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_810 = 5'h0 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_0); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_811 = 5'h1 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_1); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_812 = 5'h2 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_2); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_813 = 5'h3 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_3); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_814 = 5'h4 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_4); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_815 = 5'h5 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_5); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_816 = 5'h6 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_6); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_817 = 5'h7 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_7); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_818 = 5'h8 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_8); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_819 = 5'h9 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_9); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_820 = 5'ha == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_10); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_821 = 5'hb == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_11); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_822 = 5'hc == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_12); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_823 = 5'hd == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_13); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_824 = 5'he == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_14); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_825 = 5'hf == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_15); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_826 = 5'h10 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_16); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_827 = 5'h11 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_17); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_828 = 5'h12 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_18); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_829 = 5'h13 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_19); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_830 = 5'h14 == _T_8[4:0] ? $signed(resReg_0) : $signed(columnsReg_20); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_831 = _T_446 ? $signed(_GEN_810) : $signed(columnsReg_0); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_832 = _T_446 ? $signed(_GEN_811) : $signed(columnsReg_1); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_833 = _T_446 ? $signed(_GEN_812) : $signed(columnsReg_2); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_834 = _T_446 ? $signed(_GEN_813) : $signed(columnsReg_3); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_835 = _T_446 ? $signed(_GEN_814) : $signed(columnsReg_4); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_836 = _T_446 ? $signed(_GEN_815) : $signed(columnsReg_5); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_837 = _T_446 ? $signed(_GEN_816) : $signed(columnsReg_6); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_838 = _T_446 ? $signed(_GEN_817) : $signed(columnsReg_7); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_839 = _T_446 ? $signed(_GEN_818) : $signed(columnsReg_8); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_840 = _T_446 ? $signed(_GEN_819) : $signed(columnsReg_9); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_841 = _T_446 ? $signed(_GEN_820) : $signed(columnsReg_10); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_842 = _T_446 ? $signed(_GEN_821) : $signed(columnsReg_11); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_843 = _T_446 ? $signed(_GEN_822) : $signed(columnsReg_12); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_844 = _T_446 ? $signed(_GEN_823) : $signed(columnsReg_13); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_845 = _T_446 ? $signed(_GEN_824) : $signed(columnsReg_14); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_846 = _T_446 ? $signed(_GEN_825) : $signed(columnsReg_15); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_847 = _T_446 ? $signed(_GEN_826) : $signed(columnsReg_16); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_848 = _T_446 ? $signed(_GEN_827) : $signed(columnsReg_17); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_849 = _T_446 ? $signed(_GEN_828) : $signed(columnsReg_18); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_850 = _T_446 ? $signed(_GEN_829) : $signed(columnsReg_19); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_851 = _T_446 ? $signed(_GEN_830) : $signed(columnsReg_20); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_852 = _T_446 ? $signed(resReg_0) : $signed(rowsReg_0); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_854 = _T_446 ? $signed(resReg_0) : $signed(intermDiagReg_1); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_855 = 5'h0 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_831); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_856 = 5'h1 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_832); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_857 = 5'h2 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_833); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_858 = 5'h3 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_834); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_859 = 5'h4 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_835); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_860 = 5'h5 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_836); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_861 = 5'h6 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_837); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_862 = 5'h7 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_838); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_863 = 5'h8 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_839); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_864 = 5'h9 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_840); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_865 = 5'ha == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_841); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_866 = 5'hb == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_842); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_867 = 5'hc == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_843); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_868 = 5'hd == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_844); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_869 = 5'he == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_845); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_870 = 5'hf == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_846); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_871 = 5'h10 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_847); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_872 = 5'h11 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_848); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_873 = 5'h12 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_849); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_874 = 5'h13 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_850); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_875 = 5'h14 == _T_28[4:0] ? $signed(resReg_1) : $signed(_GEN_851); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_876 = _T_455 ? $signed(_GEN_855) : $signed(_GEN_831); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_877 = _T_455 ? $signed(_GEN_856) : $signed(_GEN_832); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_878 = _T_455 ? $signed(_GEN_857) : $signed(_GEN_833); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_879 = _T_455 ? $signed(_GEN_858) : $signed(_GEN_834); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_880 = _T_455 ? $signed(_GEN_859) : $signed(_GEN_835); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_881 = _T_455 ? $signed(_GEN_860) : $signed(_GEN_836); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_882 = _T_455 ? $signed(_GEN_861) : $signed(_GEN_837); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_883 = _T_455 ? $signed(_GEN_862) : $signed(_GEN_838); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_884 = _T_455 ? $signed(_GEN_863) : $signed(_GEN_839); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_885 = _T_455 ? $signed(_GEN_864) : $signed(_GEN_840); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_886 = _T_455 ? $signed(_GEN_865) : $signed(_GEN_841); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_887 = _T_455 ? $signed(_GEN_866) : $signed(_GEN_842); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_888 = _T_455 ? $signed(_GEN_867) : $signed(_GEN_843); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_889 = _T_455 ? $signed(_GEN_868) : $signed(_GEN_844); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_890 = _T_455 ? $signed(_GEN_869) : $signed(_GEN_845); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_891 = _T_455 ? $signed(_GEN_870) : $signed(_GEN_846); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_892 = _T_455 ? $signed(_GEN_871) : $signed(_GEN_847); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_893 = _T_455 ? $signed(_GEN_872) : $signed(_GEN_848); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_894 = _T_455 ? $signed(_GEN_873) : $signed(_GEN_849); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_895 = _T_455 ? $signed(_GEN_874) : $signed(_GEN_850); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_896 = _T_455 ? $signed(_GEN_875) : $signed(_GEN_851); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_897 = _T_455 ? $signed(resReg_1) : $signed(rowsReg_1); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_898 = _T_455 ? $signed(intermDiagReg_1) : $signed(diagReg_1); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_899 = _T_455 ? $signed(resReg_1) : $signed(intermDiagReg_2); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_900 = 5'h0 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_876); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_901 = 5'h1 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_877); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_902 = 5'h2 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_878); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_903 = 5'h3 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_879); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_904 = 5'h4 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_880); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_905 = 5'h5 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_881); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_906 = 5'h6 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_882); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_907 = 5'h7 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_883); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_908 = 5'h8 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_884); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_909 = 5'h9 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_885); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_910 = 5'ha == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_886); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_911 = 5'hb == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_887); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_912 = 5'hc == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_888); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_913 = 5'hd == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_889); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_914 = 5'he == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_890); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_915 = 5'hf == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_891); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_916 = 5'h10 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_892); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_917 = 5'h11 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_893); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_918 = 5'h12 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_894); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_919 = 5'h13 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_895); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_920 = 5'h14 == _T_48[4:0] ? $signed(resReg_2) : $signed(_GEN_896); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_921 = _T_464 ? $signed(_GEN_900) : $signed(_GEN_876); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_922 = _T_464 ? $signed(_GEN_901) : $signed(_GEN_877); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_923 = _T_464 ? $signed(_GEN_902) : $signed(_GEN_878); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_924 = _T_464 ? $signed(_GEN_903) : $signed(_GEN_879); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_925 = _T_464 ? $signed(_GEN_904) : $signed(_GEN_880); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_926 = _T_464 ? $signed(_GEN_905) : $signed(_GEN_881); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_927 = _T_464 ? $signed(_GEN_906) : $signed(_GEN_882); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_928 = _T_464 ? $signed(_GEN_907) : $signed(_GEN_883); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_929 = _T_464 ? $signed(_GEN_908) : $signed(_GEN_884); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_930 = _T_464 ? $signed(_GEN_909) : $signed(_GEN_885); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_931 = _T_464 ? $signed(_GEN_910) : $signed(_GEN_886); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_932 = _T_464 ? $signed(_GEN_911) : $signed(_GEN_887); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_933 = _T_464 ? $signed(_GEN_912) : $signed(_GEN_888); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_934 = _T_464 ? $signed(_GEN_913) : $signed(_GEN_889); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_935 = _T_464 ? $signed(_GEN_914) : $signed(_GEN_890); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_936 = _T_464 ? $signed(_GEN_915) : $signed(_GEN_891); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_937 = _T_464 ? $signed(_GEN_916) : $signed(_GEN_892); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_938 = _T_464 ? $signed(_GEN_917) : $signed(_GEN_893); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_939 = _T_464 ? $signed(_GEN_918) : $signed(_GEN_894); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_940 = _T_464 ? $signed(_GEN_919) : $signed(_GEN_895); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_941 = _T_464 ? $signed(_GEN_920) : $signed(_GEN_896); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_942 = _T_464 ? $signed(resReg_2) : $signed(rowsReg_2); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_943 = _T_464 ? $signed(intermDiagReg_2) : $signed(diagReg_2); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_944 = _T_464 ? $signed(resReg_2) : $signed(intermDiagReg_3); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_945 = 5'h0 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_921); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_946 = 5'h1 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_922); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_947 = 5'h2 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_923); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_948 = 5'h3 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_924); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_949 = 5'h4 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_925); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_950 = 5'h5 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_926); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_951 = 5'h6 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_927); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_952 = 5'h7 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_928); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_953 = 5'h8 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_929); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_954 = 5'h9 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_930); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_955 = 5'ha == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_931); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_956 = 5'hb == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_932); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_957 = 5'hc == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_933); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_958 = 5'hd == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_934); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_959 = 5'he == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_935); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_960 = 5'hf == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_936); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_961 = 5'h10 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_937); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_962 = 5'h11 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_938); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_963 = 5'h12 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_939); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_964 = 5'h13 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_940); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_965 = 5'h14 == _T_68[4:0] ? $signed(resReg_3) : $signed(_GEN_941); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_966 = _T_473 ? $signed(_GEN_945) : $signed(_GEN_921); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_967 = _T_473 ? $signed(_GEN_946) : $signed(_GEN_922); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_968 = _T_473 ? $signed(_GEN_947) : $signed(_GEN_923); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_969 = _T_473 ? $signed(_GEN_948) : $signed(_GEN_924); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_970 = _T_473 ? $signed(_GEN_949) : $signed(_GEN_925); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_971 = _T_473 ? $signed(_GEN_950) : $signed(_GEN_926); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_972 = _T_473 ? $signed(_GEN_951) : $signed(_GEN_927); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_973 = _T_473 ? $signed(_GEN_952) : $signed(_GEN_928); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_974 = _T_473 ? $signed(_GEN_953) : $signed(_GEN_929); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_975 = _T_473 ? $signed(_GEN_954) : $signed(_GEN_930); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_976 = _T_473 ? $signed(_GEN_955) : $signed(_GEN_931); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_977 = _T_473 ? $signed(_GEN_956) : $signed(_GEN_932); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_978 = _T_473 ? $signed(_GEN_957) : $signed(_GEN_933); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_979 = _T_473 ? $signed(_GEN_958) : $signed(_GEN_934); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_980 = _T_473 ? $signed(_GEN_959) : $signed(_GEN_935); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_981 = _T_473 ? $signed(_GEN_960) : $signed(_GEN_936); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_982 = _T_473 ? $signed(_GEN_961) : $signed(_GEN_937); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_983 = _T_473 ? $signed(_GEN_962) : $signed(_GEN_938); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_984 = _T_473 ? $signed(_GEN_963) : $signed(_GEN_939); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_985 = _T_473 ? $signed(_GEN_964) : $signed(_GEN_940); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_986 = _T_473 ? $signed(_GEN_965) : $signed(_GEN_941); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_987 = _T_473 ? $signed(resReg_3) : $signed(rowsReg_3); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_988 = _T_473 ? $signed(intermDiagReg_3) : $signed(diagReg_3); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_989 = _T_473 ? $signed(resReg_3) : $signed(intermDiagReg_4); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_990 = 5'h0 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_966); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_991 = 5'h1 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_967); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_992 = 5'h2 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_968); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_993 = 5'h3 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_969); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_994 = 5'h4 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_970); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_995 = 5'h5 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_971); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_996 = 5'h6 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_972); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_997 = 5'h7 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_973); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_998 = 5'h8 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_974); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_999 = 5'h9 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_975); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1000 = 5'ha == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_976); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1001 = 5'hb == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_977); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1002 = 5'hc == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_978); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1003 = 5'hd == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_979); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1004 = 5'he == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_980); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1005 = 5'hf == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_981); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1006 = 5'h10 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_982); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1007 = 5'h11 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_983); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1008 = 5'h12 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_984); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1009 = 5'h13 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_985); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1010 = 5'h14 == _T_88[4:0] ? $signed(resReg_4) : $signed(_GEN_986); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1011 = _T_482 ? $signed(_GEN_990) : $signed(_GEN_966); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1012 = _T_482 ? $signed(_GEN_991) : $signed(_GEN_967); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1013 = _T_482 ? $signed(_GEN_992) : $signed(_GEN_968); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1014 = _T_482 ? $signed(_GEN_993) : $signed(_GEN_969); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1015 = _T_482 ? $signed(_GEN_994) : $signed(_GEN_970); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1016 = _T_482 ? $signed(_GEN_995) : $signed(_GEN_971); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1017 = _T_482 ? $signed(_GEN_996) : $signed(_GEN_972); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1018 = _T_482 ? $signed(_GEN_997) : $signed(_GEN_973); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1019 = _T_482 ? $signed(_GEN_998) : $signed(_GEN_974); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1020 = _T_482 ? $signed(_GEN_999) : $signed(_GEN_975); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1021 = _T_482 ? $signed(_GEN_1000) : $signed(_GEN_976); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1022 = _T_482 ? $signed(_GEN_1001) : $signed(_GEN_977); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1023 = _T_482 ? $signed(_GEN_1002) : $signed(_GEN_978); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1024 = _T_482 ? $signed(_GEN_1003) : $signed(_GEN_979); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1025 = _T_482 ? $signed(_GEN_1004) : $signed(_GEN_980); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1026 = _T_482 ? $signed(_GEN_1005) : $signed(_GEN_981); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1027 = _T_482 ? $signed(_GEN_1006) : $signed(_GEN_982); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1028 = _T_482 ? $signed(_GEN_1007) : $signed(_GEN_983); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1029 = _T_482 ? $signed(_GEN_1008) : $signed(_GEN_984); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1030 = _T_482 ? $signed(_GEN_1009) : $signed(_GEN_985); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1031 = _T_482 ? $signed(_GEN_1010) : $signed(_GEN_986); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1032 = _T_482 ? $signed(resReg_4) : $signed(rowsReg_4); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1033 = _T_482 ? $signed(intermDiagReg_4) : $signed(diagReg_4); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1034 = _T_482 ? $signed(resReg_4) : $signed(intermDiagReg_5); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1035 = 5'h0 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1011); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1036 = 5'h1 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1012); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1037 = 5'h2 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1013); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1038 = 5'h3 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1014); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1039 = 5'h4 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1015); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1040 = 5'h5 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1016); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1041 = 5'h6 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1017); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1042 = 5'h7 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1018); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1043 = 5'h8 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1019); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1044 = 5'h9 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1020); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1045 = 5'ha == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1021); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1046 = 5'hb == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1022); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1047 = 5'hc == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1023); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1048 = 5'hd == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1024); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1049 = 5'he == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1025); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1050 = 5'hf == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1026); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1051 = 5'h10 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1027); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1052 = 5'h11 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1028); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1053 = 5'h12 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1029); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1054 = 5'h13 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1030); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1055 = 5'h14 == _T_108[4:0] ? $signed(resReg_5) : $signed(_GEN_1031); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1056 = _T_491 ? $signed(_GEN_1035) : $signed(_GEN_1011); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1057 = _T_491 ? $signed(_GEN_1036) : $signed(_GEN_1012); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1058 = _T_491 ? $signed(_GEN_1037) : $signed(_GEN_1013); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1059 = _T_491 ? $signed(_GEN_1038) : $signed(_GEN_1014); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1060 = _T_491 ? $signed(_GEN_1039) : $signed(_GEN_1015); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1061 = _T_491 ? $signed(_GEN_1040) : $signed(_GEN_1016); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1062 = _T_491 ? $signed(_GEN_1041) : $signed(_GEN_1017); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1063 = _T_491 ? $signed(_GEN_1042) : $signed(_GEN_1018); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1064 = _T_491 ? $signed(_GEN_1043) : $signed(_GEN_1019); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1065 = _T_491 ? $signed(_GEN_1044) : $signed(_GEN_1020); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1066 = _T_491 ? $signed(_GEN_1045) : $signed(_GEN_1021); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1067 = _T_491 ? $signed(_GEN_1046) : $signed(_GEN_1022); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1068 = _T_491 ? $signed(_GEN_1047) : $signed(_GEN_1023); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1069 = _T_491 ? $signed(_GEN_1048) : $signed(_GEN_1024); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1070 = _T_491 ? $signed(_GEN_1049) : $signed(_GEN_1025); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1071 = _T_491 ? $signed(_GEN_1050) : $signed(_GEN_1026); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1072 = _T_491 ? $signed(_GEN_1051) : $signed(_GEN_1027); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1073 = _T_491 ? $signed(_GEN_1052) : $signed(_GEN_1028); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1074 = _T_491 ? $signed(_GEN_1053) : $signed(_GEN_1029); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1075 = _T_491 ? $signed(_GEN_1054) : $signed(_GEN_1030); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1076 = _T_491 ? $signed(_GEN_1055) : $signed(_GEN_1031); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1077 = _T_491 ? $signed(resReg_5) : $signed(rowsReg_5); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1078 = _T_491 ? $signed(intermDiagReg_5) : $signed(diagReg_5); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1079 = _T_491 ? $signed(resReg_5) : $signed(intermDiagReg_6); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1080 = 5'h0 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1056); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1081 = 5'h1 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1057); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1082 = 5'h2 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1058); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1083 = 5'h3 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1059); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1084 = 5'h4 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1060); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1085 = 5'h5 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1061); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1086 = 5'h6 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1062); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1087 = 5'h7 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1063); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1088 = 5'h8 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1064); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1089 = 5'h9 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1065); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1090 = 5'ha == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1066); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1091 = 5'hb == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1067); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1092 = 5'hc == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1068); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1093 = 5'hd == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1069); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1094 = 5'he == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1070); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1095 = 5'hf == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1071); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1096 = 5'h10 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1072); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1097 = 5'h11 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1073); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1098 = 5'h12 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1074); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1099 = 5'h13 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1075); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1100 = 5'h14 == _T_128[4:0] ? $signed(resReg_6) : $signed(_GEN_1076); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1101 = _T_500 ? $signed(_GEN_1080) : $signed(_GEN_1056); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1102 = _T_500 ? $signed(_GEN_1081) : $signed(_GEN_1057); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1103 = _T_500 ? $signed(_GEN_1082) : $signed(_GEN_1058); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1104 = _T_500 ? $signed(_GEN_1083) : $signed(_GEN_1059); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1105 = _T_500 ? $signed(_GEN_1084) : $signed(_GEN_1060); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1106 = _T_500 ? $signed(_GEN_1085) : $signed(_GEN_1061); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1107 = _T_500 ? $signed(_GEN_1086) : $signed(_GEN_1062); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1108 = _T_500 ? $signed(_GEN_1087) : $signed(_GEN_1063); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1109 = _T_500 ? $signed(_GEN_1088) : $signed(_GEN_1064); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1110 = _T_500 ? $signed(_GEN_1089) : $signed(_GEN_1065); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1111 = _T_500 ? $signed(_GEN_1090) : $signed(_GEN_1066); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1112 = _T_500 ? $signed(_GEN_1091) : $signed(_GEN_1067); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1113 = _T_500 ? $signed(_GEN_1092) : $signed(_GEN_1068); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1114 = _T_500 ? $signed(_GEN_1093) : $signed(_GEN_1069); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1115 = _T_500 ? $signed(_GEN_1094) : $signed(_GEN_1070); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1116 = _T_500 ? $signed(_GEN_1095) : $signed(_GEN_1071); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1117 = _T_500 ? $signed(_GEN_1096) : $signed(_GEN_1072); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1118 = _T_500 ? $signed(_GEN_1097) : $signed(_GEN_1073); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1119 = _T_500 ? $signed(_GEN_1098) : $signed(_GEN_1074); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1120 = _T_500 ? $signed(_GEN_1099) : $signed(_GEN_1075); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1121 = _T_500 ? $signed(_GEN_1100) : $signed(_GEN_1076); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1122 = _T_500 ? $signed(resReg_6) : $signed(rowsReg_6); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1123 = _T_500 ? $signed(intermDiagReg_6) : $signed(diagReg_6); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1124 = _T_500 ? $signed(resReg_6) : $signed(intermDiagReg_7); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1125 = 5'h0 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1101); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1126 = 5'h1 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1102); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1127 = 5'h2 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1103); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1128 = 5'h3 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1104); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1129 = 5'h4 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1105); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1130 = 5'h5 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1106); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1131 = 5'h6 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1107); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1132 = 5'h7 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1108); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1133 = 5'h8 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1109); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1134 = 5'h9 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1110); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1135 = 5'ha == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1111); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1136 = 5'hb == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1112); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1137 = 5'hc == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1113); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1138 = 5'hd == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1114); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1139 = 5'he == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1115); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1140 = 5'hf == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1116); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1141 = 5'h10 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1117); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1142 = 5'h11 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1118); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1143 = 5'h12 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1119); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1144 = 5'h13 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1120); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1145 = 5'h14 == _T_148[4:0] ? $signed(resReg_7) : $signed(_GEN_1121); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1146 = _T_509 ? $signed(_GEN_1125) : $signed(_GEN_1101); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1147 = _T_509 ? $signed(_GEN_1126) : $signed(_GEN_1102); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1148 = _T_509 ? $signed(_GEN_1127) : $signed(_GEN_1103); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1149 = _T_509 ? $signed(_GEN_1128) : $signed(_GEN_1104); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1150 = _T_509 ? $signed(_GEN_1129) : $signed(_GEN_1105); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1151 = _T_509 ? $signed(_GEN_1130) : $signed(_GEN_1106); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1152 = _T_509 ? $signed(_GEN_1131) : $signed(_GEN_1107); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1153 = _T_509 ? $signed(_GEN_1132) : $signed(_GEN_1108); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1154 = _T_509 ? $signed(_GEN_1133) : $signed(_GEN_1109); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1155 = _T_509 ? $signed(_GEN_1134) : $signed(_GEN_1110); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1156 = _T_509 ? $signed(_GEN_1135) : $signed(_GEN_1111); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1157 = _T_509 ? $signed(_GEN_1136) : $signed(_GEN_1112); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1158 = _T_509 ? $signed(_GEN_1137) : $signed(_GEN_1113); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1159 = _T_509 ? $signed(_GEN_1138) : $signed(_GEN_1114); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1160 = _T_509 ? $signed(_GEN_1139) : $signed(_GEN_1115); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1161 = _T_509 ? $signed(_GEN_1140) : $signed(_GEN_1116); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1162 = _T_509 ? $signed(_GEN_1141) : $signed(_GEN_1117); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1163 = _T_509 ? $signed(_GEN_1142) : $signed(_GEN_1118); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1164 = _T_509 ? $signed(_GEN_1143) : $signed(_GEN_1119); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1165 = _T_509 ? $signed(_GEN_1144) : $signed(_GEN_1120); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1166 = _T_509 ? $signed(_GEN_1145) : $signed(_GEN_1121); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1167 = _T_509 ? $signed(resReg_7) : $signed(rowsReg_7); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1168 = _T_509 ? $signed(intermDiagReg_7) : $signed(diagReg_7); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1169 = _T_509 ? $signed(resReg_7) : $signed(intermDiagReg_8); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1170 = 5'h0 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1146); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1171 = 5'h1 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1147); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1172 = 5'h2 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1148); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1173 = 5'h3 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1149); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1174 = 5'h4 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1150); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1175 = 5'h5 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1151); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1176 = 5'h6 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1152); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1177 = 5'h7 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1153); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1178 = 5'h8 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1154); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1179 = 5'h9 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1155); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1180 = 5'ha == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1156); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1181 = 5'hb == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1157); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1182 = 5'hc == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1158); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1183 = 5'hd == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1159); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1184 = 5'he == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1160); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1185 = 5'hf == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1161); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1186 = 5'h10 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1162); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1187 = 5'h11 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1163); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1188 = 5'h12 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1164); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1189 = 5'h13 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1165); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1190 = 5'h14 == _T_168[4:0] ? $signed(resReg_8) : $signed(_GEN_1166); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1191 = _T_518 ? $signed(_GEN_1170) : $signed(_GEN_1146); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1192 = _T_518 ? $signed(_GEN_1171) : $signed(_GEN_1147); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1193 = _T_518 ? $signed(_GEN_1172) : $signed(_GEN_1148); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1194 = _T_518 ? $signed(_GEN_1173) : $signed(_GEN_1149); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1195 = _T_518 ? $signed(_GEN_1174) : $signed(_GEN_1150); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1196 = _T_518 ? $signed(_GEN_1175) : $signed(_GEN_1151); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1197 = _T_518 ? $signed(_GEN_1176) : $signed(_GEN_1152); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1198 = _T_518 ? $signed(_GEN_1177) : $signed(_GEN_1153); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1199 = _T_518 ? $signed(_GEN_1178) : $signed(_GEN_1154); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1200 = _T_518 ? $signed(_GEN_1179) : $signed(_GEN_1155); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1201 = _T_518 ? $signed(_GEN_1180) : $signed(_GEN_1156); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1202 = _T_518 ? $signed(_GEN_1181) : $signed(_GEN_1157); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1203 = _T_518 ? $signed(_GEN_1182) : $signed(_GEN_1158); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1204 = _T_518 ? $signed(_GEN_1183) : $signed(_GEN_1159); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1205 = _T_518 ? $signed(_GEN_1184) : $signed(_GEN_1160); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1206 = _T_518 ? $signed(_GEN_1185) : $signed(_GEN_1161); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1207 = _T_518 ? $signed(_GEN_1186) : $signed(_GEN_1162); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1208 = _T_518 ? $signed(_GEN_1187) : $signed(_GEN_1163); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1209 = _T_518 ? $signed(_GEN_1188) : $signed(_GEN_1164); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1210 = _T_518 ? $signed(_GEN_1189) : $signed(_GEN_1165); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1211 = _T_518 ? $signed(_GEN_1190) : $signed(_GEN_1166); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1212 = _T_518 ? $signed(resReg_8) : $signed(rowsReg_8); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1213 = _T_518 ? $signed(intermDiagReg_8) : $signed(diagReg_8); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1214 = _T_518 ? $signed(resReg_8) : $signed(intermDiagReg_9); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1215 = 5'h0 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1191); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1216 = 5'h1 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1192); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1217 = 5'h2 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1193); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1218 = 5'h3 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1194); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1219 = 5'h4 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1195); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1220 = 5'h5 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1196); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1221 = 5'h6 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1197); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1222 = 5'h7 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1198); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1223 = 5'h8 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1199); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1224 = 5'h9 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1200); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1225 = 5'ha == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1201); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1226 = 5'hb == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1202); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1227 = 5'hc == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1203); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1228 = 5'hd == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1204); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1229 = 5'he == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1205); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1230 = 5'hf == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1206); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1231 = 5'h10 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1207); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1232 = 5'h11 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1208); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1233 = 5'h12 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1209); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1234 = 5'h13 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1210); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1235 = 5'h14 == _T_188[4:0] ? $signed(resReg_9) : $signed(_GEN_1211); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1236 = _T_527 ? $signed(_GEN_1215) : $signed(_GEN_1191); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1237 = _T_527 ? $signed(_GEN_1216) : $signed(_GEN_1192); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1238 = _T_527 ? $signed(_GEN_1217) : $signed(_GEN_1193); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1239 = _T_527 ? $signed(_GEN_1218) : $signed(_GEN_1194); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1240 = _T_527 ? $signed(_GEN_1219) : $signed(_GEN_1195); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1241 = _T_527 ? $signed(_GEN_1220) : $signed(_GEN_1196); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1242 = _T_527 ? $signed(_GEN_1221) : $signed(_GEN_1197); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1243 = _T_527 ? $signed(_GEN_1222) : $signed(_GEN_1198); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1244 = _T_527 ? $signed(_GEN_1223) : $signed(_GEN_1199); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1245 = _T_527 ? $signed(_GEN_1224) : $signed(_GEN_1200); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1246 = _T_527 ? $signed(_GEN_1225) : $signed(_GEN_1201); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1247 = _T_527 ? $signed(_GEN_1226) : $signed(_GEN_1202); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1248 = _T_527 ? $signed(_GEN_1227) : $signed(_GEN_1203); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1249 = _T_527 ? $signed(_GEN_1228) : $signed(_GEN_1204); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1250 = _T_527 ? $signed(_GEN_1229) : $signed(_GEN_1205); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1251 = _T_527 ? $signed(_GEN_1230) : $signed(_GEN_1206); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1252 = _T_527 ? $signed(_GEN_1231) : $signed(_GEN_1207); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1253 = _T_527 ? $signed(_GEN_1232) : $signed(_GEN_1208); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1254 = _T_527 ? $signed(_GEN_1233) : $signed(_GEN_1209); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1255 = _T_527 ? $signed(_GEN_1234) : $signed(_GEN_1210); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1256 = _T_527 ? $signed(_GEN_1235) : $signed(_GEN_1211); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1257 = _T_527 ? $signed(resReg_9) : $signed(rowsReg_9); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1258 = _T_527 ? $signed(intermDiagReg_9) : $signed(diagReg_9); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1259 = _T_527 ? $signed(resReg_9) : $signed(intermDiagReg_10); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1260 = 5'h0 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1236); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1261 = 5'h1 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1237); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1262 = 5'h2 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1238); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1263 = 5'h3 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1239); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1264 = 5'h4 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1240); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1265 = 5'h5 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1241); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1266 = 5'h6 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1242); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1267 = 5'h7 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1243); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1268 = 5'h8 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1244); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1269 = 5'h9 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1245); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1270 = 5'ha == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1246); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1271 = 5'hb == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1247); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1272 = 5'hc == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1248); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1273 = 5'hd == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1249); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1274 = 5'he == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1250); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1275 = 5'hf == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1251); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1276 = 5'h10 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1252); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1277 = 5'h11 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1253); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1278 = 5'h12 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1254); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1279 = 5'h13 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1255); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1280 = 5'h14 == _T_208[4:0] ? $signed(resReg_10) : $signed(_GEN_1256); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1281 = _T_536 ? $signed(_GEN_1260) : $signed(_GEN_1236); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1282 = _T_536 ? $signed(_GEN_1261) : $signed(_GEN_1237); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1283 = _T_536 ? $signed(_GEN_1262) : $signed(_GEN_1238); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1284 = _T_536 ? $signed(_GEN_1263) : $signed(_GEN_1239); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1285 = _T_536 ? $signed(_GEN_1264) : $signed(_GEN_1240); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1286 = _T_536 ? $signed(_GEN_1265) : $signed(_GEN_1241); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1287 = _T_536 ? $signed(_GEN_1266) : $signed(_GEN_1242); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1288 = _T_536 ? $signed(_GEN_1267) : $signed(_GEN_1243); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1289 = _T_536 ? $signed(_GEN_1268) : $signed(_GEN_1244); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1290 = _T_536 ? $signed(_GEN_1269) : $signed(_GEN_1245); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1291 = _T_536 ? $signed(_GEN_1270) : $signed(_GEN_1246); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1292 = _T_536 ? $signed(_GEN_1271) : $signed(_GEN_1247); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1293 = _T_536 ? $signed(_GEN_1272) : $signed(_GEN_1248); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1294 = _T_536 ? $signed(_GEN_1273) : $signed(_GEN_1249); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1295 = _T_536 ? $signed(_GEN_1274) : $signed(_GEN_1250); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1296 = _T_536 ? $signed(_GEN_1275) : $signed(_GEN_1251); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1297 = _T_536 ? $signed(_GEN_1276) : $signed(_GEN_1252); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1298 = _T_536 ? $signed(_GEN_1277) : $signed(_GEN_1253); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1299 = _T_536 ? $signed(_GEN_1278) : $signed(_GEN_1254); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1300 = _T_536 ? $signed(_GEN_1279) : $signed(_GEN_1255); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1301 = _T_536 ? $signed(_GEN_1280) : $signed(_GEN_1256); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1302 = _T_536 ? $signed(resReg_10) : $signed(rowsReg_10); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1303 = _T_536 ? $signed(intermDiagReg_10) : $signed(diagReg_10); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1304 = _T_536 ? $signed(resReg_10) : $signed(intermDiagReg_11); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1305 = 5'h0 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1281); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1306 = 5'h1 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1282); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1307 = 5'h2 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1283); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1308 = 5'h3 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1284); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1309 = 5'h4 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1285); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1310 = 5'h5 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1286); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1311 = 5'h6 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1287); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1312 = 5'h7 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1288); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1313 = 5'h8 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1289); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1314 = 5'h9 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1290); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1315 = 5'ha == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1291); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1316 = 5'hb == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1292); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1317 = 5'hc == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1293); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1318 = 5'hd == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1294); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1319 = 5'he == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1295); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1320 = 5'hf == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1296); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1321 = 5'h10 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1297); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1322 = 5'h11 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1298); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1323 = 5'h12 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1299); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1324 = 5'h13 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1300); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1325 = 5'h14 == _T_228[4:0] ? $signed(resReg_11) : $signed(_GEN_1301); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1326 = _T_545 ? $signed(_GEN_1305) : $signed(_GEN_1281); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1327 = _T_545 ? $signed(_GEN_1306) : $signed(_GEN_1282); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1328 = _T_545 ? $signed(_GEN_1307) : $signed(_GEN_1283); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1329 = _T_545 ? $signed(_GEN_1308) : $signed(_GEN_1284); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1330 = _T_545 ? $signed(_GEN_1309) : $signed(_GEN_1285); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1331 = _T_545 ? $signed(_GEN_1310) : $signed(_GEN_1286); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1332 = _T_545 ? $signed(_GEN_1311) : $signed(_GEN_1287); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1333 = _T_545 ? $signed(_GEN_1312) : $signed(_GEN_1288); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1334 = _T_545 ? $signed(_GEN_1313) : $signed(_GEN_1289); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1335 = _T_545 ? $signed(_GEN_1314) : $signed(_GEN_1290); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1336 = _T_545 ? $signed(_GEN_1315) : $signed(_GEN_1291); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1337 = _T_545 ? $signed(_GEN_1316) : $signed(_GEN_1292); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1338 = _T_545 ? $signed(_GEN_1317) : $signed(_GEN_1293); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1339 = _T_545 ? $signed(_GEN_1318) : $signed(_GEN_1294); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1340 = _T_545 ? $signed(_GEN_1319) : $signed(_GEN_1295); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1341 = _T_545 ? $signed(_GEN_1320) : $signed(_GEN_1296); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1342 = _T_545 ? $signed(_GEN_1321) : $signed(_GEN_1297); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1343 = _T_545 ? $signed(_GEN_1322) : $signed(_GEN_1298); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1344 = _T_545 ? $signed(_GEN_1323) : $signed(_GEN_1299); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1345 = _T_545 ? $signed(_GEN_1324) : $signed(_GEN_1300); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1346 = _T_545 ? $signed(_GEN_1325) : $signed(_GEN_1301); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1347 = _T_545 ? $signed(resReg_11) : $signed(rowsReg_11); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1348 = _T_545 ? $signed(intermDiagReg_11) : $signed(diagReg_11); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1349 = _T_545 ? $signed(resReg_11) : $signed(intermDiagReg_12); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1350 = 5'h0 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1326); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1351 = 5'h1 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1327); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1352 = 5'h2 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1328); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1353 = 5'h3 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1329); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1354 = 5'h4 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1330); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1355 = 5'h5 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1331); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1356 = 5'h6 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1332); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1357 = 5'h7 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1333); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1358 = 5'h8 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1334); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1359 = 5'h9 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1335); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1360 = 5'ha == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1336); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1361 = 5'hb == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1337); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1362 = 5'hc == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1338); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1363 = 5'hd == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1339); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1364 = 5'he == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1340); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1365 = 5'hf == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1341); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1366 = 5'h10 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1342); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1367 = 5'h11 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1343); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1368 = 5'h12 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1344); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1369 = 5'h13 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1345); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1370 = 5'h14 == _T_248[4:0] ? $signed(resReg_12) : $signed(_GEN_1346); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1371 = _T_554 ? $signed(_GEN_1350) : $signed(_GEN_1326); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1372 = _T_554 ? $signed(_GEN_1351) : $signed(_GEN_1327); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1373 = _T_554 ? $signed(_GEN_1352) : $signed(_GEN_1328); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1374 = _T_554 ? $signed(_GEN_1353) : $signed(_GEN_1329); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1375 = _T_554 ? $signed(_GEN_1354) : $signed(_GEN_1330); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1376 = _T_554 ? $signed(_GEN_1355) : $signed(_GEN_1331); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1377 = _T_554 ? $signed(_GEN_1356) : $signed(_GEN_1332); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1378 = _T_554 ? $signed(_GEN_1357) : $signed(_GEN_1333); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1379 = _T_554 ? $signed(_GEN_1358) : $signed(_GEN_1334); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1380 = _T_554 ? $signed(_GEN_1359) : $signed(_GEN_1335); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1381 = _T_554 ? $signed(_GEN_1360) : $signed(_GEN_1336); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1382 = _T_554 ? $signed(_GEN_1361) : $signed(_GEN_1337); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1383 = _T_554 ? $signed(_GEN_1362) : $signed(_GEN_1338); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1384 = _T_554 ? $signed(_GEN_1363) : $signed(_GEN_1339); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1385 = _T_554 ? $signed(_GEN_1364) : $signed(_GEN_1340); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1386 = _T_554 ? $signed(_GEN_1365) : $signed(_GEN_1341); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1387 = _T_554 ? $signed(_GEN_1366) : $signed(_GEN_1342); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1388 = _T_554 ? $signed(_GEN_1367) : $signed(_GEN_1343); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1389 = _T_554 ? $signed(_GEN_1368) : $signed(_GEN_1344); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1390 = _T_554 ? $signed(_GEN_1369) : $signed(_GEN_1345); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1391 = _T_554 ? $signed(_GEN_1370) : $signed(_GEN_1346); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1392 = _T_554 ? $signed(resReg_12) : $signed(rowsReg_12); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1393 = _T_554 ? $signed(intermDiagReg_12) : $signed(diagReg_12); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1394 = _T_554 ? $signed(resReg_12) : $signed(intermDiagReg_13); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1395 = 5'h0 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1371); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1396 = 5'h1 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1372); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1397 = 5'h2 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1373); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1398 = 5'h3 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1374); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1399 = 5'h4 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1375); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1400 = 5'h5 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1376); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1401 = 5'h6 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1377); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1402 = 5'h7 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1378); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1403 = 5'h8 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1379); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1404 = 5'h9 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1380); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1405 = 5'ha == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1381); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1406 = 5'hb == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1382); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1407 = 5'hc == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1383); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1408 = 5'hd == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1384); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1409 = 5'he == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1385); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1410 = 5'hf == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1386); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1411 = 5'h10 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1387); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1412 = 5'h11 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1388); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1413 = 5'h12 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1389); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1414 = 5'h13 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1390); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1415 = 5'h14 == _T_268[4:0] ? $signed(resReg_13) : $signed(_GEN_1391); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1416 = _T_563 ? $signed(_GEN_1395) : $signed(_GEN_1371); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1417 = _T_563 ? $signed(_GEN_1396) : $signed(_GEN_1372); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1418 = _T_563 ? $signed(_GEN_1397) : $signed(_GEN_1373); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1419 = _T_563 ? $signed(_GEN_1398) : $signed(_GEN_1374); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1420 = _T_563 ? $signed(_GEN_1399) : $signed(_GEN_1375); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1421 = _T_563 ? $signed(_GEN_1400) : $signed(_GEN_1376); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1422 = _T_563 ? $signed(_GEN_1401) : $signed(_GEN_1377); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1423 = _T_563 ? $signed(_GEN_1402) : $signed(_GEN_1378); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1424 = _T_563 ? $signed(_GEN_1403) : $signed(_GEN_1379); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1425 = _T_563 ? $signed(_GEN_1404) : $signed(_GEN_1380); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1426 = _T_563 ? $signed(_GEN_1405) : $signed(_GEN_1381); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1427 = _T_563 ? $signed(_GEN_1406) : $signed(_GEN_1382); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1428 = _T_563 ? $signed(_GEN_1407) : $signed(_GEN_1383); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1429 = _T_563 ? $signed(_GEN_1408) : $signed(_GEN_1384); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1430 = _T_563 ? $signed(_GEN_1409) : $signed(_GEN_1385); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1431 = _T_563 ? $signed(_GEN_1410) : $signed(_GEN_1386); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1432 = _T_563 ? $signed(_GEN_1411) : $signed(_GEN_1387); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1433 = _T_563 ? $signed(_GEN_1412) : $signed(_GEN_1388); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1434 = _T_563 ? $signed(_GEN_1413) : $signed(_GEN_1389); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1435 = _T_563 ? $signed(_GEN_1414) : $signed(_GEN_1390); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1436 = _T_563 ? $signed(_GEN_1415) : $signed(_GEN_1391); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1437 = _T_563 ? $signed(resReg_13) : $signed(rowsReg_13); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1438 = _T_563 ? $signed(intermDiagReg_13) : $signed(diagReg_13); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1439 = _T_563 ? $signed(resReg_13) : $signed(intermDiagReg_14); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 99:34 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1440 = 5'h0 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1416); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1441 = 5'h1 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1417); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1442 = 5'h2 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1418); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1443 = 5'h3 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1419); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1444 = 5'h4 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1420); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1445 = 5'h5 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1421); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1446 = 5'h6 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1422); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1447 = 5'h7 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1423); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1448 = 5'h8 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1424); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1449 = 5'h9 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1425); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1450 = 5'ha == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1426); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1451 = 5'hb == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1427); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1452 = 5'hc == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1428); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1453 = 5'hd == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1429); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1454 = 5'he == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1430); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1455 = 5'hf == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1431); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1456 = 5'h10 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1432); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1457 = 5'h11 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1433); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1458 = 5'h12 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1434); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1459 = 5'h13 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1435); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1460 = 5'h14 == _T_288[4:0] ? $signed(resReg_14) : $signed(_GEN_1436); // @[WatermanCentralized.scala 95:50 WatermanCentralized.scala 95:50]
  wire [31:0] _GEN_1461 = _T_572 ? $signed(_GEN_1440) : $signed(_GEN_1416); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1462 = _T_572 ? $signed(_GEN_1441) : $signed(_GEN_1417); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1463 = _T_572 ? $signed(_GEN_1442) : $signed(_GEN_1418); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1464 = _T_572 ? $signed(_GEN_1443) : $signed(_GEN_1419); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1465 = _T_572 ? $signed(_GEN_1444) : $signed(_GEN_1420); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1466 = _T_572 ? $signed(_GEN_1445) : $signed(_GEN_1421); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1467 = _T_572 ? $signed(_GEN_1446) : $signed(_GEN_1422); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1468 = _T_572 ? $signed(_GEN_1447) : $signed(_GEN_1423); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1469 = _T_572 ? $signed(_GEN_1448) : $signed(_GEN_1424); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1470 = _T_572 ? $signed(_GEN_1449) : $signed(_GEN_1425); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1471 = _T_572 ? $signed(_GEN_1450) : $signed(_GEN_1426); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1472 = _T_572 ? $signed(_GEN_1451) : $signed(_GEN_1427); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1473 = _T_572 ? $signed(_GEN_1452) : $signed(_GEN_1428); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1474 = _T_572 ? $signed(_GEN_1453) : $signed(_GEN_1429); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1475 = _T_572 ? $signed(_GEN_1454) : $signed(_GEN_1430); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1476 = _T_572 ? $signed(_GEN_1455) : $signed(_GEN_1431); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1477 = _T_572 ? $signed(_GEN_1456) : $signed(_GEN_1432); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1478 = _T_572 ? $signed(_GEN_1457) : $signed(_GEN_1433); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1479 = _T_572 ? $signed(_GEN_1458) : $signed(_GEN_1434); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1480 = _T_572 ? $signed(_GEN_1459) : $signed(_GEN_1435); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1481 = _T_572 ? $signed(_GEN_1460) : $signed(_GEN_1436); // @[WatermanCentralized.scala 94:78]
  wire [31:0] _GEN_1482 = _T_572 ? $signed(resReg_14) : $signed(rowsReg_14); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 96:22 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1483 = _T_572 ? $signed(intermDiagReg_14) : $signed(diagReg_14); // @[WatermanCentralized.scala 94:78 WatermanCentralized.scala 97:22 WatermanCentralized.scala 22:24]
  wire [6:0] _T_997 = $signed(stepReg) + 7'sh1; // @[WatermanCentralized.scala 103:26]
  wire [1:0] _GEN_1484 = $signed(stepReg) == 7'sh22 ? 2'h0 : 2'h1; // @[WatermanCentralized.scala 104:60 WatermanCentralized.scala 105:18 WatermanCentralized.scala 107:18]
  wire [31:0] _GEN_1485 = _T_709 ? $signed(_GEN_1461) : $signed(columnsReg_0); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1486 = _T_709 ? $signed(_GEN_1462) : $signed(columnsReg_1); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1487 = _T_709 ? $signed(_GEN_1463) : $signed(columnsReg_2); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1488 = _T_709 ? $signed(_GEN_1464) : $signed(columnsReg_3); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1489 = _T_709 ? $signed(_GEN_1465) : $signed(columnsReg_4); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1490 = _T_709 ? $signed(_GEN_1466) : $signed(columnsReg_5); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1491 = _T_709 ? $signed(_GEN_1467) : $signed(columnsReg_6); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1492 = _T_709 ? $signed(_GEN_1468) : $signed(columnsReg_7); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1493 = _T_709 ? $signed(_GEN_1469) : $signed(columnsReg_8); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1494 = _T_709 ? $signed(_GEN_1470) : $signed(columnsReg_9); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1495 = _T_709 ? $signed(_GEN_1471) : $signed(columnsReg_10); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1496 = _T_709 ? $signed(_GEN_1472) : $signed(columnsReg_11); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1497 = _T_709 ? $signed(_GEN_1473) : $signed(columnsReg_12); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1498 = _T_709 ? $signed(_GEN_1474) : $signed(columnsReg_13); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1499 = _T_709 ? $signed(_GEN_1475) : $signed(columnsReg_14); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1500 = _T_709 ? $signed(_GEN_1476) : $signed(columnsReg_15); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1501 = _T_709 ? $signed(_GEN_1477) : $signed(columnsReg_16); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1502 = _T_709 ? $signed(_GEN_1478) : $signed(columnsReg_17); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1503 = _T_709 ? $signed(_GEN_1479) : $signed(columnsReg_18); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1504 = _T_709 ? $signed(_GEN_1480) : $signed(columnsReg_19); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1505 = _T_709 ? $signed(_GEN_1481) : $signed(columnsReg_20); // @[Conditional.scala 39:67 WatermanCentralized.scala 18:27]
  wire [31:0] _GEN_1506 = _T_709 ? $signed(_GEN_852) : $signed(rowsReg_0); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1508 = _T_709 ? $signed(_GEN_854) : $signed(intermDiagReg_1); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1509 = _T_709 ? $signed(_GEN_897) : $signed(rowsReg_1); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1510 = _T_709 ? $signed(_GEN_898) : $signed(diagReg_1); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1511 = _T_709 ? $signed(_GEN_899) : $signed(intermDiagReg_2); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1512 = _T_709 ? $signed(_GEN_942) : $signed(rowsReg_2); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1513 = _T_709 ? $signed(_GEN_943) : $signed(diagReg_2); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1514 = _T_709 ? $signed(_GEN_944) : $signed(intermDiagReg_3); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1515 = _T_709 ? $signed(_GEN_987) : $signed(rowsReg_3); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1516 = _T_709 ? $signed(_GEN_988) : $signed(diagReg_3); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1517 = _T_709 ? $signed(_GEN_989) : $signed(intermDiagReg_4); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1518 = _T_709 ? $signed(_GEN_1032) : $signed(rowsReg_4); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1519 = _T_709 ? $signed(_GEN_1033) : $signed(diagReg_4); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1520 = _T_709 ? $signed(_GEN_1034) : $signed(intermDiagReg_5); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1521 = _T_709 ? $signed(_GEN_1077) : $signed(rowsReg_5); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1522 = _T_709 ? $signed(_GEN_1078) : $signed(diagReg_5); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1523 = _T_709 ? $signed(_GEN_1079) : $signed(intermDiagReg_6); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1524 = _T_709 ? $signed(_GEN_1122) : $signed(rowsReg_6); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1525 = _T_709 ? $signed(_GEN_1123) : $signed(diagReg_6); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1526 = _T_709 ? $signed(_GEN_1124) : $signed(intermDiagReg_7); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1527 = _T_709 ? $signed(_GEN_1167) : $signed(rowsReg_7); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1528 = _T_709 ? $signed(_GEN_1168) : $signed(diagReg_7); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1529 = _T_709 ? $signed(_GEN_1169) : $signed(intermDiagReg_8); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1530 = _T_709 ? $signed(_GEN_1212) : $signed(rowsReg_8); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1531 = _T_709 ? $signed(_GEN_1213) : $signed(diagReg_8); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1532 = _T_709 ? $signed(_GEN_1214) : $signed(intermDiagReg_9); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1533 = _T_709 ? $signed(_GEN_1257) : $signed(rowsReg_9); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1534 = _T_709 ? $signed(_GEN_1258) : $signed(diagReg_9); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1535 = _T_709 ? $signed(_GEN_1259) : $signed(intermDiagReg_10); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1536 = _T_709 ? $signed(_GEN_1302) : $signed(rowsReg_10); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1537 = _T_709 ? $signed(_GEN_1303) : $signed(diagReg_10); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1538 = _T_709 ? $signed(_GEN_1304) : $signed(intermDiagReg_11); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1539 = _T_709 ? $signed(_GEN_1347) : $signed(rowsReg_11); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1540 = _T_709 ? $signed(_GEN_1348) : $signed(diagReg_11); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1541 = _T_709 ? $signed(_GEN_1349) : $signed(intermDiagReg_12); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1542 = _T_709 ? $signed(_GEN_1392) : $signed(rowsReg_12); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1543 = _T_709 ? $signed(_GEN_1393) : $signed(diagReg_12); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1544 = _T_709 ? $signed(_GEN_1394) : $signed(intermDiagReg_13); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1545 = _T_709 ? $signed(_GEN_1437) : $signed(rowsReg_13); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1546 = _T_709 ? $signed(_GEN_1438) : $signed(diagReg_13); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [31:0] _GEN_1547 = _T_709 ? $signed(_GEN_1439) : $signed(intermDiagReg_14); // @[Conditional.scala 39:67 WatermanCentralized.scala 23:30]
  wire [31:0] _GEN_1548 = _T_709 ? $signed(_GEN_1482) : $signed(rowsReg_14); // @[Conditional.scala 39:67 WatermanCentralized.scala 20:24]
  wire [31:0] _GEN_1549 = _T_709 ? $signed(_GEN_1483) : $signed(diagReg_14); // @[Conditional.scala 39:67 WatermanCentralized.scala 22:24]
  wire [6:0] _GEN_1550 = _T_709 ? $signed(_T_997) : $signed(stepReg); // @[Conditional.scala 39:67 WatermanCentralized.scala 103:15 WatermanCentralized.scala 25:24]
  wire [1:0] _GEN_1551 = _T_709 ? _GEN_1484 : stateReg; // @[Conditional.scala 39:67 WatermanCentralized.scala 28:25]
  calculateCell calculateCell ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_io_upper),
    .io_left(calculateCell_io_left),
    .io_diagonal(calculateCell_io_diagonal),
    .io_rowElement(calculateCell_io_rowElement),
    .io_columnElement(calculateCell_io_columnElement),
    .io_out(calculateCell_io_out)
  );
  calculateCell calculateCell_1 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_1_io_upper),
    .io_left(calculateCell_1_io_left),
    .io_diagonal(calculateCell_1_io_diagonal),
    .io_rowElement(calculateCell_1_io_rowElement),
    .io_columnElement(calculateCell_1_io_columnElement),
    .io_out(calculateCell_1_io_out)
  );
  calculateCell calculateCell_2 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_2_io_upper),
    .io_left(calculateCell_2_io_left),
    .io_diagonal(calculateCell_2_io_diagonal),
    .io_rowElement(calculateCell_2_io_rowElement),
    .io_columnElement(calculateCell_2_io_columnElement),
    .io_out(calculateCell_2_io_out)
  );
  calculateCell calculateCell_3 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_3_io_upper),
    .io_left(calculateCell_3_io_left),
    .io_diagonal(calculateCell_3_io_diagonal),
    .io_rowElement(calculateCell_3_io_rowElement),
    .io_columnElement(calculateCell_3_io_columnElement),
    .io_out(calculateCell_3_io_out)
  );
  calculateCell calculateCell_4 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_4_io_upper),
    .io_left(calculateCell_4_io_left),
    .io_diagonal(calculateCell_4_io_diagonal),
    .io_rowElement(calculateCell_4_io_rowElement),
    .io_columnElement(calculateCell_4_io_columnElement),
    .io_out(calculateCell_4_io_out)
  );
  calculateCell calculateCell_5 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_5_io_upper),
    .io_left(calculateCell_5_io_left),
    .io_diagonal(calculateCell_5_io_diagonal),
    .io_rowElement(calculateCell_5_io_rowElement),
    .io_columnElement(calculateCell_5_io_columnElement),
    .io_out(calculateCell_5_io_out)
  );
  calculateCell calculateCell_6 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_6_io_upper),
    .io_left(calculateCell_6_io_left),
    .io_diagonal(calculateCell_6_io_diagonal),
    .io_rowElement(calculateCell_6_io_rowElement),
    .io_columnElement(calculateCell_6_io_columnElement),
    .io_out(calculateCell_6_io_out)
  );
  calculateCell calculateCell_7 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_7_io_upper),
    .io_left(calculateCell_7_io_left),
    .io_diagonal(calculateCell_7_io_diagonal),
    .io_rowElement(calculateCell_7_io_rowElement),
    .io_columnElement(calculateCell_7_io_columnElement),
    .io_out(calculateCell_7_io_out)
  );
  calculateCell calculateCell_8 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_8_io_upper),
    .io_left(calculateCell_8_io_left),
    .io_diagonal(calculateCell_8_io_diagonal),
    .io_rowElement(calculateCell_8_io_rowElement),
    .io_columnElement(calculateCell_8_io_columnElement),
    .io_out(calculateCell_8_io_out)
  );
  calculateCell calculateCell_9 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_9_io_upper),
    .io_left(calculateCell_9_io_left),
    .io_diagonal(calculateCell_9_io_diagonal),
    .io_rowElement(calculateCell_9_io_rowElement),
    .io_columnElement(calculateCell_9_io_columnElement),
    .io_out(calculateCell_9_io_out)
  );
  calculateCell calculateCell_10 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_10_io_upper),
    .io_left(calculateCell_10_io_left),
    .io_diagonal(calculateCell_10_io_diagonal),
    .io_rowElement(calculateCell_10_io_rowElement),
    .io_columnElement(calculateCell_10_io_columnElement),
    .io_out(calculateCell_10_io_out)
  );
  calculateCell calculateCell_11 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_11_io_upper),
    .io_left(calculateCell_11_io_left),
    .io_diagonal(calculateCell_11_io_diagonal),
    .io_rowElement(calculateCell_11_io_rowElement),
    .io_columnElement(calculateCell_11_io_columnElement),
    .io_out(calculateCell_11_io_out)
  );
  calculateCell calculateCell_12 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_12_io_upper),
    .io_left(calculateCell_12_io_left),
    .io_diagonal(calculateCell_12_io_diagonal),
    .io_rowElement(calculateCell_12_io_rowElement),
    .io_columnElement(calculateCell_12_io_columnElement),
    .io_out(calculateCell_12_io_out)
  );
  calculateCell calculateCell_13 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_13_io_upper),
    .io_left(calculateCell_13_io_left),
    .io_diagonal(calculateCell_13_io_diagonal),
    .io_rowElement(calculateCell_13_io_rowElement),
    .io_columnElement(calculateCell_13_io_columnElement),
    .io_out(calculateCell_13_io_out)
  );
  calculateCell calculateCell_14 ( // @[WatermanCentralized.scala 31:11]
    .io_upper(calculateCell_14_io_upper),
    .io_left(calculateCell_14_io_left),
    .io_diagonal(calculateCell_14_io_diagonal),
    .io_rowElement(calculateCell_14_io_rowElement),
    .io_columnElement(calculateCell_14_io_columnElement),
    .io_out(calculateCell_14_io_out)
  );
  VectorElemOr leftForOutput ( // @[WatermanCentralized.scala 42:29]
    .io_input_0(leftForOutput_io_input_0),
    .io_input_1(leftForOutput_io_input_1),
    .io_input_2(leftForOutput_io_input_2),
    .io_input_3(leftForOutput_io_input_3),
    .io_input_4(leftForOutput_io_input_4),
    .io_input_5(leftForOutput_io_input_5),
    .io_input_6(leftForOutput_io_input_6),
    .io_input_7(leftForOutput_io_input_7),
    .io_input_8(leftForOutput_io_input_8),
    .io_input_9(leftForOutput_io_input_9),
    .io_input_10(leftForOutput_io_input_10),
    .io_input_11(leftForOutput_io_input_11),
    .io_input_12(leftForOutput_io_input_12),
    .io_input_13(leftForOutput_io_input_13),
    .io_input_14(leftForOutput_io_input_14),
    .io_out(leftForOutput_io_out)
  );
  assign io_in_ready = stateReg == 2'h0; // @[WatermanCentralized.scala 51:27]
  assign io_out_0_valid = outValidReg_0; // @[WatermanCentralized.scala 49:21]
  assign io_out_0_bits_score = resReg_0; // @[WatermanCentralized.scala 48:26]
  assign io_out_0_bits_x = _T_8[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_0_bits_y = 4'h0; // @[WatermanCentralized.scala 47:22]
  assign io_out_1_valid = outValidReg_1; // @[WatermanCentralized.scala 49:21]
  assign io_out_1_bits_score = resReg_1; // @[WatermanCentralized.scala 48:26]
  assign io_out_1_bits_x = _T_28[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_1_bits_y = 4'h1; // @[WatermanCentralized.scala 47:22]
  assign io_out_2_valid = outValidReg_2; // @[WatermanCentralized.scala 49:21]
  assign io_out_2_bits_score = resReg_2; // @[WatermanCentralized.scala 48:26]
  assign io_out_2_bits_x = _T_48[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_2_bits_y = 4'h2; // @[WatermanCentralized.scala 47:22]
  assign io_out_3_valid = outValidReg_3; // @[WatermanCentralized.scala 49:21]
  assign io_out_3_bits_score = resReg_3; // @[WatermanCentralized.scala 48:26]
  assign io_out_3_bits_x = _T_68[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_3_bits_y = 4'h3; // @[WatermanCentralized.scala 47:22]
  assign io_out_4_valid = outValidReg_4; // @[WatermanCentralized.scala 49:21]
  assign io_out_4_bits_score = resReg_4; // @[WatermanCentralized.scala 48:26]
  assign io_out_4_bits_x = _T_88[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_4_bits_y = 4'h4; // @[WatermanCentralized.scala 47:22]
  assign io_out_5_valid = outValidReg_5; // @[WatermanCentralized.scala 49:21]
  assign io_out_5_bits_score = resReg_5; // @[WatermanCentralized.scala 48:26]
  assign io_out_5_bits_x = _T_108[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_5_bits_y = 4'h5; // @[WatermanCentralized.scala 47:22]
  assign io_out_6_valid = outValidReg_6; // @[WatermanCentralized.scala 49:21]
  assign io_out_6_bits_score = resReg_6; // @[WatermanCentralized.scala 48:26]
  assign io_out_6_bits_x = _T_128[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_6_bits_y = 4'h6; // @[WatermanCentralized.scala 47:22]
  assign io_out_7_valid = outValidReg_7; // @[WatermanCentralized.scala 49:21]
  assign io_out_7_bits_score = resReg_7; // @[WatermanCentralized.scala 48:26]
  assign io_out_7_bits_x = _T_148[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_7_bits_y = 4'h7; // @[WatermanCentralized.scala 47:22]
  assign io_out_8_valid = outValidReg_8; // @[WatermanCentralized.scala 49:21]
  assign io_out_8_bits_score = resReg_8; // @[WatermanCentralized.scala 48:26]
  assign io_out_8_bits_x = _T_168[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_8_bits_y = 4'h8; // @[WatermanCentralized.scala 47:22]
  assign io_out_9_valid = outValidReg_9; // @[WatermanCentralized.scala 49:21]
  assign io_out_9_bits_score = resReg_9; // @[WatermanCentralized.scala 48:26]
  assign io_out_9_bits_x = _T_188[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_9_bits_y = 4'h9; // @[WatermanCentralized.scala 47:22]
  assign io_out_10_valid = outValidReg_10; // @[WatermanCentralized.scala 49:21]
  assign io_out_10_bits_score = resReg_10; // @[WatermanCentralized.scala 48:26]
  assign io_out_10_bits_x = _T_208[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_10_bits_y = 4'ha; // @[WatermanCentralized.scala 47:22]
  assign io_out_11_valid = outValidReg_11; // @[WatermanCentralized.scala 49:21]
  assign io_out_11_bits_score = resReg_11; // @[WatermanCentralized.scala 48:26]
  assign io_out_11_bits_x = _T_228[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_11_bits_y = 4'hb; // @[WatermanCentralized.scala 47:22]
  assign io_out_12_valid = outValidReg_12; // @[WatermanCentralized.scala 49:21]
  assign io_out_12_bits_score = resReg_12; // @[WatermanCentralized.scala 48:26]
  assign io_out_12_bits_x = _T_248[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_12_bits_y = 4'hc; // @[WatermanCentralized.scala 47:22]
  assign io_out_13_valid = outValidReg_13; // @[WatermanCentralized.scala 49:21]
  assign io_out_13_bits_score = resReg_13; // @[WatermanCentralized.scala 48:26]
  assign io_out_13_bits_x = _T_268[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_13_bits_y = 4'hd; // @[WatermanCentralized.scala 47:22]
  assign io_out_14_valid = outValidReg_14; // @[WatermanCentralized.scala 49:21]
  assign io_out_14_bits_score = resReg_14; // @[WatermanCentralized.scala 48:26]
  assign io_out_14_bits_x = _T_288[4:0]; // @[WatermanCentralized.scala 46:22]
  assign io_out_14_bits_y = 4'he; // @[WatermanCentralized.scala 47:22]
  assign calculateCell_io_upper = 5'h14 == _T_8[4:0] ? $signed(columnsReg_20) : $signed(_GEN_19); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_io_left = rowsReg_0; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_io_diagonal = 32'sh0; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_io_rowElement = TReg_0; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_io_columnElement = 5'h14 == _T_8[4:0] ? SReg_20 : _GEN_40; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_1_io_upper = 5'h14 == _T_28[4:0] ? $signed(columnsReg_20) : $signed(_GEN_61); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_1_io_left = rowsReg_1; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_1_io_diagonal = diagReg_1; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_1_io_rowElement = TReg_1; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_1_io_columnElement = 5'h14 == _T_28[4:0] ? SReg_20 : _GEN_82; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_2_io_upper = 5'h14 == _T_48[4:0] ? $signed(columnsReg_20) : $signed(_GEN_103); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_2_io_left = rowsReg_2; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_2_io_diagonal = diagReg_2; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_2_io_rowElement = TReg_2; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_2_io_columnElement = 5'h14 == _T_48[4:0] ? SReg_20 : _GEN_124; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_3_io_upper = 5'h14 == _T_68[4:0] ? $signed(columnsReg_20) : $signed(_GEN_145); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_3_io_left = rowsReg_3; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_3_io_diagonal = diagReg_3; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_3_io_rowElement = TReg_3; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_3_io_columnElement = 5'h14 == _T_68[4:0] ? SReg_20 : _GEN_166; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_4_io_upper = 5'h14 == _T_88[4:0] ? $signed(columnsReg_20) : $signed(_GEN_187); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_4_io_left = rowsReg_4; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_4_io_diagonal = diagReg_4; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_4_io_rowElement = TReg_4; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_4_io_columnElement = 5'h14 == _T_88[4:0] ? SReg_20 : _GEN_208; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_5_io_upper = 5'h14 == _T_108[4:0] ? $signed(columnsReg_20) : $signed(_GEN_229); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_5_io_left = rowsReg_5; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_5_io_diagonal = diagReg_5; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_5_io_rowElement = TReg_5; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_5_io_columnElement = 5'h14 == _T_108[4:0] ? SReg_20 : _GEN_250; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_6_io_upper = 5'h14 == _T_128[4:0] ? $signed(columnsReg_20) : $signed(_GEN_271); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_6_io_left = rowsReg_6; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_6_io_diagonal = diagReg_6; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_6_io_rowElement = TReg_6; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_6_io_columnElement = 5'h14 == _T_128[4:0] ? SReg_20 : _GEN_292; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_7_io_upper = 5'h14 == _T_148[4:0] ? $signed(columnsReg_20) : $signed(_GEN_313); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_7_io_left = rowsReg_7; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_7_io_diagonal = diagReg_7; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_7_io_rowElement = TReg_7; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_7_io_columnElement = 5'h14 == _T_148[4:0] ? SReg_20 : _GEN_334; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_8_io_upper = 5'h14 == _T_168[4:0] ? $signed(columnsReg_20) : $signed(_GEN_355); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_8_io_left = rowsReg_8; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_8_io_diagonal = diagReg_8; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_8_io_rowElement = TReg_8; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_8_io_columnElement = 5'h14 == _T_168[4:0] ? SReg_20 : _GEN_376; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_9_io_upper = 5'h14 == _T_188[4:0] ? $signed(columnsReg_20) : $signed(_GEN_397); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_9_io_left = rowsReg_9; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_9_io_diagonal = diagReg_9; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_9_io_rowElement = TReg_9; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_9_io_columnElement = 5'h14 == _T_188[4:0] ? SReg_20 : _GEN_418; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_10_io_upper = 5'h14 == _T_208[4:0] ? $signed(columnsReg_20) : $signed(_GEN_439); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_10_io_left = rowsReg_10; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_10_io_diagonal = diagReg_10; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_10_io_rowElement = TReg_10; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_10_io_columnElement = 5'h14 == _T_208[4:0] ? SReg_20 : _GEN_460; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_11_io_upper = 5'h14 == _T_228[4:0] ? $signed(columnsReg_20) : $signed(_GEN_481); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_11_io_left = rowsReg_11; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_11_io_diagonal = diagReg_11; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_11_io_rowElement = TReg_11; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_11_io_columnElement = 5'h14 == _T_228[4:0] ? SReg_20 : _GEN_502; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_12_io_upper = 5'h14 == _T_248[4:0] ? $signed(columnsReg_20) : $signed(_GEN_523); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_12_io_left = rowsReg_12; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_12_io_diagonal = diagReg_12; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_12_io_rowElement = TReg_12; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_12_io_columnElement = 5'h14 == _T_248[4:0] ? SReg_20 : _GEN_544; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_13_io_upper = 5'h14 == _T_268[4:0] ? $signed(columnsReg_20) : $signed(_GEN_565); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_13_io_left = rowsReg_13; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_13_io_diagonal = diagReg_13; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_13_io_rowElement = TReg_13; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_13_io_columnElement = 5'h14 == _T_268[4:0] ? SReg_20 : _GEN_586; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign calculateCell_14_io_upper = 5'h14 == _T_288[4:0] ? $signed(columnsReg_20) : $signed(_GEN_607); // @[WatermanCentralized.scala 35:18 WatermanCentralized.scala 35:18]
  assign calculateCell_14_io_left = rowsReg_14; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 38:17]
  assign calculateCell_14_io_diagonal = diagReg_14; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 36:21]
  assign calculateCell_14_io_rowElement = TReg_14; // @[WatermanCentralized.scala 30:20 WatermanCentralized.scala 39:23]
  assign calculateCell_14_io_columnElement = 5'h14 == _T_288[4:0] ? SReg_20 : _GEN_628; // @[WatermanCentralized.scala 37:26 WatermanCentralized.scala 37:26]
  assign leftForOutput_io_input_0 = outValidReg_0; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_1 = outValidReg_1; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_2 = outValidReg_2; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_3 = outValidReg_3; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_4 = outValidReg_4; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_5 = outValidReg_5; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_6 = outValidReg_6; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_7 = outValidReg_7; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_8 = outValidReg_8; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_9 = outValidReg_9; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_10 = outValidReg_10; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_11 = outValidReg_11; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_12 = outValidReg_12; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_13 = outValidReg_13; // @[WatermanCentralized.scala 43:26]
  assign leftForOutput_io_input_14 = outValidReg_14; // @[WatermanCentralized.scala 43:26]
  always @(posedge clock) begin
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_0 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_0 <= io_in_bits_S_0; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_1 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_1 <= io_in_bits_S_1; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_2 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_2 <= io_in_bits_S_2; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_3 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_3 <= io_in_bits_S_3; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_4 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_4 <= io_in_bits_S_4; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_5 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_5 <= io_in_bits_S_5; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_6 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_6 <= io_in_bits_S_6; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_7 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_7 <= io_in_bits_S_7; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_8 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_8 <= io_in_bits_S_8; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_9 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_9 <= io_in_bits_S_9; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_10 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_10 <= io_in_bits_S_10; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_11 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_11 <= io_in_bits_S_11; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_12 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_12 <= io_in_bits_S_12; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_13 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_13 <= io_in_bits_S_13; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_14 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_14 <= io_in_bits_S_14; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_15 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_15 <= io_in_bits_S_15; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_16 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_16 <= io_in_bits_S_16; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_17 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_17 <= io_in_bits_S_17; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_18 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_18 <= io_in_bits_S_18; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_19 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_19 <= io_in_bits_S_19; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 17:21]
      SReg_20 <= 2'h0; // @[WatermanCentralized.scala 17:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        SReg_20 <= io_in_bits_S_20; // @[WatermanCentralized.scala 57:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_0 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_0 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_0 <= _GEN_1485;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_1 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_1 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_1 <= _GEN_1486;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_2 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_2 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_2 <= _GEN_1487;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_3 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_3 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_3 <= _GEN_1488;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_4 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_4 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_4 <= _GEN_1489;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_5 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_5 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_5 <= _GEN_1490;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_6 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_6 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_6 <= _GEN_1491;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_7 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_7 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_7 <= _GEN_1492;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_8 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_8 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_8 <= _GEN_1493;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_9 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_9 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_9 <= _GEN_1494;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_10 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_10 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_10 <= _GEN_1495;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_11 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_11 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_11 <= _GEN_1496;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_12 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_12 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_12 <= _GEN_1497;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_13 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_13 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_13 <= _GEN_1498;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_14 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_14 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_14 <= _GEN_1499;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_15 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_15 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_15 <= _GEN_1500;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_16 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_16 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_16 <= _GEN_1501;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_17 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_17 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_17 <= _GEN_1502;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_18 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_18 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_18 <= _GEN_1503;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_19 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_19 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_19 <= _GEN_1504;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 18:27]
      columnsReg_20 <= 32'sh0; // @[WatermanCentralized.scala 18:27]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        columnsReg_20 <= 32'sh0; // @[WatermanCentralized.scala 58:25]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        columnsReg_20 <= _GEN_1505;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_0 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_0 <= io_in_bits_T_0; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_1 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_1 <= io_in_bits_T_1; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_2 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_2 <= io_in_bits_T_2; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_3 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_3 <= io_in_bits_T_3; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_4 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_4 <= io_in_bits_T_4; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_5 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_5 <= io_in_bits_T_5; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_6 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_6 <= io_in_bits_T_6; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_7 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_7 <= io_in_bits_T_7; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_8 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_8 <= io_in_bits_T_8; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_9 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_9 <= io_in_bits_T_9; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_10 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_10 <= io_in_bits_T_10; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_11 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_11 <= io_in_bits_T_11; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_12 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_12 <= io_in_bits_T_12; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_13 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_13 <= io_in_bits_T_13; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 19:21]
      TReg_14 <= 2'h0; // @[WatermanCentralized.scala 19:21]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        TReg_14 <= io_in_bits_T_14; // @[WatermanCentralized.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_0 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_0 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_0 <= _GEN_1506;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_1 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_1 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_1 <= _GEN_1509;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_2 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_2 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_2 <= _GEN_1512;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_3 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_3 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_3 <= _GEN_1515;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_4 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_4 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_4 <= _GEN_1518;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_5 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_5 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_5 <= _GEN_1521;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_6 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_6 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_6 <= _GEN_1524;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_7 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_7 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_7 <= _GEN_1527;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_8 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_8 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_8 <= _GEN_1530;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_9 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_9 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_9 <= _GEN_1533;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_10 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_10 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_10 <= _GEN_1536;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_11 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_11 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_11 <= _GEN_1539;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_12 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_12 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_12 <= _GEN_1542;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_13 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_13 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_13 <= _GEN_1545;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 20:24]
      rowsReg_14 <= 32'sh0; // @[WatermanCentralized.scala 20:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        rowsReg_14 <= 32'sh0; // @[WatermanCentralized.scala 62:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        rowsReg_14 <= _GEN_1548;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_0 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'sh0 >= $signed(_T_443) & 7'sh0 <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_0 <= PEs_0_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_1 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'sh1 >= $signed(_T_443) & 7'sh1 <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_1 <= PEs_1_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_2 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'sh2 >= $signed(_T_443) & 7'sh2 <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_2 <= PEs_2_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_3 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'sh3 >= $signed(_T_443) & 7'sh3 <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_3 <= PEs_3_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_4 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'sh4 >= $signed(_T_443) & 7'sh4 <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_4 <= PEs_4_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_5 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'sh5 >= $signed(_T_443) & 7'sh5 <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_5 <= PEs_5_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_6 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'sh6 >= $signed(_T_443) & 7'sh6 <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_6 <= PEs_6_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_7 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'sh7 >= $signed(_T_443) & 7'sh7 <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_7 <= PEs_7_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_8 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'sh8 >= $signed(_T_443) & 7'sh8 <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_8 <= PEs_8_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_9 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'sh9 >= $signed(_T_443) & 7'sh9 <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_9 <= PEs_9_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_10 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'sha >= $signed(_T_443) & 7'sha <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_10 <= PEs_10_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_11 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'shb >= $signed(_T_443) & 7'shb <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_11 <= PEs_11_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_12 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'shc >= $signed(_T_443) & 7'shc <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_12 <= PEs_12_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_13 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'shd >= $signed(_T_443) & 7'shd <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_13 <= PEs_13_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 21:23]
      resReg_14 <= 32'sh0; // @[WatermanCentralized.scala 21:23]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        if (7'she >= $signed(_T_443) & 7'she <= $signed(stepReg)) begin // @[WatermanCentralized.scala 72:78]
          resReg_14 <= PEs_14_out; // @[WatermanCentralized.scala 73:21]
        end
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_1 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_1 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_1 <= _GEN_1510;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_2 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_2 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_2 <= _GEN_1513;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_3 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_3 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_3 <= _GEN_1516;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_4 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_4 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_4 <= _GEN_1519;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_5 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_5 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_5 <= _GEN_1522;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_6 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_6 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_6 <= _GEN_1525;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_7 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_7 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_7 <= _GEN_1528;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_8 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_8 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_8 <= _GEN_1531;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_9 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_9 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_9 <= _GEN_1534;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_10 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_10 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_10 <= _GEN_1537;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_11 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_11 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_11 <= _GEN_1540;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_12 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_12 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_12 <= _GEN_1543;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_13 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_13 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_13 <= _GEN_1546;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 22:24]
      diagReg_14 <= 32'sh0; // @[WatermanCentralized.scala 22:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        diagReg_14 <= 32'sh0; // @[WatermanCentralized.scala 63:22]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        diagReg_14 <= _GEN_1549;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_1 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_1 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_1 <= _GEN_1508;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_2 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_2 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_2 <= _GEN_1511;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_3 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_3 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_3 <= _GEN_1514;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_4 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_4 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_4 <= _GEN_1517;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_5 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_5 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_5 <= _GEN_1520;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_6 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_6 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_6 <= _GEN_1523;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_7 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_7 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_7 <= _GEN_1526;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_8 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_8 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_8 <= _GEN_1529;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_9 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_9 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_9 <= _GEN_1532;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_10 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_10 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_10 <= _GEN_1535;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_11 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_11 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_11 <= _GEN_1538;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_12 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_12 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_12 <= _GEN_1541;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_13 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_13 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_13 <= _GEN_1544;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 23:30]
      intermDiagReg_14 <= 32'sh0; // @[WatermanCentralized.scala 23:30]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        intermDiagReg_14 <= 32'sh0; // @[WatermanCentralized.scala 64:28]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        intermDiagReg_14 <= _GEN_1547;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_0 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_0 <= _GEN_735;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_0 <= _GEN_794;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_1 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_1 <= _GEN_737;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_1 <= _GEN_795;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_2 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_2 <= _GEN_739;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_2 <= _GEN_796;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_3 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_3 <= _GEN_741;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_3 <= _GEN_797;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_4 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_4 <= _GEN_743;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_4 <= _GEN_798;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_5 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_5 <= _GEN_745;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_5 <= _GEN_799;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_6 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_6 <= _GEN_747;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_6 <= _GEN_800;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_7 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_7 <= _GEN_749;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_7 <= _GEN_801;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_8 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_8 <= _GEN_751;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_8 <= _GEN_802;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_9 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_9 <= _GEN_753;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_9 <= _GEN_803;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_10 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_10 <= _GEN_755;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_10 <= _GEN_804;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_11 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_11 <= _GEN_757;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_11 <= _GEN_805;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_12 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_12 <= _GEN_759;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_12 <= _GEN_806;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_13 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_13 <= _GEN_761;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_13 <= _GEN_807;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 24:28]
      outValidReg_14 <= 1'h0; // @[WatermanCentralized.scala 24:28]
    end else if (!(_T_436)) begin // @[Conditional.scala 40:58]
      if (_T_437) begin // @[Conditional.scala 39:67]
        outValidReg_14 <= _GEN_763;
      end else if (_T_573) begin // @[Conditional.scala 39:67]
        outValidReg_14 <= _GEN_808;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 25:24]
      stepReg <= 7'sh0; // @[WatermanCentralized.scala 25:24]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        stepReg <= 7'sh0; // @[WatermanCentralized.scala 66:17]
      end
    end else if (!(_T_437)) begin // @[Conditional.scala 39:67]
      if (!(_T_573)) begin // @[Conditional.scala 39:67]
        stepReg <= _GEN_1550;
      end
    end
    if (reset) begin // @[WatermanCentralized.scala 28:25]
      stateReg <= 2'h0; // @[WatermanCentralized.scala 28:25]
    end else if (_T_436) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanCentralized.scala 55:25]
        stateReg <= 2'h1; // @[WatermanCentralized.scala 67:18]
      end
    end else if (_T_437) begin // @[Conditional.scala 39:67]
      stateReg <= 2'h2; // @[WatermanCentralized.scala 77:16]
    end else if (_T_573) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_809;
    end else begin
      stateReg <= _GEN_1551;
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
  columnsReg_0 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  columnsReg_1 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  columnsReg_2 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  columnsReg_3 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  columnsReg_4 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  columnsReg_5 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  columnsReg_6 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  columnsReg_7 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  columnsReg_8 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  columnsReg_9 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  columnsReg_10 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  columnsReg_11 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  columnsReg_12 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  columnsReg_13 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  columnsReg_14 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  columnsReg_15 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  columnsReg_16 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  columnsReg_17 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  columnsReg_18 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  columnsReg_19 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  columnsReg_20 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  TReg_0 = _RAND_42[1:0];
  _RAND_43 = {1{`RANDOM}};
  TReg_1 = _RAND_43[1:0];
  _RAND_44 = {1{`RANDOM}};
  TReg_2 = _RAND_44[1:0];
  _RAND_45 = {1{`RANDOM}};
  TReg_3 = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  TReg_4 = _RAND_46[1:0];
  _RAND_47 = {1{`RANDOM}};
  TReg_5 = _RAND_47[1:0];
  _RAND_48 = {1{`RANDOM}};
  TReg_6 = _RAND_48[1:0];
  _RAND_49 = {1{`RANDOM}};
  TReg_7 = _RAND_49[1:0];
  _RAND_50 = {1{`RANDOM}};
  TReg_8 = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  TReg_9 = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  TReg_10 = _RAND_52[1:0];
  _RAND_53 = {1{`RANDOM}};
  TReg_11 = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  TReg_12 = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  TReg_13 = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  TReg_14 = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  rowsReg_0 = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  rowsReg_1 = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  rowsReg_2 = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  rowsReg_3 = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  rowsReg_4 = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  rowsReg_5 = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  rowsReg_6 = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  rowsReg_7 = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  rowsReg_8 = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  rowsReg_9 = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  rowsReg_10 = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  rowsReg_11 = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  rowsReg_12 = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  rowsReg_13 = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  rowsReg_14 = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  resReg_0 = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  resReg_1 = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  resReg_2 = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  resReg_3 = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  resReg_4 = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  resReg_5 = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  resReg_6 = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  resReg_7 = _RAND_79[31:0];
  _RAND_80 = {1{`RANDOM}};
  resReg_8 = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  resReg_9 = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  resReg_10 = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  resReg_11 = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  resReg_12 = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  resReg_13 = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  resReg_14 = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  diagReg_1 = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  diagReg_2 = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  diagReg_3 = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  diagReg_4 = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  diagReg_5 = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  diagReg_6 = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  diagReg_7 = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  diagReg_8 = _RAND_94[31:0];
  _RAND_95 = {1{`RANDOM}};
  diagReg_9 = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  diagReg_10 = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  diagReg_11 = _RAND_97[31:0];
  _RAND_98 = {1{`RANDOM}};
  diagReg_12 = _RAND_98[31:0];
  _RAND_99 = {1{`RANDOM}};
  diagReg_13 = _RAND_99[31:0];
  _RAND_100 = {1{`RANDOM}};
  diagReg_14 = _RAND_100[31:0];
  _RAND_101 = {1{`RANDOM}};
  intermDiagReg_1 = _RAND_101[31:0];
  _RAND_102 = {1{`RANDOM}};
  intermDiagReg_2 = _RAND_102[31:0];
  _RAND_103 = {1{`RANDOM}};
  intermDiagReg_3 = _RAND_103[31:0];
  _RAND_104 = {1{`RANDOM}};
  intermDiagReg_4 = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  intermDiagReg_5 = _RAND_105[31:0];
  _RAND_106 = {1{`RANDOM}};
  intermDiagReg_6 = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  intermDiagReg_7 = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  intermDiagReg_8 = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  intermDiagReg_9 = _RAND_109[31:0];
  _RAND_110 = {1{`RANDOM}};
  intermDiagReg_10 = _RAND_110[31:0];
  _RAND_111 = {1{`RANDOM}};
  intermDiagReg_11 = _RAND_111[31:0];
  _RAND_112 = {1{`RANDOM}};
  intermDiagReg_12 = _RAND_112[31:0];
  _RAND_113 = {1{`RANDOM}};
  intermDiagReg_13 = _RAND_113[31:0];
  _RAND_114 = {1{`RANDOM}};
  intermDiagReg_14 = _RAND_114[31:0];
  _RAND_115 = {1{`RANDOM}};
  outValidReg_0 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  outValidReg_1 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  outValidReg_2 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  outValidReg_3 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  outValidReg_4 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  outValidReg_5 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  outValidReg_6 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  outValidReg_7 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  outValidReg_8 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  outValidReg_9 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  outValidReg_10 = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  outValidReg_11 = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  outValidReg_12 = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  outValidReg_13 = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  outValidReg_14 = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  stepReg = _RAND_130[6:0];
  _RAND_131 = {1{`RANDOM}};
  stateReg = _RAND_131[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
