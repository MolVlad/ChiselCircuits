module substituteElements(
  input  [1:0]  io_first,
  input  [1:0]  io_second,
  output [31:0] io_out
);
  wire [1:0] _GEN_0 = io_first == io_second ? $signed(2'sh1) : $signed(-2'sh1); // @[DNA.scala 28:33 DNA.scala 29:12 DNA.scala 31:12]
  assign io_out = {{30{_GEN_0[1]}},_GEN_0}; // @[DNA.scala 28:33 DNA.scala 29:12 DNA.scala 31:12]
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
  output [1:0]  io_out_bits_x,
  output [1:0]  io_out_bits_y,
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
  wire [1:0] substituteElements_io_first; // @[WatermanSystolic.scala 122:34]
  wire [1:0] substituteElements_io_second; // @[WatermanSystolic.scala 122:34]
  wire [31:0] substituteElements_io_out; // @[WatermanSystolic.scala 122:34]
  reg  stateReg; // @[WatermanSystolic.scala 112:25]
  reg  toNextPeValidReg; // @[WatermanSystolic.scala 113:33]
  reg  scoreValidReg; // @[WatermanSystolic.scala 114:30]
  reg [31:0] previousScore; // @[WatermanSystolic.scala 115:30]
  reg [31:0] leftReg; // @[WatermanSystolic.scala 116:24]
  reg [31:0] diagReg; // @[WatermanSystolic.scala 117:24]
  reg [31:0] upperReg; // @[WatermanSystolic.scala 118:25]
  reg [1:0] columnElementReg; // @[WatermanSystolic.scala 119:33]
  reg [1:0] stepReg; // @[WatermanSystolic.scala 120:24]
  wire [31:0] diag = $signed(diagReg) + $signed(substituteElements_io_out); // @[WatermanSystolic.scala 127:19]
  wire [31:0] upper = $signed(upperReg) - 32'sh2; // @[WatermanSystolic.scala 128:21]
  wire [31:0] left = $signed(leftReg) - 32'sh2; // @[WatermanSystolic.scala 129:19]
  wire  _T_9 = ~stateReg; // @[WatermanSystolic.scala 131:39]
  wire [31:0] diagOrUpper = $signed(diag) > $signed(upper) ? $signed(diag) : $signed(upper); // @[WatermanSystolic.scala 141:22 WatermanSystolic.scala 142:17 WatermanSystolic.scala 144:17]
  wire [31:0] diagOrLeft = $signed(diag) > $signed(left) ? $signed(diag) : $signed(left); // @[WatermanSystolic.scala 146:21 WatermanSystolic.scala 147:16 WatermanSystolic.scala 149:16]
  wire [31:0] max = $signed(diagOrLeft) > $signed(diagOrUpper) ? $signed(diagOrLeft) : $signed(diagOrUpper); // @[WatermanSystolic.scala 151:34 WatermanSystolic.scala 152:9 WatermanSystolic.scala 154:9]
  wire [31:0] score = $signed(max) > 32'sh0 ? $signed(max) : $signed(32'sh0); // @[WatermanSystolic.scala 158:35 WatermanSystolic.scala 159:13 WatermanSystolic.scala 161:13]
  wire  _GEN_7 = io_fromPreviousPE_valid | scoreValidReg; // @[WatermanSystolic.scala 175:39 WatermanSystolic.scala 180:25 WatermanSystolic.scala 114:30]
  wire  _GEN_8 = io_fromPreviousPE_valid | toNextPeValidReg; // @[WatermanSystolic.scala 175:39 WatermanSystolic.scala 181:28 WatermanSystolic.scala 113:33]
  wire  _GEN_9 = io_fromPreviousPE_valid | stateReg; // @[WatermanSystolic.scala 175:39 WatermanSystolic.scala 182:20 WatermanSystolic.scala 112:25]
  wire  _GEN_10 = io_out_ready ? 1'h0 : scoreValidReg; // @[WatermanSystolic.scala 186:28 WatermanSystolic.scala 187:25 WatermanSystolic.scala 114:30]
  wire  _GEN_11 = io_toNextPE_ready ? 1'h0 : toNextPeValidReg; // @[WatermanSystolic.scala 189:33 WatermanSystolic.scala 190:28 WatermanSystolic.scala 113:33]
  wire [1:0] _T_19 = stepReg + 2'h1; // @[WatermanSystolic.scala 195:30]
  wire [31:0] _GEN_12 = ~(scoreValidReg | toNextPeValidReg) ? $signed(score) : $signed(previousScore); // @[WatermanSystolic.scala 192:52 WatermanSystolic.scala 193:25 WatermanSystolic.scala 115:30]
  wire  _GEN_13 = ~(scoreValidReg | toNextPeValidReg) ? 1'h0 : stateReg; // @[WatermanSystolic.scala 192:52 WatermanSystolic.scala 194:20 WatermanSystolic.scala 112:25]
  wire [1:0] _GEN_14 = ~(scoreValidReg | toNextPeValidReg) ? _T_19 : stepReg; // @[WatermanSystolic.scala 192:52 WatermanSystolic.scala 195:19 WatermanSystolic.scala 120:24]
  wire [31:0] _GEN_15 = ~(scoreValidReg | toNextPeValidReg) ? $signed(score) : $signed(leftReg); // @[WatermanSystolic.scala 192:52 WatermanSystolic.scala 196:19 WatermanSystolic.scala 116:24]
  substituteElements substituteElements ( // @[WatermanSystolic.scala 122:34]
    .io_first(substituteElements_io_first),
    .io_second(substituteElements_io_second),
    .io_out(substituteElements_io_out)
  );
  assign io_fromPreviousPE_ready = ~stateReg; // @[WatermanSystolic.scala 131:39]
  assign io_out_valid = scoreValidReg; // @[WatermanSystolic.scala 133:16]
  assign io_out_bits_score = $signed(max) > 32'sh0 ? $signed(max) : $signed(32'sh0); // @[WatermanSystolic.scala 158:35 WatermanSystolic.scala 159:13 WatermanSystolic.scala 161:13]
  assign io_out_bits_x = stepReg; // @[WatermanSystolic.scala 136:17]
  assign io_out_bits_y = io_number[1:0]; // @[WatermanSystolic.scala 135:17]
  assign io_toNextPE_valid = toNextPeValidReg; // @[WatermanSystolic.scala 132:21]
  assign io_toNextPE_bits_upper = $signed(max) > 32'sh0 ? $signed(max) : $signed(32'sh0); // @[WatermanSystolic.scala 158:35 WatermanSystolic.scala 159:13 WatermanSystolic.scala 161:13]
  assign io_toNextPE_bits_diagonal = previousScore; // @[WatermanSystolic.scala 138:29]
  assign io_toNextPE_bits_columnElement = columnElementReg; // @[WatermanSystolic.scala 139:34]
  assign substituteElements_io_first = io_rowElement; // @[WatermanSystolic.scala 123:31]
  assign substituteElements_io_second = columnElementReg; // @[WatermanSystolic.scala 124:32]
  always @(posedge clock) begin
    if (reset) begin // @[WatermanSystolic.scala 112:25]
      stateReg <= 1'h0; // @[WatermanSystolic.scala 112:25]
    end else if (io_reset) begin // @[WatermanSystolic.scala 167:18]
      stateReg <= 1'h0; // @[WatermanSystolic.scala 171:14]
    end else if (_T_9) begin // @[Conditional.scala 40:58]
      stateReg <= _GEN_9;
    end else if (stateReg) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_13;
    end
    if (reset) begin // @[WatermanSystolic.scala 113:33]
      toNextPeValidReg <= 1'h0; // @[WatermanSystolic.scala 113:33]
    end else if (!(io_reset)) begin // @[WatermanSystolic.scala 167:18]
      if (_T_9) begin // @[Conditional.scala 40:58]
        toNextPeValidReg <= _GEN_8;
      end else if (stateReg) begin // @[Conditional.scala 39:67]
        toNextPeValidReg <= _GEN_11;
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 114:30]
      scoreValidReg <= 1'h0; // @[WatermanSystolic.scala 114:30]
    end else if (!(io_reset)) begin // @[WatermanSystolic.scala 167:18]
      if (_T_9) begin // @[Conditional.scala 40:58]
        scoreValidReg <= _GEN_7;
      end else if (stateReg) begin // @[Conditional.scala 39:67]
        scoreValidReg <= _GEN_10;
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 115:30]
      previousScore <= 32'sh0; // @[WatermanSystolic.scala 115:30]
    end else if (io_reset) begin // @[WatermanSystolic.scala 167:18]
      previousScore <= 32'sh0; // @[WatermanSystolic.scala 168:19]
    end else if (!(_T_9)) begin // @[Conditional.scala 40:58]
      if (stateReg) begin // @[Conditional.scala 39:67]
        previousScore <= _GEN_12;
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 116:24]
      leftReg <= 32'sh0; // @[WatermanSystolic.scala 116:24]
    end else if (io_reset) begin // @[WatermanSystolic.scala 167:18]
      leftReg <= 32'sh0; // @[WatermanSystolic.scala 169:13]
    end else if (!(_T_9)) begin // @[Conditional.scala 40:58]
      if (stateReg) begin // @[Conditional.scala 39:67]
        leftReg <= _GEN_15;
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 117:24]
      diagReg <= 32'sh0; // @[WatermanSystolic.scala 117:24]
    end else if (!(io_reset)) begin // @[WatermanSystolic.scala 167:18]
      if (_T_9) begin // @[Conditional.scala 40:58]
        if (io_fromPreviousPE_valid) begin // @[WatermanSystolic.scala 175:39]
          diagReg <= io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 177:19]
        end
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 118:25]
      upperReg <= 32'sh0; // @[WatermanSystolic.scala 118:25]
    end else if (!(io_reset)) begin // @[WatermanSystolic.scala 167:18]
      if (_T_9) begin // @[Conditional.scala 40:58]
        if (io_fromPreviousPE_valid) begin // @[WatermanSystolic.scala 175:39]
          upperReg <= io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 176:20]
        end
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 119:33]
      columnElementReg <= 2'h0; // @[WatermanSystolic.scala 119:33]
    end else if (!(io_reset)) begin // @[WatermanSystolic.scala 167:18]
      if (_T_9) begin // @[Conditional.scala 40:58]
        if (io_fromPreviousPE_valid) begin // @[WatermanSystolic.scala 175:39]
          columnElementReg <= io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 178:28]
        end
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 120:24]
      stepReg <= 2'h0; // @[WatermanSystolic.scala 120:24]
    end else if (io_reset) begin // @[WatermanSystolic.scala 167:18]
      stepReg <= 2'h0; // @[WatermanSystolic.scala 170:13]
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
  stepReg = _RAND_8[1:0];
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
  input  [1:0]  io_in_bits_T_0,
  input  [1:0]  io_in_bits_T_1,
  input  [1:0]  io_in_bits_T_2,
  input  [1:0]  io_in_bits_T_3,
  input         io_out_0_ready,
  output        io_out_0_valid,
  output [31:0] io_out_0_bits_score,
  output [1:0]  io_out_0_bits_x,
  output [1:0]  io_out_0_bits_y,
  input         io_out_1_ready,
  output        io_out_1_valid,
  output [31:0] io_out_1_bits_score,
  output [1:0]  io_out_1_bits_x,
  output [1:0]  io_out_1_bits_y,
  input         io_out_2_ready,
  output        io_out_2_valid,
  output [31:0] io_out_2_bits_score,
  output [1:0]  io_out_2_bits_x,
  output [1:0]  io_out_2_bits_y,
  input         io_out_3_ready,
  output        io_out_3_valid,
  output [31:0] io_out_3_bits_score,
  output [1:0]  io_out_3_bits_x,
  output [1:0]  io_out_3_bits_y
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
`endif // RANDOMIZE_REG_INIT
  wire  processingElementDecoupled_clock; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_reset; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_io_rowElement; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_io_reset; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_io_number; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_io_out_ready; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_io_out_valid; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_io_out_bits_score; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_io_out_bits_x; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_io_out_bits_y; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_io_toNextPE_ready; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_io_toNextPE_valid; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_1_clock; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_1_reset; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_1_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_1_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_1_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_1_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_1_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_1_io_rowElement; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_1_io_reset; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_1_io_number; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_1_io_out_ready; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_1_io_out_valid; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_1_io_out_bits_score; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_1_io_out_bits_x; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_1_io_out_bits_y; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_1_io_toNextPE_ready; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_1_io_toNextPE_valid; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_1_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_1_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_1_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_2_clock; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_2_reset; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_2_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_2_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_2_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_2_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_2_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_2_io_rowElement; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_2_io_reset; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_2_io_number; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_2_io_out_ready; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_2_io_out_valid; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_2_io_out_bits_score; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_2_io_out_bits_x; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_2_io_out_bits_y; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_2_io_toNextPE_ready; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_2_io_toNextPE_valid; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_2_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_2_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_2_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_3_clock; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_3_reset; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_3_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_3_io_fromPreviousPE_valid; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_3_io_fromPreviousPE_bits_upper; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_3_io_fromPreviousPE_bits_diagonal; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_3_io_fromPreviousPE_bits_columnElement; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_3_io_rowElement; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_3_io_reset; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_3_io_number; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_3_io_out_ready; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_3_io_out_valid; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_3_io_out_bits_score; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_3_io_out_bits_x; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_3_io_out_bits_y; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_3_io_toNextPE_ready; // @[WatermanSystolic.scala 25:11]
  wire  processingElementDecoupled_3_io_toNextPE_valid; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_3_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 25:11]
  wire [31:0] processingElementDecoupled_3_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 25:11]
  wire [1:0] processingElementDecoupled_3_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 25:11]
  reg [1:0] stateReg; // @[WatermanSystolic.scala 18:25]
  reg [1:0] stepReg; // @[WatermanSystolic.scala 19:24]
  reg [1:0] TReg_0; // @[WatermanSystolic.scala 20:21]
  reg [1:0] TReg_1; // @[WatermanSystolic.scala 20:21]
  reg [1:0] TReg_2; // @[WatermanSystolic.scala 20:21]
  reg [1:0] TReg_3; // @[WatermanSystolic.scala 20:21]
  reg [1:0] SReg_0; // @[WatermanSystolic.scala 21:21]
  reg [1:0] SReg_1; // @[WatermanSystolic.scala 21:21]
  reg [1:0] SReg_2; // @[WatermanSystolic.scala 21:21]
  reg [1:0] SReg_3; // @[WatermanSystolic.scala 21:21]
  reg  resetReg; // @[WatermanSystolic.scala 22:25]
  wire  _T_2 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_3 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _T_5 = stepReg + 2'h1; // @[WatermanSystolic.scala 75:28]
  wire [1:0] _GEN_11 = stepReg == 2'h3 ? 2'h2 : stateReg; // @[WatermanSystolic.scala 76:49 WatermanSystolic.scala 77:20 WatermanSystolic.scala 18:25]
  wire  PEs_0_fromPreviousPE_ready = processingElementDecoupled_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  wire  _T_7 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] PEs_3_out_bits_x = processingElementDecoupled_3_io_out_bits_x; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  wire  PEs_3_out_valid = processingElementDecoupled_3_io_out_valid; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  wire  _GEN_17 = PEs_3_out_valid & PEs_3_out_bits_x == 2'h3 | resetReg; // @[WatermanSystolic.scala 82:104 WatermanSystolic.scala 83:18 WatermanSystolic.scala 22:25]
  wire [1:0] _GEN_18 = PEs_3_out_valid & PEs_3_out_bits_x == 2'h3 ? 2'h0 : stateReg; // @[WatermanSystolic.scala 82:104 WatermanSystolic.scala 84:18 WatermanSystolic.scala 18:25]
  processingElementDecoupled processingElementDecoupled ( // @[WatermanSystolic.scala 25:11]
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
  processingElementDecoupled processingElementDecoupled_1 ( // @[WatermanSystolic.scala 25:11]
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
  processingElementDecoupled processingElementDecoupled_2 ( // @[WatermanSystolic.scala 25:11]
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
  processingElementDecoupled processingElementDecoupled_3 ( // @[WatermanSystolic.scala 25:11]
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
  assign io_in_ready = stateReg == 2'h0; // @[WatermanSystolic.scala 54:27]
  assign io_out_0_valid = processingElementDecoupled_io_out_valid; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_0_bits_score = processingElementDecoupled_io_out_bits_score; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_0_bits_x = processingElementDecoupled_io_out_bits_x; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_0_bits_y = processingElementDecoupled_io_out_bits_y; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_1_valid = processingElementDecoupled_1_io_out_valid; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_1_bits_score = processingElementDecoupled_1_io_out_bits_score; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_1_bits_x = processingElementDecoupled_1_io_out_bits_x; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_1_bits_y = processingElementDecoupled_1_io_out_bits_y; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_2_valid = processingElementDecoupled_2_io_out_valid; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_2_bits_score = processingElementDecoupled_2_io_out_bits_score; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_2_bits_x = processingElementDecoupled_2_io_out_bits_x; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_2_bits_y = processingElementDecoupled_2_io_out_bits_y; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_3_valid = processingElementDecoupled_3_io_out_valid; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_3_bits_score = processingElementDecoupled_3_io_out_bits_score; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_3_bits_x = processingElementDecoupled_3_io_out_bits_x; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign io_out_3_bits_y = processingElementDecoupled_3_io_out_bits_y; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_clock = clock;
  assign processingElementDecoupled_reset = reset;
  assign processingElementDecoupled_io_fromPreviousPE_valid = stateReg == 2'h1; // @[WatermanSystolic.scala 31:47]
  assign processingElementDecoupled_io_fromPreviousPE_bits_upper = 32'sh0; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 33:40]
  assign processingElementDecoupled_io_fromPreviousPE_bits_diagonal = 32'sh0; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 34:43]
  assign processingElementDecoupled_io_fromPreviousPE_bits_columnElement = SReg_0; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 32:48]
  assign processingElementDecoupled_io_rowElement = TReg_0; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
  assign processingElementDecoupled_io_reset = resetReg; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
  assign processingElementDecoupled_io_number = 32'h0; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
  assign processingElementDecoupled_io_out_ready = io_out_0_ready; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
  assign processingElementDecoupled_io_toNextPE_ready = processingElementDecoupled_1_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_1_clock = clock;
  assign processingElementDecoupled_1_reset = reset;
  assign processingElementDecoupled_1_io_fromPreviousPE_valid = processingElementDecoupled_io_toNextPE_valid; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_1_io_fromPreviousPE_bits_upper = processingElementDecoupled_io_toNextPE_bits_upper; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_1_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_1_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_1_io_rowElement = TReg_1; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
  assign processingElementDecoupled_1_io_reset = resetReg; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
  assign processingElementDecoupled_1_io_number = 32'h1; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
  assign processingElementDecoupled_1_io_out_ready = io_out_1_ready; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
  assign processingElementDecoupled_1_io_toNextPE_ready = processingElementDecoupled_2_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_2_clock = clock;
  assign processingElementDecoupled_2_reset = reset;
  assign processingElementDecoupled_2_io_fromPreviousPE_valid = processingElementDecoupled_1_io_toNextPE_valid; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_2_io_fromPreviousPE_bits_upper = processingElementDecoupled_1_io_toNextPE_bits_upper
    ; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_2_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_1_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_2_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_1_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_2_io_rowElement = TReg_2; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
  assign processingElementDecoupled_2_io_reset = resetReg; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
  assign processingElementDecoupled_2_io_number = 32'h2; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
  assign processingElementDecoupled_2_io_out_ready = io_out_2_ready; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
  assign processingElementDecoupled_2_io_toNextPE_ready = processingElementDecoupled_3_io_fromPreviousPE_ready; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_3_clock = clock;
  assign processingElementDecoupled_3_reset = reset;
  assign processingElementDecoupled_3_io_fromPreviousPE_valid = processingElementDecoupled_2_io_toNextPE_valid; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_3_io_fromPreviousPE_bits_upper = processingElementDecoupled_2_io_toNextPE_bits_upper
    ; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_3_io_fromPreviousPE_bits_diagonal =
    processingElementDecoupled_2_io_toNextPE_bits_diagonal; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_3_io_fromPreviousPE_bits_columnElement =
    processingElementDecoupled_2_io_toNextPE_bits_columnElement; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 24:20]
  assign processingElementDecoupled_3_io_rowElement = TReg_3; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 44:23]
  assign processingElementDecoupled_3_io_reset = resetReg; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 45:18]
  assign processingElementDecoupled_3_io_number = 32'h3; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 43:19]
  assign processingElementDecoupled_3_io_out_ready = io_out_3_ready; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 51:22]
  assign processingElementDecoupled_3_io_toNextPE_ready = 1'h1; // @[WatermanSystolic.scala 24:20 WatermanSystolic.scala 28:38]
  always @(posedge clock) begin
    if (reset) begin // @[WatermanSystolic.scala 18:25]
      stateReg <= 2'h0; // @[WatermanSystolic.scala 18:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 58:25]
        stateReg <= 2'h1; // @[WatermanSystolic.scala 67:18]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 71:41]
        stateReg <= _GEN_11;
      end
    end else if (_T_7) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_18;
    end
    if (reset) begin // @[WatermanSystolic.scala 19:24]
      stepReg <= 2'h0; // @[WatermanSystolic.scala 19:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 58:25]
        stepReg <= 2'h0; // @[WatermanSystolic.scala 66:17]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 71:41]
        stepReg <= _T_5; // @[WatermanSystolic.scala 75:17]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 20:21]
      TReg_0 <= 2'h0; // @[WatermanSystolic.scala 20:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 58:25]
        TReg_0 <= io_in_bits_T_0; // @[WatermanSystolic.scala 63:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 20:21]
      TReg_1 <= 2'h0; // @[WatermanSystolic.scala 20:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 58:25]
        TReg_1 <= io_in_bits_T_1; // @[WatermanSystolic.scala 63:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 20:21]
      TReg_2 <= 2'h0; // @[WatermanSystolic.scala 20:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 58:25]
        TReg_2 <= io_in_bits_T_2; // @[WatermanSystolic.scala 63:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 20:21]
      TReg_3 <= 2'h0; // @[WatermanSystolic.scala 20:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 58:25]
        TReg_3 <= io_in_bits_T_3; // @[WatermanSystolic.scala 63:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      SReg_0 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 58:25]
        SReg_0 <= io_in_bits_S_0; // @[WatermanSystolic.scala 60:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 71:41]
        SReg_0 <= SReg_1; // @[WatermanSystolic.scala 73:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      SReg_1 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 58:25]
        SReg_1 <= io_in_bits_S_1; // @[WatermanSystolic.scala 60:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 71:41]
        SReg_1 <= SReg_2; // @[WatermanSystolic.scala 73:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      SReg_2 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 58:25]
        SReg_2 <= io_in_bits_S_2; // @[WatermanSystolic.scala 60:19]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (PEs_0_fromPreviousPE_ready) begin // @[WatermanSystolic.scala 71:41]
        SReg_2 <= SReg_3; // @[WatermanSystolic.scala 73:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 21:21]
      SReg_3 <= 2'h0; // @[WatermanSystolic.scala 21:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 58:25]
        SReg_3 <= io_in_bits_S_3; // @[WatermanSystolic.scala 60:19]
      end
    end
    if (reset) begin // @[WatermanSystolic.scala 22:25]
      resetReg <= 1'h0; // @[WatermanSystolic.scala 22:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[WatermanSystolic.scala 58:25]
        resetReg <= 1'h0; // @[WatermanSystolic.scala 65:18]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_7) begin // @[Conditional.scala 39:67]
        resetReg <= _GEN_17;
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
  stepReg = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  TReg_0 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  TReg_1 = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  TReg_2 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  TReg_3 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  SReg_0 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  SReg_1 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  SReg_2 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  SReg_3 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  resetReg = _RAND_10[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
