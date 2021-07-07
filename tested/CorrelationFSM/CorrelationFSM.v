module MultiplyAndAccumulate(
  input         clock,
  input         reset,
  input  [31:0] io_x,
  input  [31:0] io_y,
  input         io_reset,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] accReg; // @[CorrelationFSM.scala 83:23]
  wire [63:0] _T = $signed(io_x) * $signed(io_y); // @[CorrelationFSM.scala 89:29]
  wire [63:0] _GEN_1 = {{32{accReg[31]}},accReg}; // @[CorrelationFSM.scala 89:22]
  wire [63:0] _T_3 = $signed(_GEN_1) + $signed(_T); // @[CorrelationFSM.scala 89:22]
  wire [63:0] _GEN_0 = io_reset ? $signed(64'sh0) : $signed(_T_3); // @[CorrelationFSM.scala 86:19 CorrelationFSM.scala 87:12 CorrelationFSM.scala 89:12]
  assign io_out = accReg; // @[CorrelationFSM.scala 84:10]
  always @(posedge clock) begin
    if (reset) begin // @[CorrelationFSM.scala 83:23]
      accReg <= 32'sh0; // @[CorrelationFSM.scala 83:23]
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
  accReg = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CorrelationFSM(
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
  wire  pe_clock; // @[CorrelationFSM.scala 27:18]
  wire  pe_reset; // @[CorrelationFSM.scala 27:18]
  wire [31:0] pe_io_x; // @[CorrelationFSM.scala 27:18]
  wire [31:0] pe_io_y; // @[CorrelationFSM.scala 27:18]
  wire  pe_io_reset; // @[CorrelationFSM.scala 27:18]
  wire [31:0] pe_io_out; // @[CorrelationFSM.scala 27:18]
  reg [1:0] stateReg; // @[CorrelationFSM.scala 14:25]
  reg [1:0] computingStageReg; // @[CorrelationFSM.scala 17:34]
  reg [31:0] x0Reg; // @[CorrelationFSM.scala 19:22]
  reg [31:0] x1Reg; // @[CorrelationFSM.scala 20:22]
  reg [31:0] x2Reg; // @[CorrelationFSM.scala 21:22]
  wire  _T_2 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_3 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_4 = 2'h0 == computingStageReg; // @[Conditional.scala 37:30]
  wire  _T_5 = 2'h1 == computingStageReg; // @[Conditional.scala 37:30]
  wire  _T_6 = 2'h2 == computingStageReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_5 = _T_6 ? $signed(x2Reg) : $signed(32'sh0); // @[Conditional.scala 39:67 CorrelationFSM.scala 60:19 CorrelationFSM.scala 29:11]
  wire [2:0] _GEN_6 = _T_6 ? $signed(3'sh3) : $signed(3'sh0); // @[Conditional.scala 39:67 CorrelationFSM.scala 61:19 CorrelationFSM.scala 30:11]
  wire [1:0] _GEN_7 = _T_6 ? 2'h2 : stateReg; // @[Conditional.scala 39:67 CorrelationFSM.scala 62:20 CorrelationFSM.scala 14:25]
  wire [31:0] _GEN_8 = _T_5 ? $signed(x1Reg) : $signed(_GEN_5); // @[Conditional.scala 39:67 CorrelationFSM.scala 55:19]
  wire [2:0] _GEN_9 = _T_5 ? $signed(3'sh2) : $signed(_GEN_6); // @[Conditional.scala 39:67 CorrelationFSM.scala 56:19]
  wire [1:0] _GEN_10 = _T_5 ? 2'h2 : computingStageReg; // @[Conditional.scala 39:67 CorrelationFSM.scala 57:29 CorrelationFSM.scala 17:34]
  wire [1:0] _GEN_11 = _T_5 ? stateReg : _GEN_7; // @[Conditional.scala 39:67 CorrelationFSM.scala 14:25]
  wire [31:0] _GEN_12 = _T_4 ? $signed(x0Reg) : $signed(_GEN_8); // @[Conditional.scala 40:58 CorrelationFSM.scala 50:19]
  wire [2:0] _GEN_13 = _T_4 ? $signed(3'sh1) : $signed(_GEN_9); // @[Conditional.scala 40:58 CorrelationFSM.scala 51:19]
  wire  _T_7 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_17 = io_out_ready ? 2'h0 : stateReg; // @[CorrelationFSM.scala 67:26 CorrelationFSM.scala 69:18 CorrelationFSM.scala 14:25]
  wire [31:0] _GEN_20 = _T_3 ? $signed(_GEN_12) : $signed(32'sh0); // @[Conditional.scala 39:67 CorrelationFSM.scala 29:11]
  wire [2:0] _GEN_21 = _T_3 ? $signed(_GEN_13) : $signed(3'sh0); // @[Conditional.scala 39:67 CorrelationFSM.scala 30:11]
  wire  _GEN_24 = _T_3 ? 1'h0 : _T_7 & io_out_ready; // @[Conditional.scala 39:67 CorrelationFSM.scala 31:15]
  wire [2:0] _GEN_31 = _T_2 ? $signed(3'sh0) : $signed(_GEN_21); // @[Conditional.scala 40:58 CorrelationFSM.scala 30:11]
  MultiplyAndAccumulate pe ( // @[CorrelationFSM.scala 27:18]
    .clock(pe_clock),
    .reset(pe_reset),
    .io_x(pe_io_x),
    .io_y(pe_io_y),
    .io_reset(pe_io_reset),
    .io_out(pe_io_out)
  );
  assign io_in_ready = stateReg == 2'h0; // @[CorrelationFSM.scala 34:27]
  assign io_out_valid = stateReg == 2'h2; // @[CorrelationFSM.scala 35:28]
  assign io_out_bits = pe_io_out; // @[CorrelationFSM.scala 32:15]
  assign pe_clock = clock;
  assign pe_reset = reset;
  assign pe_io_x = _T_2 ? $signed(32'sh0) : $signed(_GEN_20); // @[Conditional.scala 40:58 CorrelationFSM.scala 29:11]
  assign pe_io_y = {{29{_GEN_31[2]}},_GEN_31}; // @[Conditional.scala 40:58 CorrelationFSM.scala 30:11]
  assign pe_io_reset = _T_2 ? 1'h0 : _GEN_24; // @[Conditional.scala 40:58 CorrelationFSM.scala 31:15]
  always @(posedge clock) begin
    if (reset) begin // @[CorrelationFSM.scala 14:25]
      stateReg <= 2'h0; // @[CorrelationFSM.scala 14:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSM.scala 39:25]
        stateReg <= 2'h1; // @[CorrelationFSM.scala 43:18]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (!(_T_4)) begin // @[Conditional.scala 40:58]
        stateReg <= _GEN_11;
      end
    end else if (_T_7) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_17;
    end
    if (reset) begin // @[CorrelationFSM.scala 17:34]
      computingStageReg <= 2'h0; // @[CorrelationFSM.scala 17:34]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSM.scala 39:25]
        computingStageReg <= 2'h0; // @[CorrelationFSM.scala 44:27]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (_T_4) begin // @[Conditional.scala 40:58]
        computingStageReg <= 2'h1; // @[CorrelationFSM.scala 52:29]
      end else begin
        computingStageReg <= _GEN_10;
      end
    end
    if (reset) begin // @[CorrelationFSM.scala 19:22]
      x0Reg <= 32'sh0; // @[CorrelationFSM.scala 19:22]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSM.scala 39:25]
        x0Reg <= x1Reg; // @[CorrelationFSM.scala 40:15]
      end
    end
    if (reset) begin // @[CorrelationFSM.scala 20:22]
      x1Reg <= 32'sh0; // @[CorrelationFSM.scala 20:22]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSM.scala 39:25]
        x1Reg <= x2Reg; // @[CorrelationFSM.scala 41:15]
      end
    end
    if (reset) begin // @[CorrelationFSM.scala 21:22]
      x2Reg <= 32'sh0; // @[CorrelationFSM.scala 21:22]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationFSM.scala 39:25]
        x2Reg <= io_in_bits; // @[CorrelationFSM.scala 42:15]
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
