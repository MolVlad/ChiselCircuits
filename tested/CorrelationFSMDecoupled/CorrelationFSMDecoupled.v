module DecoupledMultiplyAndAccumulate(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_x,
  input  [31:0] io_in_bits_y,
  input         io_in_bits_reset,
  output        io_out_valid,
  output [31:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[CorrelationFSMDecoupled.scala 114:25]
  reg [31:0] xReg; // @[CorrelationFSMDecoupled.scala 115:21]
  reg [31:0] yReg; // @[CorrelationFSMDecoupled.scala 116:21]
  reg  resetReg; // @[CorrelationFSMDecoupled.scala 117:25]
  reg [31:0] accReg; // @[CorrelationFSMDecoupled.scala 118:23]
  wire  _T = ~stateReg; // @[CorrelationFSMDecoupled.scala 121:27]
  wire  _GEN_3 = io_in_valid | stateReg; // @[CorrelationFSMDecoupled.scala 126:25 CorrelationFSMDecoupled.scala 131:18 CorrelationFSMDecoupled.scala 114:25]
  wire [63:0] _T_4 = $signed(xReg) * $signed(yReg); // @[CorrelationFSMDecoupled.scala 140:33]
  wire [63:0] _GEN_12 = {{32{accReg[31]}},accReg}; // @[CorrelationFSMDecoupled.scala 140:26]
  wire [63:0] _T_7 = $signed(_GEN_12) + $signed(_T_4); // @[CorrelationFSMDecoupled.scala 140:26]
  wire [63:0] _GEN_4 = resetReg ? $signed(64'sh0) : $signed(_T_7); // @[CorrelationFSMDecoupled.scala 137:23 CorrelationFSMDecoupled.scala 138:16 CorrelationFSMDecoupled.scala 140:16]
  wire [63:0] _GEN_6 = stateReg ? $signed(_GEN_4) : $signed({{32{accReg[31]}},accReg}); // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 118:23]
  wire [63:0] _GEN_11 = _T ? $signed({{32{accReg[31]}},accReg}) : $signed(_GEN_6); // @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 118:23]
  assign io_in_ready = ~stateReg; // @[CorrelationFSMDecoupled.scala 121:27]
  assign io_out_valid = ~stateReg; // @[CorrelationFSMDecoupled.scala 122:28]
  assign io_out_bits = accReg; // @[CorrelationFSMDecoupled.scala 120:15]
  always @(posedge clock) begin
    if (reset) begin // @[CorrelationFSMDecoupled.scala 114:25]
      stateReg <= 1'h0; // @[CorrelationFSMDecoupled.scala 114:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      stateReg <= _GEN_3;
    end else if (stateReg) begin // @[Conditional.scala 39:67]
      stateReg <= 1'h0; // @[CorrelationFSMDecoupled.scala 135:16]
    end
    if (reset) begin // @[CorrelationFSMDecoupled.scala 115:21]
      xReg <= 32'sh0; // @[CorrelationFSMDecoupled.scala 115:21]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSMDecoupled.scala 126:25]
        xReg <= io_in_bits_x; // @[CorrelationFSMDecoupled.scala 127:14]
      end
    end
    if (reset) begin // @[CorrelationFSMDecoupled.scala 116:21]
      yReg <= 32'sh0; // @[CorrelationFSMDecoupled.scala 116:21]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSMDecoupled.scala 126:25]
        yReg <= io_in_bits_y; // @[CorrelationFSMDecoupled.scala 128:14]
      end
    end
    if (reset) begin // @[CorrelationFSMDecoupled.scala 117:25]
      resetReg <= 1'h0; // @[CorrelationFSMDecoupled.scala 117:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSMDecoupled.scala 126:25]
        resetReg <= io_in_bits_reset; // @[CorrelationFSMDecoupled.scala 129:18]
      end
    end
    if (reset) begin // @[CorrelationFSMDecoupled.scala 118:23]
      accReg <= 32'sh0; // @[CorrelationFSMDecoupled.scala 118:23]
    end else begin
      accReg <= _GEN_11[31:0];
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
  xReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  yReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  resetReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  accReg = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CorrelationFSMDecoupled(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire  pe_clock; // @[CorrelationFSMDecoupled.scala 30:18]
  wire  pe_reset; // @[CorrelationFSMDecoupled.scala 30:18]
  wire  pe_io_in_ready; // @[CorrelationFSMDecoupled.scala 30:18]
  wire  pe_io_in_valid; // @[CorrelationFSMDecoupled.scala 30:18]
  wire [31:0] pe_io_in_bits_x; // @[CorrelationFSMDecoupled.scala 30:18]
  wire [31:0] pe_io_in_bits_y; // @[CorrelationFSMDecoupled.scala 30:18]
  wire  pe_io_in_bits_reset; // @[CorrelationFSMDecoupled.scala 30:18]
  wire  pe_io_out_valid; // @[CorrelationFSMDecoupled.scala 30:18]
  wire [31:0] pe_io_out_bits; // @[CorrelationFSMDecoupled.scala 30:18]
  reg [2:0] stateReg; // @[CorrelationFSMDecoupled.scala 14:25]
  reg [1:0] computingStageReg; // @[CorrelationFSMDecoupled.scala 17:34]
  reg [31:0] x0Reg; // @[CorrelationFSMDecoupled.scala 19:22]
  reg [31:0] x1Reg; // @[CorrelationFSMDecoupled.scala 20:22]
  reg [31:0] x2Reg; // @[CorrelationFSMDecoupled.scala 21:22]
  reg [31:0] resReg; // @[CorrelationFSMDecoupled.scala 27:23]
  wire  _T_6 = 3'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_7 = 3'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_8 = 2'h0 == computingStageReg; // @[Conditional.scala 37:30]
  wire  _T_9 = 2'h1 == computingStageReg; // @[Conditional.scala 37:30]
  wire  _T_10 = 2'h2 == computingStageReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_5 = _T_10 ? $signed(x2Reg) : $signed(32'sh0); // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 62:27 CorrelationFSMDecoupled.scala 35:19]
  wire [2:0] _GEN_6 = _T_10 ? $signed(3'sh3) : $signed(3'sh0); // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 63:27 CorrelationFSMDecoupled.scala 36:19]
  wire [31:0] _GEN_7 = _T_9 ? $signed(x1Reg) : $signed(_GEN_5); // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 58:27]
  wire [2:0] _GEN_8 = _T_9 ? $signed(3'sh2) : $signed(_GEN_6); // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 59:27]
  wire [31:0] _GEN_9 = _T_8 ? $signed(x0Reg) : $signed(_GEN_7); // @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 54:27]
  wire [2:0] _GEN_10 = _T_8 ? $signed(3'sh1) : $signed(_GEN_8); // @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 55:27]
  wire  _T_11 = 3'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_12 = _T_10 ? 3'h3 : stateReg; // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 84:22 CorrelationFSMDecoupled.scala 14:25]
  wire [1:0] _GEN_13 = _T_9 ? 2'h2 : computingStageReg; // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 80:31 CorrelationFSMDecoupled.scala 17:34]
  wire [2:0] _GEN_14 = _T_9 ? 3'h1 : _GEN_12; // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 81:22]
  wire [1:0] _GEN_15 = _T_8 ? 2'h1 : _GEN_13; // @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 76:31]
  wire [2:0] _GEN_16 = _T_8 ? 3'h1 : _GEN_14; // @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 77:22]
  wire [31:0] _GEN_17 = pe_io_out_valid ? $signed(pe_io_out_bits) : $signed(resReg); // @[CorrelationFSMDecoupled.scala 71:29 CorrelationFSMDecoupled.scala 72:16 CorrelationFSMDecoupled.scala 27:23]
  wire [1:0] _GEN_18 = pe_io_out_valid ? _GEN_15 : computingStageReg; // @[CorrelationFSMDecoupled.scala 71:29 CorrelationFSMDecoupled.scala 17:34]
  wire [2:0] _GEN_19 = pe_io_out_valid ? _GEN_16 : stateReg; // @[CorrelationFSMDecoupled.scala 71:29 CorrelationFSMDecoupled.scala 14:25]
  wire  _T_15 = 3'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_20 = io_out_ready ? 3'h4 : stateReg; // @[CorrelationFSMDecoupled.scala 90:26 CorrelationFSMDecoupled.scala 91:18 CorrelationFSMDecoupled.scala 14:25]
  wire  _T_16 = 3'h4 == stateReg; // @[Conditional.scala 37:30]
  wire  _GEN_21 = pe_io_in_ready; // @[CorrelationFSMDecoupled.scala 95:28 CorrelationFSMDecoupled.scala 96:29 CorrelationFSMDecoupled.scala 37:23]
  wire [2:0] _GEN_22 = pe_io_in_ready ? 3'h0 : stateReg; // @[CorrelationFSMDecoupled.scala 95:28 CorrelationFSMDecoupled.scala 97:18 CorrelationFSMDecoupled.scala 14:25]
  wire [2:0] _GEN_24 = _T_16 ? _GEN_22 : stateReg; // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 14:25]
  wire [2:0] _GEN_25 = _T_15 ? _GEN_20 : _GEN_24; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_15 ? 1'h0 : _T_16 & _GEN_21; // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 37:23]
  wire  _GEN_30 = _T_11 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 37:23]
  wire [31:0] _GEN_31 = _T_7 ? $signed(_GEN_9) : $signed(32'sh0); // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 35:19]
  wire [2:0] _GEN_32 = _T_7 ? $signed(_GEN_10) : $signed(3'sh0); // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 36:19]
  wire  _GEN_36 = _T_7 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67 CorrelationFSMDecoupled.scala 37:23]
  wire [2:0] _GEN_43 = _T_6 ? $signed(3'sh0) : $signed(_GEN_32); // @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 36:19]
  DecoupledMultiplyAndAccumulate pe ( // @[CorrelationFSMDecoupled.scala 30:18]
    .clock(pe_clock),
    .reset(pe_reset),
    .io_in_ready(pe_io_in_ready),
    .io_in_valid(pe_io_in_valid),
    .io_in_bits_x(pe_io_in_bits_x),
    .io_in_bits_y(pe_io_in_bits_y),
    .io_in_bits_reset(pe_io_in_bits_reset),
    .io_out_valid(pe_io_out_valid),
    .io_out_bits(pe_io_out_bits)
  );
  assign io_in_ready = stateReg == 3'h0; // @[CorrelationFSMDecoupled.scala 32:27]
  assign io_out_valid = stateReg == 3'h3; // @[CorrelationFSMDecoupled.scala 33:28]
  assign io_out_bits = resReg; // @[CorrelationFSMDecoupled.scala 28:15]
  assign pe_clock = clock;
  assign pe_reset = reset;
  assign pe_io_in_valid = stateReg == 3'h1 | stateReg == 3'h4; // @[CorrelationFSMDecoupled.scala 38:44]
  assign pe_io_in_bits_x = _T_6 ? $signed(32'sh0) : $signed(_GEN_31); // @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 35:19]
  assign pe_io_in_bits_y = {{29{_GEN_43[2]}},_GEN_43}; // @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 36:19]
  assign pe_io_in_bits_reset = _T_6 ? 1'h0 : _GEN_36; // @[Conditional.scala 40:58 CorrelationFSMDecoupled.scala 37:23]
  always @(posedge clock) begin
    if (reset) begin // @[CorrelationFSMDecoupled.scala 14:25]
      stateReg <= 3'h0; // @[CorrelationFSMDecoupled.scala 14:25]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSMDecoupled.scala 43:25]
        stateReg <= 3'h1; // @[CorrelationFSMDecoupled.scala 47:18]
      end
    end else if (_T_7) begin // @[Conditional.scala 39:67]
      if (pe_io_in_ready) begin // @[CorrelationFSMDecoupled.scala 66:28]
        stateReg <= 3'h2; // @[CorrelationFSMDecoupled.scala 67:18]
      end
    end else if (_T_11) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_19;
    end else begin
      stateReg <= _GEN_25;
    end
    if (reset) begin // @[CorrelationFSMDecoupled.scala 17:34]
      computingStageReg <= 2'h0; // @[CorrelationFSMDecoupled.scala 17:34]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSMDecoupled.scala 43:25]
        computingStageReg <= 2'h0; // @[CorrelationFSMDecoupled.scala 48:27]
      end
    end else if (!(_T_7)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        computingStageReg <= _GEN_18;
      end
    end
    if (reset) begin // @[CorrelationFSMDecoupled.scala 19:22]
      x0Reg <= 32'sh0; // @[CorrelationFSMDecoupled.scala 19:22]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSMDecoupled.scala 43:25]
        x0Reg <= x1Reg; // @[CorrelationFSMDecoupled.scala 44:15]
      end
    end
    if (reset) begin // @[CorrelationFSMDecoupled.scala 20:22]
      x1Reg <= 32'sh0; // @[CorrelationFSMDecoupled.scala 20:22]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSMDecoupled.scala 43:25]
        x1Reg <= x2Reg; // @[CorrelationFSMDecoupled.scala 45:15]
      end
    end
    if (reset) begin // @[CorrelationFSMDecoupled.scala 21:22]
      x2Reg <= 32'sh0; // @[CorrelationFSMDecoupled.scala 21:22]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSMDecoupled.scala 43:25]
        x2Reg <= io_in_bits; // @[CorrelationFSMDecoupled.scala 46:15]
      end
    end
    if (reset) begin // @[CorrelationFSMDecoupled.scala 27:23]
      resReg <= 32'sh0; // @[CorrelationFSMDecoupled.scala 27:23]
    end else if (!(_T_6)) begin // @[Conditional.scala 40:58]
      if (!(_T_7)) begin // @[Conditional.scala 39:67]
        if (_T_11) begin // @[Conditional.scala 39:67]
          resReg <= _GEN_17;
        end
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
  stateReg = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  computingStageReg = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  x0Reg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  x1Reg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  x2Reg = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  resReg = _RAND_5[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
