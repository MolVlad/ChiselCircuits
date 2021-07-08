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
  reg  stateReg; // @[DotProductDecoupled.scala 93:25]
  reg [31:0] xReg; // @[DotProductDecoupled.scala 94:21]
  reg [31:0] yReg; // @[DotProductDecoupled.scala 95:21]
  reg  resetReg; // @[DotProductDecoupled.scala 96:25]
  reg [31:0] accReg; // @[DotProductDecoupled.scala 97:23]
  wire  _T = ~stateReg; // @[DotProductDecoupled.scala 100:27]
  wire  _GEN_3 = io_in_valid | stateReg; // @[DotProductDecoupled.scala 105:25 DotProductDecoupled.scala 110:18 DotProductDecoupled.scala 93:25]
  wire [63:0] _T_4 = $signed(xReg) * $signed(yReg); // @[DotProductDecoupled.scala 119:33]
  wire [63:0] _GEN_12 = {{32{accReg[31]}},accReg}; // @[DotProductDecoupled.scala 119:26]
  wire [63:0] _T_7 = $signed(_GEN_12) + $signed(_T_4); // @[DotProductDecoupled.scala 119:26]
  wire [63:0] _GEN_4 = resetReg ? $signed(64'sh0) : $signed(_T_7); // @[DotProductDecoupled.scala 116:23 DotProductDecoupled.scala 117:16 DotProductDecoupled.scala 119:16]
  wire [63:0] _GEN_6 = stateReg ? $signed(_GEN_4) : $signed({{32{accReg[31]}},accReg}); // @[Conditional.scala 39:67 DotProductDecoupled.scala 97:23]
  wire [63:0] _GEN_11 = _T ? $signed({{32{accReg[31]}},accReg}) : $signed(_GEN_6); // @[Conditional.scala 40:58 DotProductDecoupled.scala 97:23]
  assign io_in_ready = ~stateReg; // @[DotProductDecoupled.scala 100:27]
  assign io_out_valid = ~stateReg; // @[DotProductDecoupled.scala 101:28]
  assign io_out_bits = accReg; // @[DotProductDecoupled.scala 99:15]
  always @(posedge clock) begin
    if (reset) begin // @[DotProductDecoupled.scala 93:25]
      stateReg <= 1'h0; // @[DotProductDecoupled.scala 93:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      stateReg <= _GEN_3;
    end else if (stateReg) begin // @[Conditional.scala 39:67]
      stateReg <= 1'h0; // @[DotProductDecoupled.scala 114:16]
    end
    if (reset) begin // @[DotProductDecoupled.scala 94:21]
      xReg <= 32'sh0; // @[DotProductDecoupled.scala 94:21]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 105:25]
        xReg <= io_in_bits_x; // @[DotProductDecoupled.scala 106:14]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 95:21]
      yReg <= 32'sh0; // @[DotProductDecoupled.scala 95:21]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 105:25]
        yReg <= io_in_bits_y; // @[DotProductDecoupled.scala 107:14]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 96:25]
      resetReg <= 1'h0; // @[DotProductDecoupled.scala 96:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 105:25]
        resetReg <= io_in_bits_reset; // @[DotProductDecoupled.scala 108:18]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 97:23]
      accReg <= 32'sh0; // @[DotProductDecoupled.scala 97:23]
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
module DotProductDecoupled(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_x_0,
  input  [31:0] io_in_bits_x_1,
  input  [31:0] io_in_bits_x_2,
  input  [31:0] io_in_bits_x_3,
  input  [31:0] io_in_bits_y_0,
  input  [31:0] io_in_bits_y_1,
  input  [31:0] io_in_bits_y_2,
  input  [31:0] io_in_bits_y_3,
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
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  wire  pe_clock; // @[DotProductDecoupled.scala 23:18]
  wire  pe_reset; // @[DotProductDecoupled.scala 23:18]
  wire  pe_io_in_ready; // @[DotProductDecoupled.scala 23:18]
  wire  pe_io_in_valid; // @[DotProductDecoupled.scala 23:18]
  wire [31:0] pe_io_in_bits_x; // @[DotProductDecoupled.scala 23:18]
  wire [31:0] pe_io_in_bits_y; // @[DotProductDecoupled.scala 23:18]
  wire  pe_io_in_bits_reset; // @[DotProductDecoupled.scala 23:18]
  wire  pe_io_out_valid; // @[DotProductDecoupled.scala 23:18]
  wire [31:0] pe_io_out_bits; // @[DotProductDecoupled.scala 23:18]
  reg [31:0] xRegs_0; // @[DotProductDecoupled.scala 15:22]
  reg [31:0] xRegs_1; // @[DotProductDecoupled.scala 15:22]
  reg [31:0] xRegs_2; // @[DotProductDecoupled.scala 15:22]
  reg [31:0] xRegs_3; // @[DotProductDecoupled.scala 15:22]
  reg [31:0] yRegs_0; // @[DotProductDecoupled.scala 16:22]
  reg [31:0] yRegs_1; // @[DotProductDecoupled.scala 16:22]
  reg [31:0] yRegs_2; // @[DotProductDecoupled.scala 16:22]
  reg [31:0] yRegs_3; // @[DotProductDecoupled.scala 16:22]
  reg [2:0] stateReg; // @[DotProductDecoupled.scala 19:25]
  reg [2:0] cntReg; // @[DotProductDecoupled.scala 20:23]
  wire  _T_6 = 3'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_7 = 3'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_11 = 2'h1 == cntReg[1:0] ? $signed(xRegs_1) : $signed(xRegs_0); // @[DotProductDecoupled.scala 51:25 DotProductDecoupled.scala 51:25]
  wire [31:0] _GEN_12 = 2'h2 == cntReg[1:0] ? $signed(xRegs_2) : $signed(_GEN_11); // @[DotProductDecoupled.scala 51:25 DotProductDecoupled.scala 51:25]
  wire [31:0] _GEN_13 = 2'h3 == cntReg[1:0] ? $signed(xRegs_3) : $signed(_GEN_12); // @[DotProductDecoupled.scala 51:25 DotProductDecoupled.scala 51:25]
  wire [31:0] _GEN_15 = 2'h1 == cntReg[1:0] ? $signed(yRegs_1) : $signed(yRegs_0); // @[DotProductDecoupled.scala 52:25 DotProductDecoupled.scala 52:25]
  wire [31:0] _GEN_16 = 2'h2 == cntReg[1:0] ? $signed(yRegs_2) : $signed(_GEN_15); // @[DotProductDecoupled.scala 52:25 DotProductDecoupled.scala 52:25]
  wire [31:0] _GEN_17 = 2'h3 == cntReg[1:0] ? $signed(yRegs_3) : $signed(_GEN_16); // @[DotProductDecoupled.scala 52:25 DotProductDecoupled.scala 52:25]
  wire [31:0] _GEN_18 = pe_io_in_ready ? $signed(_GEN_13) : $signed(32'sh0); // @[DotProductDecoupled.scala 50:7 DotProductDecoupled.scala 51:25 DotProductDecoupled.scala 25:19]
  wire [31:0] _GEN_19 = pe_io_in_ready ? $signed(_GEN_17) : $signed(32'sh0); // @[DotProductDecoupled.scala 50:7 DotProductDecoupled.scala 52:25 DotProductDecoupled.scala 26:19]
  wire  _T_10 = 3'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [2:0] _T_12 = cntReg + 3'h1; // @[DotProductDecoupled.scala 59:26]
  wire [2:0] _GEN_21 = cntReg == 3'h3 ? 3'h3 : 3'h1; // @[DotProductDecoupled.scala 61:34 DotProductDecoupled.scala 62:20 DotProductDecoupled.scala 64:20]
  wire [2:0] _GEN_22 = pe_io_out_valid ? _T_12 : cntReg; // @[DotProductDecoupled.scala 58:29 DotProductDecoupled.scala 59:16 DotProductDecoupled.scala 20:23]
  wire [2:0] _GEN_23 = pe_io_out_valid ? _GEN_21 : stateReg; // @[DotProductDecoupled.scala 58:29 DotProductDecoupled.scala 19:25]
  wire  _T_14 = 3'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_24 = io_out_ready ? 3'h4 : stateReg; // @[DotProductDecoupled.scala 69:26 DotProductDecoupled.scala 70:18 DotProductDecoupled.scala 19:25]
  wire  _T_15 = 3'h4 == stateReg; // @[Conditional.scala 37:30]
  wire  _GEN_25 = pe_io_in_ready; // @[DotProductDecoupled.scala 74:28 DotProductDecoupled.scala 75:29 DotProductDecoupled.scala 27:23]
  wire [2:0] _GEN_26 = pe_io_in_ready ? 3'h0 : stateReg; // @[DotProductDecoupled.scala 74:28 DotProductDecoupled.scala 76:18 DotProductDecoupled.scala 19:25]
  wire [2:0] _GEN_28 = _T_15 ? _GEN_26 : stateReg; // @[Conditional.scala 39:67 DotProductDecoupled.scala 19:25]
  wire [2:0] _GEN_29 = _T_14 ? _GEN_24 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_14 ? 1'h0 : _T_15 & _GEN_25; // @[Conditional.scala 39:67 DotProductDecoupled.scala 27:23]
  wire  _GEN_33 = _T_10 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67 DotProductDecoupled.scala 27:23]
  wire [31:0] _GEN_34 = _T_7 ? $signed(_GEN_18) : $signed(32'sh0); // @[Conditional.scala 39:67 DotProductDecoupled.scala 25:19]
  wire [31:0] _GEN_35 = _T_7 ? $signed(_GEN_19) : $signed(32'sh0); // @[Conditional.scala 39:67 DotProductDecoupled.scala 26:19]
  wire  _GEN_38 = _T_7 ? 1'h0 : _GEN_33; // @[Conditional.scala 39:67 DotProductDecoupled.scala 27:23]
  DecoupledMultiplyAndAccumulate pe ( // @[DotProductDecoupled.scala 23:18]
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
  assign io_in_ready = stateReg == 3'h0; // @[DotProductDecoupled.scala 32:27]
  assign io_out_valid = stateReg == 3'h3; // @[DotProductDecoupled.scala 33:28]
  assign io_out_bits = pe_io_out_bits; // @[DotProductDecoupled.scala 31:15]
  assign pe_clock = clock;
  assign pe_reset = reset;
  assign pe_io_in_valid = stateReg == 3'h1 | stateReg == 3'h4; // @[DotProductDecoupled.scala 28:44]
  assign pe_io_in_bits_x = _T_6 ? $signed(32'sh0) : $signed(_GEN_34); // @[Conditional.scala 40:58 DotProductDecoupled.scala 25:19]
  assign pe_io_in_bits_y = _T_6 ? $signed(32'sh0) : $signed(_GEN_35); // @[Conditional.scala 40:58 DotProductDecoupled.scala 26:19]
  assign pe_io_in_bits_reset = _T_6 ? 1'h0 : _GEN_38; // @[Conditional.scala 40:58 DotProductDecoupled.scala 27:23]
  always @(posedge clock) begin
    if (reset) begin // @[DotProductDecoupled.scala 15:22]
      xRegs_0 <= 32'sh0; // @[DotProductDecoupled.scala 15:22]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 37:25]
        xRegs_0 <= io_in_bits_x_0; // @[DotProductDecoupled.scala 39:20]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 15:22]
      xRegs_1 <= 32'sh0; // @[DotProductDecoupled.scala 15:22]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 37:25]
        xRegs_1 <= io_in_bits_x_1; // @[DotProductDecoupled.scala 39:20]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 15:22]
      xRegs_2 <= 32'sh0; // @[DotProductDecoupled.scala 15:22]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 37:25]
        xRegs_2 <= io_in_bits_x_2; // @[DotProductDecoupled.scala 39:20]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 15:22]
      xRegs_3 <= 32'sh0; // @[DotProductDecoupled.scala 15:22]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 37:25]
        xRegs_3 <= io_in_bits_x_3; // @[DotProductDecoupled.scala 39:20]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 16:22]
      yRegs_0 <= 32'sh0; // @[DotProductDecoupled.scala 16:22]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 37:25]
        yRegs_0 <= io_in_bits_y_0; // @[DotProductDecoupled.scala 42:20]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 16:22]
      yRegs_1 <= 32'sh0; // @[DotProductDecoupled.scala 16:22]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 37:25]
        yRegs_1 <= io_in_bits_y_1; // @[DotProductDecoupled.scala 42:20]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 16:22]
      yRegs_2 <= 32'sh0; // @[DotProductDecoupled.scala 16:22]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 37:25]
        yRegs_2 <= io_in_bits_y_2; // @[DotProductDecoupled.scala 42:20]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 16:22]
      yRegs_3 <= 32'sh0; // @[DotProductDecoupled.scala 16:22]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 37:25]
        yRegs_3 <= io_in_bits_y_3; // @[DotProductDecoupled.scala 42:20]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 19:25]
      stateReg <= 3'h0; // @[DotProductDecoupled.scala 19:25]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 37:25]
        stateReg <= 3'h1; // @[DotProductDecoupled.scala 45:18]
      end
    end else if (_T_7) begin // @[Conditional.scala 39:67]
      if (pe_io_in_ready) begin // @[DotProductDecoupled.scala 50:7]
        stateReg <= 3'h2; // @[DotProductDecoupled.scala 54:18]
      end
    end else if (_T_10) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_23;
    end else begin
      stateReg <= _GEN_29;
    end
    if (reset) begin // @[DotProductDecoupled.scala 20:23]
      cntReg <= 3'h0; // @[DotProductDecoupled.scala 20:23]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 37:25]
        cntReg <= 3'h0; // @[DotProductDecoupled.scala 44:16]
      end
    end else if (!(_T_7)) begin // @[Conditional.scala 39:67]
      if (_T_10) begin // @[Conditional.scala 39:67]
        cntReg <= _GEN_22;
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
  xRegs_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  xRegs_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  xRegs_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  xRegs_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  yRegs_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  yRegs_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  yRegs_2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  yRegs_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  stateReg = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  cntReg = _RAND_9[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
