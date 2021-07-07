module SynchronizedDotProductPE(
  input         clock,
  input         reset,
  input  [31:0] io_x,
  input  [31:0] io_y,
  input         io_reset,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] xReg; // @[DotProductDoubleSync.scala 70:21]
  reg [31:0] yReg; // @[DotProductDoubleSync.scala 71:21]
  reg  resetReg; // @[DotProductDoubleSync.scala 72:25]
  reg [31:0] accReg; // @[DotProductDoubleSync.scala 74:23]
  wire [63:0] _T = $signed(xReg) * $signed(yReg); // @[DotProductDoubleSync.scala 80:29]
  wire [63:0] _GEN_1 = {{32{accReg[31]}},accReg}; // @[DotProductDoubleSync.scala 80:22]
  wire [63:0] _T_3 = $signed(_GEN_1) + $signed(_T); // @[DotProductDoubleSync.scala 80:22]
  wire [63:0] _GEN_0 = resetReg ? $signed(64'sh0) : $signed(_T_3); // @[DotProductDoubleSync.scala 77:19 DotProductDoubleSync.scala 78:12 DotProductDoubleSync.scala 80:12]
  assign io_out = accReg; // @[DotProductDoubleSync.scala 75:10]
  always @(posedge clock) begin
    if (reset) begin // @[DotProductDoubleSync.scala 70:21]
      xReg <= 32'sh0; // @[DotProductDoubleSync.scala 70:21]
    end else begin
      xReg <= io_x; // @[DotProductDoubleSync.scala 70:21]
    end
    if (reset) begin // @[DotProductDoubleSync.scala 71:21]
      yReg <= 32'sh0; // @[DotProductDoubleSync.scala 71:21]
    end else begin
      yReg <= io_y; // @[DotProductDoubleSync.scala 71:21]
    end
    if (reset) begin // @[DotProductDoubleSync.scala 72:25]
      resetReg <= 1'h0; // @[DotProductDoubleSync.scala 72:25]
    end else begin
      resetReg <= io_reset; // @[DotProductDoubleSync.scala 72:25]
    end
    if (reset) begin // @[DotProductDoubleSync.scala 74:23]
      accReg <= 32'sh0; // @[DotProductDoubleSync.scala 74:23]
    end else begin
      accReg <= _GEN_0[31:0];
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
  xReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  yReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  resetReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  accReg = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DotProductDoubleSync(
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
`endif // RANDOMIZE_REG_INIT
  wire  pe_clock; // @[DotProductDoubleSync.scala 21:18]
  wire  pe_reset; // @[DotProductDoubleSync.scala 21:18]
  wire [31:0] pe_io_x; // @[DotProductDoubleSync.scala 21:18]
  wire [31:0] pe_io_y; // @[DotProductDoubleSync.scala 21:18]
  wire  pe_io_reset; // @[DotProductDoubleSync.scala 21:18]
  wire [31:0] pe_io_out; // @[DotProductDoubleSync.scala 21:18]
  reg [1:0] stateReg; // @[DotProductDoubleSync.scala 16:25]
  reg [31:0] xReg; // @[DotProductDoubleSync.scala 17:21]
  reg [31:0] yReg; // @[DotProductDoubleSync.scala 18:21]
  reg [1:0] cntReg; // @[DotProductDoubleSync.scala 19:23]
  wire  _T_2 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_3 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_4 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _T_6 = cntReg + 2'h1; // @[DotProductDoubleSync.scala 44:24]
  wire [1:0] _GEN_3 = cntReg == 2'h2 ? 2'h3 : 2'h0; // @[DotProductDoubleSync.scala 46:28 DotProductDoubleSync.scala 47:18 DotProductDoubleSync.scala 49:18]
  wire  _T_8 = 2'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_4 = io_out_ready ? 2'h1 : cntReg; // @[DotProductDoubleSync.scala 53:26 DotProductDoubleSync.scala 54:16 DotProductDoubleSync.scala 19:23]
  wire [1:0] _GEN_6 = io_out_ready ? 2'h0 : stateReg; // @[DotProductDoubleSync.scala 53:26 DotProductDoubleSync.scala 56:18 DotProductDoubleSync.scala 16:25]
  wire [1:0] _GEN_7 = _T_8 ? _GEN_4 : cntReg; // @[Conditional.scala 39:67 DotProductDoubleSync.scala 19:23]
  wire [1:0] _GEN_9 = _T_8 ? _GEN_6 : stateReg; // @[Conditional.scala 39:67 DotProductDoubleSync.scala 16:25]
  wire  _GEN_12 = _T_4 ? 1'h0 : _T_8 & io_out_ready; // @[Conditional.scala 39:67 DotProductDoubleSync.scala 24:15]
  wire [31:0] _GEN_13 = _T_3 ? $signed(xReg) : $signed(32'sh0); // @[Conditional.scala 39:67 DotProductDoubleSync.scala 39:15 DotProductDoubleSync.scala 22:11]
  wire [31:0] _GEN_14 = _T_3 ? $signed(yReg) : $signed(32'sh0); // @[Conditional.scala 39:67 DotProductDoubleSync.scala 40:15 DotProductDoubleSync.scala 23:11]
  wire  _GEN_17 = _T_3 ? 1'h0 : _GEN_12; // @[Conditional.scala 39:67 DotProductDoubleSync.scala 24:15]
  SynchronizedDotProductPE pe ( // @[DotProductDoubleSync.scala 21:18]
    .clock(pe_clock),
    .reset(pe_reset),
    .io_x(pe_io_x),
    .io_y(pe_io_y),
    .io_reset(pe_io_reset),
    .io_out(pe_io_out)
  );
  assign io_in_ready = stateReg == 2'h0; // @[DotProductDoubleSync.scala 27:27]
  assign io_out_valid = stateReg == 2'h3; // @[DotProductDoubleSync.scala 28:28]
  assign io_out_bits = pe_io_out; // @[DotProductDoubleSync.scala 25:15]
  assign pe_clock = clock;
  assign pe_reset = reset;
  assign pe_io_x = _T_2 ? $signed(32'sh0) : $signed(_GEN_13); // @[Conditional.scala 40:58 DotProductDoubleSync.scala 22:11]
  assign pe_io_y = _T_2 ? $signed(32'sh0) : $signed(_GEN_14); // @[Conditional.scala 40:58 DotProductDoubleSync.scala 23:11]
  assign pe_io_reset = _T_2 ? 1'h0 : _GEN_17; // @[Conditional.scala 40:58 DotProductDoubleSync.scala 24:15]
  always @(posedge clock) begin
    if (reset) begin // @[DotProductDoubleSync.scala 16:25]
      stateReg <= 2'h0; // @[DotProductDoubleSync.scala 16:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDoubleSync.scala 32:25]
        stateReg <= 2'h1; // @[DotProductDoubleSync.scala 35:18]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      stateReg <= 2'h2; // @[DotProductDoubleSync.scala 41:16]
    end else if (_T_4) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_3;
    end else begin
      stateReg <= _GEN_9;
    end
    if (reset) begin // @[DotProductDoubleSync.scala 17:21]
      xReg <= 32'sh0; // @[DotProductDoubleSync.scala 17:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDoubleSync.scala 32:25]
        xReg <= io_in_bits_x; // @[DotProductDoubleSync.scala 33:14]
      end
    end
    if (reset) begin // @[DotProductDoubleSync.scala 18:21]
      yReg <= 32'sh0; // @[DotProductDoubleSync.scala 18:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductDoubleSync.scala 32:25]
        yReg <= io_in_bits_y; // @[DotProductDoubleSync.scala 34:14]
      end
    end
    if (reset) begin // @[DotProductDoubleSync.scala 19:23]
      cntReg <= 2'h1; // @[DotProductDoubleSync.scala 19:23]
    end else if (!(_T_2)) begin // @[Conditional.scala 40:58]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        if (_T_4) begin // @[Conditional.scala 39:67]
          cntReg <= _T_6; // @[DotProductDoubleSync.scala 44:14]
        end else begin
          cntReg <= _GEN_7;
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
  stateReg = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  xReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  yReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  cntReg = _RAND_3[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
