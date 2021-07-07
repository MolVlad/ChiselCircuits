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
  reg  stateReg; // @[DotProductDecoupled.scala 87:25]
  reg [31:0] xReg; // @[DotProductDecoupled.scala 88:21]
  reg [31:0] yReg; // @[DotProductDecoupled.scala 89:21]
  reg  resetReg; // @[DotProductDecoupled.scala 90:25]
  reg [31:0] accReg; // @[DotProductDecoupled.scala 91:23]
  wire  _T = ~stateReg; // @[DotProductDecoupled.scala 94:27]
  wire  _GEN_3 = io_in_valid | stateReg; // @[DotProductDecoupled.scala 99:25 DotProductDecoupled.scala 104:18 DotProductDecoupled.scala 87:25]
  wire [63:0] _T_4 = $signed(xReg) * $signed(yReg); // @[DotProductDecoupled.scala 113:33]
  wire [63:0] _GEN_12 = {{32{accReg[31]}},accReg}; // @[DotProductDecoupled.scala 113:26]
  wire [63:0] _T_7 = $signed(_GEN_12) + $signed(_T_4); // @[DotProductDecoupled.scala 113:26]
  wire [63:0] _GEN_4 = resetReg ? $signed(64'sh0) : $signed(_T_7); // @[DotProductDecoupled.scala 110:23 DotProductDecoupled.scala 111:16 DotProductDecoupled.scala 113:16]
  wire [63:0] _GEN_6 = stateReg ? $signed(_GEN_4) : $signed({{32{accReg[31]}},accReg}); // @[Conditional.scala 39:67 DotProductDecoupled.scala 91:23]
  wire [63:0] _GEN_11 = _T ? $signed({{32{accReg[31]}},accReg}) : $signed(_GEN_6); // @[Conditional.scala 40:58 DotProductDecoupled.scala 91:23]
  assign io_in_ready = ~stateReg; // @[DotProductDecoupled.scala 94:27]
  assign io_out_valid = ~stateReg; // @[DotProductDecoupled.scala 95:28]
  assign io_out_bits = accReg; // @[DotProductDecoupled.scala 93:15]
  always @(posedge clock) begin
    if (reset) begin // @[DotProductDecoupled.scala 87:25]
      stateReg <= 1'h0; // @[DotProductDecoupled.scala 87:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      stateReg <= _GEN_3;
    end else if (stateReg) begin // @[Conditional.scala 39:67]
      stateReg <= 1'h0; // @[DotProductDecoupled.scala 108:16]
    end
    if (reset) begin // @[DotProductDecoupled.scala 88:21]
      xReg <= 32'sh0; // @[DotProductDecoupled.scala 88:21]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 99:25]
        xReg <= io_in_bits_x; // @[DotProductDecoupled.scala 100:14]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 89:21]
      yReg <= 32'sh0; // @[DotProductDecoupled.scala 89:21]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 99:25]
        yReg <= io_in_bits_y; // @[DotProductDecoupled.scala 101:14]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 90:25]
      resetReg <= 1'h0; // @[DotProductDecoupled.scala 90:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 99:25]
        resetReg <= io_in_bits_reset; // @[DotProductDecoupled.scala 102:18]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 91:23]
      accReg <= 32'sh0; // @[DotProductDecoupled.scala 91:23]
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
  input  [31:0] io_in_bits_x,
  input  [31:0] io_in_bits_y,
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
`endif // RANDOMIZE_REG_INIT
  wire  pe_clock; // @[DotProductDecoupled.scala 22:18]
  wire  pe_reset; // @[DotProductDecoupled.scala 22:18]
  wire  pe_io_in_ready; // @[DotProductDecoupled.scala 22:18]
  wire  pe_io_in_valid; // @[DotProductDecoupled.scala 22:18]
  wire [31:0] pe_io_in_bits_x; // @[DotProductDecoupled.scala 22:18]
  wire [31:0] pe_io_in_bits_y; // @[DotProductDecoupled.scala 22:18]
  wire  pe_io_in_bits_reset; // @[DotProductDecoupled.scala 22:18]
  wire  pe_io_out_valid; // @[DotProductDecoupled.scala 22:18]
  wire [31:0] pe_io_out_bits; // @[DotProductDecoupled.scala 22:18]
  reg [2:0] stateReg; // @[DotProductDecoupled.scala 16:25]
  reg [31:0] xReg; // @[DotProductDecoupled.scala 17:21]
  reg [31:0] yReg; // @[DotProductDecoupled.scala 18:21]
  reg [31:0] resReg; // @[DotProductDecoupled.scala 19:23]
  reg [1:0] cntReg; // @[DotProductDecoupled.scala 20:23]
  wire  _T_6 = 3'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_7 = 3'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _T_9 = cntReg + 2'h1; // @[DotProductDecoupled.scala 47:26]
  wire [2:0] _GEN_3 = cntReg == 2'h2 ? 3'h2 : 3'h0; // @[DotProductDecoupled.scala 48:30 DotProductDecoupled.scala 49:20 DotProductDecoupled.scala 51:20]
  wire [31:0] _GEN_4 = pe_io_in_ready ? $signed(xReg) : $signed(32'sh0); // @[DotProductDecoupled.scala 43:7 DotProductDecoupled.scala 44:25 DotProductDecoupled.scala 23:19]
  wire [31:0] _GEN_5 = pe_io_in_ready ? $signed(yReg) : $signed(32'sh0); // @[DotProductDecoupled.scala 43:7 DotProductDecoupled.scala 45:25 DotProductDecoupled.scala 24:19]
  wire  _T_11 = 3'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_8 = pe_io_out_valid ? $signed(pe_io_out_bits) : $signed(resReg); // @[DotProductDecoupled.scala 56:29 DotProductDecoupled.scala 57:16 DotProductDecoupled.scala 19:23]
  wire [2:0] _GEN_9 = pe_io_out_valid ? 3'h3 : stateReg; // @[DotProductDecoupled.scala 56:29 DotProductDecoupled.scala 58:18 DotProductDecoupled.scala 16:25]
  wire  _T_12 = 3'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_10 = io_out_ready ? 2'h1 : cntReg; // @[DotProductDecoupled.scala 62:26 DotProductDecoupled.scala 63:16 DotProductDecoupled.scala 20:23]
  wire [2:0] _GEN_11 = io_out_ready ? 3'h4 : stateReg; // @[DotProductDecoupled.scala 62:26 DotProductDecoupled.scala 64:18 DotProductDecoupled.scala 16:25]
  wire  _T_13 = 3'h4 == stateReg; // @[Conditional.scala 37:30]
  wire  _GEN_12 = pe_io_in_ready; // @[DotProductDecoupled.scala 68:28 DotProductDecoupled.scala 69:29 DotProductDecoupled.scala 25:23]
  wire [2:0] _GEN_13 = pe_io_in_ready ? 3'h0 : stateReg; // @[DotProductDecoupled.scala 68:28 DotProductDecoupled.scala 70:18 DotProductDecoupled.scala 16:25]
  wire [2:0] _GEN_15 = _T_13 ? _GEN_13 : stateReg; // @[Conditional.scala 39:67 DotProductDecoupled.scala 16:25]
  wire [1:0] _GEN_16 = _T_12 ? _GEN_10 : cntReg; // @[Conditional.scala 39:67 DotProductDecoupled.scala 20:23]
  wire [2:0] _GEN_17 = _T_12 ? _GEN_11 : _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_18 = _T_12 ? 1'h0 : _T_13 & _GEN_12; // @[Conditional.scala 39:67 DotProductDecoupled.scala 25:23]
  wire  _GEN_22 = _T_11 ? 1'h0 : _GEN_18; // @[Conditional.scala 39:67 DotProductDecoupled.scala 25:23]
  wire [31:0] _GEN_23 = _T_7 ? $signed(_GEN_4) : $signed(32'sh0); // @[Conditional.scala 39:67 DotProductDecoupled.scala 23:19]
  wire [31:0] _GEN_24 = _T_7 ? $signed(_GEN_5) : $signed(32'sh0); // @[Conditional.scala 39:67 DotProductDecoupled.scala 24:19]
  wire  _GEN_28 = _T_7 ? 1'h0 : _GEN_22; // @[Conditional.scala 39:67 DotProductDecoupled.scala 25:23]
  DecoupledMultiplyAndAccumulate pe ( // @[DotProductDecoupled.scala 22:18]
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
  assign io_in_ready = stateReg == 3'h0; // @[DotProductDecoupled.scala 30:27]
  assign io_out_valid = stateReg == 3'h3; // @[DotProductDecoupled.scala 31:28]
  assign io_out_bits = resReg; // @[DotProductDecoupled.scala 29:15]
  assign pe_clock = clock;
  assign pe_reset = reset;
  assign pe_io_in_valid = stateReg == 3'h1 | stateReg == 3'h4; // @[DotProductDecoupled.scala 26:44]
  assign pe_io_in_bits_x = _T_6 ? $signed(32'sh0) : $signed(_GEN_23); // @[Conditional.scala 40:58 DotProductDecoupled.scala 23:19]
  assign pe_io_in_bits_y = _T_6 ? $signed(32'sh0) : $signed(_GEN_24); // @[Conditional.scala 40:58 DotProductDecoupled.scala 24:19]
  assign pe_io_in_bits_reset = _T_6 ? 1'h0 : _GEN_28; // @[Conditional.scala 40:58 DotProductDecoupled.scala 25:23]
  always @(posedge clock) begin
    if (reset) begin // @[DotProductDecoupled.scala 16:25]
      stateReg <= 3'h0; // @[DotProductDecoupled.scala 16:25]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 35:25]
        stateReg <= 3'h1; // @[DotProductDecoupled.scala 38:18]
      end
    end else if (_T_7) begin // @[Conditional.scala 39:67]
      if (pe_io_in_ready) begin // @[DotProductDecoupled.scala 43:7]
        stateReg <= _GEN_3;
      end
    end else if (_T_11) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_9;
    end else begin
      stateReg <= _GEN_17;
    end
    if (reset) begin // @[DotProductDecoupled.scala 17:21]
      xReg <= 32'sh0; // @[DotProductDecoupled.scala 17:21]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 35:25]
        xReg <= io_in_bits_x; // @[DotProductDecoupled.scala 36:14]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 18:21]
      yReg <= 32'sh0; // @[DotProductDecoupled.scala 18:21]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDecoupled.scala 35:25]
        yReg <= io_in_bits_y; // @[DotProductDecoupled.scala 37:14]
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 19:23]
      resReg <= 32'sh0; // @[DotProductDecoupled.scala 19:23]
    end else if (!(_T_6)) begin // @[Conditional.scala 40:58]
      if (!(_T_7)) begin // @[Conditional.scala 39:67]
        if (_T_11) begin // @[Conditional.scala 39:67]
          resReg <= _GEN_8;
        end
      end
    end
    if (reset) begin // @[DotProductDecoupled.scala 20:23]
      cntReg <= 2'h1; // @[DotProductDecoupled.scala 20:23]
    end else if (!(_T_6)) begin // @[Conditional.scala 40:58]
      if (_T_7) begin // @[Conditional.scala 39:67]
        if (pe_io_in_ready) begin // @[DotProductDecoupled.scala 43:7]
          cntReg <= _T_9; // @[DotProductDecoupled.scala 47:16]
        end
      end else if (!(_T_11)) begin // @[Conditional.scala 39:67]
        cntReg <= _GEN_16;
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
  xReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  yReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  resReg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  cntReg = _RAND_4[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
