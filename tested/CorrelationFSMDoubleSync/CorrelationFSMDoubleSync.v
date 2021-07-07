module SynchronizedMultiplyAndAccumulate(
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
  reg [31:0] xReg; // @[CorrelationFSMDoubleSync.scala 96:21]
  reg [31:0] yReg; // @[CorrelationFSMDoubleSync.scala 97:21]
  reg  resetReg; // @[CorrelationFSMDoubleSync.scala 98:25]
  reg [31:0] accReg; // @[CorrelationFSMDoubleSync.scala 100:23]
  wire [63:0] _T = $signed(xReg) * $signed(yReg); // @[CorrelationFSMDoubleSync.scala 106:29]
  wire [63:0] _GEN_1 = {{32{accReg[31]}},accReg}; // @[CorrelationFSMDoubleSync.scala 106:22]
  wire [63:0] _T_3 = $signed(_GEN_1) + $signed(_T); // @[CorrelationFSMDoubleSync.scala 106:22]
  wire [63:0] _GEN_0 = resetReg ? $signed(64'sh0) : $signed(_T_3); // @[CorrelationFSMDoubleSync.scala 103:19 CorrelationFSMDoubleSync.scala 104:12 CorrelationFSMDoubleSync.scala 106:12]
  assign io_out = accReg; // @[CorrelationFSMDoubleSync.scala 101:10]
  always @(posedge clock) begin
    if (reset) begin // @[CorrelationFSMDoubleSync.scala 96:21]
      xReg <= 32'sh0; // @[CorrelationFSMDoubleSync.scala 96:21]
    end else begin
      xReg <= io_x; // @[CorrelationFSMDoubleSync.scala 96:21]
    end
    if (reset) begin // @[CorrelationFSMDoubleSync.scala 97:21]
      yReg <= 32'sh0; // @[CorrelationFSMDoubleSync.scala 97:21]
    end else begin
      yReg <= io_y; // @[CorrelationFSMDoubleSync.scala 97:21]
    end
    if (reset) begin // @[CorrelationFSMDoubleSync.scala 98:25]
      resetReg <= 1'h0; // @[CorrelationFSMDoubleSync.scala 98:25]
    end else begin
      resetReg <= io_reset; // @[CorrelationFSMDoubleSync.scala 98:25]
    end
    if (reset) begin // @[CorrelationFSMDoubleSync.scala 100:23]
      accReg <= 32'sh0; // @[CorrelationFSMDoubleSync.scala 100:23]
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
module CorrelationFSMDoubleSync(
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
`endif // RANDOMIZE_REG_INIT
  wire  pe_clock; // @[CorrelationFSMDoubleSync.scala 26:18]
  wire  pe_reset; // @[CorrelationFSMDoubleSync.scala 26:18]
  wire [31:0] pe_io_x; // @[CorrelationFSMDoubleSync.scala 26:18]
  wire [31:0] pe_io_y; // @[CorrelationFSMDoubleSync.scala 26:18]
  wire  pe_io_reset; // @[CorrelationFSMDoubleSync.scala 26:18]
  wire [31:0] pe_io_out; // @[CorrelationFSMDoubleSync.scala 26:18]
  reg [1:0] stateReg; // @[CorrelationFSMDoubleSync.scala 13:25]
  reg [1:0] computingStageReg; // @[CorrelationFSMDoubleSync.scala 16:34]
  reg [31:0] x0Reg; // @[CorrelationFSMDoubleSync.scala 18:22]
  reg [31:0] x1Reg; // @[CorrelationFSMDoubleSync.scala 19:22]
  reg [31:0] x2Reg; // @[CorrelationFSMDoubleSync.scala 20:22]
  wire  _T_2 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_3 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_4 = 2'h0 == computingStageReg; // @[Conditional.scala 37:30]
  wire  _T_5 = 2'h1 == computingStageReg; // @[Conditional.scala 37:30]
  wire  _T_6 = 2'h2 == computingStageReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_5 = _T_6 ? $signed(x2Reg) : $signed(32'sh0); // @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 57:19 CorrelationFSMDoubleSync.scala 28:11]
  wire [2:0] _GEN_6 = _T_6 ? $signed(3'sh3) : $signed(3'sh0); // @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 58:19 CorrelationFSMDoubleSync.scala 29:11]
  wire [31:0] _GEN_7 = _T_5 ? $signed(x1Reg) : $signed(_GEN_5); // @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 53:19]
  wire [2:0] _GEN_8 = _T_5 ? $signed(3'sh2) : $signed(_GEN_6); // @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 54:19]
  wire [31:0] _GEN_9 = _T_4 ? $signed(x0Reg) : $signed(_GEN_7); // @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 49:19]
  wire [2:0] _GEN_10 = _T_4 ? $signed(3'sh1) : $signed(_GEN_8); // @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 50:19]
  wire  _T_7 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_11 = _T_6 ? 2'h3 : stateReg; // @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 75:20 CorrelationFSMDoubleSync.scala 13:25]
  wire [1:0] _GEN_12 = _T_5 ? 2'h2 : computingStageReg; // @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 71:29 CorrelationFSMDoubleSync.scala 16:34]
  wire [1:0] _GEN_13 = _T_5 ? 2'h1 : _GEN_11; // @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 72:20]
  wire [1:0] _GEN_14 = _T_4 ? 2'h1 : _GEN_12; // @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 67:29]
  wire [1:0] _GEN_15 = _T_4 ? 2'h1 : _GEN_13; // @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 68:20]
  wire  _T_11 = 2'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_17 = io_out_ready ? 2'h0 : stateReg; // @[CorrelationFSMDoubleSync.scala 80:26 CorrelationFSMDoubleSync.scala 82:18 CorrelationFSMDoubleSync.scala 13:25]
  wire [1:0] _GEN_19 = _T_11 ? _GEN_17 : stateReg; // @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 13:25]
  wire  _GEN_22 = _T_7 ? 1'h0 : _T_11 & io_out_ready; // @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 30:15]
  wire [31:0] _GEN_23 = _T_3 ? $signed(_GEN_9) : $signed(32'sh0); // @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 28:11]
  wire [2:0] _GEN_24 = _T_3 ? $signed(_GEN_10) : $signed(3'sh0); // @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 29:11]
  wire  _GEN_27 = _T_3 ? 1'h0 : _GEN_22; // @[Conditional.scala 39:67 CorrelationFSMDoubleSync.scala 30:15]
  wire [2:0] _GEN_34 = _T_2 ? $signed(3'sh0) : $signed(_GEN_24); // @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 29:11]
  SynchronizedMultiplyAndAccumulate pe ( // @[CorrelationFSMDoubleSync.scala 26:18]
    .clock(pe_clock),
    .reset(pe_reset),
    .io_x(pe_io_x),
    .io_y(pe_io_y),
    .io_reset(pe_io_reset),
    .io_out(pe_io_out)
  );
  assign io_in_ready = stateReg == 2'h0; // @[CorrelationFSMDoubleSync.scala 33:27]
  assign io_out_valid = stateReg == 2'h3; // @[CorrelationFSMDoubleSync.scala 34:28]
  assign io_out_bits = pe_io_out; // @[CorrelationFSMDoubleSync.scala 31:15]
  assign pe_clock = clock;
  assign pe_reset = reset;
  assign pe_io_x = _T_2 ? $signed(32'sh0) : $signed(_GEN_23); // @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 28:11]
  assign pe_io_y = {{29{_GEN_34[2]}},_GEN_34}; // @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 29:11]
  assign pe_io_reset = _T_2 ? 1'h0 : _GEN_27; // @[Conditional.scala 40:58 CorrelationFSMDoubleSync.scala 30:15]
  always @(posedge clock) begin
    if (reset) begin // @[CorrelationFSMDoubleSync.scala 13:25]
      stateReg <= 2'h0; // @[CorrelationFSMDoubleSync.scala 13:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSMDoubleSync.scala 38:25]
        stateReg <= 2'h1; // @[CorrelationFSMDoubleSync.scala 42:18]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      stateReg <= 2'h2; // @[CorrelationFSMDoubleSync.scala 62:16]
    end else if (_T_7) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_15;
    end else begin
      stateReg <= _GEN_19;
    end
    if (reset) begin // @[CorrelationFSMDoubleSync.scala 16:34]
      computingStageReg <= 2'h0; // @[CorrelationFSMDoubleSync.scala 16:34]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSMDoubleSync.scala 38:25]
        computingStageReg <= 2'h0; // @[CorrelationFSMDoubleSync.scala 43:27]
      end
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_7) begin // @[Conditional.scala 39:67]
        computingStageReg <= _GEN_14;
      end
    end
    if (reset) begin // @[CorrelationFSMDoubleSync.scala 18:22]
      x0Reg <= 32'sh0; // @[CorrelationFSMDoubleSync.scala 18:22]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSMDoubleSync.scala 38:25]
        x0Reg <= x1Reg; // @[CorrelationFSMDoubleSync.scala 39:15]
      end
    end
    if (reset) begin // @[CorrelationFSMDoubleSync.scala 19:22]
      x1Reg <= 32'sh0; // @[CorrelationFSMDoubleSync.scala 19:22]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSMDoubleSync.scala 38:25]
        x1Reg <= x2Reg; // @[CorrelationFSMDoubleSync.scala 40:15]
      end
    end
    if (reset) begin // @[CorrelationFSMDoubleSync.scala 20:22]
      x2Reg <= 32'sh0; // @[CorrelationFSMDoubleSync.scala 20:22]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSMDoubleSync.scala 38:25]
        x2Reg <= io_in_bits; // @[CorrelationFSMDoubleSync.scala 41:15]
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
  computingStageReg = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  x0Reg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  x1Reg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  x2Reg = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
