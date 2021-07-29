module changeWordOrder(
  input  [31:0] io_in,
  output [31:0] io_out
);
  wire [7:0] byte0 = io_in[7:0]; // @[MD4Pipelined.scala 373:17]
  wire [7:0] byte1 = io_in[15:8]; // @[MD4Pipelined.scala 374:17]
  wire [7:0] byte2 = io_in[23:16]; // @[MD4Pipelined.scala 375:17]
  wire [7:0] byte3 = io_in[31:24]; // @[MD4Pipelined.scala 376:17]
  wire [15:0] lo = {byte2,byte3}; // @[Cat.scala 30:58]
  wire [15:0] hi = {byte0,byte1}; // @[Cat.scala 30:58]
  assign io_out = {hi,lo}; // @[Cat.scala 30:58]
endmodule
module MD4ChangeOrderInput(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] changeWordOrder_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_1_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_1_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_2_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_2_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_3_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_3_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_4_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_4_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_5_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_5_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_6_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_6_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_7_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_7_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_8_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_8_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_9_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_9_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_10_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_10_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_11_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_11_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_12_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_12_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_13_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_13_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_14_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_14_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_15_io_in; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_15_io_out; // @[MD4Pipelined.scala 131:11]
  wire [31:0] changeWordOrder_16_io_in; // @[MD4Pipelined.scala 140:19]
  wire [31:0] changeWordOrder_16_io_out; // @[MD4Pipelined.scala 140:19]
  wire [31:0] changeWordOrder_17_io_in; // @[MD4Pipelined.scala 144:19]
  wire [31:0] changeWordOrder_17_io_out; // @[MD4Pipelined.scala 144:19]
  wire [31:0] changeWordOrder_18_io_in; // @[MD4Pipelined.scala 148:19]
  wire [31:0] changeWordOrder_18_io_out; // @[MD4Pipelined.scala 148:19]
  wire [31:0] changeWordOrder_19_io_in; // @[MD4Pipelined.scala 152:19]
  wire [31:0] changeWordOrder_19_io_out; // @[MD4Pipelined.scala 152:19]
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 118:26]
  wire [31:0] result_D0 = changeWordOrder_19_io_out;
  wire [31:0] result_C0 = changeWordOrder_18_io_out;
  wire [31:0] result_B0 = changeWordOrder_17_io_out;
  wire [31:0] result_A0 = changeWordOrder_16_io_out;
  wire [31:0] PEs_15_out = changeWordOrder_15_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_14_out = changeWordOrder_14_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_13_out = changeWordOrder_13_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_12_out = changeWordOrder_12_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_11_out = changeWordOrder_11_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_10_out = changeWordOrder_10_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_9_out = changeWordOrder_9_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_8_out = changeWordOrder_8_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_7_out = changeWordOrder_7_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_6_out = changeWordOrder_6_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_5_out = changeWordOrder_5_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_4_out = changeWordOrder_4_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_3_out = changeWordOrder_3_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_2_out = changeWordOrder_2_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_1_out = changeWordOrder_1_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [31:0] PEs_0_out = changeWordOrder_io_out; // @[MD4Pipelined.scala 130:20 MD4Pipelined.scala 130:20]
  wire [255:0] lo = {PEs_7_out,PEs_6_out,PEs_5_out,PEs_4_out,PEs_3_out,PEs_2_out,PEs_1_out,PEs_0_out}; // @[Cat.scala 30:58]
  wire [511:0] result_X = {PEs_15_out,PEs_14_out,PEs_13_out,PEs_12_out,PEs_11_out,PEs_10_out,PEs_9_out,PEs_8_out,lo}; // @[Cat.scala 30:58]
  changeWordOrder changeWordOrder ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_io_in),
    .io_out(changeWordOrder_io_out)
  );
  changeWordOrder changeWordOrder_1 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_1_io_in),
    .io_out(changeWordOrder_1_io_out)
  );
  changeWordOrder changeWordOrder_2 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_2_io_in),
    .io_out(changeWordOrder_2_io_out)
  );
  changeWordOrder changeWordOrder_3 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_3_io_in),
    .io_out(changeWordOrder_3_io_out)
  );
  changeWordOrder changeWordOrder_4 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_4_io_in),
    .io_out(changeWordOrder_4_io_out)
  );
  changeWordOrder changeWordOrder_5 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_5_io_in),
    .io_out(changeWordOrder_5_io_out)
  );
  changeWordOrder changeWordOrder_6 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_6_io_in),
    .io_out(changeWordOrder_6_io_out)
  );
  changeWordOrder changeWordOrder_7 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_7_io_in),
    .io_out(changeWordOrder_7_io_out)
  );
  changeWordOrder changeWordOrder_8 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_8_io_in),
    .io_out(changeWordOrder_8_io_out)
  );
  changeWordOrder changeWordOrder_9 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_9_io_in),
    .io_out(changeWordOrder_9_io_out)
  );
  changeWordOrder changeWordOrder_10 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_10_io_in),
    .io_out(changeWordOrder_10_io_out)
  );
  changeWordOrder changeWordOrder_11 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_11_io_in),
    .io_out(changeWordOrder_11_io_out)
  );
  changeWordOrder changeWordOrder_12 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_12_io_in),
    .io_out(changeWordOrder_12_io_out)
  );
  changeWordOrder changeWordOrder_13 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_13_io_in),
    .io_out(changeWordOrder_13_io_out)
  );
  changeWordOrder changeWordOrder_14 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_14_io_in),
    .io_out(changeWordOrder_14_io_out)
  );
  changeWordOrder changeWordOrder_15 ( // @[MD4Pipelined.scala 131:11]
    .io_in(changeWordOrder_15_io_in),
    .io_out(changeWordOrder_15_io_out)
  );
  changeWordOrder changeWordOrder_16 ( // @[MD4Pipelined.scala 140:19]
    .io_in(changeWordOrder_16_io_in),
    .io_out(changeWordOrder_16_io_out)
  );
  changeWordOrder changeWordOrder_17 ( // @[MD4Pipelined.scala 144:19]
    .io_in(changeWordOrder_17_io_in),
    .io_out(changeWordOrder_17_io_out)
  );
  changeWordOrder changeWordOrder_18 ( // @[MD4Pipelined.scala 148:19]
    .io_in(changeWordOrder_18_io_in),
    .io_out(changeWordOrder_18_io_out)
  );
  changeWordOrder changeWordOrder_19 ( // @[MD4Pipelined.scala 152:19]
    .io_in(changeWordOrder_19_io_in),
    .io_out(changeWordOrder_19_io_out)
  );
  assign io_out_valid = valid; // @[MD4Pipelined.scala 119:16]
  assign io_out_bits_X = valid ? result_X : 512'h0; // @[MD4Pipelined.scala 121:15 MD4Pipelined.scala 123:17 MD4Pipelined.scala 126:17]
  assign io_out_bits_A0 = valid ? result_A0 : 32'h0; // @[MD4Pipelined.scala 121:15 MD4Pipelined.scala 123:17 MD4Pipelined.scala 126:17]
  assign io_out_bits_B0 = valid ? result_B0 : 32'h0; // @[MD4Pipelined.scala 121:15 MD4Pipelined.scala 123:17 MD4Pipelined.scala 126:17]
  assign io_out_bits_C0 = valid ? result_C0 : 32'h0; // @[MD4Pipelined.scala 121:15 MD4Pipelined.scala 123:17 MD4Pipelined.scala 126:17]
  assign io_out_bits_D0 = valid ? result_D0 : 32'h0; // @[MD4Pipelined.scala 121:15 MD4Pipelined.scala 123:17 MD4Pipelined.scala 126:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 121:15 MD4Pipelined.scala 122:17 MD4Pipelined.scala 125:17]
  assign changeWordOrder_io_in = input_X[31:0]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_1_io_in = input_X[63:32]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_2_io_in = input_X[95:64]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_3_io_in = input_X[127:96]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_4_io_in = input_X[159:128]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_5_io_in = input_X[191:160]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_6_io_in = input_X[223:192]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_7_io_in = input_X[255:224]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_8_io_in = input_X[287:256]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_9_io_in = input_X[319:288]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_10_io_in = input_X[351:320]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_11_io_in = input_X[383:352]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_12_io_in = input_X[415:384]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_13_io_in = input_X[447:416]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_14_io_in = input_X[479:448]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_15_io_in = input_X[511:480]; // @[MD4Pipelined.scala 134:25]
  assign changeWordOrder_16_io_in = input_A0; // @[MD4Pipelined.scala 141:10]
  assign changeWordOrder_17_io_in = input_B0; // @[MD4Pipelined.scala 145:10]
  assign changeWordOrder_18_io_in = input_C0; // @[MD4Pipelined.scala 149:10]
  assign changeWordOrder_19_io_in = input_D0; // @[MD4Pipelined.scala 153:10]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B0 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C0 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  valid = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4FinalAddition(
  input         clock,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_A,
  input  [31:0] io_in_bits_B,
  input  [31:0] io_in_bits_C,
  input  [31:0] io_in_bits_D,
  input  [31:0] io_in_bits_A0,
  input  [31:0] io_in_bits_B0,
  input  [31:0] io_in_bits_C0,
  input  [31:0] io_in_bits_D0,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_A,
  output [31:0] io_out_bits_B,
  output [31:0] io_out_bits_C,
  output [31:0] io_out_bits_D
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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 316:26]
  wire [31:0] result_D = input_D + input_D0; // @[MD4Pipelined.scala 331:23]
  wire [31:0] result_C = input_C + input_C0; // @[MD4Pipelined.scala 330:23]
  wire [31:0] result_B = input_B + input_B0; // @[MD4Pipelined.scala 329:23]
  wire [31:0] result_A = input_A + input_A0; // @[MD4Pipelined.scala 328:23]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 319:15 MD4Pipelined.scala 320:17 MD4Pipelined.scala 323:17]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 317:16]
  assign io_out_bits_A = valid ? result_A : 32'h0; // @[MD4Pipelined.scala 319:15 MD4Pipelined.scala 321:17 MD4Pipelined.scala 324:17]
  assign io_out_bits_B = valid ? result_B : 32'h0; // @[MD4Pipelined.scala 319:15 MD4Pipelined.scala 321:17 MD4Pipelined.scala 324:17]
  assign io_out_bits_C = valid ? result_C : 32'h0; // @[MD4Pipelined.scala 319:15 MD4Pipelined.scala 321:17 MD4Pipelined.scala 324:17]
  assign io_out_bits_D = valid ? result_D : 32'h0; // @[MD4Pipelined.scala 319:15 MD4Pipelined.scala 321:17 MD4Pipelined.scala 324:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  input_A = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  input_B = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_C = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_D = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_A0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_B0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_C0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_D0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  valid = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ChangeOrderOutput(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [127:0] io_out_bits,
  output         io_in_ready,
  input          io_in_valid,
  input  [127:0] io_in_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] changeWordOrder_io_in; // @[MD4Pipelined.scala 358:11]
  wire [31:0] changeWordOrder_io_out; // @[MD4Pipelined.scala 358:11]
  wire [31:0] changeWordOrder_1_io_in; // @[MD4Pipelined.scala 358:11]
  wire [31:0] changeWordOrder_1_io_out; // @[MD4Pipelined.scala 358:11]
  wire [31:0] changeWordOrder_2_io_in; // @[MD4Pipelined.scala 358:11]
  wire [31:0] changeWordOrder_2_io_out; // @[MD4Pipelined.scala 358:11]
  wire [31:0] changeWordOrder_3_io_in; // @[MD4Pipelined.scala 358:11]
  wire [31:0] changeWordOrder_3_io_out; // @[MD4Pipelined.scala 358:11]
  reg [127:0] input_; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 345:26]
  wire [31:0] PEs_3_out = changeWordOrder_3_io_out; // @[MD4Pipelined.scala 357:20 MD4Pipelined.scala 357:20]
  wire [31:0] PEs_2_out = changeWordOrder_2_io_out; // @[MD4Pipelined.scala 357:20 MD4Pipelined.scala 357:20]
  wire [31:0] PEs_1_out = changeWordOrder_1_io_out; // @[MD4Pipelined.scala 357:20 MD4Pipelined.scala 357:20]
  wire [31:0] PEs_0_out = changeWordOrder_io_out; // @[MD4Pipelined.scala 357:20 MD4Pipelined.scala 357:20]
  wire [127:0] result = {PEs_3_out,PEs_2_out,PEs_1_out,PEs_0_out}; // @[Cat.scala 30:58]
  changeWordOrder changeWordOrder ( // @[MD4Pipelined.scala 358:11]
    .io_in(changeWordOrder_io_in),
    .io_out(changeWordOrder_io_out)
  );
  changeWordOrder changeWordOrder_1 ( // @[MD4Pipelined.scala 358:11]
    .io_in(changeWordOrder_1_io_in),
    .io_out(changeWordOrder_1_io_out)
  );
  changeWordOrder changeWordOrder_2 ( // @[MD4Pipelined.scala 358:11]
    .io_in(changeWordOrder_2_io_in),
    .io_out(changeWordOrder_2_io_out)
  );
  changeWordOrder changeWordOrder_3 ( // @[MD4Pipelined.scala 358:11]
    .io_in(changeWordOrder_3_io_in),
    .io_out(changeWordOrder_3_io_out)
  );
  assign io_out_valid = valid; // @[MD4Pipelined.scala 346:16]
  assign io_out_bits = valid ? result : 128'h0; // @[MD4Pipelined.scala 348:15 MD4Pipelined.scala 350:17 MD4Pipelined.scala 353:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 348:15 MD4Pipelined.scala 349:17 MD4Pipelined.scala 352:17]
  assign changeWordOrder_io_in = input_[31:0]; // @[MD4Pipelined.scala 361:23]
  assign changeWordOrder_1_io_in = input_[63:32]; // @[MD4Pipelined.scala 361:23]
  assign changeWordOrder_2_io_in = input_[95:64]; // @[MD4Pipelined.scala 361:23]
  assign changeWordOrder_3_io_in = input_[127:96]; // @[MD4Pipelined.scala 361:23]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_ <= io_in_bits; // @[Reg.scala 16:23]
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
  _RAND_0 = {4{`RANDOM}};
  input_ = _RAND_0[127:0];
  _RAND_1 = {1{`RANDOM}};
  valid = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_B & input_C; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_B; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_D; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_A + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[511:480]; // @[MD4Pipelined.scala 236:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [28:0] hi = sum[28:0]; // @[MD4Pipelined.scala 201:23]
  wire [2:0] lo = sum[31:29]; // @[MD4Pipelined.scala 201:35]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_1(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_A & input_B; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_A; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_C; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_D + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[479:448]; // @[MD4Pipelined.scala 237:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [24:0] hi = sum[24:0]; // @[MD4Pipelined.scala 207:35]
  wire [6:0] lo = sum[31:25]; // @[MD4Pipelined.scala 207:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_2(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_D & input_A; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_D; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_B; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_C + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[447:416]; // @[MD4Pipelined.scala 238:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [20:0] hi = sum[20:0]; // @[MD4Pipelined.scala 216:35]
  wire [10:0] lo = sum[31:21]; // @[MD4Pipelined.scala 216:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_3(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_C & input_D; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_C; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_A; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_B + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[415:384]; // @[MD4Pipelined.scala 239:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [12:0] hi = sum[12:0]; // @[MD4Pipelined.scala 225:35]
  wire [18:0] lo = sum[31:13]; // @[MD4Pipelined.scala 225:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_4(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_B & input_C; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_B; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_D; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_A + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[383:352]; // @[MD4Pipelined.scala 240:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [28:0] hi = sum[28:0]; // @[MD4Pipelined.scala 201:23]
  wire [2:0] lo = sum[31:29]; // @[MD4Pipelined.scala 201:35]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_5(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_A & input_B; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_A; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_C; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_D + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[351:320]; // @[MD4Pipelined.scala 241:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [24:0] hi = sum[24:0]; // @[MD4Pipelined.scala 207:35]
  wire [6:0] lo = sum[31:25]; // @[MD4Pipelined.scala 207:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_6(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_D & input_A; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_D; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_B; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_C + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[319:288]; // @[MD4Pipelined.scala 242:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [20:0] hi = sum[20:0]; // @[MD4Pipelined.scala 216:35]
  wire [10:0] lo = sum[31:21]; // @[MD4Pipelined.scala 216:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_7(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_C & input_D; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_C; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_A; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_B + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[287:256]; // @[MD4Pipelined.scala 243:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [12:0] hi = sum[12:0]; // @[MD4Pipelined.scala 225:35]
  wire [18:0] lo = sum[31:13]; // @[MD4Pipelined.scala 225:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_8(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_B & input_C; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_B; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_D; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_A + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[255:224]; // @[MD4Pipelined.scala 244:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [28:0] hi = sum[28:0]; // @[MD4Pipelined.scala 201:23]
  wire [2:0] lo = sum[31:29]; // @[MD4Pipelined.scala 201:35]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_9(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_A & input_B; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_A; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_C; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_D + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[223:192]; // @[MD4Pipelined.scala 245:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [24:0] hi = sum[24:0]; // @[MD4Pipelined.scala 207:35]
  wire [6:0] lo = sum[31:25]; // @[MD4Pipelined.scala 207:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_10(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_D & input_A; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_D; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_B; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_C + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[191:160]; // @[MD4Pipelined.scala 246:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [20:0] hi = sum[20:0]; // @[MD4Pipelined.scala 216:35]
  wire [10:0] lo = sum[31:21]; // @[MD4Pipelined.scala 216:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_11(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_C & input_D; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_C; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_A; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_B + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[159:128]; // @[MD4Pipelined.scala 247:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [12:0] hi = sum[12:0]; // @[MD4Pipelined.scala 225:35]
  wire [18:0] lo = sum[31:13]; // @[MD4Pipelined.scala 225:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_12(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_B & input_C; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_B; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_D; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_A + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[127:96]; // @[MD4Pipelined.scala 248:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [28:0] hi = sum[28:0]; // @[MD4Pipelined.scala 201:23]
  wire [2:0] lo = sum[31:29]; // @[MD4Pipelined.scala 201:35]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_13(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_A & input_B; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_A; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_C; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_D + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[95:64]; // @[MD4Pipelined.scala 249:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [24:0] hi = sum[24:0]; // @[MD4Pipelined.scala 207:35]
  wire [6:0] lo = sum[31:25]; // @[MD4Pipelined.scala 207:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_14(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_D & input_A; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_D; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_B; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_C + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[63:32]; // @[MD4Pipelined.scala 250:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [20:0] hi = sum[20:0]; // @[MD4Pipelined.scala 216:35]
  wire [10:0] lo = sum[31:21]; // @[MD4Pipelined.scala 216:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_15(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_2 = input_C & input_D; // @[MD4Pipelined.scala 192:11]
  wire [31:0] _T_3 = ~input_C; // @[MD4Pipelined.scala 192:20]
  wire [31:0] _T_4 = _T_3 & input_A; // @[MD4Pipelined.scala 192:31]
  wire [31:0] F = _T_2 | _T_4; // @[MD4Pipelined.scala 192:16]
  wire [31:0] _T_14 = input_B + F; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[31:0]; // @[MD4Pipelined.scala 251:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [32:0] _T_17 = {{1'd0}, _T_16}; // @[MD4Pipelined.scala 196:28]
  wire [31:0] sum = _T_17[31:0]; // @[MD4Pipelined.scala 196:28]
  wire [12:0] hi = sum[12:0]; // @[MD4Pipelined.scala 225:35]
  wire [18:0] lo = sum[31:13]; // @[MD4Pipelined.scala 225:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_16(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_B & input_C; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_B & input_D; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_C & input_D; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_A + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[511:480]; // @[MD4Pipelined.scala 258:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [28:0] hi = sum[28:0]; // @[MD4Pipelined.scala 201:23]
  wire [2:0] lo = sum[31:29]; // @[MD4Pipelined.scala 201:35]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_17(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_A & input_B; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_A & input_C; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_B & input_C; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_D + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[383:352]; // @[MD4Pipelined.scala 259:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [26:0] hi = sum[26:0]; // @[MD4Pipelined.scala 208:35]
  wire [4:0] lo = sum[31:27]; // @[MD4Pipelined.scala 208:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_18(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_D & input_A; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_D & input_B; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_A & input_B; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_C + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[255:224]; // @[MD4Pipelined.scala 260:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [22:0] hi = sum[22:0]; // @[MD4Pipelined.scala 217:35]
  wire [8:0] lo = sum[31:23]; // @[MD4Pipelined.scala 217:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_19(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_C & input_D; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_C & input_A; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_D & input_A; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_B + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[127:96]; // @[MD4Pipelined.scala 261:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [18:0] hi = sum[18:0]; // @[MD4Pipelined.scala 226:35]
  wire [12:0] lo = sum[31:19]; // @[MD4Pipelined.scala 226:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_20(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_B & input_C; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_B & input_D; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_C & input_D; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_A + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[479:448]; // @[MD4Pipelined.scala 262:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [28:0] hi = sum[28:0]; // @[MD4Pipelined.scala 201:23]
  wire [2:0] lo = sum[31:29]; // @[MD4Pipelined.scala 201:35]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_21(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_A & input_B; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_A & input_C; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_B & input_C; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_D + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[351:320]; // @[MD4Pipelined.scala 263:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [26:0] hi = sum[26:0]; // @[MD4Pipelined.scala 208:35]
  wire [4:0] lo = sum[31:27]; // @[MD4Pipelined.scala 208:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_22(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_D & input_A; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_D & input_B; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_A & input_B; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_C + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[223:192]; // @[MD4Pipelined.scala 264:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [22:0] hi = sum[22:0]; // @[MD4Pipelined.scala 217:35]
  wire [8:0] lo = sum[31:23]; // @[MD4Pipelined.scala 217:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_23(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_C & input_D; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_C & input_A; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_D & input_A; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_B + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[95:64]; // @[MD4Pipelined.scala 265:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [18:0] hi = sum[18:0]; // @[MD4Pipelined.scala 226:35]
  wire [12:0] lo = sum[31:19]; // @[MD4Pipelined.scala 226:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_24(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_B & input_C; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_B & input_D; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_C & input_D; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_A + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[447:416]; // @[MD4Pipelined.scala 266:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [28:0] hi = sum[28:0]; // @[MD4Pipelined.scala 201:23]
  wire [2:0] lo = sum[31:29]; // @[MD4Pipelined.scala 201:35]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_25(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_A & input_B; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_A & input_C; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_B & input_C; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_D + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[319:288]; // @[MD4Pipelined.scala 267:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [26:0] hi = sum[26:0]; // @[MD4Pipelined.scala 208:35]
  wire [4:0] lo = sum[31:27]; // @[MD4Pipelined.scala 208:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_26(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_D & input_A; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_D & input_B; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_A & input_B; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_C + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[191:160]; // @[MD4Pipelined.scala 268:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [22:0] hi = sum[22:0]; // @[MD4Pipelined.scala 217:35]
  wire [8:0] lo = sum[31:23]; // @[MD4Pipelined.scala 217:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_27(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_C & input_D; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_C & input_A; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_D & input_A; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_B + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[63:32]; // @[MD4Pipelined.scala 269:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [18:0] hi = sum[18:0]; // @[MD4Pipelined.scala 226:35]
  wire [12:0] lo = sum[31:19]; // @[MD4Pipelined.scala 226:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_28(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_B & input_C; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_B & input_D; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_C & input_D; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_A + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[415:384]; // @[MD4Pipelined.scala 270:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [28:0] hi = sum[28:0]; // @[MD4Pipelined.scala 201:23]
  wire [2:0] lo = sum[31:29]; // @[MD4Pipelined.scala 201:35]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_29(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_A & input_B; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_A & input_C; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_B & input_C; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_D + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[287:256]; // @[MD4Pipelined.scala 271:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [26:0] hi = sum[26:0]; // @[MD4Pipelined.scala 208:35]
  wire [4:0] lo = sum[31:27]; // @[MD4Pipelined.scala 208:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_30(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_D & input_A; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_D & input_B; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_A & input_B; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_C + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[159:128]; // @[MD4Pipelined.scala 272:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [22:0] hi = sum[22:0]; // @[MD4Pipelined.scala 217:35]
  wire [8:0] lo = sum[31:23]; // @[MD4Pipelined.scala 217:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_31(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_6 = input_C & input_D; // @[MD4Pipelined.scala 193:11]
  wire [31:0] _T_7 = input_C & input_A; // @[MD4Pipelined.scala 193:21]
  wire [31:0] _T_8 = _T_6 | _T_7; // @[MD4Pipelined.scala 193:16]
  wire [31:0] _T_9 = input_D & input_A; // @[MD4Pipelined.scala 193:31]
  wire [31:0] G = _T_8 | _T_9; // @[MD4Pipelined.scala 193:26]
  wire [31:0] _T_14 = input_B + G; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[31:0]; // @[MD4Pipelined.scala 273:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h5a827999; // @[MD4Pipelined.scala 196:28]
  wire [18:0] hi = sum[18:0]; // @[MD4Pipelined.scala 226:35]
  wire [12:0] lo = sum[31:19]; // @[MD4Pipelined.scala 226:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_32(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_B ^ input_C; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_D; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_A + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[511:480]; // @[MD4Pipelined.scala 280:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [28:0] hi = sum[28:0]; // @[MD4Pipelined.scala 201:23]
  wire [2:0] lo = sum[31:29]; // @[MD4Pipelined.scala 201:35]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_33(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_A ^ input_B; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_C; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_D + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[255:224]; // @[MD4Pipelined.scala 281:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [22:0] hi = sum[22:0]; // @[MD4Pipelined.scala 209:35]
  wire [8:0] lo = sum[31:23]; // @[MD4Pipelined.scala 209:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_34(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_D ^ input_A; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_B; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_C + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[383:352]; // @[MD4Pipelined.scala 282:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [20:0] hi = sum[20:0]; // @[MD4Pipelined.scala 218:35]
  wire [10:0] lo = sum[31:21]; // @[MD4Pipelined.scala 218:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_35(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_C ^ input_D; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_A; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_B + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[127:96]; // @[MD4Pipelined.scala 283:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [16:0] hi = sum[16:0]; // @[MD4Pipelined.scala 227:35]
  wire [14:0] lo = sum[31:17]; // @[MD4Pipelined.scala 227:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_36(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_B ^ input_C; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_D; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_A + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[447:416]; // @[MD4Pipelined.scala 284:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [28:0] hi = sum[28:0]; // @[MD4Pipelined.scala 201:23]
  wire [2:0] lo = sum[31:29]; // @[MD4Pipelined.scala 201:35]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_37(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_A ^ input_B; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_C; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_D + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[191:160]; // @[MD4Pipelined.scala 285:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [22:0] hi = sum[22:0]; // @[MD4Pipelined.scala 209:35]
  wire [8:0] lo = sum[31:23]; // @[MD4Pipelined.scala 209:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_38(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_D ^ input_A; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_B; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_C + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[319:288]; // @[MD4Pipelined.scala 286:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [20:0] hi = sum[20:0]; // @[MD4Pipelined.scala 218:35]
  wire [10:0] lo = sum[31:21]; // @[MD4Pipelined.scala 218:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_39(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_C ^ input_D; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_A; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_B + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[63:32]; // @[MD4Pipelined.scala 287:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [16:0] hi = sum[16:0]; // @[MD4Pipelined.scala 227:35]
  wire [14:0] lo = sum[31:17]; // @[MD4Pipelined.scala 227:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_40(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_B ^ input_C; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_D; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_A + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[479:448]; // @[MD4Pipelined.scala 288:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [28:0] hi = sum[28:0]; // @[MD4Pipelined.scala 201:23]
  wire [2:0] lo = sum[31:29]; // @[MD4Pipelined.scala 201:35]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_41(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_A ^ input_B; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_C; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_D + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[223:192]; // @[MD4Pipelined.scala 289:30]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [22:0] hi = sum[22:0]; // @[MD4Pipelined.scala 209:35]
  wire [8:0] lo = sum[31:23]; // @[MD4Pipelined.scala 209:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_42(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_D ^ input_A; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_B; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_C + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[351:320]; // @[MD4Pipelined.scala 290:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [20:0] hi = sum[20:0]; // @[MD4Pipelined.scala 218:35]
  wire [10:0] lo = sum[31:21]; // @[MD4Pipelined.scala 218:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_43(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_C ^ input_D; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_A; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_B + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[95:64]; // @[MD4Pipelined.scala 291:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [16:0] hi = sum[16:0]; // @[MD4Pipelined.scala 227:35]
  wire [14:0] lo = sum[31:17]; // @[MD4Pipelined.scala 227:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_44(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_B ^ input_C; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_D; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_A + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[415:384]; // @[MD4Pipelined.scala 292:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [28:0] hi = sum[28:0]; // @[MD4Pipelined.scala 201:23]
  wire [2:0] lo = sum[31:29]; // @[MD4Pipelined.scala 201:35]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_45(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_A ^ input_B; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_C; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_D + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[159:128]; // @[MD4Pipelined.scala 293:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [22:0] hi = sum[22:0]; // @[MD4Pipelined.scala 209:35]
  wire [8:0] lo = sum[31:23]; // @[MD4Pipelined.scala 209:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_46(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [511:0] io_out_bits_X,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_D ^ input_A; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_B; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_C + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[287:256]; // @[MD4Pipelined.scala 294:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [20:0] hi = sum[20:0]; // @[MD4Pipelined.scala 218:35]
  wire [10:0] lo = sum[31:21]; // @[MD4Pipelined.scala 218:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_X = valid ? input_X : 512'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? input_B : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4ProcessingElement_47(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [31:0]  io_out_bits_A,
  output [31:0]  io_out_bits_B,
  output [31:0]  io_out_bits_C,
  output [31:0]  io_out_bits_D,
  output [31:0]  io_out_bits_A0,
  output [31:0]  io_out_bits_B0,
  output [31:0]  io_out_bits_C0,
  output [31:0]  io_out_bits_D0,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A,
  input  [31:0]  io_in_bits_B,
  input  [31:0]  io_in_bits_C,
  input  [31:0]  io_in_bits_D,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
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
  reg [511:0] input_X; // @[Reg.scala 15:16]
  reg [31:0] input_A; // @[Reg.scala 15:16]
  reg [31:0] input_B; // @[Reg.scala 15:16]
  reg [31:0] input_C; // @[Reg.scala 15:16]
  reg [31:0] input_D; // @[Reg.scala 15:16]
  reg [31:0] input_A0; // @[Reg.scala 15:16]
  reg [31:0] input_B0; // @[Reg.scala 15:16]
  reg [31:0] input_C0; // @[Reg.scala 15:16]
  reg [31:0] input_D0; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[MD4Pipelined.scala 168:26]
  wire [31:0] _T_11 = input_C ^ input_D; // @[MD4Pipelined.scala 194:10]
  wire [31:0] H = _T_11 ^ input_A; // @[MD4Pipelined.scala 194:14]
  wire [31:0] _T_14 = input_B + H; // @[MD4Pipelined.scala 196:12]
  wire [31:0] xk = input_X[31:0]; // @[MD4Pipelined.scala 295:31]
  wire [31:0] _T_16 = _T_14 + xk; // @[MD4Pipelined.scala 196:23]
  wire [31:0] sum = _T_16 + 32'h6ed9eba1; // @[MD4Pipelined.scala 196:28]
  wire [16:0] hi = sum[16:0]; // @[MD4Pipelined.scala 227:35]
  wire [14:0] lo = sum[31:17]; // @[MD4Pipelined.scala 227:47]
  wire [31:0] rotated = {hi,lo}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[MD4Pipelined.scala 169:16]
  assign io_out_bits_A = valid ? input_A : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B = valid ? rotated : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C = valid ? input_C : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D = valid ? input_D : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_A0 = valid ? input_A0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_B0 = valid ? input_B0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_C0 = valid ? input_C0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_out_bits_D0 = valid ? input_D0 : 32'h0; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 173:17 MD4Pipelined.scala 176:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[MD4Pipelined.scala 171:15 MD4Pipelined.scala 172:17 MD4Pipelined.scala 175:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_X <= io_in_bits_X; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A <= io_in_bits_A; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B <= io_in_bits_B; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C <= io_in_bits_C; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D <= io_in_bits_D; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_A0 <= io_in_bits_A0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_B0 <= io_in_bits_B0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_C0 <= io_in_bits_C0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_D0 <= io_in_bits_D0; // @[Reg.scala 16:23]
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
  _RAND_0 = {16{`RANDOM}};
  input_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  input_A = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_B = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_C = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_D = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_A0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_B0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_C0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_D0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MD4Pipelined(
  input          clock,
  input          reset,
  output         io_in_ready,
  input          io_in_valid,
  input  [511:0] io_in_bits_X,
  input  [31:0]  io_in_bits_A0,
  input  [31:0]  io_in_bits_B0,
  input  [31:0]  io_in_bits_C0,
  input  [31:0]  io_in_bits_D0,
  input          io_hash_ready,
  output         io_hash_valid,
  output [127:0] io_hash_bits
);
  wire  changeInput_clock; // @[MD4Pipelined.scala 12:27]
  wire  changeInput_io_out_ready; // @[MD4Pipelined.scala 12:27]
  wire  changeInput_io_out_valid; // @[MD4Pipelined.scala 12:27]
  wire [511:0] changeInput_io_out_bits_X; // @[MD4Pipelined.scala 12:27]
  wire [31:0] changeInput_io_out_bits_A0; // @[MD4Pipelined.scala 12:27]
  wire [31:0] changeInput_io_out_bits_B0; // @[MD4Pipelined.scala 12:27]
  wire [31:0] changeInput_io_out_bits_C0; // @[MD4Pipelined.scala 12:27]
  wire [31:0] changeInput_io_out_bits_D0; // @[MD4Pipelined.scala 12:27]
  wire  changeInput_io_in_ready; // @[MD4Pipelined.scala 12:27]
  wire  changeInput_io_in_valid; // @[MD4Pipelined.scala 12:27]
  wire [511:0] changeInput_io_in_bits_X; // @[MD4Pipelined.scala 12:27]
  wire [31:0] changeInput_io_in_bits_A0; // @[MD4Pipelined.scala 12:27]
  wire [31:0] changeInput_io_in_bits_B0; // @[MD4Pipelined.scala 12:27]
  wire [31:0] changeInput_io_in_bits_C0; // @[MD4Pipelined.scala 12:27]
  wire [31:0] changeInput_io_in_bits_D0; // @[MD4Pipelined.scala 12:27]
  wire  add_clock; // @[MD4Pipelined.scala 21:19]
  wire  add_io_in_ready; // @[MD4Pipelined.scala 21:19]
  wire  add_io_in_valid; // @[MD4Pipelined.scala 21:19]
  wire [31:0] add_io_in_bits_A; // @[MD4Pipelined.scala 21:19]
  wire [31:0] add_io_in_bits_B; // @[MD4Pipelined.scala 21:19]
  wire [31:0] add_io_in_bits_C; // @[MD4Pipelined.scala 21:19]
  wire [31:0] add_io_in_bits_D; // @[MD4Pipelined.scala 21:19]
  wire [31:0] add_io_in_bits_A0; // @[MD4Pipelined.scala 21:19]
  wire [31:0] add_io_in_bits_B0; // @[MD4Pipelined.scala 21:19]
  wire [31:0] add_io_in_bits_C0; // @[MD4Pipelined.scala 21:19]
  wire [31:0] add_io_in_bits_D0; // @[MD4Pipelined.scala 21:19]
  wire  add_io_out_ready; // @[MD4Pipelined.scala 21:19]
  wire  add_io_out_valid; // @[MD4Pipelined.scala 21:19]
  wire [31:0] add_io_out_bits_A; // @[MD4Pipelined.scala 21:19]
  wire [31:0] add_io_out_bits_B; // @[MD4Pipelined.scala 21:19]
  wire [31:0] add_io_out_bits_C; // @[MD4Pipelined.scala 21:19]
  wire [31:0] add_io_out_bits_D; // @[MD4Pipelined.scala 21:19]
  wire  changeOutput_clock; // @[MD4Pipelined.scala 24:28]
  wire  changeOutput_io_out_ready; // @[MD4Pipelined.scala 24:28]
  wire  changeOutput_io_out_valid; // @[MD4Pipelined.scala 24:28]
  wire [127:0] changeOutput_io_out_bits; // @[MD4Pipelined.scala 24:28]
  wire  changeOutput_io_in_ready; // @[MD4Pipelined.scala 24:28]
  wire  changeOutput_io_in_valid; // @[MD4Pipelined.scala 24:28]
  wire [127:0] changeOutput_io_in_bits; // @[MD4Pipelined.scala 24:28]
  wire  PEs_0_0_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_0_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_0_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_0_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_0_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_0_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_0_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_0_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_1_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_1_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_1_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_1_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_1_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_1_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_1_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_1_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_2_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_2_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_2_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_2_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_2_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_2_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_2_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_2_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_3_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_3_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_3_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_3_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_3_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_3_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_3_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_3_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_4_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_4_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_4_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_4_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_4_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_4_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_4_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_4_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_5_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_5_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_5_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_5_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_5_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_5_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_5_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_5_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_6_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_6_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_6_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_6_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_6_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_6_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_6_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_6_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_7_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_7_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_7_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_7_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_7_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_7_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_7_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_7_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_8_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_8_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_8_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_8_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_8_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_8_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_8_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_8_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_9_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_9_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_9_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_9_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_9_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_9_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_9_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_9_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_10_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_10_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_10_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_10_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_10_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_10_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_10_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_10_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_11_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_11_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_11_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_11_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_11_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_11_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_11_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_11_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_12_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_12_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_12_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_12_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_12_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_12_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_12_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_12_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_13_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_13_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_13_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_13_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_13_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_13_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_13_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_13_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_14_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_14_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_14_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_14_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_14_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_14_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_14_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_14_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_15_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_15_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_15_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_15_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_15_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_0_15_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_0_15_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_0_15_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_0_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_0_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_0_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_0_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_0_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_0_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_0_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_0_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_1_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_1_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_1_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_1_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_1_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_1_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_1_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_1_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_2_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_2_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_2_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_2_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_2_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_2_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_2_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_2_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_3_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_3_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_3_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_3_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_3_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_3_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_3_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_3_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_4_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_4_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_4_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_4_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_4_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_4_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_4_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_4_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_5_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_5_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_5_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_5_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_5_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_5_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_5_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_5_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_6_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_6_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_6_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_6_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_6_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_6_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_6_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_6_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_7_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_7_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_7_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_7_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_7_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_7_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_7_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_7_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_8_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_8_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_8_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_8_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_8_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_8_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_8_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_8_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_9_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_9_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_9_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_9_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_9_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_9_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_9_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_9_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_10_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_10_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_10_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_10_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_10_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_10_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_10_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_10_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_11_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_11_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_11_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_11_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_11_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_11_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_11_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_11_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_12_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_12_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_12_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_12_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_12_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_12_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_12_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_12_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_13_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_13_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_13_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_13_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_13_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_13_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_13_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_13_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_14_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_14_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_14_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_14_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_14_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_14_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_14_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_14_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_15_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_15_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_15_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_15_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_15_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_1_15_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_1_15_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_1_15_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_0_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_0_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_0_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_0_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_0_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_0_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_0_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_0_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_1_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_1_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_1_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_1_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_1_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_1_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_1_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_1_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_2_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_2_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_2_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_2_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_2_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_2_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_2_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_2_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_3_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_3_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_3_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_3_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_3_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_3_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_3_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_3_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_4_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_4_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_4_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_4_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_4_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_4_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_4_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_4_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_5_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_5_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_5_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_5_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_5_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_5_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_5_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_5_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_6_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_6_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_6_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_6_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_6_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_6_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_6_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_6_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_7_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_7_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_7_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_7_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_7_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_7_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_7_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_7_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_8_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_8_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_8_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_8_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_8_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_8_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_8_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_8_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_9_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_9_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_9_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_9_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_9_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_9_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_9_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_9_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_10_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_10_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_10_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_10_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_10_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_10_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_10_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_10_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_11_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_11_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_11_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_11_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_11_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_11_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_11_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_11_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_12_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_12_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_12_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_12_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_12_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_12_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_12_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_12_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_13_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_13_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_13_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_13_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_13_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_13_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_13_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_13_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_14_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_14_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_14_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_14_io_out_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_14_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_14_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_14_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_14_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_15_clock; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_15_io_out_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_15_io_out_valid; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_out_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_out_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_out_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_out_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_out_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_out_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_out_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_out_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_15_io_in_ready; // @[MD4Pipelined.scala 34:22]
  wire  PEs_2_15_io_in_valid; // @[MD4Pipelined.scala 34:22]
  wire [511:0] PEs_2_15_io_in_bits_X; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_in_bits_A; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_in_bits_B; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_in_bits_C; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_in_bits_D; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_in_bits_A0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_in_bits_B0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_in_bits_C0; // @[MD4Pipelined.scala 34:22]
  wire [31:0] PEs_2_15_io_in_bits_D0; // @[MD4Pipelined.scala 34:22]
  wire [63:0] lo = {add_io_out_bits_C,add_io_out_bits_D}; // @[Cat.scala 30:58]
  wire [63:0] hi = {add_io_out_bits_A,add_io_out_bits_B}; // @[Cat.scala 30:58]
  MD4ChangeOrderInput changeInput ( // @[MD4Pipelined.scala 12:27]
    .clock(changeInput_clock),
    .io_out_ready(changeInput_io_out_ready),
    .io_out_valid(changeInput_io_out_valid),
    .io_out_bits_X(changeInput_io_out_bits_X),
    .io_out_bits_A0(changeInput_io_out_bits_A0),
    .io_out_bits_B0(changeInput_io_out_bits_B0),
    .io_out_bits_C0(changeInput_io_out_bits_C0),
    .io_out_bits_D0(changeInput_io_out_bits_D0),
    .io_in_ready(changeInput_io_in_ready),
    .io_in_valid(changeInput_io_in_valid),
    .io_in_bits_X(changeInput_io_in_bits_X),
    .io_in_bits_A0(changeInput_io_in_bits_A0),
    .io_in_bits_B0(changeInput_io_in_bits_B0),
    .io_in_bits_C0(changeInput_io_in_bits_C0),
    .io_in_bits_D0(changeInput_io_in_bits_D0)
  );
  MD4FinalAddition add ( // @[MD4Pipelined.scala 21:19]
    .clock(add_clock),
    .io_in_ready(add_io_in_ready),
    .io_in_valid(add_io_in_valid),
    .io_in_bits_A(add_io_in_bits_A),
    .io_in_bits_B(add_io_in_bits_B),
    .io_in_bits_C(add_io_in_bits_C),
    .io_in_bits_D(add_io_in_bits_D),
    .io_in_bits_A0(add_io_in_bits_A0),
    .io_in_bits_B0(add_io_in_bits_B0),
    .io_in_bits_C0(add_io_in_bits_C0),
    .io_in_bits_D0(add_io_in_bits_D0),
    .io_out_ready(add_io_out_ready),
    .io_out_valid(add_io_out_valid),
    .io_out_bits_A(add_io_out_bits_A),
    .io_out_bits_B(add_io_out_bits_B),
    .io_out_bits_C(add_io_out_bits_C),
    .io_out_bits_D(add_io_out_bits_D)
  );
  MD4ChangeOrderOutput changeOutput ( // @[MD4Pipelined.scala 24:28]
    .clock(changeOutput_clock),
    .io_out_ready(changeOutput_io_out_ready),
    .io_out_valid(changeOutput_io_out_valid),
    .io_out_bits(changeOutput_io_out_bits),
    .io_in_ready(changeOutput_io_in_ready),
    .io_in_valid(changeOutput_io_in_valid),
    .io_in_bits(changeOutput_io_in_bits)
  );
  MD4ProcessingElement PEs_0_0 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_0_clock),
    .io_out_ready(PEs_0_0_io_out_ready),
    .io_out_valid(PEs_0_0_io_out_valid),
    .io_out_bits_X(PEs_0_0_io_out_bits_X),
    .io_out_bits_A(PEs_0_0_io_out_bits_A),
    .io_out_bits_B(PEs_0_0_io_out_bits_B),
    .io_out_bits_C(PEs_0_0_io_out_bits_C),
    .io_out_bits_D(PEs_0_0_io_out_bits_D),
    .io_out_bits_A0(PEs_0_0_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_0_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_0_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_0_io_out_bits_D0),
    .io_in_ready(PEs_0_0_io_in_ready),
    .io_in_valid(PEs_0_0_io_in_valid),
    .io_in_bits_X(PEs_0_0_io_in_bits_X),
    .io_in_bits_A(PEs_0_0_io_in_bits_A),
    .io_in_bits_B(PEs_0_0_io_in_bits_B),
    .io_in_bits_C(PEs_0_0_io_in_bits_C),
    .io_in_bits_D(PEs_0_0_io_in_bits_D),
    .io_in_bits_A0(PEs_0_0_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_0_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_0_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_0_io_in_bits_D0)
  );
  MD4ProcessingElement_1 PEs_0_1 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_1_clock),
    .io_out_ready(PEs_0_1_io_out_ready),
    .io_out_valid(PEs_0_1_io_out_valid),
    .io_out_bits_X(PEs_0_1_io_out_bits_X),
    .io_out_bits_A(PEs_0_1_io_out_bits_A),
    .io_out_bits_B(PEs_0_1_io_out_bits_B),
    .io_out_bits_C(PEs_0_1_io_out_bits_C),
    .io_out_bits_D(PEs_0_1_io_out_bits_D),
    .io_out_bits_A0(PEs_0_1_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_1_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_1_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_1_io_out_bits_D0),
    .io_in_ready(PEs_0_1_io_in_ready),
    .io_in_valid(PEs_0_1_io_in_valid),
    .io_in_bits_X(PEs_0_1_io_in_bits_X),
    .io_in_bits_A(PEs_0_1_io_in_bits_A),
    .io_in_bits_B(PEs_0_1_io_in_bits_B),
    .io_in_bits_C(PEs_0_1_io_in_bits_C),
    .io_in_bits_D(PEs_0_1_io_in_bits_D),
    .io_in_bits_A0(PEs_0_1_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_1_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_1_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_1_io_in_bits_D0)
  );
  MD4ProcessingElement_2 PEs_0_2 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_2_clock),
    .io_out_ready(PEs_0_2_io_out_ready),
    .io_out_valid(PEs_0_2_io_out_valid),
    .io_out_bits_X(PEs_0_2_io_out_bits_X),
    .io_out_bits_A(PEs_0_2_io_out_bits_A),
    .io_out_bits_B(PEs_0_2_io_out_bits_B),
    .io_out_bits_C(PEs_0_2_io_out_bits_C),
    .io_out_bits_D(PEs_0_2_io_out_bits_D),
    .io_out_bits_A0(PEs_0_2_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_2_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_2_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_2_io_out_bits_D0),
    .io_in_ready(PEs_0_2_io_in_ready),
    .io_in_valid(PEs_0_2_io_in_valid),
    .io_in_bits_X(PEs_0_2_io_in_bits_X),
    .io_in_bits_A(PEs_0_2_io_in_bits_A),
    .io_in_bits_B(PEs_0_2_io_in_bits_B),
    .io_in_bits_C(PEs_0_2_io_in_bits_C),
    .io_in_bits_D(PEs_0_2_io_in_bits_D),
    .io_in_bits_A0(PEs_0_2_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_2_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_2_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_2_io_in_bits_D0)
  );
  MD4ProcessingElement_3 PEs_0_3 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_3_clock),
    .io_out_ready(PEs_0_3_io_out_ready),
    .io_out_valid(PEs_0_3_io_out_valid),
    .io_out_bits_X(PEs_0_3_io_out_bits_X),
    .io_out_bits_A(PEs_0_3_io_out_bits_A),
    .io_out_bits_B(PEs_0_3_io_out_bits_B),
    .io_out_bits_C(PEs_0_3_io_out_bits_C),
    .io_out_bits_D(PEs_0_3_io_out_bits_D),
    .io_out_bits_A0(PEs_0_3_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_3_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_3_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_3_io_out_bits_D0),
    .io_in_ready(PEs_0_3_io_in_ready),
    .io_in_valid(PEs_0_3_io_in_valid),
    .io_in_bits_X(PEs_0_3_io_in_bits_X),
    .io_in_bits_A(PEs_0_3_io_in_bits_A),
    .io_in_bits_B(PEs_0_3_io_in_bits_B),
    .io_in_bits_C(PEs_0_3_io_in_bits_C),
    .io_in_bits_D(PEs_0_3_io_in_bits_D),
    .io_in_bits_A0(PEs_0_3_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_3_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_3_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_3_io_in_bits_D0)
  );
  MD4ProcessingElement_4 PEs_0_4 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_4_clock),
    .io_out_ready(PEs_0_4_io_out_ready),
    .io_out_valid(PEs_0_4_io_out_valid),
    .io_out_bits_X(PEs_0_4_io_out_bits_X),
    .io_out_bits_A(PEs_0_4_io_out_bits_A),
    .io_out_bits_B(PEs_0_4_io_out_bits_B),
    .io_out_bits_C(PEs_0_4_io_out_bits_C),
    .io_out_bits_D(PEs_0_4_io_out_bits_D),
    .io_out_bits_A0(PEs_0_4_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_4_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_4_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_4_io_out_bits_D0),
    .io_in_ready(PEs_0_4_io_in_ready),
    .io_in_valid(PEs_0_4_io_in_valid),
    .io_in_bits_X(PEs_0_4_io_in_bits_X),
    .io_in_bits_A(PEs_0_4_io_in_bits_A),
    .io_in_bits_B(PEs_0_4_io_in_bits_B),
    .io_in_bits_C(PEs_0_4_io_in_bits_C),
    .io_in_bits_D(PEs_0_4_io_in_bits_D),
    .io_in_bits_A0(PEs_0_4_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_4_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_4_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_4_io_in_bits_D0)
  );
  MD4ProcessingElement_5 PEs_0_5 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_5_clock),
    .io_out_ready(PEs_0_5_io_out_ready),
    .io_out_valid(PEs_0_5_io_out_valid),
    .io_out_bits_X(PEs_0_5_io_out_bits_X),
    .io_out_bits_A(PEs_0_5_io_out_bits_A),
    .io_out_bits_B(PEs_0_5_io_out_bits_B),
    .io_out_bits_C(PEs_0_5_io_out_bits_C),
    .io_out_bits_D(PEs_0_5_io_out_bits_D),
    .io_out_bits_A0(PEs_0_5_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_5_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_5_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_5_io_out_bits_D0),
    .io_in_ready(PEs_0_5_io_in_ready),
    .io_in_valid(PEs_0_5_io_in_valid),
    .io_in_bits_X(PEs_0_5_io_in_bits_X),
    .io_in_bits_A(PEs_0_5_io_in_bits_A),
    .io_in_bits_B(PEs_0_5_io_in_bits_B),
    .io_in_bits_C(PEs_0_5_io_in_bits_C),
    .io_in_bits_D(PEs_0_5_io_in_bits_D),
    .io_in_bits_A0(PEs_0_5_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_5_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_5_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_5_io_in_bits_D0)
  );
  MD4ProcessingElement_6 PEs_0_6 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_6_clock),
    .io_out_ready(PEs_0_6_io_out_ready),
    .io_out_valid(PEs_0_6_io_out_valid),
    .io_out_bits_X(PEs_0_6_io_out_bits_X),
    .io_out_bits_A(PEs_0_6_io_out_bits_A),
    .io_out_bits_B(PEs_0_6_io_out_bits_B),
    .io_out_bits_C(PEs_0_6_io_out_bits_C),
    .io_out_bits_D(PEs_0_6_io_out_bits_D),
    .io_out_bits_A0(PEs_0_6_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_6_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_6_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_6_io_out_bits_D0),
    .io_in_ready(PEs_0_6_io_in_ready),
    .io_in_valid(PEs_0_6_io_in_valid),
    .io_in_bits_X(PEs_0_6_io_in_bits_X),
    .io_in_bits_A(PEs_0_6_io_in_bits_A),
    .io_in_bits_B(PEs_0_6_io_in_bits_B),
    .io_in_bits_C(PEs_0_6_io_in_bits_C),
    .io_in_bits_D(PEs_0_6_io_in_bits_D),
    .io_in_bits_A0(PEs_0_6_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_6_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_6_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_6_io_in_bits_D0)
  );
  MD4ProcessingElement_7 PEs_0_7 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_7_clock),
    .io_out_ready(PEs_0_7_io_out_ready),
    .io_out_valid(PEs_0_7_io_out_valid),
    .io_out_bits_X(PEs_0_7_io_out_bits_X),
    .io_out_bits_A(PEs_0_7_io_out_bits_A),
    .io_out_bits_B(PEs_0_7_io_out_bits_B),
    .io_out_bits_C(PEs_0_7_io_out_bits_C),
    .io_out_bits_D(PEs_0_7_io_out_bits_D),
    .io_out_bits_A0(PEs_0_7_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_7_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_7_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_7_io_out_bits_D0),
    .io_in_ready(PEs_0_7_io_in_ready),
    .io_in_valid(PEs_0_7_io_in_valid),
    .io_in_bits_X(PEs_0_7_io_in_bits_X),
    .io_in_bits_A(PEs_0_7_io_in_bits_A),
    .io_in_bits_B(PEs_0_7_io_in_bits_B),
    .io_in_bits_C(PEs_0_7_io_in_bits_C),
    .io_in_bits_D(PEs_0_7_io_in_bits_D),
    .io_in_bits_A0(PEs_0_7_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_7_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_7_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_7_io_in_bits_D0)
  );
  MD4ProcessingElement_8 PEs_0_8 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_8_clock),
    .io_out_ready(PEs_0_8_io_out_ready),
    .io_out_valid(PEs_0_8_io_out_valid),
    .io_out_bits_X(PEs_0_8_io_out_bits_X),
    .io_out_bits_A(PEs_0_8_io_out_bits_A),
    .io_out_bits_B(PEs_0_8_io_out_bits_B),
    .io_out_bits_C(PEs_0_8_io_out_bits_C),
    .io_out_bits_D(PEs_0_8_io_out_bits_D),
    .io_out_bits_A0(PEs_0_8_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_8_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_8_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_8_io_out_bits_D0),
    .io_in_ready(PEs_0_8_io_in_ready),
    .io_in_valid(PEs_0_8_io_in_valid),
    .io_in_bits_X(PEs_0_8_io_in_bits_X),
    .io_in_bits_A(PEs_0_8_io_in_bits_A),
    .io_in_bits_B(PEs_0_8_io_in_bits_B),
    .io_in_bits_C(PEs_0_8_io_in_bits_C),
    .io_in_bits_D(PEs_0_8_io_in_bits_D),
    .io_in_bits_A0(PEs_0_8_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_8_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_8_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_8_io_in_bits_D0)
  );
  MD4ProcessingElement_9 PEs_0_9 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_9_clock),
    .io_out_ready(PEs_0_9_io_out_ready),
    .io_out_valid(PEs_0_9_io_out_valid),
    .io_out_bits_X(PEs_0_9_io_out_bits_X),
    .io_out_bits_A(PEs_0_9_io_out_bits_A),
    .io_out_bits_B(PEs_0_9_io_out_bits_B),
    .io_out_bits_C(PEs_0_9_io_out_bits_C),
    .io_out_bits_D(PEs_0_9_io_out_bits_D),
    .io_out_bits_A0(PEs_0_9_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_9_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_9_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_9_io_out_bits_D0),
    .io_in_ready(PEs_0_9_io_in_ready),
    .io_in_valid(PEs_0_9_io_in_valid),
    .io_in_bits_X(PEs_0_9_io_in_bits_X),
    .io_in_bits_A(PEs_0_9_io_in_bits_A),
    .io_in_bits_B(PEs_0_9_io_in_bits_B),
    .io_in_bits_C(PEs_0_9_io_in_bits_C),
    .io_in_bits_D(PEs_0_9_io_in_bits_D),
    .io_in_bits_A0(PEs_0_9_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_9_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_9_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_9_io_in_bits_D0)
  );
  MD4ProcessingElement_10 PEs_0_10 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_10_clock),
    .io_out_ready(PEs_0_10_io_out_ready),
    .io_out_valid(PEs_0_10_io_out_valid),
    .io_out_bits_X(PEs_0_10_io_out_bits_X),
    .io_out_bits_A(PEs_0_10_io_out_bits_A),
    .io_out_bits_B(PEs_0_10_io_out_bits_B),
    .io_out_bits_C(PEs_0_10_io_out_bits_C),
    .io_out_bits_D(PEs_0_10_io_out_bits_D),
    .io_out_bits_A0(PEs_0_10_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_10_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_10_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_10_io_out_bits_D0),
    .io_in_ready(PEs_0_10_io_in_ready),
    .io_in_valid(PEs_0_10_io_in_valid),
    .io_in_bits_X(PEs_0_10_io_in_bits_X),
    .io_in_bits_A(PEs_0_10_io_in_bits_A),
    .io_in_bits_B(PEs_0_10_io_in_bits_B),
    .io_in_bits_C(PEs_0_10_io_in_bits_C),
    .io_in_bits_D(PEs_0_10_io_in_bits_D),
    .io_in_bits_A0(PEs_0_10_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_10_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_10_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_10_io_in_bits_D0)
  );
  MD4ProcessingElement_11 PEs_0_11 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_11_clock),
    .io_out_ready(PEs_0_11_io_out_ready),
    .io_out_valid(PEs_0_11_io_out_valid),
    .io_out_bits_X(PEs_0_11_io_out_bits_X),
    .io_out_bits_A(PEs_0_11_io_out_bits_A),
    .io_out_bits_B(PEs_0_11_io_out_bits_B),
    .io_out_bits_C(PEs_0_11_io_out_bits_C),
    .io_out_bits_D(PEs_0_11_io_out_bits_D),
    .io_out_bits_A0(PEs_0_11_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_11_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_11_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_11_io_out_bits_D0),
    .io_in_ready(PEs_0_11_io_in_ready),
    .io_in_valid(PEs_0_11_io_in_valid),
    .io_in_bits_X(PEs_0_11_io_in_bits_X),
    .io_in_bits_A(PEs_0_11_io_in_bits_A),
    .io_in_bits_B(PEs_0_11_io_in_bits_B),
    .io_in_bits_C(PEs_0_11_io_in_bits_C),
    .io_in_bits_D(PEs_0_11_io_in_bits_D),
    .io_in_bits_A0(PEs_0_11_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_11_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_11_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_11_io_in_bits_D0)
  );
  MD4ProcessingElement_12 PEs_0_12 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_12_clock),
    .io_out_ready(PEs_0_12_io_out_ready),
    .io_out_valid(PEs_0_12_io_out_valid),
    .io_out_bits_X(PEs_0_12_io_out_bits_X),
    .io_out_bits_A(PEs_0_12_io_out_bits_A),
    .io_out_bits_B(PEs_0_12_io_out_bits_B),
    .io_out_bits_C(PEs_0_12_io_out_bits_C),
    .io_out_bits_D(PEs_0_12_io_out_bits_D),
    .io_out_bits_A0(PEs_0_12_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_12_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_12_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_12_io_out_bits_D0),
    .io_in_ready(PEs_0_12_io_in_ready),
    .io_in_valid(PEs_0_12_io_in_valid),
    .io_in_bits_X(PEs_0_12_io_in_bits_X),
    .io_in_bits_A(PEs_0_12_io_in_bits_A),
    .io_in_bits_B(PEs_0_12_io_in_bits_B),
    .io_in_bits_C(PEs_0_12_io_in_bits_C),
    .io_in_bits_D(PEs_0_12_io_in_bits_D),
    .io_in_bits_A0(PEs_0_12_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_12_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_12_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_12_io_in_bits_D0)
  );
  MD4ProcessingElement_13 PEs_0_13 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_13_clock),
    .io_out_ready(PEs_0_13_io_out_ready),
    .io_out_valid(PEs_0_13_io_out_valid),
    .io_out_bits_X(PEs_0_13_io_out_bits_X),
    .io_out_bits_A(PEs_0_13_io_out_bits_A),
    .io_out_bits_B(PEs_0_13_io_out_bits_B),
    .io_out_bits_C(PEs_0_13_io_out_bits_C),
    .io_out_bits_D(PEs_0_13_io_out_bits_D),
    .io_out_bits_A0(PEs_0_13_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_13_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_13_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_13_io_out_bits_D0),
    .io_in_ready(PEs_0_13_io_in_ready),
    .io_in_valid(PEs_0_13_io_in_valid),
    .io_in_bits_X(PEs_0_13_io_in_bits_X),
    .io_in_bits_A(PEs_0_13_io_in_bits_A),
    .io_in_bits_B(PEs_0_13_io_in_bits_B),
    .io_in_bits_C(PEs_0_13_io_in_bits_C),
    .io_in_bits_D(PEs_0_13_io_in_bits_D),
    .io_in_bits_A0(PEs_0_13_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_13_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_13_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_13_io_in_bits_D0)
  );
  MD4ProcessingElement_14 PEs_0_14 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_14_clock),
    .io_out_ready(PEs_0_14_io_out_ready),
    .io_out_valid(PEs_0_14_io_out_valid),
    .io_out_bits_X(PEs_0_14_io_out_bits_X),
    .io_out_bits_A(PEs_0_14_io_out_bits_A),
    .io_out_bits_B(PEs_0_14_io_out_bits_B),
    .io_out_bits_C(PEs_0_14_io_out_bits_C),
    .io_out_bits_D(PEs_0_14_io_out_bits_D),
    .io_out_bits_A0(PEs_0_14_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_14_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_14_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_14_io_out_bits_D0),
    .io_in_ready(PEs_0_14_io_in_ready),
    .io_in_valid(PEs_0_14_io_in_valid),
    .io_in_bits_X(PEs_0_14_io_in_bits_X),
    .io_in_bits_A(PEs_0_14_io_in_bits_A),
    .io_in_bits_B(PEs_0_14_io_in_bits_B),
    .io_in_bits_C(PEs_0_14_io_in_bits_C),
    .io_in_bits_D(PEs_0_14_io_in_bits_D),
    .io_in_bits_A0(PEs_0_14_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_14_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_14_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_14_io_in_bits_D0)
  );
  MD4ProcessingElement_15 PEs_0_15 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_0_15_clock),
    .io_out_ready(PEs_0_15_io_out_ready),
    .io_out_valid(PEs_0_15_io_out_valid),
    .io_out_bits_X(PEs_0_15_io_out_bits_X),
    .io_out_bits_A(PEs_0_15_io_out_bits_A),
    .io_out_bits_B(PEs_0_15_io_out_bits_B),
    .io_out_bits_C(PEs_0_15_io_out_bits_C),
    .io_out_bits_D(PEs_0_15_io_out_bits_D),
    .io_out_bits_A0(PEs_0_15_io_out_bits_A0),
    .io_out_bits_B0(PEs_0_15_io_out_bits_B0),
    .io_out_bits_C0(PEs_0_15_io_out_bits_C0),
    .io_out_bits_D0(PEs_0_15_io_out_bits_D0),
    .io_in_ready(PEs_0_15_io_in_ready),
    .io_in_valid(PEs_0_15_io_in_valid),
    .io_in_bits_X(PEs_0_15_io_in_bits_X),
    .io_in_bits_A(PEs_0_15_io_in_bits_A),
    .io_in_bits_B(PEs_0_15_io_in_bits_B),
    .io_in_bits_C(PEs_0_15_io_in_bits_C),
    .io_in_bits_D(PEs_0_15_io_in_bits_D),
    .io_in_bits_A0(PEs_0_15_io_in_bits_A0),
    .io_in_bits_B0(PEs_0_15_io_in_bits_B0),
    .io_in_bits_C0(PEs_0_15_io_in_bits_C0),
    .io_in_bits_D0(PEs_0_15_io_in_bits_D0)
  );
  MD4ProcessingElement_16 PEs_1_0 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_0_clock),
    .io_out_ready(PEs_1_0_io_out_ready),
    .io_out_valid(PEs_1_0_io_out_valid),
    .io_out_bits_X(PEs_1_0_io_out_bits_X),
    .io_out_bits_A(PEs_1_0_io_out_bits_A),
    .io_out_bits_B(PEs_1_0_io_out_bits_B),
    .io_out_bits_C(PEs_1_0_io_out_bits_C),
    .io_out_bits_D(PEs_1_0_io_out_bits_D),
    .io_out_bits_A0(PEs_1_0_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_0_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_0_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_0_io_out_bits_D0),
    .io_in_ready(PEs_1_0_io_in_ready),
    .io_in_valid(PEs_1_0_io_in_valid),
    .io_in_bits_X(PEs_1_0_io_in_bits_X),
    .io_in_bits_A(PEs_1_0_io_in_bits_A),
    .io_in_bits_B(PEs_1_0_io_in_bits_B),
    .io_in_bits_C(PEs_1_0_io_in_bits_C),
    .io_in_bits_D(PEs_1_0_io_in_bits_D),
    .io_in_bits_A0(PEs_1_0_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_0_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_0_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_0_io_in_bits_D0)
  );
  MD4ProcessingElement_17 PEs_1_1 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_1_clock),
    .io_out_ready(PEs_1_1_io_out_ready),
    .io_out_valid(PEs_1_1_io_out_valid),
    .io_out_bits_X(PEs_1_1_io_out_bits_X),
    .io_out_bits_A(PEs_1_1_io_out_bits_A),
    .io_out_bits_B(PEs_1_1_io_out_bits_B),
    .io_out_bits_C(PEs_1_1_io_out_bits_C),
    .io_out_bits_D(PEs_1_1_io_out_bits_D),
    .io_out_bits_A0(PEs_1_1_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_1_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_1_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_1_io_out_bits_D0),
    .io_in_ready(PEs_1_1_io_in_ready),
    .io_in_valid(PEs_1_1_io_in_valid),
    .io_in_bits_X(PEs_1_1_io_in_bits_X),
    .io_in_bits_A(PEs_1_1_io_in_bits_A),
    .io_in_bits_B(PEs_1_1_io_in_bits_B),
    .io_in_bits_C(PEs_1_1_io_in_bits_C),
    .io_in_bits_D(PEs_1_1_io_in_bits_D),
    .io_in_bits_A0(PEs_1_1_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_1_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_1_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_1_io_in_bits_D0)
  );
  MD4ProcessingElement_18 PEs_1_2 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_2_clock),
    .io_out_ready(PEs_1_2_io_out_ready),
    .io_out_valid(PEs_1_2_io_out_valid),
    .io_out_bits_X(PEs_1_2_io_out_bits_X),
    .io_out_bits_A(PEs_1_2_io_out_bits_A),
    .io_out_bits_B(PEs_1_2_io_out_bits_B),
    .io_out_bits_C(PEs_1_2_io_out_bits_C),
    .io_out_bits_D(PEs_1_2_io_out_bits_D),
    .io_out_bits_A0(PEs_1_2_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_2_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_2_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_2_io_out_bits_D0),
    .io_in_ready(PEs_1_2_io_in_ready),
    .io_in_valid(PEs_1_2_io_in_valid),
    .io_in_bits_X(PEs_1_2_io_in_bits_X),
    .io_in_bits_A(PEs_1_2_io_in_bits_A),
    .io_in_bits_B(PEs_1_2_io_in_bits_B),
    .io_in_bits_C(PEs_1_2_io_in_bits_C),
    .io_in_bits_D(PEs_1_2_io_in_bits_D),
    .io_in_bits_A0(PEs_1_2_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_2_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_2_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_2_io_in_bits_D0)
  );
  MD4ProcessingElement_19 PEs_1_3 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_3_clock),
    .io_out_ready(PEs_1_3_io_out_ready),
    .io_out_valid(PEs_1_3_io_out_valid),
    .io_out_bits_X(PEs_1_3_io_out_bits_X),
    .io_out_bits_A(PEs_1_3_io_out_bits_A),
    .io_out_bits_B(PEs_1_3_io_out_bits_B),
    .io_out_bits_C(PEs_1_3_io_out_bits_C),
    .io_out_bits_D(PEs_1_3_io_out_bits_D),
    .io_out_bits_A0(PEs_1_3_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_3_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_3_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_3_io_out_bits_D0),
    .io_in_ready(PEs_1_3_io_in_ready),
    .io_in_valid(PEs_1_3_io_in_valid),
    .io_in_bits_X(PEs_1_3_io_in_bits_X),
    .io_in_bits_A(PEs_1_3_io_in_bits_A),
    .io_in_bits_B(PEs_1_3_io_in_bits_B),
    .io_in_bits_C(PEs_1_3_io_in_bits_C),
    .io_in_bits_D(PEs_1_3_io_in_bits_D),
    .io_in_bits_A0(PEs_1_3_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_3_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_3_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_3_io_in_bits_D0)
  );
  MD4ProcessingElement_20 PEs_1_4 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_4_clock),
    .io_out_ready(PEs_1_4_io_out_ready),
    .io_out_valid(PEs_1_4_io_out_valid),
    .io_out_bits_X(PEs_1_4_io_out_bits_X),
    .io_out_bits_A(PEs_1_4_io_out_bits_A),
    .io_out_bits_B(PEs_1_4_io_out_bits_B),
    .io_out_bits_C(PEs_1_4_io_out_bits_C),
    .io_out_bits_D(PEs_1_4_io_out_bits_D),
    .io_out_bits_A0(PEs_1_4_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_4_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_4_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_4_io_out_bits_D0),
    .io_in_ready(PEs_1_4_io_in_ready),
    .io_in_valid(PEs_1_4_io_in_valid),
    .io_in_bits_X(PEs_1_4_io_in_bits_X),
    .io_in_bits_A(PEs_1_4_io_in_bits_A),
    .io_in_bits_B(PEs_1_4_io_in_bits_B),
    .io_in_bits_C(PEs_1_4_io_in_bits_C),
    .io_in_bits_D(PEs_1_4_io_in_bits_D),
    .io_in_bits_A0(PEs_1_4_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_4_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_4_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_4_io_in_bits_D0)
  );
  MD4ProcessingElement_21 PEs_1_5 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_5_clock),
    .io_out_ready(PEs_1_5_io_out_ready),
    .io_out_valid(PEs_1_5_io_out_valid),
    .io_out_bits_X(PEs_1_5_io_out_bits_X),
    .io_out_bits_A(PEs_1_5_io_out_bits_A),
    .io_out_bits_B(PEs_1_5_io_out_bits_B),
    .io_out_bits_C(PEs_1_5_io_out_bits_C),
    .io_out_bits_D(PEs_1_5_io_out_bits_D),
    .io_out_bits_A0(PEs_1_5_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_5_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_5_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_5_io_out_bits_D0),
    .io_in_ready(PEs_1_5_io_in_ready),
    .io_in_valid(PEs_1_5_io_in_valid),
    .io_in_bits_X(PEs_1_5_io_in_bits_X),
    .io_in_bits_A(PEs_1_5_io_in_bits_A),
    .io_in_bits_B(PEs_1_5_io_in_bits_B),
    .io_in_bits_C(PEs_1_5_io_in_bits_C),
    .io_in_bits_D(PEs_1_5_io_in_bits_D),
    .io_in_bits_A0(PEs_1_5_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_5_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_5_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_5_io_in_bits_D0)
  );
  MD4ProcessingElement_22 PEs_1_6 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_6_clock),
    .io_out_ready(PEs_1_6_io_out_ready),
    .io_out_valid(PEs_1_6_io_out_valid),
    .io_out_bits_X(PEs_1_6_io_out_bits_X),
    .io_out_bits_A(PEs_1_6_io_out_bits_A),
    .io_out_bits_B(PEs_1_6_io_out_bits_B),
    .io_out_bits_C(PEs_1_6_io_out_bits_C),
    .io_out_bits_D(PEs_1_6_io_out_bits_D),
    .io_out_bits_A0(PEs_1_6_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_6_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_6_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_6_io_out_bits_D0),
    .io_in_ready(PEs_1_6_io_in_ready),
    .io_in_valid(PEs_1_6_io_in_valid),
    .io_in_bits_X(PEs_1_6_io_in_bits_X),
    .io_in_bits_A(PEs_1_6_io_in_bits_A),
    .io_in_bits_B(PEs_1_6_io_in_bits_B),
    .io_in_bits_C(PEs_1_6_io_in_bits_C),
    .io_in_bits_D(PEs_1_6_io_in_bits_D),
    .io_in_bits_A0(PEs_1_6_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_6_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_6_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_6_io_in_bits_D0)
  );
  MD4ProcessingElement_23 PEs_1_7 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_7_clock),
    .io_out_ready(PEs_1_7_io_out_ready),
    .io_out_valid(PEs_1_7_io_out_valid),
    .io_out_bits_X(PEs_1_7_io_out_bits_X),
    .io_out_bits_A(PEs_1_7_io_out_bits_A),
    .io_out_bits_B(PEs_1_7_io_out_bits_B),
    .io_out_bits_C(PEs_1_7_io_out_bits_C),
    .io_out_bits_D(PEs_1_7_io_out_bits_D),
    .io_out_bits_A0(PEs_1_7_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_7_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_7_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_7_io_out_bits_D0),
    .io_in_ready(PEs_1_7_io_in_ready),
    .io_in_valid(PEs_1_7_io_in_valid),
    .io_in_bits_X(PEs_1_7_io_in_bits_X),
    .io_in_bits_A(PEs_1_7_io_in_bits_A),
    .io_in_bits_B(PEs_1_7_io_in_bits_B),
    .io_in_bits_C(PEs_1_7_io_in_bits_C),
    .io_in_bits_D(PEs_1_7_io_in_bits_D),
    .io_in_bits_A0(PEs_1_7_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_7_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_7_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_7_io_in_bits_D0)
  );
  MD4ProcessingElement_24 PEs_1_8 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_8_clock),
    .io_out_ready(PEs_1_8_io_out_ready),
    .io_out_valid(PEs_1_8_io_out_valid),
    .io_out_bits_X(PEs_1_8_io_out_bits_X),
    .io_out_bits_A(PEs_1_8_io_out_bits_A),
    .io_out_bits_B(PEs_1_8_io_out_bits_B),
    .io_out_bits_C(PEs_1_8_io_out_bits_C),
    .io_out_bits_D(PEs_1_8_io_out_bits_D),
    .io_out_bits_A0(PEs_1_8_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_8_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_8_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_8_io_out_bits_D0),
    .io_in_ready(PEs_1_8_io_in_ready),
    .io_in_valid(PEs_1_8_io_in_valid),
    .io_in_bits_X(PEs_1_8_io_in_bits_X),
    .io_in_bits_A(PEs_1_8_io_in_bits_A),
    .io_in_bits_B(PEs_1_8_io_in_bits_B),
    .io_in_bits_C(PEs_1_8_io_in_bits_C),
    .io_in_bits_D(PEs_1_8_io_in_bits_D),
    .io_in_bits_A0(PEs_1_8_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_8_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_8_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_8_io_in_bits_D0)
  );
  MD4ProcessingElement_25 PEs_1_9 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_9_clock),
    .io_out_ready(PEs_1_9_io_out_ready),
    .io_out_valid(PEs_1_9_io_out_valid),
    .io_out_bits_X(PEs_1_9_io_out_bits_X),
    .io_out_bits_A(PEs_1_9_io_out_bits_A),
    .io_out_bits_B(PEs_1_9_io_out_bits_B),
    .io_out_bits_C(PEs_1_9_io_out_bits_C),
    .io_out_bits_D(PEs_1_9_io_out_bits_D),
    .io_out_bits_A0(PEs_1_9_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_9_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_9_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_9_io_out_bits_D0),
    .io_in_ready(PEs_1_9_io_in_ready),
    .io_in_valid(PEs_1_9_io_in_valid),
    .io_in_bits_X(PEs_1_9_io_in_bits_X),
    .io_in_bits_A(PEs_1_9_io_in_bits_A),
    .io_in_bits_B(PEs_1_9_io_in_bits_B),
    .io_in_bits_C(PEs_1_9_io_in_bits_C),
    .io_in_bits_D(PEs_1_9_io_in_bits_D),
    .io_in_bits_A0(PEs_1_9_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_9_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_9_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_9_io_in_bits_D0)
  );
  MD4ProcessingElement_26 PEs_1_10 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_10_clock),
    .io_out_ready(PEs_1_10_io_out_ready),
    .io_out_valid(PEs_1_10_io_out_valid),
    .io_out_bits_X(PEs_1_10_io_out_bits_X),
    .io_out_bits_A(PEs_1_10_io_out_bits_A),
    .io_out_bits_B(PEs_1_10_io_out_bits_B),
    .io_out_bits_C(PEs_1_10_io_out_bits_C),
    .io_out_bits_D(PEs_1_10_io_out_bits_D),
    .io_out_bits_A0(PEs_1_10_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_10_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_10_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_10_io_out_bits_D0),
    .io_in_ready(PEs_1_10_io_in_ready),
    .io_in_valid(PEs_1_10_io_in_valid),
    .io_in_bits_X(PEs_1_10_io_in_bits_X),
    .io_in_bits_A(PEs_1_10_io_in_bits_A),
    .io_in_bits_B(PEs_1_10_io_in_bits_B),
    .io_in_bits_C(PEs_1_10_io_in_bits_C),
    .io_in_bits_D(PEs_1_10_io_in_bits_D),
    .io_in_bits_A0(PEs_1_10_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_10_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_10_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_10_io_in_bits_D0)
  );
  MD4ProcessingElement_27 PEs_1_11 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_11_clock),
    .io_out_ready(PEs_1_11_io_out_ready),
    .io_out_valid(PEs_1_11_io_out_valid),
    .io_out_bits_X(PEs_1_11_io_out_bits_X),
    .io_out_bits_A(PEs_1_11_io_out_bits_A),
    .io_out_bits_B(PEs_1_11_io_out_bits_B),
    .io_out_bits_C(PEs_1_11_io_out_bits_C),
    .io_out_bits_D(PEs_1_11_io_out_bits_D),
    .io_out_bits_A0(PEs_1_11_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_11_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_11_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_11_io_out_bits_D0),
    .io_in_ready(PEs_1_11_io_in_ready),
    .io_in_valid(PEs_1_11_io_in_valid),
    .io_in_bits_X(PEs_1_11_io_in_bits_X),
    .io_in_bits_A(PEs_1_11_io_in_bits_A),
    .io_in_bits_B(PEs_1_11_io_in_bits_B),
    .io_in_bits_C(PEs_1_11_io_in_bits_C),
    .io_in_bits_D(PEs_1_11_io_in_bits_D),
    .io_in_bits_A0(PEs_1_11_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_11_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_11_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_11_io_in_bits_D0)
  );
  MD4ProcessingElement_28 PEs_1_12 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_12_clock),
    .io_out_ready(PEs_1_12_io_out_ready),
    .io_out_valid(PEs_1_12_io_out_valid),
    .io_out_bits_X(PEs_1_12_io_out_bits_X),
    .io_out_bits_A(PEs_1_12_io_out_bits_A),
    .io_out_bits_B(PEs_1_12_io_out_bits_B),
    .io_out_bits_C(PEs_1_12_io_out_bits_C),
    .io_out_bits_D(PEs_1_12_io_out_bits_D),
    .io_out_bits_A0(PEs_1_12_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_12_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_12_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_12_io_out_bits_D0),
    .io_in_ready(PEs_1_12_io_in_ready),
    .io_in_valid(PEs_1_12_io_in_valid),
    .io_in_bits_X(PEs_1_12_io_in_bits_X),
    .io_in_bits_A(PEs_1_12_io_in_bits_A),
    .io_in_bits_B(PEs_1_12_io_in_bits_B),
    .io_in_bits_C(PEs_1_12_io_in_bits_C),
    .io_in_bits_D(PEs_1_12_io_in_bits_D),
    .io_in_bits_A0(PEs_1_12_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_12_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_12_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_12_io_in_bits_D0)
  );
  MD4ProcessingElement_29 PEs_1_13 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_13_clock),
    .io_out_ready(PEs_1_13_io_out_ready),
    .io_out_valid(PEs_1_13_io_out_valid),
    .io_out_bits_X(PEs_1_13_io_out_bits_X),
    .io_out_bits_A(PEs_1_13_io_out_bits_A),
    .io_out_bits_B(PEs_1_13_io_out_bits_B),
    .io_out_bits_C(PEs_1_13_io_out_bits_C),
    .io_out_bits_D(PEs_1_13_io_out_bits_D),
    .io_out_bits_A0(PEs_1_13_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_13_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_13_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_13_io_out_bits_D0),
    .io_in_ready(PEs_1_13_io_in_ready),
    .io_in_valid(PEs_1_13_io_in_valid),
    .io_in_bits_X(PEs_1_13_io_in_bits_X),
    .io_in_bits_A(PEs_1_13_io_in_bits_A),
    .io_in_bits_B(PEs_1_13_io_in_bits_B),
    .io_in_bits_C(PEs_1_13_io_in_bits_C),
    .io_in_bits_D(PEs_1_13_io_in_bits_D),
    .io_in_bits_A0(PEs_1_13_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_13_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_13_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_13_io_in_bits_D0)
  );
  MD4ProcessingElement_30 PEs_1_14 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_14_clock),
    .io_out_ready(PEs_1_14_io_out_ready),
    .io_out_valid(PEs_1_14_io_out_valid),
    .io_out_bits_X(PEs_1_14_io_out_bits_X),
    .io_out_bits_A(PEs_1_14_io_out_bits_A),
    .io_out_bits_B(PEs_1_14_io_out_bits_B),
    .io_out_bits_C(PEs_1_14_io_out_bits_C),
    .io_out_bits_D(PEs_1_14_io_out_bits_D),
    .io_out_bits_A0(PEs_1_14_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_14_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_14_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_14_io_out_bits_D0),
    .io_in_ready(PEs_1_14_io_in_ready),
    .io_in_valid(PEs_1_14_io_in_valid),
    .io_in_bits_X(PEs_1_14_io_in_bits_X),
    .io_in_bits_A(PEs_1_14_io_in_bits_A),
    .io_in_bits_B(PEs_1_14_io_in_bits_B),
    .io_in_bits_C(PEs_1_14_io_in_bits_C),
    .io_in_bits_D(PEs_1_14_io_in_bits_D),
    .io_in_bits_A0(PEs_1_14_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_14_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_14_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_14_io_in_bits_D0)
  );
  MD4ProcessingElement_31 PEs_1_15 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_1_15_clock),
    .io_out_ready(PEs_1_15_io_out_ready),
    .io_out_valid(PEs_1_15_io_out_valid),
    .io_out_bits_X(PEs_1_15_io_out_bits_X),
    .io_out_bits_A(PEs_1_15_io_out_bits_A),
    .io_out_bits_B(PEs_1_15_io_out_bits_B),
    .io_out_bits_C(PEs_1_15_io_out_bits_C),
    .io_out_bits_D(PEs_1_15_io_out_bits_D),
    .io_out_bits_A0(PEs_1_15_io_out_bits_A0),
    .io_out_bits_B0(PEs_1_15_io_out_bits_B0),
    .io_out_bits_C0(PEs_1_15_io_out_bits_C0),
    .io_out_bits_D0(PEs_1_15_io_out_bits_D0),
    .io_in_ready(PEs_1_15_io_in_ready),
    .io_in_valid(PEs_1_15_io_in_valid),
    .io_in_bits_X(PEs_1_15_io_in_bits_X),
    .io_in_bits_A(PEs_1_15_io_in_bits_A),
    .io_in_bits_B(PEs_1_15_io_in_bits_B),
    .io_in_bits_C(PEs_1_15_io_in_bits_C),
    .io_in_bits_D(PEs_1_15_io_in_bits_D),
    .io_in_bits_A0(PEs_1_15_io_in_bits_A0),
    .io_in_bits_B0(PEs_1_15_io_in_bits_B0),
    .io_in_bits_C0(PEs_1_15_io_in_bits_C0),
    .io_in_bits_D0(PEs_1_15_io_in_bits_D0)
  );
  MD4ProcessingElement_32 PEs_2_0 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_0_clock),
    .io_out_ready(PEs_2_0_io_out_ready),
    .io_out_valid(PEs_2_0_io_out_valid),
    .io_out_bits_X(PEs_2_0_io_out_bits_X),
    .io_out_bits_A(PEs_2_0_io_out_bits_A),
    .io_out_bits_B(PEs_2_0_io_out_bits_B),
    .io_out_bits_C(PEs_2_0_io_out_bits_C),
    .io_out_bits_D(PEs_2_0_io_out_bits_D),
    .io_out_bits_A0(PEs_2_0_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_0_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_0_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_0_io_out_bits_D0),
    .io_in_ready(PEs_2_0_io_in_ready),
    .io_in_valid(PEs_2_0_io_in_valid),
    .io_in_bits_X(PEs_2_0_io_in_bits_X),
    .io_in_bits_A(PEs_2_0_io_in_bits_A),
    .io_in_bits_B(PEs_2_0_io_in_bits_B),
    .io_in_bits_C(PEs_2_0_io_in_bits_C),
    .io_in_bits_D(PEs_2_0_io_in_bits_D),
    .io_in_bits_A0(PEs_2_0_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_0_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_0_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_0_io_in_bits_D0)
  );
  MD4ProcessingElement_33 PEs_2_1 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_1_clock),
    .io_out_ready(PEs_2_1_io_out_ready),
    .io_out_valid(PEs_2_1_io_out_valid),
    .io_out_bits_X(PEs_2_1_io_out_bits_X),
    .io_out_bits_A(PEs_2_1_io_out_bits_A),
    .io_out_bits_B(PEs_2_1_io_out_bits_B),
    .io_out_bits_C(PEs_2_1_io_out_bits_C),
    .io_out_bits_D(PEs_2_1_io_out_bits_D),
    .io_out_bits_A0(PEs_2_1_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_1_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_1_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_1_io_out_bits_D0),
    .io_in_ready(PEs_2_1_io_in_ready),
    .io_in_valid(PEs_2_1_io_in_valid),
    .io_in_bits_X(PEs_2_1_io_in_bits_X),
    .io_in_bits_A(PEs_2_1_io_in_bits_A),
    .io_in_bits_B(PEs_2_1_io_in_bits_B),
    .io_in_bits_C(PEs_2_1_io_in_bits_C),
    .io_in_bits_D(PEs_2_1_io_in_bits_D),
    .io_in_bits_A0(PEs_2_1_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_1_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_1_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_1_io_in_bits_D0)
  );
  MD4ProcessingElement_34 PEs_2_2 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_2_clock),
    .io_out_ready(PEs_2_2_io_out_ready),
    .io_out_valid(PEs_2_2_io_out_valid),
    .io_out_bits_X(PEs_2_2_io_out_bits_X),
    .io_out_bits_A(PEs_2_2_io_out_bits_A),
    .io_out_bits_B(PEs_2_2_io_out_bits_B),
    .io_out_bits_C(PEs_2_2_io_out_bits_C),
    .io_out_bits_D(PEs_2_2_io_out_bits_D),
    .io_out_bits_A0(PEs_2_2_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_2_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_2_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_2_io_out_bits_D0),
    .io_in_ready(PEs_2_2_io_in_ready),
    .io_in_valid(PEs_2_2_io_in_valid),
    .io_in_bits_X(PEs_2_2_io_in_bits_X),
    .io_in_bits_A(PEs_2_2_io_in_bits_A),
    .io_in_bits_B(PEs_2_2_io_in_bits_B),
    .io_in_bits_C(PEs_2_2_io_in_bits_C),
    .io_in_bits_D(PEs_2_2_io_in_bits_D),
    .io_in_bits_A0(PEs_2_2_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_2_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_2_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_2_io_in_bits_D0)
  );
  MD4ProcessingElement_35 PEs_2_3 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_3_clock),
    .io_out_ready(PEs_2_3_io_out_ready),
    .io_out_valid(PEs_2_3_io_out_valid),
    .io_out_bits_X(PEs_2_3_io_out_bits_X),
    .io_out_bits_A(PEs_2_3_io_out_bits_A),
    .io_out_bits_B(PEs_2_3_io_out_bits_B),
    .io_out_bits_C(PEs_2_3_io_out_bits_C),
    .io_out_bits_D(PEs_2_3_io_out_bits_D),
    .io_out_bits_A0(PEs_2_3_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_3_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_3_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_3_io_out_bits_D0),
    .io_in_ready(PEs_2_3_io_in_ready),
    .io_in_valid(PEs_2_3_io_in_valid),
    .io_in_bits_X(PEs_2_3_io_in_bits_X),
    .io_in_bits_A(PEs_2_3_io_in_bits_A),
    .io_in_bits_B(PEs_2_3_io_in_bits_B),
    .io_in_bits_C(PEs_2_3_io_in_bits_C),
    .io_in_bits_D(PEs_2_3_io_in_bits_D),
    .io_in_bits_A0(PEs_2_3_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_3_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_3_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_3_io_in_bits_D0)
  );
  MD4ProcessingElement_36 PEs_2_4 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_4_clock),
    .io_out_ready(PEs_2_4_io_out_ready),
    .io_out_valid(PEs_2_4_io_out_valid),
    .io_out_bits_X(PEs_2_4_io_out_bits_X),
    .io_out_bits_A(PEs_2_4_io_out_bits_A),
    .io_out_bits_B(PEs_2_4_io_out_bits_B),
    .io_out_bits_C(PEs_2_4_io_out_bits_C),
    .io_out_bits_D(PEs_2_4_io_out_bits_D),
    .io_out_bits_A0(PEs_2_4_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_4_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_4_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_4_io_out_bits_D0),
    .io_in_ready(PEs_2_4_io_in_ready),
    .io_in_valid(PEs_2_4_io_in_valid),
    .io_in_bits_X(PEs_2_4_io_in_bits_X),
    .io_in_bits_A(PEs_2_4_io_in_bits_A),
    .io_in_bits_B(PEs_2_4_io_in_bits_B),
    .io_in_bits_C(PEs_2_4_io_in_bits_C),
    .io_in_bits_D(PEs_2_4_io_in_bits_D),
    .io_in_bits_A0(PEs_2_4_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_4_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_4_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_4_io_in_bits_D0)
  );
  MD4ProcessingElement_37 PEs_2_5 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_5_clock),
    .io_out_ready(PEs_2_5_io_out_ready),
    .io_out_valid(PEs_2_5_io_out_valid),
    .io_out_bits_X(PEs_2_5_io_out_bits_X),
    .io_out_bits_A(PEs_2_5_io_out_bits_A),
    .io_out_bits_B(PEs_2_5_io_out_bits_B),
    .io_out_bits_C(PEs_2_5_io_out_bits_C),
    .io_out_bits_D(PEs_2_5_io_out_bits_D),
    .io_out_bits_A0(PEs_2_5_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_5_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_5_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_5_io_out_bits_D0),
    .io_in_ready(PEs_2_5_io_in_ready),
    .io_in_valid(PEs_2_5_io_in_valid),
    .io_in_bits_X(PEs_2_5_io_in_bits_X),
    .io_in_bits_A(PEs_2_5_io_in_bits_A),
    .io_in_bits_B(PEs_2_5_io_in_bits_B),
    .io_in_bits_C(PEs_2_5_io_in_bits_C),
    .io_in_bits_D(PEs_2_5_io_in_bits_D),
    .io_in_bits_A0(PEs_2_5_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_5_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_5_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_5_io_in_bits_D0)
  );
  MD4ProcessingElement_38 PEs_2_6 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_6_clock),
    .io_out_ready(PEs_2_6_io_out_ready),
    .io_out_valid(PEs_2_6_io_out_valid),
    .io_out_bits_X(PEs_2_6_io_out_bits_X),
    .io_out_bits_A(PEs_2_6_io_out_bits_A),
    .io_out_bits_B(PEs_2_6_io_out_bits_B),
    .io_out_bits_C(PEs_2_6_io_out_bits_C),
    .io_out_bits_D(PEs_2_6_io_out_bits_D),
    .io_out_bits_A0(PEs_2_6_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_6_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_6_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_6_io_out_bits_D0),
    .io_in_ready(PEs_2_6_io_in_ready),
    .io_in_valid(PEs_2_6_io_in_valid),
    .io_in_bits_X(PEs_2_6_io_in_bits_X),
    .io_in_bits_A(PEs_2_6_io_in_bits_A),
    .io_in_bits_B(PEs_2_6_io_in_bits_B),
    .io_in_bits_C(PEs_2_6_io_in_bits_C),
    .io_in_bits_D(PEs_2_6_io_in_bits_D),
    .io_in_bits_A0(PEs_2_6_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_6_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_6_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_6_io_in_bits_D0)
  );
  MD4ProcessingElement_39 PEs_2_7 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_7_clock),
    .io_out_ready(PEs_2_7_io_out_ready),
    .io_out_valid(PEs_2_7_io_out_valid),
    .io_out_bits_X(PEs_2_7_io_out_bits_X),
    .io_out_bits_A(PEs_2_7_io_out_bits_A),
    .io_out_bits_B(PEs_2_7_io_out_bits_B),
    .io_out_bits_C(PEs_2_7_io_out_bits_C),
    .io_out_bits_D(PEs_2_7_io_out_bits_D),
    .io_out_bits_A0(PEs_2_7_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_7_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_7_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_7_io_out_bits_D0),
    .io_in_ready(PEs_2_7_io_in_ready),
    .io_in_valid(PEs_2_7_io_in_valid),
    .io_in_bits_X(PEs_2_7_io_in_bits_X),
    .io_in_bits_A(PEs_2_7_io_in_bits_A),
    .io_in_bits_B(PEs_2_7_io_in_bits_B),
    .io_in_bits_C(PEs_2_7_io_in_bits_C),
    .io_in_bits_D(PEs_2_7_io_in_bits_D),
    .io_in_bits_A0(PEs_2_7_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_7_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_7_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_7_io_in_bits_D0)
  );
  MD4ProcessingElement_40 PEs_2_8 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_8_clock),
    .io_out_ready(PEs_2_8_io_out_ready),
    .io_out_valid(PEs_2_8_io_out_valid),
    .io_out_bits_X(PEs_2_8_io_out_bits_X),
    .io_out_bits_A(PEs_2_8_io_out_bits_A),
    .io_out_bits_B(PEs_2_8_io_out_bits_B),
    .io_out_bits_C(PEs_2_8_io_out_bits_C),
    .io_out_bits_D(PEs_2_8_io_out_bits_D),
    .io_out_bits_A0(PEs_2_8_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_8_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_8_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_8_io_out_bits_D0),
    .io_in_ready(PEs_2_8_io_in_ready),
    .io_in_valid(PEs_2_8_io_in_valid),
    .io_in_bits_X(PEs_2_8_io_in_bits_X),
    .io_in_bits_A(PEs_2_8_io_in_bits_A),
    .io_in_bits_B(PEs_2_8_io_in_bits_B),
    .io_in_bits_C(PEs_2_8_io_in_bits_C),
    .io_in_bits_D(PEs_2_8_io_in_bits_D),
    .io_in_bits_A0(PEs_2_8_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_8_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_8_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_8_io_in_bits_D0)
  );
  MD4ProcessingElement_41 PEs_2_9 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_9_clock),
    .io_out_ready(PEs_2_9_io_out_ready),
    .io_out_valid(PEs_2_9_io_out_valid),
    .io_out_bits_X(PEs_2_9_io_out_bits_X),
    .io_out_bits_A(PEs_2_9_io_out_bits_A),
    .io_out_bits_B(PEs_2_9_io_out_bits_B),
    .io_out_bits_C(PEs_2_9_io_out_bits_C),
    .io_out_bits_D(PEs_2_9_io_out_bits_D),
    .io_out_bits_A0(PEs_2_9_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_9_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_9_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_9_io_out_bits_D0),
    .io_in_ready(PEs_2_9_io_in_ready),
    .io_in_valid(PEs_2_9_io_in_valid),
    .io_in_bits_X(PEs_2_9_io_in_bits_X),
    .io_in_bits_A(PEs_2_9_io_in_bits_A),
    .io_in_bits_B(PEs_2_9_io_in_bits_B),
    .io_in_bits_C(PEs_2_9_io_in_bits_C),
    .io_in_bits_D(PEs_2_9_io_in_bits_D),
    .io_in_bits_A0(PEs_2_9_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_9_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_9_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_9_io_in_bits_D0)
  );
  MD4ProcessingElement_42 PEs_2_10 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_10_clock),
    .io_out_ready(PEs_2_10_io_out_ready),
    .io_out_valid(PEs_2_10_io_out_valid),
    .io_out_bits_X(PEs_2_10_io_out_bits_X),
    .io_out_bits_A(PEs_2_10_io_out_bits_A),
    .io_out_bits_B(PEs_2_10_io_out_bits_B),
    .io_out_bits_C(PEs_2_10_io_out_bits_C),
    .io_out_bits_D(PEs_2_10_io_out_bits_D),
    .io_out_bits_A0(PEs_2_10_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_10_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_10_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_10_io_out_bits_D0),
    .io_in_ready(PEs_2_10_io_in_ready),
    .io_in_valid(PEs_2_10_io_in_valid),
    .io_in_bits_X(PEs_2_10_io_in_bits_X),
    .io_in_bits_A(PEs_2_10_io_in_bits_A),
    .io_in_bits_B(PEs_2_10_io_in_bits_B),
    .io_in_bits_C(PEs_2_10_io_in_bits_C),
    .io_in_bits_D(PEs_2_10_io_in_bits_D),
    .io_in_bits_A0(PEs_2_10_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_10_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_10_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_10_io_in_bits_D0)
  );
  MD4ProcessingElement_43 PEs_2_11 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_11_clock),
    .io_out_ready(PEs_2_11_io_out_ready),
    .io_out_valid(PEs_2_11_io_out_valid),
    .io_out_bits_X(PEs_2_11_io_out_bits_X),
    .io_out_bits_A(PEs_2_11_io_out_bits_A),
    .io_out_bits_B(PEs_2_11_io_out_bits_B),
    .io_out_bits_C(PEs_2_11_io_out_bits_C),
    .io_out_bits_D(PEs_2_11_io_out_bits_D),
    .io_out_bits_A0(PEs_2_11_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_11_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_11_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_11_io_out_bits_D0),
    .io_in_ready(PEs_2_11_io_in_ready),
    .io_in_valid(PEs_2_11_io_in_valid),
    .io_in_bits_X(PEs_2_11_io_in_bits_X),
    .io_in_bits_A(PEs_2_11_io_in_bits_A),
    .io_in_bits_B(PEs_2_11_io_in_bits_B),
    .io_in_bits_C(PEs_2_11_io_in_bits_C),
    .io_in_bits_D(PEs_2_11_io_in_bits_D),
    .io_in_bits_A0(PEs_2_11_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_11_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_11_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_11_io_in_bits_D0)
  );
  MD4ProcessingElement_44 PEs_2_12 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_12_clock),
    .io_out_ready(PEs_2_12_io_out_ready),
    .io_out_valid(PEs_2_12_io_out_valid),
    .io_out_bits_X(PEs_2_12_io_out_bits_X),
    .io_out_bits_A(PEs_2_12_io_out_bits_A),
    .io_out_bits_B(PEs_2_12_io_out_bits_B),
    .io_out_bits_C(PEs_2_12_io_out_bits_C),
    .io_out_bits_D(PEs_2_12_io_out_bits_D),
    .io_out_bits_A0(PEs_2_12_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_12_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_12_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_12_io_out_bits_D0),
    .io_in_ready(PEs_2_12_io_in_ready),
    .io_in_valid(PEs_2_12_io_in_valid),
    .io_in_bits_X(PEs_2_12_io_in_bits_X),
    .io_in_bits_A(PEs_2_12_io_in_bits_A),
    .io_in_bits_B(PEs_2_12_io_in_bits_B),
    .io_in_bits_C(PEs_2_12_io_in_bits_C),
    .io_in_bits_D(PEs_2_12_io_in_bits_D),
    .io_in_bits_A0(PEs_2_12_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_12_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_12_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_12_io_in_bits_D0)
  );
  MD4ProcessingElement_45 PEs_2_13 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_13_clock),
    .io_out_ready(PEs_2_13_io_out_ready),
    .io_out_valid(PEs_2_13_io_out_valid),
    .io_out_bits_X(PEs_2_13_io_out_bits_X),
    .io_out_bits_A(PEs_2_13_io_out_bits_A),
    .io_out_bits_B(PEs_2_13_io_out_bits_B),
    .io_out_bits_C(PEs_2_13_io_out_bits_C),
    .io_out_bits_D(PEs_2_13_io_out_bits_D),
    .io_out_bits_A0(PEs_2_13_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_13_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_13_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_13_io_out_bits_D0),
    .io_in_ready(PEs_2_13_io_in_ready),
    .io_in_valid(PEs_2_13_io_in_valid),
    .io_in_bits_X(PEs_2_13_io_in_bits_X),
    .io_in_bits_A(PEs_2_13_io_in_bits_A),
    .io_in_bits_B(PEs_2_13_io_in_bits_B),
    .io_in_bits_C(PEs_2_13_io_in_bits_C),
    .io_in_bits_D(PEs_2_13_io_in_bits_D),
    .io_in_bits_A0(PEs_2_13_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_13_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_13_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_13_io_in_bits_D0)
  );
  MD4ProcessingElement_46 PEs_2_14 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_14_clock),
    .io_out_ready(PEs_2_14_io_out_ready),
    .io_out_valid(PEs_2_14_io_out_valid),
    .io_out_bits_X(PEs_2_14_io_out_bits_X),
    .io_out_bits_A(PEs_2_14_io_out_bits_A),
    .io_out_bits_B(PEs_2_14_io_out_bits_B),
    .io_out_bits_C(PEs_2_14_io_out_bits_C),
    .io_out_bits_D(PEs_2_14_io_out_bits_D),
    .io_out_bits_A0(PEs_2_14_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_14_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_14_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_14_io_out_bits_D0),
    .io_in_ready(PEs_2_14_io_in_ready),
    .io_in_valid(PEs_2_14_io_in_valid),
    .io_in_bits_X(PEs_2_14_io_in_bits_X),
    .io_in_bits_A(PEs_2_14_io_in_bits_A),
    .io_in_bits_B(PEs_2_14_io_in_bits_B),
    .io_in_bits_C(PEs_2_14_io_in_bits_C),
    .io_in_bits_D(PEs_2_14_io_in_bits_D),
    .io_in_bits_A0(PEs_2_14_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_14_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_14_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_14_io_in_bits_D0)
  );
  MD4ProcessingElement_47 PEs_2_15 ( // @[MD4Pipelined.scala 34:22]
    .clock(PEs_2_15_clock),
    .io_out_ready(PEs_2_15_io_out_ready),
    .io_out_valid(PEs_2_15_io_out_valid),
    .io_out_bits_A(PEs_2_15_io_out_bits_A),
    .io_out_bits_B(PEs_2_15_io_out_bits_B),
    .io_out_bits_C(PEs_2_15_io_out_bits_C),
    .io_out_bits_D(PEs_2_15_io_out_bits_D),
    .io_out_bits_A0(PEs_2_15_io_out_bits_A0),
    .io_out_bits_B0(PEs_2_15_io_out_bits_B0),
    .io_out_bits_C0(PEs_2_15_io_out_bits_C0),
    .io_out_bits_D0(PEs_2_15_io_out_bits_D0),
    .io_in_ready(PEs_2_15_io_in_ready),
    .io_in_valid(PEs_2_15_io_in_valid),
    .io_in_bits_X(PEs_2_15_io_in_bits_X),
    .io_in_bits_A(PEs_2_15_io_in_bits_A),
    .io_in_bits_B(PEs_2_15_io_in_bits_B),
    .io_in_bits_C(PEs_2_15_io_in_bits_C),
    .io_in_bits_D(PEs_2_15_io_in_bits_D),
    .io_in_bits_A0(PEs_2_15_io_in_bits_A0),
    .io_in_bits_B0(PEs_2_15_io_in_bits_B0),
    .io_in_bits_C0(PEs_2_15_io_in_bits_C0),
    .io_in_bits_D0(PEs_2_15_io_in_bits_D0)
  );
  assign io_in_ready = changeInput_io_in_ready; // @[MD4Pipelined.scala 19:15]
  assign io_hash_valid = changeOutput_io_out_valid; // @[MD4Pipelined.scala 29:17]
  assign io_hash_bits = changeOutput_io_out_bits; // @[MD4Pipelined.scala 28:16]
  assign changeInput_clock = clock;
  assign changeInput_io_out_ready = PEs_0_0_io_in_ready; // @[MD4Pipelined.scala 53:34]
  assign changeInput_io_in_valid = io_in_valid; // @[MD4Pipelined.scala 13:27]
  assign changeInput_io_in_bits_X = io_in_bits_X; // @[MD4Pipelined.scala 14:28]
  assign changeInput_io_in_bits_A0 = io_in_bits_A0; // @[MD4Pipelined.scala 15:29]
  assign changeInput_io_in_bits_B0 = io_in_bits_B0; // @[MD4Pipelined.scala 16:29]
  assign changeInput_io_in_bits_C0 = io_in_bits_C0; // @[MD4Pipelined.scala 17:29]
  assign changeInput_io_in_bits_D0 = io_in_bits_D0; // @[MD4Pipelined.scala 18:29]
  assign add_clock = clock;
  assign add_io_in_valid = PEs_2_15_io_out_valid; // @[MD4Pipelined.scala 67:25]
  assign add_io_in_bits_A = PEs_2_15_io_out_bits_A; // @[MD4Pipelined.scala 72:26]
  assign add_io_in_bits_B = PEs_2_15_io_out_bits_B; // @[MD4Pipelined.scala 73:26]
  assign add_io_in_bits_C = PEs_2_15_io_out_bits_C; // @[MD4Pipelined.scala 74:26]
  assign add_io_in_bits_D = PEs_2_15_io_out_bits_D; // @[MD4Pipelined.scala 75:26]
  assign add_io_in_bits_A0 = PEs_2_15_io_out_bits_A0; // @[MD4Pipelined.scala 68:27]
  assign add_io_in_bits_B0 = PEs_2_15_io_out_bits_B0; // @[MD4Pipelined.scala 69:27]
  assign add_io_in_bits_C0 = PEs_2_15_io_out_bits_C0; // @[MD4Pipelined.scala 70:27]
  assign add_io_in_bits_D0 = PEs_2_15_io_out_bits_D0; // @[MD4Pipelined.scala 71:27]
  assign add_io_out_ready = changeOutput_io_in_ready; // @[MD4Pipelined.scala 27:20]
  assign changeOutput_clock = clock;
  assign changeOutput_io_out_ready = io_hash_ready; // @[MD4Pipelined.scala 30:29]
  assign changeOutput_io_in_valid = add_io_out_valid; // @[MD4Pipelined.scala 25:28]
  assign changeOutput_io_in_bits = {hi,lo}; // @[Cat.scala 30:58]
  assign PEs_0_0_clock = clock;
  assign PEs_0_0_io_out_ready = PEs_0_1_io_in_ready; // @[MD4Pipelined.scala 65:32]
  assign PEs_0_0_io_in_valid = changeInput_io_out_valid; // @[MD4Pipelined.scala 43:31]
  assign PEs_0_0_io_in_bits_X = changeInput_io_out_bits_X; // @[MD4Pipelined.scala 44:32]
  assign PEs_0_0_io_in_bits_A = changeInput_io_out_bits_A0; // @[MD4Pipelined.scala 49:32]
  assign PEs_0_0_io_in_bits_B = changeInput_io_out_bits_B0; // @[MD4Pipelined.scala 50:32]
  assign PEs_0_0_io_in_bits_C = changeInput_io_out_bits_C0; // @[MD4Pipelined.scala 51:32]
  assign PEs_0_0_io_in_bits_D = changeInput_io_out_bits_D0; // @[MD4Pipelined.scala 52:32]
  assign PEs_0_0_io_in_bits_A0 = changeInput_io_out_bits_A0; // @[MD4Pipelined.scala 45:33]
  assign PEs_0_0_io_in_bits_B0 = changeInput_io_out_bits_B0; // @[MD4Pipelined.scala 46:33]
  assign PEs_0_0_io_in_bits_C0 = changeInput_io_out_bits_C0; // @[MD4Pipelined.scala 47:33]
  assign PEs_0_0_io_in_bits_D0 = changeInput_io_out_bits_D0; // @[MD4Pipelined.scala 48:33]
  assign PEs_0_1_clock = clock;
  assign PEs_0_1_io_out_ready = PEs_0_2_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_1_io_in_valid = PEs_0_0_io_out_valid; // @[MD4Pipelined.scala 55:33]
  assign PEs_0_1_io_in_bits_X = PEs_0_0_io_out_bits_X; // @[MD4Pipelined.scala 56:34]
  assign PEs_0_1_io_in_bits_A = PEs_0_0_io_out_bits_A; // @[MD4Pipelined.scala 61:34]
  assign PEs_0_1_io_in_bits_B = PEs_0_0_io_out_bits_B; // @[MD4Pipelined.scala 62:34]
  assign PEs_0_1_io_in_bits_C = PEs_0_0_io_out_bits_C; // @[MD4Pipelined.scala 63:34]
  assign PEs_0_1_io_in_bits_D = PEs_0_0_io_out_bits_D; // @[MD4Pipelined.scala 64:34]
  assign PEs_0_1_io_in_bits_A0 = PEs_0_0_io_out_bits_A0; // @[MD4Pipelined.scala 57:35]
  assign PEs_0_1_io_in_bits_B0 = PEs_0_0_io_out_bits_B0; // @[MD4Pipelined.scala 58:35]
  assign PEs_0_1_io_in_bits_C0 = PEs_0_0_io_out_bits_C0; // @[MD4Pipelined.scala 59:35]
  assign PEs_0_1_io_in_bits_D0 = PEs_0_0_io_out_bits_D0; // @[MD4Pipelined.scala 60:35]
  assign PEs_0_2_clock = clock;
  assign PEs_0_2_io_out_ready = PEs_0_3_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_2_io_in_valid = PEs_0_1_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_2_io_in_bits_X = PEs_0_1_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_2_io_in_bits_A = PEs_0_1_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_2_io_in_bits_B = PEs_0_1_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_2_io_in_bits_C = PEs_0_1_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_2_io_in_bits_D = PEs_0_1_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_2_io_in_bits_A0 = PEs_0_1_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_2_io_in_bits_B0 = PEs_0_1_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_2_io_in_bits_C0 = PEs_0_1_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_2_io_in_bits_D0 = PEs_0_1_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_0_3_clock = clock;
  assign PEs_0_3_io_out_ready = PEs_0_4_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_3_io_in_valid = PEs_0_2_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_3_io_in_bits_X = PEs_0_2_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_3_io_in_bits_A = PEs_0_2_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_3_io_in_bits_B = PEs_0_2_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_3_io_in_bits_C = PEs_0_2_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_3_io_in_bits_D = PEs_0_2_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_3_io_in_bits_A0 = PEs_0_2_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_3_io_in_bits_B0 = PEs_0_2_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_3_io_in_bits_C0 = PEs_0_2_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_3_io_in_bits_D0 = PEs_0_2_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_0_4_clock = clock;
  assign PEs_0_4_io_out_ready = PEs_0_5_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_4_io_in_valid = PEs_0_3_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_4_io_in_bits_X = PEs_0_3_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_4_io_in_bits_A = PEs_0_3_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_4_io_in_bits_B = PEs_0_3_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_4_io_in_bits_C = PEs_0_3_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_4_io_in_bits_D = PEs_0_3_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_4_io_in_bits_A0 = PEs_0_3_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_4_io_in_bits_B0 = PEs_0_3_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_4_io_in_bits_C0 = PEs_0_3_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_4_io_in_bits_D0 = PEs_0_3_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_0_5_clock = clock;
  assign PEs_0_5_io_out_ready = PEs_0_6_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_5_io_in_valid = PEs_0_4_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_5_io_in_bits_X = PEs_0_4_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_5_io_in_bits_A = PEs_0_4_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_5_io_in_bits_B = PEs_0_4_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_5_io_in_bits_C = PEs_0_4_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_5_io_in_bits_D = PEs_0_4_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_5_io_in_bits_A0 = PEs_0_4_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_5_io_in_bits_B0 = PEs_0_4_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_5_io_in_bits_C0 = PEs_0_4_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_5_io_in_bits_D0 = PEs_0_4_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_0_6_clock = clock;
  assign PEs_0_6_io_out_ready = PEs_0_7_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_6_io_in_valid = PEs_0_5_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_6_io_in_bits_X = PEs_0_5_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_6_io_in_bits_A = PEs_0_5_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_6_io_in_bits_B = PEs_0_5_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_6_io_in_bits_C = PEs_0_5_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_6_io_in_bits_D = PEs_0_5_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_6_io_in_bits_A0 = PEs_0_5_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_6_io_in_bits_B0 = PEs_0_5_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_6_io_in_bits_C0 = PEs_0_5_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_6_io_in_bits_D0 = PEs_0_5_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_0_7_clock = clock;
  assign PEs_0_7_io_out_ready = PEs_0_8_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_7_io_in_valid = PEs_0_6_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_7_io_in_bits_X = PEs_0_6_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_7_io_in_bits_A = PEs_0_6_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_7_io_in_bits_B = PEs_0_6_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_7_io_in_bits_C = PEs_0_6_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_7_io_in_bits_D = PEs_0_6_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_7_io_in_bits_A0 = PEs_0_6_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_7_io_in_bits_B0 = PEs_0_6_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_7_io_in_bits_C0 = PEs_0_6_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_7_io_in_bits_D0 = PEs_0_6_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_0_8_clock = clock;
  assign PEs_0_8_io_out_ready = PEs_0_9_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_8_io_in_valid = PEs_0_7_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_8_io_in_bits_X = PEs_0_7_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_8_io_in_bits_A = PEs_0_7_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_8_io_in_bits_B = PEs_0_7_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_8_io_in_bits_C = PEs_0_7_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_8_io_in_bits_D = PEs_0_7_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_8_io_in_bits_A0 = PEs_0_7_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_8_io_in_bits_B0 = PEs_0_7_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_8_io_in_bits_C0 = PEs_0_7_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_8_io_in_bits_D0 = PEs_0_7_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_0_9_clock = clock;
  assign PEs_0_9_io_out_ready = PEs_0_10_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_9_io_in_valid = PEs_0_8_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_9_io_in_bits_X = PEs_0_8_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_9_io_in_bits_A = PEs_0_8_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_9_io_in_bits_B = PEs_0_8_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_9_io_in_bits_C = PEs_0_8_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_9_io_in_bits_D = PEs_0_8_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_9_io_in_bits_A0 = PEs_0_8_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_9_io_in_bits_B0 = PEs_0_8_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_9_io_in_bits_C0 = PEs_0_8_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_9_io_in_bits_D0 = PEs_0_8_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_0_10_clock = clock;
  assign PEs_0_10_io_out_ready = PEs_0_11_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_10_io_in_valid = PEs_0_9_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_10_io_in_bits_X = PEs_0_9_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_10_io_in_bits_A = PEs_0_9_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_10_io_in_bits_B = PEs_0_9_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_10_io_in_bits_C = PEs_0_9_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_10_io_in_bits_D = PEs_0_9_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_10_io_in_bits_A0 = PEs_0_9_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_10_io_in_bits_B0 = PEs_0_9_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_10_io_in_bits_C0 = PEs_0_9_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_10_io_in_bits_D0 = PEs_0_9_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_0_11_clock = clock;
  assign PEs_0_11_io_out_ready = PEs_0_12_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_11_io_in_valid = PEs_0_10_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_11_io_in_bits_X = PEs_0_10_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_11_io_in_bits_A = PEs_0_10_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_11_io_in_bits_B = PEs_0_10_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_11_io_in_bits_C = PEs_0_10_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_11_io_in_bits_D = PEs_0_10_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_11_io_in_bits_A0 = PEs_0_10_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_11_io_in_bits_B0 = PEs_0_10_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_11_io_in_bits_C0 = PEs_0_10_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_11_io_in_bits_D0 = PEs_0_10_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_0_12_clock = clock;
  assign PEs_0_12_io_out_ready = PEs_0_13_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_12_io_in_valid = PEs_0_11_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_12_io_in_bits_X = PEs_0_11_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_12_io_in_bits_A = PEs_0_11_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_12_io_in_bits_B = PEs_0_11_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_12_io_in_bits_C = PEs_0_11_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_12_io_in_bits_D = PEs_0_11_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_12_io_in_bits_A0 = PEs_0_11_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_12_io_in_bits_B0 = PEs_0_11_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_12_io_in_bits_C0 = PEs_0_11_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_12_io_in_bits_D0 = PEs_0_11_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_0_13_clock = clock;
  assign PEs_0_13_io_out_ready = PEs_0_14_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_13_io_in_valid = PEs_0_12_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_13_io_in_bits_X = PEs_0_12_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_13_io_in_bits_A = PEs_0_12_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_13_io_in_bits_B = PEs_0_12_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_13_io_in_bits_C = PEs_0_12_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_13_io_in_bits_D = PEs_0_12_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_13_io_in_bits_A0 = PEs_0_12_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_13_io_in_bits_B0 = PEs_0_12_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_13_io_in_bits_C0 = PEs_0_12_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_13_io_in_bits_D0 = PEs_0_12_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_0_14_clock = clock;
  assign PEs_0_14_io_out_ready = PEs_0_15_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_0_14_io_in_valid = PEs_0_13_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_14_io_in_bits_X = PEs_0_13_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_14_io_in_bits_A = PEs_0_13_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_14_io_in_bits_B = PEs_0_13_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_14_io_in_bits_C = PEs_0_13_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_14_io_in_bits_D = PEs_0_13_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_14_io_in_bits_A0 = PEs_0_13_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_14_io_in_bits_B0 = PEs_0_13_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_14_io_in_bits_C0 = PEs_0_13_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_14_io_in_bits_D0 = PEs_0_13_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_0_15_clock = clock;
  assign PEs_0_15_io_out_ready = PEs_1_0_io_in_ready; // @[MD4Pipelined.scala 88:32]
  assign PEs_0_15_io_in_valid = PEs_0_14_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_0_15_io_in_bits_X = PEs_0_14_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_0_15_io_in_bits_A = PEs_0_14_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_0_15_io_in_bits_B = PEs_0_14_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_0_15_io_in_bits_C = PEs_0_14_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_0_15_io_in_bits_D = PEs_0_14_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_0_15_io_in_bits_A0 = PEs_0_14_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_0_15_io_in_bits_B0 = PEs_0_14_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_0_15_io_in_bits_C0 = PEs_0_14_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_0_15_io_in_bits_D0 = PEs_0_14_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_0_clock = clock;
  assign PEs_1_0_io_out_ready = PEs_1_1_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_0_io_in_valid = PEs_0_15_io_out_valid; // @[MD4Pipelined.scala 78:33]
  assign PEs_1_0_io_in_bits_X = PEs_0_15_io_out_bits_X; // @[MD4Pipelined.scala 79:34]
  assign PEs_1_0_io_in_bits_A = PEs_0_15_io_out_bits_A; // @[MD4Pipelined.scala 84:34]
  assign PEs_1_0_io_in_bits_B = PEs_0_15_io_out_bits_B; // @[MD4Pipelined.scala 85:34]
  assign PEs_1_0_io_in_bits_C = PEs_0_15_io_out_bits_C; // @[MD4Pipelined.scala 86:34]
  assign PEs_1_0_io_in_bits_D = PEs_0_15_io_out_bits_D; // @[MD4Pipelined.scala 87:34]
  assign PEs_1_0_io_in_bits_A0 = PEs_0_15_io_out_bits_A0; // @[MD4Pipelined.scala 80:35]
  assign PEs_1_0_io_in_bits_B0 = PEs_0_15_io_out_bits_B0; // @[MD4Pipelined.scala 81:35]
  assign PEs_1_0_io_in_bits_C0 = PEs_0_15_io_out_bits_C0; // @[MD4Pipelined.scala 82:35]
  assign PEs_1_0_io_in_bits_D0 = PEs_0_15_io_out_bits_D0; // @[MD4Pipelined.scala 83:35]
  assign PEs_1_1_clock = clock;
  assign PEs_1_1_io_out_ready = PEs_1_2_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_1_io_in_valid = PEs_1_0_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_1_io_in_bits_X = PEs_1_0_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_1_io_in_bits_A = PEs_1_0_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_1_io_in_bits_B = PEs_1_0_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_1_io_in_bits_C = PEs_1_0_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_1_io_in_bits_D = PEs_1_0_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_1_io_in_bits_A0 = PEs_1_0_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_1_io_in_bits_B0 = PEs_1_0_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_1_io_in_bits_C0 = PEs_1_0_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_1_io_in_bits_D0 = PEs_1_0_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_2_clock = clock;
  assign PEs_1_2_io_out_ready = PEs_1_3_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_2_io_in_valid = PEs_1_1_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_2_io_in_bits_X = PEs_1_1_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_2_io_in_bits_A = PEs_1_1_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_2_io_in_bits_B = PEs_1_1_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_2_io_in_bits_C = PEs_1_1_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_2_io_in_bits_D = PEs_1_1_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_2_io_in_bits_A0 = PEs_1_1_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_2_io_in_bits_B0 = PEs_1_1_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_2_io_in_bits_C0 = PEs_1_1_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_2_io_in_bits_D0 = PEs_1_1_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_3_clock = clock;
  assign PEs_1_3_io_out_ready = PEs_1_4_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_3_io_in_valid = PEs_1_2_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_3_io_in_bits_X = PEs_1_2_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_3_io_in_bits_A = PEs_1_2_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_3_io_in_bits_B = PEs_1_2_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_3_io_in_bits_C = PEs_1_2_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_3_io_in_bits_D = PEs_1_2_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_3_io_in_bits_A0 = PEs_1_2_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_3_io_in_bits_B0 = PEs_1_2_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_3_io_in_bits_C0 = PEs_1_2_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_3_io_in_bits_D0 = PEs_1_2_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_4_clock = clock;
  assign PEs_1_4_io_out_ready = PEs_1_5_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_4_io_in_valid = PEs_1_3_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_4_io_in_bits_X = PEs_1_3_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_4_io_in_bits_A = PEs_1_3_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_4_io_in_bits_B = PEs_1_3_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_4_io_in_bits_C = PEs_1_3_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_4_io_in_bits_D = PEs_1_3_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_4_io_in_bits_A0 = PEs_1_3_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_4_io_in_bits_B0 = PEs_1_3_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_4_io_in_bits_C0 = PEs_1_3_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_4_io_in_bits_D0 = PEs_1_3_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_5_clock = clock;
  assign PEs_1_5_io_out_ready = PEs_1_6_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_5_io_in_valid = PEs_1_4_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_5_io_in_bits_X = PEs_1_4_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_5_io_in_bits_A = PEs_1_4_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_5_io_in_bits_B = PEs_1_4_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_5_io_in_bits_C = PEs_1_4_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_5_io_in_bits_D = PEs_1_4_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_5_io_in_bits_A0 = PEs_1_4_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_5_io_in_bits_B0 = PEs_1_4_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_5_io_in_bits_C0 = PEs_1_4_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_5_io_in_bits_D0 = PEs_1_4_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_6_clock = clock;
  assign PEs_1_6_io_out_ready = PEs_1_7_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_6_io_in_valid = PEs_1_5_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_6_io_in_bits_X = PEs_1_5_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_6_io_in_bits_A = PEs_1_5_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_6_io_in_bits_B = PEs_1_5_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_6_io_in_bits_C = PEs_1_5_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_6_io_in_bits_D = PEs_1_5_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_6_io_in_bits_A0 = PEs_1_5_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_6_io_in_bits_B0 = PEs_1_5_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_6_io_in_bits_C0 = PEs_1_5_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_6_io_in_bits_D0 = PEs_1_5_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_7_clock = clock;
  assign PEs_1_7_io_out_ready = PEs_1_8_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_7_io_in_valid = PEs_1_6_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_7_io_in_bits_X = PEs_1_6_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_7_io_in_bits_A = PEs_1_6_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_7_io_in_bits_B = PEs_1_6_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_7_io_in_bits_C = PEs_1_6_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_7_io_in_bits_D = PEs_1_6_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_7_io_in_bits_A0 = PEs_1_6_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_7_io_in_bits_B0 = PEs_1_6_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_7_io_in_bits_C0 = PEs_1_6_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_7_io_in_bits_D0 = PEs_1_6_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_8_clock = clock;
  assign PEs_1_8_io_out_ready = PEs_1_9_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_8_io_in_valid = PEs_1_7_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_8_io_in_bits_X = PEs_1_7_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_8_io_in_bits_A = PEs_1_7_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_8_io_in_bits_B = PEs_1_7_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_8_io_in_bits_C = PEs_1_7_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_8_io_in_bits_D = PEs_1_7_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_8_io_in_bits_A0 = PEs_1_7_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_8_io_in_bits_B0 = PEs_1_7_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_8_io_in_bits_C0 = PEs_1_7_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_8_io_in_bits_D0 = PEs_1_7_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_9_clock = clock;
  assign PEs_1_9_io_out_ready = PEs_1_10_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_9_io_in_valid = PEs_1_8_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_9_io_in_bits_X = PEs_1_8_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_9_io_in_bits_A = PEs_1_8_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_9_io_in_bits_B = PEs_1_8_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_9_io_in_bits_C = PEs_1_8_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_9_io_in_bits_D = PEs_1_8_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_9_io_in_bits_A0 = PEs_1_8_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_9_io_in_bits_B0 = PEs_1_8_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_9_io_in_bits_C0 = PEs_1_8_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_9_io_in_bits_D0 = PEs_1_8_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_10_clock = clock;
  assign PEs_1_10_io_out_ready = PEs_1_11_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_10_io_in_valid = PEs_1_9_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_10_io_in_bits_X = PEs_1_9_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_10_io_in_bits_A = PEs_1_9_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_10_io_in_bits_B = PEs_1_9_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_10_io_in_bits_C = PEs_1_9_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_10_io_in_bits_D = PEs_1_9_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_10_io_in_bits_A0 = PEs_1_9_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_10_io_in_bits_B0 = PEs_1_9_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_10_io_in_bits_C0 = PEs_1_9_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_10_io_in_bits_D0 = PEs_1_9_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_11_clock = clock;
  assign PEs_1_11_io_out_ready = PEs_1_12_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_11_io_in_valid = PEs_1_10_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_11_io_in_bits_X = PEs_1_10_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_11_io_in_bits_A = PEs_1_10_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_11_io_in_bits_B = PEs_1_10_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_11_io_in_bits_C = PEs_1_10_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_11_io_in_bits_D = PEs_1_10_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_11_io_in_bits_A0 = PEs_1_10_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_11_io_in_bits_B0 = PEs_1_10_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_11_io_in_bits_C0 = PEs_1_10_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_11_io_in_bits_D0 = PEs_1_10_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_12_clock = clock;
  assign PEs_1_12_io_out_ready = PEs_1_13_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_12_io_in_valid = PEs_1_11_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_12_io_in_bits_X = PEs_1_11_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_12_io_in_bits_A = PEs_1_11_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_12_io_in_bits_B = PEs_1_11_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_12_io_in_bits_C = PEs_1_11_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_12_io_in_bits_D = PEs_1_11_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_12_io_in_bits_A0 = PEs_1_11_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_12_io_in_bits_B0 = PEs_1_11_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_12_io_in_bits_C0 = PEs_1_11_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_12_io_in_bits_D0 = PEs_1_11_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_13_clock = clock;
  assign PEs_1_13_io_out_ready = PEs_1_14_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_13_io_in_valid = PEs_1_12_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_13_io_in_bits_X = PEs_1_12_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_13_io_in_bits_A = PEs_1_12_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_13_io_in_bits_B = PEs_1_12_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_13_io_in_bits_C = PEs_1_12_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_13_io_in_bits_D = PEs_1_12_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_13_io_in_bits_A0 = PEs_1_12_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_13_io_in_bits_B0 = PEs_1_12_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_13_io_in_bits_C0 = PEs_1_12_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_13_io_in_bits_D0 = PEs_1_12_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_14_clock = clock;
  assign PEs_1_14_io_out_ready = PEs_1_15_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_1_14_io_in_valid = PEs_1_13_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_14_io_in_bits_X = PEs_1_13_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_14_io_in_bits_A = PEs_1_13_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_14_io_in_bits_B = PEs_1_13_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_14_io_in_bits_C = PEs_1_13_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_14_io_in_bits_D = PEs_1_13_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_14_io_in_bits_A0 = PEs_1_13_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_14_io_in_bits_B0 = PEs_1_13_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_14_io_in_bits_C0 = PEs_1_13_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_14_io_in_bits_D0 = PEs_1_13_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_1_15_clock = clock;
  assign PEs_1_15_io_out_ready = PEs_2_0_io_in_ready; // @[MD4Pipelined.scala 88:32]
  assign PEs_1_15_io_in_valid = PEs_1_14_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_1_15_io_in_bits_X = PEs_1_14_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_1_15_io_in_bits_A = PEs_1_14_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_1_15_io_in_bits_B = PEs_1_14_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_1_15_io_in_bits_C = PEs_1_14_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_1_15_io_in_bits_D = PEs_1_14_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_1_15_io_in_bits_A0 = PEs_1_14_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_1_15_io_in_bits_B0 = PEs_1_14_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_1_15_io_in_bits_C0 = PEs_1_14_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_1_15_io_in_bits_D0 = PEs_1_14_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_0_clock = clock;
  assign PEs_2_0_io_out_ready = PEs_2_1_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_0_io_in_valid = PEs_1_15_io_out_valid; // @[MD4Pipelined.scala 78:33]
  assign PEs_2_0_io_in_bits_X = PEs_1_15_io_out_bits_X; // @[MD4Pipelined.scala 79:34]
  assign PEs_2_0_io_in_bits_A = PEs_1_15_io_out_bits_A; // @[MD4Pipelined.scala 84:34]
  assign PEs_2_0_io_in_bits_B = PEs_1_15_io_out_bits_B; // @[MD4Pipelined.scala 85:34]
  assign PEs_2_0_io_in_bits_C = PEs_1_15_io_out_bits_C; // @[MD4Pipelined.scala 86:34]
  assign PEs_2_0_io_in_bits_D = PEs_1_15_io_out_bits_D; // @[MD4Pipelined.scala 87:34]
  assign PEs_2_0_io_in_bits_A0 = PEs_1_15_io_out_bits_A0; // @[MD4Pipelined.scala 80:35]
  assign PEs_2_0_io_in_bits_B0 = PEs_1_15_io_out_bits_B0; // @[MD4Pipelined.scala 81:35]
  assign PEs_2_0_io_in_bits_C0 = PEs_1_15_io_out_bits_C0; // @[MD4Pipelined.scala 82:35]
  assign PEs_2_0_io_in_bits_D0 = PEs_1_15_io_out_bits_D0; // @[MD4Pipelined.scala 83:35]
  assign PEs_2_1_clock = clock;
  assign PEs_2_1_io_out_ready = PEs_2_2_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_1_io_in_valid = PEs_2_0_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_1_io_in_bits_X = PEs_2_0_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_1_io_in_bits_A = PEs_2_0_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_1_io_in_bits_B = PEs_2_0_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_1_io_in_bits_C = PEs_2_0_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_1_io_in_bits_D = PEs_2_0_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_1_io_in_bits_A0 = PEs_2_0_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_1_io_in_bits_B0 = PEs_2_0_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_1_io_in_bits_C0 = PEs_2_0_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_1_io_in_bits_D0 = PEs_2_0_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_2_clock = clock;
  assign PEs_2_2_io_out_ready = PEs_2_3_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_2_io_in_valid = PEs_2_1_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_2_io_in_bits_X = PEs_2_1_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_2_io_in_bits_A = PEs_2_1_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_2_io_in_bits_B = PEs_2_1_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_2_io_in_bits_C = PEs_2_1_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_2_io_in_bits_D = PEs_2_1_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_2_io_in_bits_A0 = PEs_2_1_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_2_io_in_bits_B0 = PEs_2_1_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_2_io_in_bits_C0 = PEs_2_1_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_2_io_in_bits_D0 = PEs_2_1_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_3_clock = clock;
  assign PEs_2_3_io_out_ready = PEs_2_4_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_3_io_in_valid = PEs_2_2_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_3_io_in_bits_X = PEs_2_2_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_3_io_in_bits_A = PEs_2_2_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_3_io_in_bits_B = PEs_2_2_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_3_io_in_bits_C = PEs_2_2_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_3_io_in_bits_D = PEs_2_2_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_3_io_in_bits_A0 = PEs_2_2_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_3_io_in_bits_B0 = PEs_2_2_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_3_io_in_bits_C0 = PEs_2_2_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_3_io_in_bits_D0 = PEs_2_2_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_4_clock = clock;
  assign PEs_2_4_io_out_ready = PEs_2_5_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_4_io_in_valid = PEs_2_3_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_4_io_in_bits_X = PEs_2_3_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_4_io_in_bits_A = PEs_2_3_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_4_io_in_bits_B = PEs_2_3_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_4_io_in_bits_C = PEs_2_3_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_4_io_in_bits_D = PEs_2_3_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_4_io_in_bits_A0 = PEs_2_3_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_4_io_in_bits_B0 = PEs_2_3_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_4_io_in_bits_C0 = PEs_2_3_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_4_io_in_bits_D0 = PEs_2_3_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_5_clock = clock;
  assign PEs_2_5_io_out_ready = PEs_2_6_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_5_io_in_valid = PEs_2_4_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_5_io_in_bits_X = PEs_2_4_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_5_io_in_bits_A = PEs_2_4_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_5_io_in_bits_B = PEs_2_4_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_5_io_in_bits_C = PEs_2_4_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_5_io_in_bits_D = PEs_2_4_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_5_io_in_bits_A0 = PEs_2_4_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_5_io_in_bits_B0 = PEs_2_4_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_5_io_in_bits_C0 = PEs_2_4_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_5_io_in_bits_D0 = PEs_2_4_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_6_clock = clock;
  assign PEs_2_6_io_out_ready = PEs_2_7_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_6_io_in_valid = PEs_2_5_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_6_io_in_bits_X = PEs_2_5_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_6_io_in_bits_A = PEs_2_5_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_6_io_in_bits_B = PEs_2_5_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_6_io_in_bits_C = PEs_2_5_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_6_io_in_bits_D = PEs_2_5_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_6_io_in_bits_A0 = PEs_2_5_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_6_io_in_bits_B0 = PEs_2_5_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_6_io_in_bits_C0 = PEs_2_5_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_6_io_in_bits_D0 = PEs_2_5_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_7_clock = clock;
  assign PEs_2_7_io_out_ready = PEs_2_8_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_7_io_in_valid = PEs_2_6_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_7_io_in_bits_X = PEs_2_6_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_7_io_in_bits_A = PEs_2_6_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_7_io_in_bits_B = PEs_2_6_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_7_io_in_bits_C = PEs_2_6_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_7_io_in_bits_D = PEs_2_6_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_7_io_in_bits_A0 = PEs_2_6_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_7_io_in_bits_B0 = PEs_2_6_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_7_io_in_bits_C0 = PEs_2_6_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_7_io_in_bits_D0 = PEs_2_6_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_8_clock = clock;
  assign PEs_2_8_io_out_ready = PEs_2_9_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_8_io_in_valid = PEs_2_7_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_8_io_in_bits_X = PEs_2_7_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_8_io_in_bits_A = PEs_2_7_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_8_io_in_bits_B = PEs_2_7_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_8_io_in_bits_C = PEs_2_7_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_8_io_in_bits_D = PEs_2_7_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_8_io_in_bits_A0 = PEs_2_7_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_8_io_in_bits_B0 = PEs_2_7_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_8_io_in_bits_C0 = PEs_2_7_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_8_io_in_bits_D0 = PEs_2_7_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_9_clock = clock;
  assign PEs_2_9_io_out_ready = PEs_2_10_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_9_io_in_valid = PEs_2_8_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_9_io_in_bits_X = PEs_2_8_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_9_io_in_bits_A = PEs_2_8_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_9_io_in_bits_B = PEs_2_8_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_9_io_in_bits_C = PEs_2_8_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_9_io_in_bits_D = PEs_2_8_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_9_io_in_bits_A0 = PEs_2_8_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_9_io_in_bits_B0 = PEs_2_8_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_9_io_in_bits_C0 = PEs_2_8_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_9_io_in_bits_D0 = PEs_2_8_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_10_clock = clock;
  assign PEs_2_10_io_out_ready = PEs_2_11_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_10_io_in_valid = PEs_2_9_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_10_io_in_bits_X = PEs_2_9_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_10_io_in_bits_A = PEs_2_9_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_10_io_in_bits_B = PEs_2_9_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_10_io_in_bits_C = PEs_2_9_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_10_io_in_bits_D = PEs_2_9_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_10_io_in_bits_A0 = PEs_2_9_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_10_io_in_bits_B0 = PEs_2_9_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_10_io_in_bits_C0 = PEs_2_9_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_10_io_in_bits_D0 = PEs_2_9_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_11_clock = clock;
  assign PEs_2_11_io_out_ready = PEs_2_12_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_11_io_in_valid = PEs_2_10_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_11_io_in_bits_X = PEs_2_10_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_11_io_in_bits_A = PEs_2_10_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_11_io_in_bits_B = PEs_2_10_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_11_io_in_bits_C = PEs_2_10_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_11_io_in_bits_D = PEs_2_10_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_11_io_in_bits_A0 = PEs_2_10_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_11_io_in_bits_B0 = PEs_2_10_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_11_io_in_bits_C0 = PEs_2_10_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_11_io_in_bits_D0 = PEs_2_10_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_12_clock = clock;
  assign PEs_2_12_io_out_ready = PEs_2_13_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_12_io_in_valid = PEs_2_11_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_12_io_in_bits_X = PEs_2_11_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_12_io_in_bits_A = PEs_2_11_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_12_io_in_bits_B = PEs_2_11_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_12_io_in_bits_C = PEs_2_11_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_12_io_in_bits_D = PEs_2_11_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_12_io_in_bits_A0 = PEs_2_11_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_12_io_in_bits_B0 = PEs_2_11_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_12_io_in_bits_C0 = PEs_2_11_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_12_io_in_bits_D0 = PEs_2_11_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_13_clock = clock;
  assign PEs_2_13_io_out_ready = PEs_2_14_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_13_io_in_valid = PEs_2_12_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_13_io_in_bits_X = PEs_2_12_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_13_io_in_bits_A = PEs_2_12_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_13_io_in_bits_B = PEs_2_12_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_13_io_in_bits_C = PEs_2_12_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_13_io_in_bits_D = PEs_2_12_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_13_io_in_bits_A0 = PEs_2_12_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_13_io_in_bits_B0 = PEs_2_12_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_13_io_in_bits_C0 = PEs_2_12_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_13_io_in_bits_D0 = PEs_2_12_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_14_clock = clock;
  assign PEs_2_14_io_out_ready = PEs_2_15_io_in_ready; // @[MD4Pipelined.scala 100:32]
  assign PEs_2_14_io_in_valid = PEs_2_13_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_14_io_in_bits_X = PEs_2_13_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_14_io_in_bits_A = PEs_2_13_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_14_io_in_bits_B = PEs_2_13_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_14_io_in_bits_C = PEs_2_13_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_14_io_in_bits_D = PEs_2_13_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_14_io_in_bits_A0 = PEs_2_13_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_14_io_in_bits_B0 = PEs_2_13_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_14_io_in_bits_C0 = PEs_2_13_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_14_io_in_bits_D0 = PEs_2_13_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
  assign PEs_2_15_clock = clock;
  assign PEs_2_15_io_out_ready = add_io_in_ready; // @[MD4Pipelined.scala 76:32]
  assign PEs_2_15_io_in_valid = PEs_2_14_io_out_valid; // @[MD4Pipelined.scala 90:33]
  assign PEs_2_15_io_in_bits_X = PEs_2_14_io_out_bits_X; // @[MD4Pipelined.scala 91:34]
  assign PEs_2_15_io_in_bits_A = PEs_2_14_io_out_bits_A; // @[MD4Pipelined.scala 96:34]
  assign PEs_2_15_io_in_bits_B = PEs_2_14_io_out_bits_B; // @[MD4Pipelined.scala 97:34]
  assign PEs_2_15_io_in_bits_C = PEs_2_14_io_out_bits_C; // @[MD4Pipelined.scala 98:34]
  assign PEs_2_15_io_in_bits_D = PEs_2_14_io_out_bits_D; // @[MD4Pipelined.scala 99:34]
  assign PEs_2_15_io_in_bits_A0 = PEs_2_14_io_out_bits_A0; // @[MD4Pipelined.scala 92:35]
  assign PEs_2_15_io_in_bits_B0 = PEs_2_14_io_out_bits_B0; // @[MD4Pipelined.scala 93:35]
  assign PEs_2_15_io_in_bits_C0 = PEs_2_14_io_out_bits_C0; // @[MD4Pipelined.scala 94:35]
  assign PEs_2_15_io_in_bits_D0 = PEs_2_14_io_out_bits_D0; // @[MD4Pipelined.scala 95:35]
endmodule
