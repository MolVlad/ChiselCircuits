module substituteElements(
  input  [1:0]  io_first,
  input  [1:0]  io_second,
  output [31:0] io_out
);
  wire [1:0] _GEN_0 = io_first == io_second ? $signed(2'sh1) : $signed(-2'sh1); // @[WatermanSystolic.scala 212:33 WatermanSystolic.scala 213:12 WatermanSystolic.scala 215:12]
  assign io_out = {{30{_GEN_0[1]}},_GEN_0}; // @[WatermanSystolic.scala 212:33 WatermanSystolic.scala 213:12 WatermanSystolic.scala 215:12]
endmodule
module processingElementDecoupled(
  input         clock,
  input         reset,
  output        io_fromPreviousPE_ready,
  input         io_fromPreviousPE_valid,
  input  [31:0] io_fromPreviousPE_bits_upper,
  input  [31:0] io_fromPreviousPE_bits_diagonal,
  input  [1:0]  io_fromPreviousPE_bits_columnElement,
  input  [1:0]  io_rowElement,
  input         io_reset,
  input  [31:0] io_number,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_score,
  output [4:0]  io_out_bits_x,
  output [3:0]  io_out_bits_y,
  input         io_toNextPE_ready,
  output        io_toNextPE_valid,
  output [31:0] io_toNextPE_bits_upper,
  output [31:0] io_toNextPE_bits_diagonal,
  output [1:0]  io_toNextPE_bits_columnElement
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
`endif // RANDOMIZE_REG_INIT
  wire [1:0] substituteElements_io_first; // @[WatermanSystolic.scala 123:34]
  wire [1:0] substituteElements_io_second; // @[WatermanSystolic.scala 123:34]
  wire [31:0] substituteElements_io_out; // @[WatermanSystolic.scala 123:34]
  reg  stateReg; // @[WatermanSystolic.scala 113:25]
  reg  toNextPeValidReg; // @[WatermanSystolic.scala 114:33]
  reg  scoreValidReg; // @[WatermanSystolic.scala 115:30]
  reg [31:0] previousScore; // @[WatermanSystolic.scala 116:30]
  reg [31:0] leftReg; // @[WatermanSystolic.scala 117:24]
  reg [31:0] diagReg; // @[WatermanSystolic.scala 118:24]
  reg [31:0] upperReg; // @[WatermanSystolic.scala 119:25]
  reg [1:0] columnElementReg; // @[WatermanSystolic.scala 120:33]
  reg [4:0] stepReg; // @[WatermanSystolic.scala 121:24]
  wire [31:0] diag = $signed(diagReg) + $signed(substituteElements_io_out); // @[WatermanSystolic.scala 128:19]
  wire [31:0] upper = $signed(upperReg) - 32'sh2; // @[WatermanSystolic.scala 129:21]
  wire [31:0] left = $signed(leftReg) - 32'sh2; // @[WatermanSystolic.scala 130:19]
  wire  _T_9 = ~stateReg; // @[WatermanSystolic.scala 132:39]
  wire [31:0] diagOrUpper = $signed(diag) > $signed(upper) ? $signed(diag) : $signed(upper); // @[WatermanSystolic.scala 142:22 WatermanSystolic.scala 143:17 WatermanSystolic.scala 145:17]
  wire [31:0] diagOrLeft = $signed(diag) > $signed(left) ? $signed(diag) : $signed(left); // @[WatermanSystolic.scala 147:21 WatermanSystolic.scala 148:16 WatermanSystolic.scala 150:16]
  wire [31:0] max = $signed(diagOrLeft) > $signed(diagOrUpper) ? $signed(diagOrLeft) : $signed(diagOrUpper); // @[WatermanSystolic.scala 152:34 WatermanSystolic.scala 153:9 WatermanSystolic.scala 155:9]
  wire [31:0] score = $signed(max) > 32'sh0 ? $signed(max) : $signed(32'sh0); // @[WatermanSystolic.scala 159:35 WatermanSystolic.scala 160:13 WatermanSystolic.scala 162:13]
  wire  _GEN_7 = io_fromPreviousPE_valid | scoreValidReg; // @[WatermanSystolic.scala 176:39 WatermanSystolic.scala 181:25 WatermanSystolic.scala 115:30]
  wire  _GEN_8 = io_fromPreviousPE_valid | toNextPeValidReg; // @[WatermanSystolic.scala 176:39 WatermanSystolic.scala 182:28 WatermanSystolic.scala 114:33]
  wire  _GEN_9 = io_fromPreviousPE_valid | stateReg; // @[WatermanSystolic.scala 176:39 WatermanSystolic.scala 183:20 WatermanSystolic.scala 113:25]
  wire  _GEN_10 = io_out_ready ? 1'h0 : scoreValidReg; // @[WatermanSystolic.scala 187:28 WatermanSystolic.scala 188:25 WatermanSystolic.scala 115:30]
  wire  _GEN_11 = io_toNextPE_ready ? 1'h0 : toNextPeValidReg; // @[WatermanSystolic.scala 190:33 WatermanSystolic.scala 191:28 WatermanSystolic.scala 114:33]
  wire [4:0] _T_19 = stepReg + 5'h1; // @[WatermanSystolic.scala 196:30]
  wire [31:0] _GEN_12 = ~(scoreValidReg | toNextPeValidReg) ? $signed(score) : $signed(previousScore); // @[WatermanSystolic.scala 193:52 WatermanSystolic.scala 194:25 WatermanSystolic.scala 116:30]
  wire  _GEN_13 = ~(scoreValidReg | toNextPeValidReg) ? 1'h0 : stateReg; // @[WatermanSystolic.scala 193:52 WatermanSystolic.scala 195:20 WatermanSystolic.scala 113:25]
  wire [4:0] _GEN_14 = ~(scoreValidReg | toNextPeValidReg) ? _T_19 : stepReg; // @[WatermanSystolic.scala 193:52 WatermanSystolic.scala 196:19 WatermanSystolic.scala 121:24]
  wire [31:0] _GEN_15 = ~(scoreValidReg | toNextPeValidReg) ? $signed(score) : $signed(leftReg); // @[WatermanSystolic.scala 193:52 WatermanSystolic.scala 197:19 WatermanSystolic.scala 117:24]
  substituteElements substituteElements ( // @[WatermanSystolic.scala 123:34]
    .io_first(substituteElements_io_first),
    .io_second(substituteElements_io_second),
    .io_out(substituteElements_io_out)
  );
  assign io_fromPreviousPE_ready = ~stateReg; // @[WatermanSystolic.scala 132:39]
  assign io_out_valid = scoreValidReg; // @[WatermanSystolic.scala 134:16]
  assign io_out_bits_score = $signed(max) > 32'sh0 ? $signed(max) : $signed(32'sh0); // @[WatermanSystolic.scala 159:35 WatermanSystolic.scala 160:13 WatermanSystolic.scala 162:13]
  assign io_out_bits_x = stepReg; // @[WatermanSystolic.scala 137:17]
  assign io_out_bits_y = io_number[3:0]; // @[WatermanSystolic.scala 136:17]
  assign io_toNextPE_valid = toNextPeValidReg; // @[WatermanSystolic.scala 133:21]
  assign io_toNextPE_bits_upper = $signed(max) > 32'sh0 ? $signed(max) : $signed(32'sh0); // @[WatermanSystolic.scala 159:35 WatermanSystolic.scala 160:13 WatermanSystolic.scala 162:13]
  assign io_toNextPE_bits_diagonal = previousScore; // @[WatermanSystolic.scala 139:29]
  assign io_toNextPE_bits_columnElement = columnElementReg; // @[WatermanSystolic.scala 140:34]
  assign substituteElements_io_first = io_rowElement; // @[WatermanSystolic.scala 124:31]
  assign substituteElements_io_second = columnElementReg; // @[WatermanSystolic.scala 125:32]
  always @(posedge clock) begin
    if (reset) begin // @[WatermanSystolic.scala 113:25]
      stateReg <= 1'h0; // @[WatermanSystolic.scala 113:25]
    end else if (io_reset) begin // @[WatermanSystolic.scala 168:18]
      stateReg <= 1'h0; // @[WatermanSystolic.scala 172:14]
    end else if (_T_9) begin // @[Conditional.scala 40:58]
      stateReg <= _GEN_9;
    end else if (stateReg) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_13;
    end
    if (reset) begin // @[WatermanSystolic.scala 114:33]
      toNextPeValidReg <= 1'h0; // @[WatermanSystolic.scala 114:33]
    end else if (!(io_reset)) begin // @[WatermanSystolic.scala 168:18]
      if (_T_9) begin // @[Conditional.scala 40:58]
        toNextPeValidReg <= _GEN_8;
      end else if (stateReg) begin // @[Conditional.scala 39:67]
        toNextPeValidReg <= _GEN_11;
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 115:30]
      scoreValidReg <= 1'h0; // @[WatermanSystolic.scala 115:30]
    end else if (!(io_reset)) begin // @[WatermanSystolic.scala 168:18]
      if (_T_9) begin // @[Conditional.scala 40:58]
        scoreValidReg <= _GEN_7;
      end else if (stateReg) begin // @[Conditional.scala 39:67]
        scoreValidReg <= _GEN_10;
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 116:30]
      previousScore <= 32'sh0; // @[WatermanSystolic.scala 116:30]
    end else if (io_reset) begin // @[WatermanSystolic.scala 168:18]
      previousScore <= 32'sh0; // @[WatermanSystolic.scala 169:19]
    end else if (!(_T_9)) begin // @[Conditional.scala 40:58]
      if (stateReg) begin // @[Conditional.scala 39:67]
        previousScore <= _GEN_12;
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 117:24]
      leftReg <= 32'sh0; // @[WatermanSystolic.scala 117:24]
    end else if (io_reset) begin // @[WatermanSystolic.scala 168:18]
      leftReg <= 32'sh0; // @[WatermanSystolic.scala 170:13]
    end else if (!(_T_9)) begin // @[Conditional.scala 40:58]
      if (stateReg) begin // @[Conditional.scala 39:67]
        leftReg <= _GEN_15;
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 118:24]
      diagReg <= 32'sh0; // @[WatermanSystolic.scala 118:24]
    end else if (!(io_reset)) begin // @[WatermanSystolic.scala 168:18]
      if (_T_9) begin // @[Conditional.scala 40:58]
        if (io_fromPreviousPE_valid) begin // @[WatermanSystolic.scala 176:39]
          diagReg <= io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 178:19]
        end
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 119:25]
      upperReg <= 32'sh0; // @[WatermanSystolic.scala 119:25]
    end else if (!(io_reset)) begin // @[WatermanSystolic.scala 168:18]
      if (_T_9) begin // @[Conditional.scala 40:58]
        if (io_fromPreviousPE_valid) begin // @[WatermanSystolic.scala 176:39]
          upperReg <= io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 177:20]
        end
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 120:33]
      columnElementReg <= 2'h0; // @[WatermanSystolic.scala 120:33]
    end else if (!(io_reset)) begin // @[WatermanSystolic.scala 168:18]
      if (_T_9) begin // @[Conditional.scala 40:58]
        if (io_fromPreviousPE_valid) begin // @[WatermanSystolic.scala 176:39]
          columnElementReg <= io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 179:28]
        end
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 121:24]
      stepReg <= 5'h0; // @[WatermanSystolic.scala 121:24]
    end else if (io_reset) begin // @[WatermanSystolic.scala 168:18]
      stepReg <= 5'h0; // @[WatermanSystolic.scala 171:13]
    end else if (!(_T_9)) begin // @[Conditional.scala 40:58]
      if (stateReg) begin // @[Conditional.scala 39:67]
        stepReg <= _GEN_14;
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
  stateReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  toNextPeValidReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  scoreValidReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  previousScore = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  leftReg = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  diagReg = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  upperReg = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  columnElementReg = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  stepReg = _RAND_8[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module WatermanSystolic(
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
`endif // RANDOMIZE_REG_INIT
  wire  processingElementDecoupled_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_1_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_1_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_1_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_1_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_1_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_1_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_1_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_1_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_1_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_1_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_1_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_1_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_1_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_1_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_1_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_1_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_1_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_1_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_1_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_1_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_2_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_2_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_2_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_2_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_2_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_2_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_2_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_2_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_2_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_2_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_2_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_2_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_2_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_2_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_2_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_2_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_2_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_2_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_2_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_2_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_3_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_3_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_3_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_3_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_3_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_3_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_3_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_3_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_3_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_3_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_3_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_3_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_3_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_3_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_3_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_3_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_3_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_3_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_3_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_3_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_4_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_4_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_4_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_4_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_4_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_4_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_4_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_4_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_4_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_4_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_4_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_4_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_4_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_4_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_4_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_4_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_4_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_4_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_4_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_4_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_5_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_5_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_5_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_5_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_5_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_5_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_5_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_5_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_5_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_5_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_5_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_5_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_5_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_5_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_5_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_5_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_5_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_5_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_5_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_5_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_6_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_6_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_6_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_6_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_6_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_6_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_6_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_6_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_6_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_6_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_6_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_6_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_6_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_6_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_6_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_6_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_6_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_6_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_6_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_6_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_7_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_7_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_7_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_7_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_7_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_7_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_7_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_7_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_7_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_7_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_7_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_7_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_7_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_7_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_7_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_7_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_7_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_7_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_7_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_7_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_8_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_8_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_8_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_8_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_8_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_8_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_8_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_8_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_8_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_8_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_8_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_8_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_8_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_8_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_8_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_8_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_8_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_8_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_8_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_8_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_9_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_9_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_9_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_9_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_9_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_9_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_9_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_9_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_9_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_9_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_9_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_9_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_9_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_9_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_9_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_9_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_9_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_9_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_9_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_9_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_10_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_10_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_10_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_10_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_10_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_10_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_10_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_10_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_10_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_10_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_10_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_10_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_10_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_10_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_10_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_10_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_10_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_10_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_10_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_10_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_11_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_11_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_11_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_11_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_11_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_11_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_11_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_11_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_11_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_11_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_11_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_11_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_11_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_11_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_11_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_11_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_11_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_11_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_11_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_11_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_12_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_12_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_12_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_12_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_12_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_12_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_12_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_12_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_12_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_12_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_12_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_12_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_12_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_12_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_12_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_12_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_12_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_12_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_12_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_12_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_13_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_13_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_13_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_13_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_13_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_13_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_13_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_13_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_13_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_13_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_13_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_13_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_13_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_13_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_13_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_13_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_13_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_13_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_13_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_13_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_14_clock; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_14_reset; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_14_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_14_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_14_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_14_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_14_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_14_io_rowElement; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_14_io_reset; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_14_io_number; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_14_io_out_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_14_io_out_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_14_io_out_bits_score; // @[WatermanSystolic.scala 26:11]
  wire [4:0] processingElementDecoupled_14_io_out_bits_x; // @[WatermanSystolic.scala 26:11]
  wire [3:0] processingElementDecoupled_14_io_out_bits_y; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_14_io_toNextPE_ready; // @[WatermanSystolic.scala 26:11]
  wire  processingElementDecoupled_14_io_toNextPE_valid; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_14_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 26:11]
  wire [31:0] processingElementDecoupled_14_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 26:11]
  wire [1:0] processingElementDecoupled_14_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 26:11]
  reg [1:0] stateReg; // @[WatermanSystolic.scala 19:25]
  reg [4:0] stepReg; // @[WatermanSystolic.scala 20:24]
  reg [1:0] TReg_0; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_1; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_2; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_3; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_4; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_5; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_6; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_7; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_8; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_9; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_10; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_11; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_12; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_13; // @[WatermanSystolic.scala 21:21]
  reg [1:0] TReg_14; // @[WatermanSystolic.scala 21:21]
  reg [1:0] SReg_0; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_1; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_2; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_3; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_4; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_5; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_6; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_7; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_8; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_9; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_10; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_11; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_12; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_13; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_14; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_15; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_16; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_17; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_18; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_19; // @[WatermanSystolic.scala 22:21]
  reg [1:0] SReg_20; // @[WatermanSystolic.scala 22:21]
  reg  resetReg; // @[WatermanSystolic.scala 23:25]
  wire  _T_2 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_3 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [4:0] _T_5 = stepReg + 5'h1; // @[WatermanSystolic.scala 76:28]
  wire [1:0] _GEN_39 = stepReg == 5'h14 ? 2'h2 : stateReg; // @[WatermanSystolic.scala 77:49 WatermanSystolic.scala 78:20 WatermanSystolic.scala 19:25]
  wire  PEs_0_fromPreviousPE_ready = processingElementDecoupled_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  wire  _T_7 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [4:0] PEs_14_out_bits_x = processingElementDecoupled_14_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  wire  PEs_14_out_valid = processingElementDecoupled_14_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  wire  _GEN_62 = PEs_14_out_valid & PEs_14_out_bits_x == 5'he | resetReg; // @[WatermanSystolic.scala 83:104 WatermanSystolic.scala 84:18 WatermanSystolic.scala 23:25]
  wire [1:0] _GEN_63 = PEs_14_out_valid & PEs_14_out_bits_x == 5'he ? 2'h0 : stateReg; // @[WatermanSystolic.scala 83:104 WatermanSystolic.scala 85:18 WatermanSystolic.scala 19:25]
  processingElementDecoupled processingElementDecoupled ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_clock),
    .reset(processingElementDecoupled_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_io_rowElement),
    .io_reset(processingElementDecoupled_io_reset),
    .io_number(processingElementDecoupled_io_number),
    .io_out_ready(processingElementDecoupled_io_out_ready),
    .io_out_valid(processingElementDecoupled_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_1 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_1_clock),
    .reset(processingElementDecoupled_1_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_1_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_1_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_1_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_1_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_1_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_1_io_rowElement),
    .io_reset(processingElementDecoupled_1_io_reset),
    .io_number(processingElementDecoupled_1_io_number),
    .io_out_ready(processingElementDecoupled_1_io_out_ready),
    .io_out_valid(processingElementDecoupled_1_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_1_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_1_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_1_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_1_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_1_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_1_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_1_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_1_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_2 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_2_clock),
    .reset(processingElementDecoupled_2_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_2_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_2_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_2_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_2_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_2_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_2_io_rowElement),
    .io_reset(processingElementDecoupled_2_io_reset),
    .io_number(processingElementDecoupled_2_io_number),
    .io_out_ready(processingElementDecoupled_2_io_out_ready),
    .io_out_valid(processingElementDecoupled_2_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_2_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_2_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_2_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_2_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_2_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_2_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_2_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_2_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_3 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_3_clock),
    .reset(processingElementDecoupled_3_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_3_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_3_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_3_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_3_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_3_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_3_io_rowElement),
    .io_reset(processingElementDecoupled_3_io_reset),
    .io_number(processingElementDecoupled_3_io_number),
    .io_out_ready(processingElementDecoupled_3_io_out_ready),
    .io_out_valid(processingElementDecoupled_3_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_3_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_3_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_3_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_3_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_3_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_3_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_3_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_3_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_4 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_4_clock),
    .reset(processingElementDecoupled_4_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_4_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_4_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_4_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_4_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_4_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_4_io_rowElement),
    .io_reset(processingElementDecoupled_4_io_reset),
    .io_number(processingElementDecoupled_4_io_number),
    .io_out_ready(processingElementDecoupled_4_io_out_ready),
    .io_out_valid(processingElementDecoupled_4_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_4_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_4_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_4_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_4_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_4_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_4_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_4_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_4_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_5 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_5_clock),
    .reset(processingElementDecoupled_5_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_5_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_5_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_5_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_5_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_5_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_5_io_rowElement),
    .io_reset(processingElementDecoupled_5_io_reset),
    .io_number(processingElementDecoupled_5_io_number),
    .io_out_ready(processingElementDecoupled_5_io_out_ready),
    .io_out_valid(processingElementDecoupled_5_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_5_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_5_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_5_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_5_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_5_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_5_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_5_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_5_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_6 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_6_clock),
    .reset(processingElementDecoupled_6_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_6_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_6_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_6_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_6_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_6_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_6_io_rowElement),
    .io_reset(processingElementDecoupled_6_io_reset),
    .io_number(processingElementDecoupled_6_io_number),
    .io_out_ready(processingElementDecoupled_6_io_out_ready),
    .io_out_valid(processingElementDecoupled_6_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_6_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_6_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_6_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_6_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_6_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_6_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_6_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_6_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_7 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_7_clock),
    .reset(processingElementDecoupled_7_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_7_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_7_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_7_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_7_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_7_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_7_io_rowElement),
    .io_reset(processingElementDecoupled_7_io_reset),
    .io_number(processingElementDecoupled_7_io_number),
    .io_out_ready(processingElementDecoupled_7_io_out_ready),
    .io_out_valid(processingElementDecoupled_7_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_7_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_7_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_7_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_7_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_7_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_7_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_7_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_7_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_8 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_8_clock),
    .reset(processingElementDecoupled_8_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_8_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_8_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_8_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_8_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_8_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_8_io_rowElement),
    .io_reset(processingElementDecoupled_8_io_reset),
    .io_number(processingElementDecoupled_8_io_number),
    .io_out_ready(processingElementDecoupled_8_io_out_ready),
    .io_out_valid(processingElementDecoupled_8_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_8_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_8_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_8_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_8_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_8_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_8_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_8_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_8_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_9 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_9_clock),
    .reset(processingElementDecoupled_9_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_9_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_9_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_9_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_9_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_9_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_9_io_rowElement),
    .io_reset(processingElementDecoupled_9_io_reset),
    .io_number(processingElementDecoupled_9_io_number),
    .io_out_ready(processingElementDecoupled_9_io_out_ready),
    .io_out_valid(processingElementDecoupled_9_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_9_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_9_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_9_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_9_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_9_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_9_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_9_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_9_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_10 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_10_clock),
    .reset(processingElementDecoupled_10_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_10_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_10_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_10_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_10_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_10_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_10_io_rowElement),
    .io_reset(processingElementDecoupled_10_io_reset),
    .io_number(processingElementDecoupled_10_io_number),
    .io_out_ready(processingElementDecoupled_10_io_out_ready),
    .io_out_valid(processingElementDecoupled_10_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_10_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_10_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_10_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_10_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_10_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_10_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_10_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_10_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_11 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_11_clock),
    .reset(processingElementDecoupled_11_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_11_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_11_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_11_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_11_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_11_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_11_io_rowElement),
    .io_reset(processingElementDecoupled_11_io_reset),
    .io_number(processingElementDecoupled_11_io_number),
    .io_out_ready(processingElementDecoupled_11_io_out_ready),
    .io_out_valid(processingElementDecoupled_11_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_11_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_11_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_11_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_11_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_11_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_11_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_11_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_11_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_12 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_12_clock),
    .reset(processingElementDecoupled_12_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_12_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_12_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_12_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_12_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_12_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_12_io_rowElement),
    .io_reset(processingElementDecoupled_12_io_reset),
    .io_number(processingElementDecoupled_12_io_number),
    .io_out_ready(processingElementDecoupled_12_io_out_ready),
    .io_out_valid(processingElementDecoupled_12_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_12_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_12_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_12_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_12_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_12_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_12_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_12_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_12_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_13 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_13_clock),
    .reset(processingElementDecoupled_13_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_13_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_13_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_13_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_13_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_13_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_13_io_rowElement),
    .io_reset(processingElementDecoupled_13_io_reset),
    .io_number(processingElementDecoupled_13_io_number),
    .io_out_ready(processingElementDecoupled_13_io_out_ready),
    .io_out_valid(processingElementDecoupled_13_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_13_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_13_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_13_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_13_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_13_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_13_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_13_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_13_io_toNextPE_bits_columnElement)
  );
  processingElementDecoupled processingElementDecoupled_14 ( // @[WatermanSystolic.scala 26:11]
    .clock(processingElementDecoupled_14_clock),
    .reset(processingElementDecoupled_14_reset),
    .io_fromPreviousPE_ready(processingElementDecoupled_14_io_fromPreviousPE_ready),
    .io_fromPreviousPE_valid(processingElementDecoupled_14_io_fromPreviousPE_valid),
    .io_fromPreviousPE_bits_upper(processingElementDecoupled_14_io_fromPreviousPE_bits_upper),
    .io_fromPreviousPE_bits_diagonal(processingElementDecoupled_14_io_fromPreviousPE_bits_diagonal),
    .io_fromPreviousPE_bits_columnElement(processingElementDecoupled_14_io_fromPreviousPE_bits_columnElement),
    .io_rowElement(processingElementDecoupled_14_io_rowElement),
    .io_reset(processingElementDecoupled_14_io_reset),
    .io_number(processingElementDecoupled_14_io_number),
    .io_out_ready(processingElementDecoupled_14_io_out_ready),
    .io_out_valid(processingElementDecoupled_14_io_out_valid),
    .io_out_bits_score(processingElementDecoupled_14_io_out_bits_score),
    .io_out_bits_x(processingElementDecoupled_14_io_out_bits_x),
    .io_out_bits_y(processingElementDecoupled_14_io_out_bits_y),
    .io_toNextPE_ready(processingElementDecoupled_14_io_toNextPE_ready),
    .io_toNextPE_valid(processingElementDecoupled_14_io_toNextPE_valid),
    .io_toNextPE_bits_upper(processingElementDecoupled_14_io_toNextPE_bits_upper),
    .io_toNextPE_bits_diagonal(processingElementDecoupled_14_io_toNextPE_bits_diagonal),
    .io_toNextPE_bits_columnElement(processingElementDecoupled_14_io_toNextPE_bits_columnElement)
  );
  assign io_in_ready = stateReg == 2'h0; // @[WatermanSystolic.scala 55:27]
  assign io_out_0_valid = processingElementDecoupled_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_0_bits_score = processingElementDecoupled_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_0_bits_x = processingElementDecoupled_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_0_bits_y = processingElementDecoupled_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_1_valid = processingElementDecoupled_1_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_1_bits_score = processingElementDecoupled_1_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_1_bits_x = processingElementDecoupled_1_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_1_bits_y = processingElementDecoupled_1_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_2_valid = processingElementDecoupled_2_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_2_bits_score = processingElementDecoupled_2_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_2_bits_x = processingElementDecoupled_2_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_2_bits_y = processingElementDecoupled_2_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_3_valid = processingElementDecoupled_3_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_3_bits_score = processingElementDecoupled_3_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_3_bits_x = processingElementDecoupled_3_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_3_bits_y = processingElementDecoupled_3_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_4_valid = processingElementDecoupled_4_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_4_bits_score = processingElementDecoupled_4_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_4_bits_x = processingElementDecoupled_4_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_4_bits_y = processingElementDecoupled_4_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_5_valid = processingElementDecoupled_5_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_5_bits_score = processingElementDecoupled_5_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_5_bits_x = processingElementDecoupled_5_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_5_bits_y = processingElementDecoupled_5_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_6_valid = processingElementDecoupled_6_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_6_bits_score = processingElementDecoupled_6_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_6_bits_x = processingElementDecoupled_6_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_6_bits_y = processingElementDecoupled_6_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_7_valid = processingElementDecoupled_7_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_7_bits_score = processingElementDecoupled_7_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_7_bits_x = processingElementDecoupled_7_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_7_bits_y = processingElementDecoupled_7_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_8_valid = processingElementDecoupled_8_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_8_bits_score = processingElementDecoupled_8_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_8_bits_x = processingElementDecoupled_8_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_8_bits_y = processingElementDecoupled_8_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_9_valid = processingElementDecoupled_9_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_9_bits_score = processingElementDecoupled_9_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_9_bits_x = processingElementDecoupled_9_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_9_bits_y = processingElementDecoupled_9_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_10_valid = processingElementDecoupled_10_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_10_bits_score = processingElementDecoupled_10_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_10_bits_x = processingElementDecoupled_10_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_10_bits_y = processingElementDecoupled_10_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_11_valid = processingElementDecoupled_11_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_11_bits_score = processingElementDecoupled_11_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_11_bits_x = processingElementDecoupled_11_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_11_bits_y = processingElementDecoupled_11_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_12_valid = processingElementDecoupled_12_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_12_bits_score = processingElementDecoupled_12_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_12_bits_x = processingElementDecoupled_12_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_12_bits_y = processingElementDecoupled_12_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_13_valid = processingElementDecoupled_13_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_13_bits_score = processingElementDecoupled_13_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_13_bits_x = processingElementDecoupled_13_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_13_bits_y = processingElementDecoupled_13_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_14_valid = processingElementDecoupled_14_io_out_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_14_bits_score = processingElementDecoupled_14_io_out_bits_score; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_14_bits_x = processingElementDecoupled_14_io_out_bits_x; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign io_out_14_bits_y = processingElementDecoupled_14_io_out_bits_y; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_clock = clock;
  assign processingElementDecoupled_reset = reset;
  assign processingElementDecoupled_io_fromPreviousPE_valid = stateReg == 2'h1; // @[WatermanSystolic.scala 32:47]
  assign processingElementDecoupled_io_fromPreviousPE_bits_upper = 32'sh0; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 34:40]
  assign processingElementDecoupled_io_fromPreviousPE_bits_diagonal = 32'sh0; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 35:43]
  assign processingElementDecoupled_io_fromPreviousPE_bits_columnElement = SReg_0; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 33:48]
  assign processingElementDecoupled_io_rowElement = TReg_0; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_io_number = 32'h0; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_io_out_ready = io_out_0_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_io_toNextPE_ready = processingElementDecoupled_1_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_1_clock = clock;
  assign processingElementDecoupled_1_reset = reset;
  assign processingElementDecoupled_1_io_fromPreviousPE_valid = processingElementDecoupled_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_1_io_fromPreviousPE_bits_upper = processingElementDecoupled_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_1_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_1_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_1_io_rowElement = TReg_1; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_1_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_1_io_number = 32'h1; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_1_io_out_ready = io_out_1_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_1_io_toNextPE_ready = processingElementDecoupled_2_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_2_clock = clock;
  assign processingElementDecoupled_2_reset = reset;
  assign processingElementDecoupled_2_io_fromPreviousPE_valid = processingElementDecoupled_1_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_2_io_fromPreviousPE_bits_upper = processingElementDecoupled_1_io_toNextPE_bits_upper
    ; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_2_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_1_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_2_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_1_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_2_io_rowElement = TReg_2; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_2_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_2_io_number = 32'h2; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_2_io_out_ready = io_out_2_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_2_io_toNextPE_ready = processingElementDecoupled_3_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_3_clock = clock;
  assign processingElementDecoupled_3_reset = reset;
  assign processingElementDecoupled_3_io_fromPreviousPE_valid = processingElementDecoupled_2_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_3_io_fromPreviousPE_bits_upper = processingElementDecoupled_2_io_toNextPE_bits_upper
    ; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_3_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_2_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_3_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_2_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_3_io_rowElement = TReg_3; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_3_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_3_io_number = 32'h3; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_3_io_out_ready = io_out_3_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_3_io_toNextPE_ready = processingElementDecoupled_4_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_4_clock = clock;
  assign processingElementDecoupled_4_reset = reset;
  assign processingElementDecoupled_4_io_fromPreviousPE_valid = processingElementDecoupled_3_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_4_io_fromPreviousPE_bits_upper = processingElementDecoupled_3_io_toNextPE_bits_upper
    ; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_4_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_3_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_4_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_3_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_4_io_rowElement = TReg_4; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_4_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_4_io_number = 32'h4; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_4_io_out_ready = io_out_4_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_4_io_toNextPE_ready = processingElementDecoupled_5_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_5_clock = clock;
  assign processingElementDecoupled_5_reset = reset;
  assign processingElementDecoupled_5_io_fromPreviousPE_valid = processingElementDecoupled_4_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_5_io_fromPreviousPE_bits_upper = processingElementDecoupled_4_io_toNextPE_bits_upper
    ; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_5_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_4_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_5_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_4_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_5_io_rowElement = TReg_5; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_5_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_5_io_number = 32'h5; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_5_io_out_ready = io_out_5_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_5_io_toNextPE_ready = processingElementDecoupled_6_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_6_clock = clock;
  assign processingElementDecoupled_6_reset = reset;
  assign processingElementDecoupled_6_io_fromPreviousPE_valid = processingElementDecoupled_5_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_6_io_fromPreviousPE_bits_upper = processingElementDecoupled_5_io_toNextPE_bits_upper
    ; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_6_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_5_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_6_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_5_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_6_io_rowElement = TReg_6; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_6_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_6_io_number = 32'h6; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_6_io_out_ready = io_out_6_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_6_io_toNextPE_ready = processingElementDecoupled_7_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_7_clock = clock;
  assign processingElementDecoupled_7_reset = reset;
  assign processingElementDecoupled_7_io_fromPreviousPE_valid = processingElementDecoupled_6_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_7_io_fromPreviousPE_bits_upper = processingElementDecoupled_6_io_toNextPE_bits_upper
    ; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_7_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_6_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_7_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_6_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_7_io_rowElement = TReg_7; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_7_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_7_io_number = 32'h7; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_7_io_out_ready = io_out_7_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_7_io_toNextPE_ready = processingElementDecoupled_8_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_8_clock = clock;
  assign processingElementDecoupled_8_reset = reset;
  assign processingElementDecoupled_8_io_fromPreviousPE_valid = processingElementDecoupled_7_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_8_io_fromPreviousPE_bits_upper = processingElementDecoupled_7_io_toNextPE_bits_upper
    ; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_8_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_7_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_8_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_7_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_8_io_rowElement = TReg_8; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_8_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_8_io_number = 32'h8; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_8_io_out_ready = io_out_8_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_8_io_toNextPE_ready = processingElementDecoupled_9_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_9_clock = clock;
  assign processingElementDecoupled_9_reset = reset;
  assign processingElementDecoupled_9_io_fromPreviousPE_valid = processingElementDecoupled_8_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_9_io_fromPreviousPE_bits_upper = processingElementDecoupled_8_io_toNextPE_bits_upper
    ; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_9_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_8_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_9_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_8_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_9_io_rowElement = TReg_9; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_9_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_9_io_number = 32'h9; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_9_io_out_ready = io_out_9_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_9_io_toNextPE_ready = processingElementDecoupled_10_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_10_clock = clock;
  assign processingElementDecoupled_10_reset = reset;
  assign processingElementDecoupled_10_io_fromPreviousPE_valid = processingElementDecoupled_9_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_10_io_fromPreviousPE_bits_upper =
    processingElementDecoupled_9_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_10_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_9_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_10_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_9_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_10_io_rowElement = TReg_10; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_10_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_10_io_number = 32'ha; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_10_io_out_ready = io_out_10_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_10_io_toNextPE_ready = processingElementDecoupled_11_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_11_clock = clock;
  assign processingElementDecoupled_11_reset = reset;
  assign processingElementDecoupled_11_io_fromPreviousPE_valid = processingElementDecoupled_10_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_11_io_fromPreviousPE_bits_upper =
    processingElementDecoupled_10_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_11_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_10_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_11_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_10_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_11_io_rowElement = TReg_11; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_11_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_11_io_number = 32'hb; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_11_io_out_ready = io_out_11_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_11_io_toNextPE_ready = processingElementDecoupled_12_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_12_clock = clock;
  assign processingElementDecoupled_12_reset = reset;
  assign processingElementDecoupled_12_io_fromPreviousPE_valid = processingElementDecoupled_11_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_12_io_fromPreviousPE_bits_upper =
    processingElementDecoupled_11_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_12_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_11_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_12_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_11_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_12_io_rowElement = TReg_12; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_12_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_12_io_number = 32'hc; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_12_io_out_ready = io_out_12_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_12_io_toNextPE_ready = processingElementDecoupled_13_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_13_clock = clock;
  assign processingElementDecoupled_13_reset = reset;
  assign processingElementDecoupled_13_io_fromPreviousPE_valid = processingElementDecoupled_12_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_13_io_fromPreviousPE_bits_upper =
    processingElementDecoupled_12_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_13_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_12_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_13_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_12_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_13_io_rowElement = TReg_13; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_13_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_13_io_number = 32'hd; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_13_io_out_ready = io_out_13_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_13_io_toNextPE_ready = processingElementDecoupled_14_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_14_clock = clock;
  assign processingElementDecoupled_14_reset = reset;
  assign processingElementDecoupled_14_io_fromPreviousPE_valid = processingElementDecoupled_13_io_toNextPE_valid; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_14_io_fromPreviousPE_bits_upper =
    processingElementDecoupled_13_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_14_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_13_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_14_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_13_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 25:20]
  assign processingElementDecoupled_14_io_rowElement = TReg_14; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 45:23]
  assign processingElementDecoupled_14_io_reset = resetReg; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 46:18]
  assign processingElementDecoupled_14_io_number = 32'he; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 44:19]
  assign processingElementDecoupled_14_io_out_ready = io_out_14_ready; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 52:22]
  assign processingElementDecoupled_14_io_toNextPE_ready = 1'h1; // @[WatermanSystolic.scala 25:20 WatermanSystolic.scala 29:38]
  always @(posedge clock) begin
    if (reset) begin // @[WatermanSystolic.scala 19:25]
      stateReg <= 2'h0; // @[WatermanSystolic.scala 19:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        stateReg <= 2'h1; // @[WatermanSystolic.scala 68:18]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        stateReg <= _GEN_39;
      end
    end else if (_T_7) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_63;
    end
    if (reset) begin // @[WatermanSystolic.scala 20:24]
      stepReg <= 5'h0; // @[WatermanSystolic.scala 20:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        stepReg <= 5'h0; // @[WatermanSystolic.scala 67:17]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        stepReg <= _T_5; // @[WatermanSystolic.scala 76:17]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_0 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_0 <= io_in_bits_T_0; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_1 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_1 <= io_in_bits_T_1; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_2 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_2 <= io_in_bits_T_2; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_3 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_3 <= io_in_bits_T_3; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_4 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_4 <= io_in_bits_T_4; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_5 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_5 <= io_in_bits_T_5; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_6 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_6 <= io_in_bits_T_6; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_7 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_7 <= io_in_bits_T_7; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_8 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_8 <= io_in_bits_T_8; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_9 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_9 <= io_in_bits_T_9; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_10 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_10 <= io_in_bits_T_10; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_11 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_11 <= io_in_bits_T_11; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_12 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_12 <= io_in_bits_T_12; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_13 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_13 <= io_in_bits_T_13; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      TReg_14 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        TReg_14 <= io_in_bits_T_14; // @[WatermanSystolic.scala 64:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_0 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_0 <= io_in_bits_S_0; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_0 <= SReg_1; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_1 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_1 <= io_in_bits_S_1; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_1 <= SReg_2; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_2 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_2 <= io_in_bits_S_2; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_2 <= SReg_3; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_3 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_3 <= io_in_bits_S_3; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_3 <= SReg_4; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_4 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_4 <= io_in_bits_S_4; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_4 <= SReg_5; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_5 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_5 <= io_in_bits_S_5; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_5 <= SReg_6; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_6 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_6 <= io_in_bits_S_6; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_6 <= SReg_7; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_7 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_7 <= io_in_bits_S_7; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_7 <= SReg_8; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_8 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_8 <= io_in_bits_S_8; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_8 <= SReg_9; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_9 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_9 <= io_in_bits_S_9; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_9 <= SReg_10; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_10 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_10 <= io_in_bits_S_10; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_10 <= SReg_11; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_11 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_11 <= io_in_bits_S_11; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_11 <= SReg_12; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_12 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_12 <= io_in_bits_S_12; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_12 <= SReg_13; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_13 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_13 <= io_in_bits_S_13; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_13 <= SReg_14; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_14 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_14 <= io_in_bits_S_14; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_14 <= SReg_15; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_15 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_15 <= io_in_bits_S_15; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_15 <= SReg_16; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_16 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_16 <= io_in_bits_S_16; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_16 <= SReg_17; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_17 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_17 <= io_in_bits_S_17; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_17 <= SReg_18; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_18 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_18 <= io_in_bits_S_18; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_18 <= SReg_19; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_19 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_19 <= io_in_bits_S_19; // @[WatermanSystolic.scala 61:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 72:41]
        SReg_19 <= SReg_20; // @[WatermanSystolic.scala 74:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:21]
      SReg_20 <= 2'h0; // @[WatermanSystolic.scala 22:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        SReg_20 <= io_in_bits_S_20; // @[WatermanSystolic.scala 61:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 23:25]
      resetReg <= 1'h0; // @[WatermanSystolic.scala 23:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 59:25]
        resetReg <= 1'h0; // @[WatermanSystolic.scala 66:18]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_7) begin // @[Conditional.scala 39:67]
        resetReg <= _GEN_62;
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
  stateReg = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  stepReg = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  TReg_0 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  TReg_1 = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  TReg_2 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  TReg_3 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  TReg_4 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  TReg_5 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  TReg_6 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  TReg_7 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  TReg_8 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  TReg_9 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  TReg_10 = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  TReg_11 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  TReg_12 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  TReg_13 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  TReg_14 = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  SReg_0 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  SReg_1 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  SReg_2 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  SReg_3 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  SReg_4 = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  SReg_5 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  SReg_6 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  SReg_7 = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  SReg_8 = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  SReg_9 = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  SReg_10 = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  SReg_11 = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  SReg_12 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  SReg_13 = _RAND_30[1:0];
  _RAND_31 = {1{`RANDOM}};
  SReg_14 = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  SReg_15 = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  SReg_16 = _RAND_33[1:0];
  _RAND_34 = {1{`RANDOM}};
  SReg_17 = _RAND_34[1:0];
  _RAND_35 = {1{`RANDOM}};
  SReg_18 = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  SReg_19 = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  SReg_20 = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  resetReg = _RAND_38[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
