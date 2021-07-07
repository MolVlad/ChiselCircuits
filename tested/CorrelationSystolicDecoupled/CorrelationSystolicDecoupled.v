module DecoupledPE(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_x,
  input  [31:0] io_in_bits_w,
  input  [31:0] io_in_bits_prev,
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
  reg [1:0] stateReg; // @[CorrelationSystolicDecoupled.scala 82:25]
  reg [31:0] xReg; // @[CorrelationSystolicDecoupled.scala 83:21]
  reg [31:0] wReg; // @[CorrelationSystolicDecoupled.scala 84:21]
  reg [31:0] prevReg; // @[CorrelationSystolicDecoupled.scala 85:24]
  reg [31:0] accReg; // @[CorrelationSystolicDecoupled.scala 86:23]
  reg [31:0] resReg; // @[CorrelationSystolicDecoupled.scala 87:23]
  wire  _T_2 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_3 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [63:0] _T_4 = $signed(xReg) * $signed(wReg); // @[CorrelationSystolicDecoupled.scala 106:31]
  wire [63:0] _GEN_15 = {{32{accReg[31]}},accReg}; // @[CorrelationSystolicDecoupled.scala 106:24]
  wire [63:0] _T_7 = $signed(_GEN_15) + $signed(_T_4); // @[CorrelationSystolicDecoupled.scala 106:24]
  wire  _T_8 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_4 = io_out_ready ? 2'h0 : stateReg; // @[CorrelationSystolicDecoupled.scala 109:26 CorrelationSystolicDecoupled.scala 110:18 CorrelationSystolicDecoupled.scala 82:25]
  wire [63:0] _GEN_8 = _T_3 ? $signed(_T_7) : $signed({{32{resReg[31]}},resReg}); // @[Conditional.scala 39:67 CorrelationSystolicDecoupled.scala 106:14 CorrelationSystolicDecoupled.scala 87:23]
  wire [63:0] _GEN_14 = _T_2 ? $signed({{32{resReg[31]}},resReg}) : $signed(_GEN_8); // @[Conditional.scala 40:58 CorrelationSystolicDecoupled.scala 87:23]
  assign io_in_ready = stateReg == 2'h0; // @[CorrelationSystolicDecoupled.scala 90:27]
  assign io_out_valid = stateReg == 2'h2; // @[CorrelationSystolicDecoupled.scala 91:28]
  assign io_out_bits = resReg; // @[CorrelationSystolicDecoupled.scala 89:15]
  always @(posedge clock) begin
    if (reset) begin // @[CorrelationSystolicDecoupled.scala 82:25]
      stateReg <= 2'h0; // @[CorrelationSystolicDecoupled.scala 82:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationSystolicDecoupled.scala 95:25]
        stateReg <= 2'h1; // @[CorrelationSystolicDecoupled.scala 100:18]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      stateReg <= 2'h2; // @[CorrelationSystolicDecoupled.scala 104:16]
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_4;
    end
    if (reset) begin // @[CorrelationSystolicDecoupled.scala 83:21]
      xReg <= 32'sh0; // @[CorrelationSystolicDecoupled.scala 83:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationSystolicDecoupled.scala 95:25]
        xReg <= io_in_bits_x; // @[CorrelationSystolicDecoupled.scala 96:14]
      end
    end
    if (reset) begin // @[CorrelationSystolicDecoupled.scala 84:21]
      wReg <= 32'sh0; // @[CorrelationSystolicDecoupled.scala 84:21]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationSystolicDecoupled.scala 95:25]
        wReg <= io_in_bits_w; // @[CorrelationSystolicDecoupled.scala 97:14]
      end
    end
    if (reset) begin // @[CorrelationSystolicDecoupled.scala 85:24]
      prevReg <= 32'sh0; // @[CorrelationSystolicDecoupled.scala 85:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationSystolicDecoupled.scala 95:25]
        prevReg <= io_in_bits_prev; // @[CorrelationSystolicDecoupled.scala 98:17]
      end
    end
    if (reset) begin // @[CorrelationSystolicDecoupled.scala 86:23]
      accReg <= 32'sh0; // @[CorrelationSystolicDecoupled.scala 86:23]
    end else if (!(_T_2)) begin // @[Conditional.scala 40:58]
      if (_T_3) begin // @[Conditional.scala 39:67]
        accReg <= prevReg; // @[CorrelationSystolicDecoupled.scala 105:14]
      end
    end
    if (reset) begin // @[CorrelationSystolicDecoupled.scala 87:23]
      resReg <= 32'sh0; // @[CorrelationSystolicDecoupled.scala 87:23]
    end else begin
      resReg <= _GEN_14[31:0];
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
  wReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  prevReg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  accReg = _RAND_4[31:0];
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
module CorrelationSystolicDecoupled(
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
`endif // RANDOMIZE_REG_INIT
  wire  pe0_clock; // @[CorrelationSystolicDecoupled.scala 20:19]
  wire  pe0_reset; // @[CorrelationSystolicDecoupled.scala 20:19]
  wire  pe0_io_in_ready; // @[CorrelationSystolicDecoupled.scala 20:19]
  wire  pe0_io_in_valid; // @[CorrelationSystolicDecoupled.scala 20:19]
  wire [31:0] pe0_io_in_bits_x; // @[CorrelationSystolicDecoupled.scala 20:19]
  wire [31:0] pe0_io_in_bits_w; // @[CorrelationSystolicDecoupled.scala 20:19]
  wire [31:0] pe0_io_in_bits_prev; // @[CorrelationSystolicDecoupled.scala 20:19]
  wire  pe0_io_out_ready; // @[CorrelationSystolicDecoupled.scala 20:19]
  wire  pe0_io_out_valid; // @[CorrelationSystolicDecoupled.scala 20:19]
  wire [31:0] pe0_io_out_bits; // @[CorrelationSystolicDecoupled.scala 20:19]
  wire  pe1_clock; // @[CorrelationSystolicDecoupled.scala 21:19]
  wire  pe1_reset; // @[CorrelationSystolicDecoupled.scala 21:19]
  wire  pe1_io_in_ready; // @[CorrelationSystolicDecoupled.scala 21:19]
  wire  pe1_io_in_valid; // @[CorrelationSystolicDecoupled.scala 21:19]
  wire [31:0] pe1_io_in_bits_x; // @[CorrelationSystolicDecoupled.scala 21:19]
  wire [31:0] pe1_io_in_bits_w; // @[CorrelationSystolicDecoupled.scala 21:19]
  wire [31:0] pe1_io_in_bits_prev; // @[CorrelationSystolicDecoupled.scala 21:19]
  wire  pe1_io_out_ready; // @[CorrelationSystolicDecoupled.scala 21:19]
  wire  pe1_io_out_valid; // @[CorrelationSystolicDecoupled.scala 21:19]
  wire [31:0] pe1_io_out_bits; // @[CorrelationSystolicDecoupled.scala 21:19]
  wire  pe2_clock; // @[CorrelationSystolicDecoupled.scala 22:19]
  wire  pe2_reset; // @[CorrelationSystolicDecoupled.scala 22:19]
  wire  pe2_io_in_ready; // @[CorrelationSystolicDecoupled.scala 22:19]
  wire  pe2_io_in_valid; // @[CorrelationSystolicDecoupled.scala 22:19]
  wire [31:0] pe2_io_in_bits_x; // @[CorrelationSystolicDecoupled.scala 22:19]
  wire [31:0] pe2_io_in_bits_w; // @[CorrelationSystolicDecoupled.scala 22:19]
  wire [31:0] pe2_io_in_bits_prev; // @[CorrelationSystolicDecoupled.scala 22:19]
  wire  pe2_io_out_ready; // @[CorrelationSystolicDecoupled.scala 22:19]
  wire  pe2_io_out_valid; // @[CorrelationSystolicDecoupled.scala 22:19]
  wire [31:0] pe2_io_out_bits; // @[CorrelationSystolicDecoupled.scala 22:19]
  reg [1:0] stateReg; // @[CorrelationSystolicDecoupled.scala 13:25]
  reg [31:0] resReg; // @[CorrelationSystolicDecoupled.scala 15:23]
  reg [31:0] xReg; // @[CorrelationSystolicDecoupled.scala 32:21]
  wire  _T_4 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_5 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_6 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_3 = pe2_io_out_valid ? $signed(pe2_io_out_bits) : $signed(resReg); // @[CorrelationSystolicDecoupled.scala 58:30 CorrelationSystolicDecoupled.scala 59:16 CorrelationSystolicDecoupled.scala 15:23]
  wire [1:0] _GEN_4 = pe2_io_out_valid ? 2'h3 : stateReg; // @[CorrelationSystolicDecoupled.scala 58:30 CorrelationSystolicDecoupled.scala 60:18 CorrelationSystolicDecoupled.scala 13:25]
  wire  _T_7 = 2'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_5 = io_out_ready ? 2'h0 : stateReg; // @[CorrelationSystolicDecoupled.scala 64:26 CorrelationSystolicDecoupled.scala 65:18 CorrelationSystolicDecoupled.scala 13:25]
  wire [1:0] _GEN_6 = _T_7 ? _GEN_5 : stateReg; // @[Conditional.scala 39:67 CorrelationSystolicDecoupled.scala 13:25]
  DecoupledPE pe0 ( // @[CorrelationSystolicDecoupled.scala 20:19]
    .clock(pe0_clock),
    .reset(pe0_reset),
    .io_in_ready(pe0_io_in_ready),
    .io_in_valid(pe0_io_in_valid),
    .io_in_bits_x(pe0_io_in_bits_x),
    .io_in_bits_w(pe0_io_in_bits_w),
    .io_in_bits_prev(pe0_io_in_bits_prev),
    .io_out_ready(pe0_io_out_ready),
    .io_out_valid(pe0_io_out_valid),
    .io_out_bits(pe0_io_out_bits)
  );
  DecoupledPE pe1 ( // @[CorrelationSystolicDecoupled.scala 21:19]
    .clock(pe1_clock),
    .reset(pe1_reset),
    .io_in_ready(pe1_io_in_ready),
    .io_in_valid(pe1_io_in_valid),
    .io_in_bits_x(pe1_io_in_bits_x),
    .io_in_bits_w(pe1_io_in_bits_w),
    .io_in_bits_prev(pe1_io_in_bits_prev),
    .io_out_ready(pe1_io_out_ready),
    .io_out_valid(pe1_io_out_valid),
    .io_out_bits(pe1_io_out_bits)
  );
  DecoupledPE pe2 ( // @[CorrelationSystolicDecoupled.scala 22:19]
    .clock(pe2_clock),
    .reset(pe2_reset),
    .io_in_ready(pe2_io_in_ready),
    .io_in_valid(pe2_io_in_valid),
    .io_in_bits_x(pe2_io_in_bits_x),
    .io_in_bits_w(pe2_io_in_bits_w),
    .io_in_bits_prev(pe2_io_in_bits_prev),
    .io_out_ready(pe2_io_out_ready),
    .io_out_valid(pe2_io_out_valid),
    .io_out_bits(pe2_io_out_bits)
  );
  assign io_in_ready = stateReg == 2'h0; // @[CorrelationSystolicDecoupled.scala 17:27]
  assign io_out_valid = stateReg == 2'h3; // @[CorrelationSystolicDecoupled.scala 18:28]
  assign io_out_bits = resReg; // @[CorrelationSystolicDecoupled.scala 16:15]
  assign pe0_clock = clock;
  assign pe0_reset = reset;
  assign pe0_io_in_valid = stateReg == 2'h1; // @[CorrelationSystolicDecoupled.scala 37:31]
  assign pe0_io_in_bits_x = xReg; // @[CorrelationSystolicDecoupled.scala 33:20]
  assign pe0_io_in_bits_w = 32'sh1; // @[CorrelationSystolicDecoupled.scala 28:20]
  assign pe0_io_in_bits_prev = 32'sh0; // @[CorrelationSystolicDecoupled.scala 24:23]
  assign pe0_io_out_ready = pe1_io_in_ready; // @[CorrelationSystolicDecoupled.scala 41:20]
  assign pe1_clock = clock;
  assign pe1_reset = reset;
  assign pe1_io_in_valid = pe0_io_out_valid; // @[CorrelationSystolicDecoupled.scala 38:19]
  assign pe1_io_in_bits_x = xReg; // @[CorrelationSystolicDecoupled.scala 34:20]
  assign pe1_io_in_bits_w = 32'sh2; // @[CorrelationSystolicDecoupled.scala 29:20]
  assign pe1_io_in_bits_prev = pe0_io_out_bits; // @[CorrelationSystolicDecoupled.scala 25:23]
  assign pe1_io_out_ready = pe2_io_in_ready; // @[CorrelationSystolicDecoupled.scala 42:20]
  assign pe2_clock = clock;
  assign pe2_reset = reset;
  assign pe2_io_in_valid = pe1_io_out_valid; // @[CorrelationSystolicDecoupled.scala 39:19]
  assign pe2_io_in_bits_x = xReg; // @[CorrelationSystolicDecoupled.scala 35:20]
  assign pe2_io_in_bits_w = 32'sh3; // @[CorrelationSystolicDecoupled.scala 30:20]
  assign pe2_io_in_bits_prev = pe1_io_out_bits; // @[CorrelationSystolicDecoupled.scala 26:23]
  assign pe2_io_out_ready = stateReg == 2'h2; // @[CorrelationSystolicDecoupled.scala 43:32]
  always @(posedge clock) begin
    if (reset) begin // @[CorrelationSystolicDecoupled.scala 13:25]
      stateReg <= 2'h0; // @[CorrelationSystolicDecoupled.scala 13:25]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationSystolicDecoupled.scala 47:25]
        stateReg <= 2'h1; // @[CorrelationSystolicDecoupled.scala 49:18]
      end
    end else if (_T_5) begin // @[Conditional.scala 39:67]
      if (pe0_io_in_ready) begin // @[CorrelationSystolicDecoupled.scala 53:29]
        stateReg <= 2'h2; // @[CorrelationSystolicDecoupled.scala 54:18]
      end
    end else if (_T_6) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_4;
    end else begin
      stateReg <= _GEN_6;
    end
    if (reset) begin // @[CorrelationSystolicDecoupled.scala 15:23]
      resReg <= 32'sh0; // @[CorrelationSystolicDecoupled.scala 15:23]
    end else if (!(_T_4)) begin // @[Conditional.scala 40:58]
      if (!(_T_5)) begin // @[Conditional.scala 39:67]
        if (_T_6) begin // @[Conditional.scala 39:67]
          resReg <= _GEN_3;
        end
      end
    end
    if (reset) begin // @[CorrelationSystolicDecoupled.scala 32:21]
      xReg <= 32'sh0; // @[CorrelationSystolicDecoupled.scala 32:21]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[CorrelationSystolicDecoupled.scala 47:25]
        xReg <= io_in_bits; // @[CorrelationSystolicDecoupled.scala 48:14]
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
  resReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  xReg = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
