module AES_FinalOperation(
  input          clock,
  input          reset,
  input          io_out_ready,
  output         io_out_valid,
  output [127:0] io_out_bits,
  output         io_in_ready,
  input          io_in_valid,
  input  [7:0]   io_in_bits_state_0_0,
  input  [7:0]   io_in_bits_state_0_1,
  input  [7:0]   io_in_bits_state_0_2,
  input  [7:0]   io_in_bits_state_0_3,
  input  [7:0]   io_in_bits_state_1_0,
  input  [7:0]   io_in_bits_state_1_1,
  input  [7:0]   io_in_bits_state_1_2,
  input  [7:0]   io_in_bits_state_1_3,
  input  [7:0]   io_in_bits_state_2_0,
  input  [7:0]   io_in_bits_state_2_1,
  input  [7:0]   io_in_bits_state_2_2,
  input  [7:0]   io_in_bits_state_2_3,
  input  [7:0]   io_in_bits_state_3_0,
  input  [7:0]   io_in_bits_state_3_1,
  input  [7:0]   io_in_bits_state_3_2,
  input  [7:0]   io_in_bits_state_3_3,
  input  [7:0]   io_in_bits_key_0_0,
  input  [7:0]   io_in_bits_key_0_1,
  input  [7:0]   io_in_bits_key_0_2,
  input  [7:0]   io_in_bits_key_0_3,
  input  [7:0]   io_in_bits_key_1_0,
  input  [7:0]   io_in_bits_key_1_1,
  input  [7:0]   io_in_bits_key_1_2,
  input  [7:0]   io_in_bits_key_1_3,
  input  [7:0]   io_in_bits_key_2_0,
  input  [7:0]   io_in_bits_key_2_1,
  input  [7:0]   io_in_bits_key_2_2,
  input  [7:0]   io_in_bits_key_2_3,
  input  [7:0]   io_in_bits_key_3_0,
  input  [7:0]   io_in_bits_key_3_1,
  input  [7:0]   io_in_bits_key_3_2,
  input  [7:0]   io_in_bits_key_3_3
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
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] input_state_0_0; // @[Reg.scala 15:16]
  reg [7:0] input_state_0_1; // @[Reg.scala 15:16]
  reg [7:0] input_state_0_2; // @[Reg.scala 15:16]
  reg [7:0] input_state_0_3; // @[Reg.scala 15:16]
  reg [7:0] input_state_1_0; // @[Reg.scala 15:16]
  reg [7:0] input_state_1_1; // @[Reg.scala 15:16]
  reg [7:0] input_state_1_2; // @[Reg.scala 15:16]
  reg [7:0] input_state_1_3; // @[Reg.scala 15:16]
  reg [7:0] input_state_2_0; // @[Reg.scala 15:16]
  reg [7:0] input_state_2_1; // @[Reg.scala 15:16]
  reg [7:0] input_state_2_2; // @[Reg.scala 15:16]
  reg [7:0] input_state_2_3; // @[Reg.scala 15:16]
  reg [7:0] input_state_3_0; // @[Reg.scala 15:16]
  reg [7:0] input_state_3_1; // @[Reg.scala 15:16]
  reg [7:0] input_state_3_2; // @[Reg.scala 15:16]
  reg [7:0] input_state_3_3; // @[Reg.scala 15:16]
  reg [7:0] input_key_0_0; // @[Reg.scala 15:16]
  reg [7:0] input_key_0_1; // @[Reg.scala 15:16]
  reg [7:0] input_key_0_2; // @[Reg.scala 15:16]
  reg [7:0] input_key_0_3; // @[Reg.scala 15:16]
  reg [7:0] input_key_1_0; // @[Reg.scala 15:16]
  reg [7:0] input_key_1_1; // @[Reg.scala 15:16]
  reg [7:0] input_key_1_2; // @[Reg.scala 15:16]
  reg [7:0] input_key_1_3; // @[Reg.scala 15:16]
  reg [7:0] input_key_2_0; // @[Reg.scala 15:16]
  reg [7:0] input_key_2_1; // @[Reg.scala 15:16]
  reg [7:0] input_key_2_2; // @[Reg.scala 15:16]
  reg [7:0] input_key_2_3; // @[Reg.scala 15:16]
  reg [7:0] input_key_3_0; // @[Reg.scala 15:16]
  reg [7:0] input_key_3_1; // @[Reg.scala 15:16]
  reg [7:0] input_key_3_2; // @[Reg.scala 15:16]
  reg [7:0] input_key_3_3; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[AES_Pipelined.scala 126:26]
  wire [7:0] hi_hi_hi_hi = input_state_0_0 ^ input_key_0_0; // @[AES_Pipelined.scala 138:34]
  wire [7:0] hi_hi_hi_lo = input_state_0_1 ^ input_key_0_1; // @[AES_Pipelined.scala 138:68]
  wire [7:0] hi_hi_lo_hi = input_state_0_2 ^ input_key_0_2; // @[AES_Pipelined.scala 139:22]
  wire [7:0] hi_hi_lo_lo = input_state_0_3 ^ input_key_0_3; // @[AES_Pipelined.scala 139:56]
  wire [7:0] hi_lo_hi_hi = input_state_1_0 ^ input_key_1_0; // @[AES_Pipelined.scala 140:22]
  wire [7:0] hi_lo_hi_lo = input_state_1_1 ^ input_key_1_1; // @[AES_Pipelined.scala 140:56]
  wire [7:0] hi_lo_lo_hi = input_state_1_2 ^ input_key_1_2; // @[AES_Pipelined.scala 141:22]
  wire [7:0] hi_lo_lo_lo = input_state_1_3 ^ input_key_1_3; // @[AES_Pipelined.scala 141:56]
  wire [7:0] lo_hi_hi_hi = input_state_2_0 ^ input_key_2_0; // @[AES_Pipelined.scala 142:22]
  wire [7:0] lo_hi_hi_lo = input_state_2_1 ^ input_key_2_1; // @[AES_Pipelined.scala 142:56]
  wire [7:0] lo_hi_lo_hi = input_state_2_2 ^ input_key_2_2; // @[AES_Pipelined.scala 143:22]
  wire [7:0] lo_hi_lo_lo = input_state_2_3 ^ input_key_2_3; // @[AES_Pipelined.scala 143:56]
  wire [7:0] lo_lo_hi_hi = input_state_3_0 ^ input_key_3_0; // @[AES_Pipelined.scala 144:22]
  wire [7:0] lo_lo_hi_lo = input_state_3_1 ^ input_key_3_1; // @[AES_Pipelined.scala 144:56]
  wire [7:0] lo_lo_lo_hi = input_state_3_2 ^ input_key_3_2; // @[AES_Pipelined.scala 145:22]
  wire [7:0] lo_lo_lo_lo = input_state_3_3 ^ input_key_3_3; // @[AES_Pipelined.scala 145:56]
  wire [63:0] lo = {lo_hi_hi_hi,lo_hi_hi_lo,lo_hi_lo_hi,lo_hi_lo_lo,lo_lo_hi_hi,lo_lo_hi_lo,lo_lo_lo_hi,lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [127:0] result = {hi_hi_hi_hi,hi_hi_hi_lo,hi_hi_lo_hi,hi_hi_lo_lo,hi_lo_hi_hi,hi_lo_hi_lo,hi_lo_lo_hi,hi_lo_lo_lo
    ,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[AES_Pipelined.scala 127:16]
  assign io_out_bits = valid ? result : 128'h0; // @[AES_Pipelined.scala 129:15 AES_Pipelined.scala 131:17 AES_Pipelined.scala 134:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[AES_Pipelined.scala 129:15 AES_Pipelined.scala 130:17 AES_Pipelined.scala 133:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_state_0_0 <= io_in_bits_state_0_0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_0_1 <= io_in_bits_state_0_1; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_0_2 <= io_in_bits_state_0_2; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_0_3 <= io_in_bits_state_0_3; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_1_0 <= io_in_bits_state_1_0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_1_1 <= io_in_bits_state_1_1; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_1_2 <= io_in_bits_state_1_2; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_1_3 <= io_in_bits_state_1_3; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_2_0 <= io_in_bits_state_2_0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_2_1 <= io_in_bits_state_2_1; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_2_2 <= io_in_bits_state_2_2; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_2_3 <= io_in_bits_state_2_3; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_3_0 <= io_in_bits_state_3_0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_3_1 <= io_in_bits_state_3_1; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_3_2 <= io_in_bits_state_3_2; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_3_3 <= io_in_bits_state_3_3; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_0_0 <= io_in_bits_key_0_0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_0_1 <= io_in_bits_key_0_1; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_0_2 <= io_in_bits_key_0_2; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_0_3 <= io_in_bits_key_0_3; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_1_0 <= io_in_bits_key_1_0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_1_1 <= io_in_bits_key_1_1; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_1_2 <= io_in_bits_key_1_2; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_1_3 <= io_in_bits_key_1_3; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_2_0 <= io_in_bits_key_2_0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_2_1 <= io_in_bits_key_2_1; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_2_2 <= io_in_bits_key_2_2; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_2_3 <= io_in_bits_key_2_3; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_3_0 <= io_in_bits_key_3_0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_3_1 <= io_in_bits_key_3_1; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_3_2 <= io_in_bits_key_3_2; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key_3_3 <= io_in_bits_key_3_3; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      valid <= io_in_valid; // @[Reg.scala 16:23]
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
  input_state_0_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  input_state_0_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  input_state_0_2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  input_state_0_3 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  input_state_1_0 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  input_state_1_1 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  input_state_1_2 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  input_state_1_3 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  input_state_2_0 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  input_state_2_1 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  input_state_2_2 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  input_state_2_3 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  input_state_3_0 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  input_state_3_1 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  input_state_3_2 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  input_state_3_3 = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  input_key_0_0 = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  input_key_0_1 = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  input_key_0_2 = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  input_key_0_3 = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  input_key_1_0 = _RAND_20[7:0];
  _RAND_21 = {1{`RANDOM}};
  input_key_1_1 = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  input_key_1_2 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  input_key_1_3 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  input_key_2_0 = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  input_key_2_1 = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  input_key_2_2 = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  input_key_2_3 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  input_key_3_0 = _RAND_28[7:0];
  _RAND_29 = {1{`RANDOM}};
  input_key_3_1 = _RAND_29[7:0];
  _RAND_30 = {1{`RANDOM}};
  input_key_3_2 = _RAND_30[7:0];
  _RAND_31 = {1{`RANDOM}};
  input_key_3_3 = _RAND_31[7:0];
  _RAND_32 = {1{`RANDOM}};
  valid = _RAND_32[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
