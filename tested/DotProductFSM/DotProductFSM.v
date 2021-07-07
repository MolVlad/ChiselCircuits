module DotProductPE(
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
  reg [31:0] accReg; // @[DotProductFSM.scala 67:23]
  wire [63:0] _T = $signed(io_x) * $signed(io_y); // @[DotProductFSM.scala 73:29]
  wire [63:0] _GEN_1 = {{32{accReg[31]}},accReg}; // @[DotProductFSM.scala 73:22]
  wire [63:0] _T_3 = $signed(_GEN_1) + $signed(_T); // @[DotProductFSM.scala 73:22]
  wire [63:0] _GEN_0 = io_reset ? $signed(64'sh0) : $signed(_T_3); // @[DotProductFSM.scala 70:19 DotProductFSM.scala 71:12 DotProductFSM.scala 73:12]
  assign io_out = accReg; // @[DotProductFSM.scala 68:10]
  always @(posedge clock) begin
    if (reset) begin // @[DotProductFSM.scala 67:23]
      accReg <= 32'sh0; // @[DotProductFSM.scala 67:23]
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
module DotProductFSM(
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
  wire  pe_clock; // @[DotProductFSM.scala 21:18]
  wire  pe_reset; // @[DotProductFSM.scala 21:18]
  wire [31:0] pe_io_x; // @[DotProductFSM.scala 21:18]
  wire [31:0] pe_io_y; // @[DotProductFSM.scala 21:18]
  wire  pe_io_reset; // @[DotProductFSM.scala 21:18]
  wire [31:0] pe_io_out; // @[DotProductFSM.scala 21:18]
  reg [1:0] stateReg; // @[DotProductFSM.scala 16:25]
  reg [31:0] xReg; // @[DotProductFSM.scala 17:21]
  reg [31:0] yReg; // @[DotProductFSM.scala 18:21]
  reg [1:0] cntReg; // @[DotProductFSM.scala 19:23]
  wire  _T_2 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_3 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _T_5 = cntReg + 2'h1; // @[DotProductFSM.scala 41:24]
  wire  _T_7 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_4 = io_out_ready ? 2'h1 : cntReg; // @[DotProductFSM.scala 50:26 DotProductFSM.scala 51:16 DotProductFSM.scala 19:23]
  wire [1:0] _GEN_6 = io_out_ready ? 2'h0 : stateReg; // @[DotProductFSM.scala 50:26 DotProductFSM.scala 53:18 DotProductFSM.scala 16:25]
  wire [31:0] _GEN_10 = _T_3 ? $signed(xReg) : $signed(32'sh0); // @[Conditional.scala 39:67 DotProductFSM.scala 39:15 DotProductFSM.scala 22:11]
  wire [31:0] _GEN_11 = _T_3 ? $signed(yReg) : $signed(32'sh0); // @[Conditional.scala 39:67 DotProductFSM.scala 40:15 DotProductFSM.scala 23:11]
  wire  _GEN_14 = _T_3 ? 1'h0 : _T_7 & io_out_ready; // @[Conditional.scala 39:67 DotProductFSM.scala 24:15]
  DotProductPE pe ( // @[DotProductFSM.scala 21:18]
    .clock(pe_clock),
    .reset(pe_reset),
    .io_x(pe_io_x),
    .io_y(pe_io_y),
    .io_reset(pe_io_reset),
    .io_out(pe_io_out)
  );
  assign io_in_ready = stateReg == 2'h0; // @[DotProductFSM.scala 27:27]
  assign io_out_valid = stateReg == 2'h2; // @[DotProductFSM.scala 28:28]
  assign io_out_bits = pe_io_out; // @[DotProductFSM.scala 25:15]
  assign pe_clock = clock;
  assign pe_reset = reset;
  assign pe_io_x = _T_2 ? $signed(32'sh0) : $signed(_GEN_10); // @[Conditional.scala 40:58 DotProductFSM.scala 22:11]
  assign pe_io_y = _T_2 ? $signed(32'sh0) : $signed(_GEN_11); // @[Conditional.scala 40:58 DotProductFSM.scala 23:11]
  assign pe_io_reset = _T_2 ? 1'h0 : _GEN_14; // @[Conditional.scala 40:58 DotProductFSM.scala 24:15]
  always @(posedge clock) begin
    if (reset) begin // @[DotProductFSM.scala 16:25]
      stateReg <= 2'h0; // @[DotProductFSM.scala 16:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductFSM.scala 32:25]
        stateReg <= 2'h1; // @[DotProductFSM.scala 35:18]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (cntReg == 2'h2) begin // @[DotProductFSM.scala 43:28]
        stateReg <= 2'h2; // @[DotProductFSM.scala 44:18]
      end else begin
        stateReg <= 2'h0; // @[DotProductFSM.scala 46:18]
      end
    end else if (_T_7) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_6;
    end
    if (reset) begin // @[DotProductFSM.scala 17:21]
      xReg <= 32'sh0; // @[DotProductFSM.scala 17:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductFSM.scala 32:25]
        xReg <= io_in_bits_x; // @[DotProductFSM.scala 33:14]
      end
    end
    if (reset) begin // @[DotProductFSM.scala 18:21]
      yReg <= 32'sh0; // @[DotProductFSM.scala 18:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProductFSM.scala 32:25]
        yReg <= io_in_bits_y; // @[DotProductFSM.scala 34:14]
      end
    end
    if (reset) begin // @[DotProductFSM.scala 19:23]
      cntReg <= 2'h1; // @[DotProductFSM.scala 19:23]
    end else if (!(_T_2)) begin // @[Conditional.scala 40:58]
      if (_T_3) begin // @[Conditional.scala 39:67]
        cntReg <= _T_5; // @[DotProductFSM.scala 41:14]
      end else if (_T_7) begin // @[Conditional.scala 39:67]
        cntReg <= _GEN_4;
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
