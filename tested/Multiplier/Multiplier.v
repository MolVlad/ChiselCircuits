module Multiplier(
  input        clock,
  input        reset,
  input        io_out_ready,
  output       io_out_valid,
  output [7:0] io_out_bits,
  output       io_in_ready,
  input        io_in_valid,
  input  [3:0] io_in_bits_x,
  input  [3:0] io_in_bits_y
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[Multiplier.scala 16:25]
  reg [1:0] multStageReg; // @[Multiplier.scala 18:29]
  reg [3:0] xReg; // @[Multiplier.scala 23:21]
  reg [3:0] yReg; // @[Multiplier.scala 24:21]
  wire [1:0] x0 = xReg[1:0]; // @[Multiplier.scala 31:13]
  wire [1:0] x1 = xReg[3:2]; // @[Multiplier.scala 33:13]
  wire [1:0] y0 = yReg[1:0]; // @[Multiplier.scala 35:13]
  wire [1:0] y1 = yReg[3:2]; // @[Multiplier.scala 37:13]
  wire  _T_7 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_8 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_9 = 2'h0 == multStageReg; // @[Conditional.scala 37:30]
  wire  _T_11 = 2'h1 == multStageReg; // @[Conditional.scala 37:30]
  wire  _T_15 = 2'h2 == multStageReg; // @[Conditional.scala 37:30]
  wire  _T_19 = 2'h3 == multStageReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_3 = _T_19 ? x0 : 2'h0; // @[Conditional.scala 39:67 Multiplier.scala 91:16 Multiplier.scala 48:8]
  wire [1:0] _GEN_8 = _T_15 ? x1 : _GEN_3; // @[Conditional.scala 39:67 Multiplier.scala 84:16]
  wire [1:0] _GEN_13 = _T_11 ? x0 : _GEN_8; // @[Conditional.scala 39:67 Multiplier.scala 77:16]
  wire [1:0] _GEN_18 = _T_9 ? x1 : _GEN_13; // @[Conditional.scala 40:58 Multiplier.scala 70:16]
  wire [1:0] _GEN_25 = _T_8 ? _GEN_18 : 2'h0; // @[Conditional.scala 39:67 Multiplier.scala 48:8]
  wire [1:0] xMul = _T_7 ? 2'h0 : _GEN_25; // @[Conditional.scala 40:58 Multiplier.scala 48:8]
  wire [1:0] _GEN_4 = _T_19 ? y0 : 2'h0; // @[Conditional.scala 39:67 Multiplier.scala 92:16 Multiplier.scala 49:8]
  wire [1:0] _GEN_9 = _T_15 ? y0 : _GEN_4; // @[Conditional.scala 39:67 Multiplier.scala 85:16]
  wire [1:0] _GEN_14 = _T_11 ? y1 : _GEN_9; // @[Conditional.scala 39:67 Multiplier.scala 78:16]
  wire [1:0] _GEN_19 = _T_9 ? y1 : _GEN_14; // @[Conditional.scala 40:58 Multiplier.scala 71:16]
  wire [1:0] _GEN_26 = _T_8 ? _GEN_19 : 2'h0; // @[Conditional.scala 39:67 Multiplier.scala 49:8]
  wire [1:0] yMul = _T_7 ? 2'h0 : _GEN_26; // @[Conditional.scala 40:58 Multiplier.scala 49:8]
  wire [3:0] resMul = xMul * yMul; // @[Multiplier.scala 43:18]
  reg [7:0] resReg; // @[Multiplier.scala 45:23]
  wire [7:0] _GEN_37 = {resMul, 4'h0}; // @[Multiplier.scala 72:28]
  wire [10:0] _T_10 = {{3'd0}, _GEN_37}; // @[Multiplier.scala 72:28]
  wire [5:0] _GEN_38 = {resMul, 2'h0}; // @[Multiplier.scala 79:38]
  wire [6:0] _T_12 = {{1'd0}, _GEN_38}; // @[Multiplier.scala 79:38]
  wire [7:0] _GEN_39 = {{1'd0}, _T_12}; // @[Multiplier.scala 79:28]
  wire [7:0] _T_14 = resReg + _GEN_39; // @[Multiplier.scala 79:28]
  wire [7:0] _GEN_42 = {{4'd0}, resMul}; // @[Multiplier.scala 93:28]
  wire [7:0] _T_21 = resReg + _GEN_42; // @[Multiplier.scala 93:28]
  wire [7:0] _GEN_5 = _T_19 ? _T_21 : resReg; // @[Conditional.scala 39:67 Multiplier.scala 93:18 Multiplier.scala 45:23]
  wire [1:0] _GEN_6 = _T_19 ? 2'h0 : multStageReg; // @[Conditional.scala 39:67 Multiplier.scala 95:24 Multiplier.scala 18:29]
  wire [1:0] _GEN_7 = _T_19 ? 2'h2 : stateReg; // @[Conditional.scala 39:67 Multiplier.scala 96:20 Multiplier.scala 16:25]
  wire [7:0] _GEN_10 = _T_15 ? _T_14 : _GEN_5; // @[Conditional.scala 39:67 Multiplier.scala 86:18]
  wire [1:0] _GEN_11 = _T_15 ? 2'h3 : _GEN_6; // @[Conditional.scala 39:67 Multiplier.scala 88:24]
  wire [1:0] _GEN_12 = _T_15 ? stateReg : _GEN_7; // @[Conditional.scala 39:67 Multiplier.scala 16:25]
  wire [7:0] _GEN_15 = _T_11 ? _T_14 : _GEN_10; // @[Conditional.scala 39:67 Multiplier.scala 79:18]
  wire [1:0] _GEN_16 = _T_11 ? 2'h2 : _GEN_11; // @[Conditional.scala 39:67 Multiplier.scala 81:24]
  wire [1:0] _GEN_17 = _T_11 ? stateReg : _GEN_12; // @[Conditional.scala 39:67 Multiplier.scala 16:25]
  wire [10:0] _GEN_20 = _T_9 ? _T_10 : {{3'd0}, _GEN_15}; // @[Conditional.scala 40:58 Multiplier.scala 72:18]
  wire  _T_22 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_23 = io_out_ready ? 2'h0 : stateReg; // @[Multiplier.scala 101:26 Multiplier.scala 102:18 Multiplier.scala 16:25]
  wire [10:0] _GEN_27 = _T_8 ? _GEN_20 : {{3'd0}, resReg}; // @[Conditional.scala 39:67 Multiplier.scala 45:23]
  wire [10:0] _GEN_35 = _T_7 ? {{3'd0}, resReg} : _GEN_27; // @[Conditional.scala 40:58 Multiplier.scala 45:23]
  assign io_out_valid = stateReg == 2'h2; // @[Multiplier.scala 21:28]
  assign io_out_bits = resReg; // @[Multiplier.scala 46:15]
  assign io_in_ready = stateReg == 2'h0; // @[Multiplier.scala 20:27]
  always @(posedge clock) begin
    if (reset) begin // @[Multiplier.scala 16:25]
      stateReg <= 2'h0; // @[Multiplier.scala 16:25]
    end else if (_T_7) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[Multiplier.scala 53:25]
        stateReg <= 2'h1; // @[Multiplier.scala 57:18]
      end
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      if (!(_T_9)) begin // @[Conditional.scala 40:58]
        stateReg <= _GEN_17;
      end
    end else if (_T_22) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_23;
    end
    if (reset) begin // @[Multiplier.scala 18:29]
      multStageReg <= 2'h0; // @[Multiplier.scala 18:29]
    end else if (!(_T_7)) begin // @[Conditional.scala 40:58]
      if (_T_8) begin // @[Conditional.scala 39:67]
        if (_T_9) begin // @[Conditional.scala 40:58]
          multStageReg <= 2'h1; // @[Multiplier.scala 74:24]
        end else begin
          multStageReg <= _GEN_16;
        end
      end
    end
    if (reset) begin // @[Multiplier.scala 23:21]
      xReg <= io_in_bits_x; // @[Multiplier.scala 23:21]
    end else if (_T_7) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[Multiplier.scala 53:25]
        xReg <= io_in_bits_x; // @[Multiplier.scala 54:14]
      end
    end
    if (reset) begin // @[Multiplier.scala 24:21]
      yReg <= io_in_bits_y; // @[Multiplier.scala 24:21]
    end else if (_T_7) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[Multiplier.scala 53:25]
        yReg <= io_in_bits_y; // @[Multiplier.scala 55:14]
      end
    end
    if (reset) begin // @[Multiplier.scala 45:23]
      resReg <= 8'h0; // @[Multiplier.scala 45:23]
    end else begin
      resReg <= _GEN_35[7:0];
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
  multStageReg = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  xReg = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  yReg = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  resReg = _RAND_4[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
