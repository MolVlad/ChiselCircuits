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
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[Multiplier.scala 16:25]
  reg [1:0] multStageReg; // @[Multiplier.scala 18:29]
  wire [1:0] x0 = io_in_bits_x[1:0]; // @[Multiplier.scala 28:21]
  wire [1:0] x1 = io_in_bits_x[3:2]; // @[Multiplier.scala 30:21]
  wire [1:0] y0 = io_in_bits_y[1:0]; // @[Multiplier.scala 32:21]
  wire [1:0] y1 = io_in_bits_y[3:2]; // @[Multiplier.scala 34:21]
  wire  _T_7 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_8 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_9 = 2'h0 == multStageReg; // @[Conditional.scala 37:30]
  wire  _T_11 = 2'h1 == multStageReg; // @[Conditional.scala 37:30]
  wire  _T_15 = 2'h2 == multStageReg; // @[Conditional.scala 37:30]
  wire  _T_19 = 2'h3 == multStageReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_1 = _T_19 ? x0 : 2'h0; // @[Conditional.scala 39:67 Multiplier.scala 85:16 Multiplier.scala 45:8]
  wire [1:0] _GEN_6 = _T_15 ? x1 : _GEN_1; // @[Conditional.scala 39:67 Multiplier.scala 78:16]
  wire [1:0] _GEN_11 = _T_11 ? x0 : _GEN_6; // @[Conditional.scala 39:67 Multiplier.scala 71:16]
  wire [1:0] _GEN_16 = _T_9 ? x1 : _GEN_11; // @[Conditional.scala 40:58 Multiplier.scala 64:16]
  wire [1:0] _GEN_23 = _T_8 ? _GEN_16 : 2'h0; // @[Conditional.scala 39:67 Multiplier.scala 45:8]
  wire [1:0] xMul = _T_7 ? 2'h0 : _GEN_23; // @[Conditional.scala 40:58 Multiplier.scala 45:8]
  wire [1:0] _GEN_2 = _T_19 ? y0 : 2'h0; // @[Conditional.scala 39:67 Multiplier.scala 86:16 Multiplier.scala 46:8]
  wire [1:0] _GEN_7 = _T_15 ? y0 : _GEN_2; // @[Conditional.scala 39:67 Multiplier.scala 79:16]
  wire [1:0] _GEN_12 = _T_11 ? y1 : _GEN_7; // @[Conditional.scala 39:67 Multiplier.scala 72:16]
  wire [1:0] _GEN_17 = _T_9 ? y1 : _GEN_12; // @[Conditional.scala 40:58 Multiplier.scala 65:16]
  wire [1:0] _GEN_24 = _T_8 ? _GEN_17 : 2'h0; // @[Conditional.scala 39:67 Multiplier.scala 46:8]
  wire [1:0] yMul = _T_7 ? 2'h0 : _GEN_24; // @[Conditional.scala 40:58 Multiplier.scala 46:8]
  wire [3:0] resMul = xMul * yMul; // @[Multiplier.scala 40:18]
  reg [7:0] resReg; // @[Multiplier.scala 42:23]
  wire [7:0] _GEN_33 = {resMul, 4'h0}; // @[Multiplier.scala 66:28]
  wire [10:0] _T_10 = {{3'd0}, _GEN_33}; // @[Multiplier.scala 66:28]
  wire [5:0] _GEN_34 = {resMul, 2'h0}; // @[Multiplier.scala 73:38]
  wire [6:0] _T_12 = {{1'd0}, _GEN_34}; // @[Multiplier.scala 73:38]
  wire [7:0] _GEN_35 = {{1'd0}, _T_12}; // @[Multiplier.scala 73:28]
  wire [7:0] _T_14 = resReg + _GEN_35; // @[Multiplier.scala 73:28]
  wire [7:0] _GEN_38 = {{4'd0}, resMul}; // @[Multiplier.scala 87:28]
  wire [7:0] _T_21 = resReg + _GEN_38; // @[Multiplier.scala 87:28]
  wire [7:0] _GEN_3 = _T_19 ? _T_21 : resReg; // @[Conditional.scala 39:67 Multiplier.scala 87:18 Multiplier.scala 42:23]
  wire [1:0] _GEN_4 = _T_19 ? 2'h0 : multStageReg; // @[Conditional.scala 39:67 Multiplier.scala 89:24 Multiplier.scala 18:29]
  wire [1:0] _GEN_5 = _T_19 ? 2'h2 : stateReg; // @[Conditional.scala 39:67 Multiplier.scala 90:20 Multiplier.scala 16:25]
  wire [7:0] _GEN_8 = _T_15 ? _T_14 : _GEN_3; // @[Conditional.scala 39:67 Multiplier.scala 80:18]
  wire [1:0] _GEN_9 = _T_15 ? 2'h3 : _GEN_4; // @[Conditional.scala 39:67 Multiplier.scala 82:24]
  wire [1:0] _GEN_10 = _T_15 ? stateReg : _GEN_5; // @[Conditional.scala 39:67 Multiplier.scala 16:25]
  wire [7:0] _GEN_13 = _T_11 ? _T_14 : _GEN_8; // @[Conditional.scala 39:67 Multiplier.scala 73:18]
  wire [1:0] _GEN_14 = _T_11 ? 2'h2 : _GEN_9; // @[Conditional.scala 39:67 Multiplier.scala 75:24]
  wire [1:0] _GEN_15 = _T_11 ? stateReg : _GEN_10; // @[Conditional.scala 39:67 Multiplier.scala 16:25]
  wire [10:0] _GEN_18 = _T_9 ? _T_10 : {{3'd0}, _GEN_13}; // @[Conditional.scala 40:58 Multiplier.scala 66:18]
  wire  _T_22 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_21 = io_out_ready ? 2'h0 : stateReg; // @[Multiplier.scala 95:26 Multiplier.scala 96:18 Multiplier.scala 16:25]
  wire [10:0] _GEN_25 = _T_8 ? _GEN_18 : {{3'd0}, resReg}; // @[Conditional.scala 39:67 Multiplier.scala 42:23]
  wire [10:0] _GEN_31 = _T_7 ? {{3'd0}, resReg} : _GEN_25; // @[Conditional.scala 40:58 Multiplier.scala 42:23]
  assign io_out_valid = stateReg == 2'h2; // @[Multiplier.scala 21:28]
  assign io_out_bits = resReg; // @[Multiplier.scala 43:15]
  assign io_in_ready = stateReg == 2'h0; // @[Multiplier.scala 20:27]
  always @(posedge clock) begin
    if (reset) begin // @[Multiplier.scala 16:25]
      stateReg <= 2'h0; // @[Multiplier.scala 16:25]
    end else if (_T_7) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[Multiplier.scala 50:25]
        stateReg <= 2'h1; // @[Multiplier.scala 51:18]
      end
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      if (!(_T_9)) begin // @[Conditional.scala 40:58]
        stateReg <= _GEN_15;
      end
    end else if (_T_22) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_21;
    end
    if (reset) begin // @[Multiplier.scala 18:29]
      multStageReg <= 2'h0; // @[Multiplier.scala 18:29]
    end else if (!(_T_7)) begin // @[Conditional.scala 40:58]
      if (_T_8) begin // @[Conditional.scala 39:67]
        if (_T_9) begin // @[Conditional.scala 40:58]
          multStageReg <= 2'h1; // @[Multiplier.scala 68:24]
        end else begin
          multStageReg <= _GEN_14;
        end
      end
    end
    if (reset) begin // @[Multiplier.scala 42:23]
      resReg <= 8'h0; // @[Multiplier.scala 42:23]
    end else begin
      resReg <= _GEN_31[7:0];
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
  resReg = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
