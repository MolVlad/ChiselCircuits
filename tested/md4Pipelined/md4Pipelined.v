module changeWordOrder(
  input  [31:0] io_in,
  output [31:0] io_out
);
  wire [7:0] byte0 = io_in[7:0]; // @[changeWordOrder.scala 13:17]
  wire [7:0] byte1 = io_in[15:8]; // @[changeWordOrder.scala 14:17]
  wire [7:0] byte2 = io_in[23:16]; // @[changeWordOrder.scala 15:17]
  wire [7:0] byte3 = io_in[31:24]; // @[changeWordOrder.scala 16:17]
  wire [15:0] lo = {byte2,byte3}; // @[Cat.scala 30:58]
  wire [15:0] hi = {byte0,byte1}; // @[Cat.scala 30:58]
  assign io_out = {hi,lo}; // @[Cat.scala 30:58]
endmodule
module ChangeOrderMD4Input(
  input          clock,
  input          reset,
  input          io_out_ready,
  output         io_out_valid,
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
  reg [511:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] changeWordOrder_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_1_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_1_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_2_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_2_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_3_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_3_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_4_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_4_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_5_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_5_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_6_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_6_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_7_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_7_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_8_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_8_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_9_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_9_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_10_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_10_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_11_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_11_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_12_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_12_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_13_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_13_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_14_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_14_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_15_io_in; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_15_io_out; // @[md4Pipelined.scala 277:11]
  wire [31:0] changeWordOrder_16_io_in; // @[md4Pipelined.scala 286:19]
  wire [31:0] changeWordOrder_16_io_out; // @[md4Pipelined.scala 286:19]
  wire [31:0] changeWordOrder_17_io_in; // @[md4Pipelined.scala 290:19]
  wire [31:0] changeWordOrder_17_io_out; // @[md4Pipelined.scala 290:19]
  wire [31:0] changeWordOrder_18_io_in; // @[md4Pipelined.scala 294:19]
  wire [31:0] changeWordOrder_18_io_out; // @[md4Pipelined.scala 294:19]
  wire [31:0] changeWordOrder_19_io_in; // @[md4Pipelined.scala 298:19]
  wire [31:0] changeWordOrder_19_io_out; // @[md4Pipelined.scala 298:19]
  reg [511:0] data_0_X; // @[md4Pipelined.scala 252:21]
  reg [31:0] data_0_A0; // @[md4Pipelined.scala 252:21]
  reg [31:0] data_0_B0; // @[md4Pipelined.scala 252:21]
  reg [31:0] data_0_C0; // @[md4Pipelined.scala 252:21]
  reg [31:0] data_0_D0; // @[md4Pipelined.scala 252:21]
  reg [511:0] data_1_X; // @[md4Pipelined.scala 252:21]
  reg [31:0] data_1_A0; // @[md4Pipelined.scala 252:21]
  reg [31:0] data_1_B0; // @[md4Pipelined.scala 252:21]
  reg [31:0] data_1_C0; // @[md4Pipelined.scala 252:21]
  reg [31:0] data_1_D0; // @[md4Pipelined.scala 252:21]
  reg  head; // @[md4Pipelined.scala 253:21]
  reg  tail; // @[md4Pipelined.scala 254:21]
  reg  full_0; // @[md4Pipelined.scala 255:21]
  reg  full_1; // @[md4Pipelined.scala 255:21]
  wire [511:0] input_X = head ? data_1_X : data_0_X; // @[md4Pipelined.scala 260:9 md4Pipelined.scala 260:9]
  wire  _GEN_11 = tail ? full_1 : full_0; // @[md4Pipelined.scala 263:23 md4Pipelined.scala 263:23]
  wire  _GEN_44 = ~tail; // @[md4Pipelined.scala 264:16 md4Pipelined.scala 264:16 md4Pipelined.scala 255:21]
  wire  _GEN_12 = ~tail | full_0; // @[md4Pipelined.scala 264:16 md4Pipelined.scala 264:16 md4Pipelined.scala 255:21]
  wire  _GEN_13 = tail | full_1; // @[md4Pipelined.scala 264:16 md4Pipelined.scala 264:16 md4Pipelined.scala 255:21]
  wire  _GEN_24 = io_in_valid & ~_GEN_11 ? _GEN_12 : full_0; // @[md4Pipelined.scala 263:36 md4Pipelined.scala 255:21]
  wire  _GEN_25 = io_in_valid & ~_GEN_11 ? _GEN_13 : full_1; // @[md4Pipelined.scala 263:36 md4Pipelined.scala 255:21]
  wire  _GEN_38 = head ? full_1 : full_0; // @[md4Pipelined.scala 270:21 md4Pipelined.scala 270:21]
  changeWordOrder changeWordOrder ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_io_in),
    .io_out(changeWordOrder_io_out)
  );
  changeWordOrder changeWordOrder_1 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_1_io_in),
    .io_out(changeWordOrder_1_io_out)
  );
  changeWordOrder changeWordOrder_2 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_2_io_in),
    .io_out(changeWordOrder_2_io_out)
  );
  changeWordOrder changeWordOrder_3 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_3_io_in),
    .io_out(changeWordOrder_3_io_out)
  );
  changeWordOrder changeWordOrder_4 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_4_io_in),
    .io_out(changeWordOrder_4_io_out)
  );
  changeWordOrder changeWordOrder_5 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_5_io_in),
    .io_out(changeWordOrder_5_io_out)
  );
  changeWordOrder changeWordOrder_6 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_6_io_in),
    .io_out(changeWordOrder_6_io_out)
  );
  changeWordOrder changeWordOrder_7 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_7_io_in),
    .io_out(changeWordOrder_7_io_out)
  );
  changeWordOrder changeWordOrder_8 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_8_io_in),
    .io_out(changeWordOrder_8_io_out)
  );
  changeWordOrder changeWordOrder_9 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_9_io_in),
    .io_out(changeWordOrder_9_io_out)
  );
  changeWordOrder changeWordOrder_10 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_10_io_in),
    .io_out(changeWordOrder_10_io_out)
  );
  changeWordOrder changeWordOrder_11 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_11_io_in),
    .io_out(changeWordOrder_11_io_out)
  );
  changeWordOrder changeWordOrder_12 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_12_io_in),
    .io_out(changeWordOrder_12_io_out)
  );
  changeWordOrder changeWordOrder_13 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_13_io_in),
    .io_out(changeWordOrder_13_io_out)
  );
  changeWordOrder changeWordOrder_14 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_14_io_in),
    .io_out(changeWordOrder_14_io_out)
  );
  changeWordOrder changeWordOrder_15 ( // @[md4Pipelined.scala 277:11]
    .io_in(changeWordOrder_15_io_in),
    .io_out(changeWordOrder_15_io_out)
  );
  changeWordOrder changeWordOrder_16 ( // @[md4Pipelined.scala 286:19]
    .io_in(changeWordOrder_16_io_in),
    .io_out(changeWordOrder_16_io_out)
  );
  changeWordOrder changeWordOrder_17 ( // @[md4Pipelined.scala 290:19]
    .io_in(changeWordOrder_17_io_in),
    .io_out(changeWordOrder_17_io_out)
  );
  changeWordOrder changeWordOrder_18 ( // @[md4Pipelined.scala 294:19]
    .io_in(changeWordOrder_18_io_in),
    .io_out(changeWordOrder_18_io_out)
  );
  changeWordOrder changeWordOrder_19 ( // @[md4Pipelined.scala 298:19]
    .io_in(changeWordOrder_19_io_in),
    .io_out(changeWordOrder_19_io_out)
  );
  assign io_out_valid = full_0 | full_1; // @[md4Pipelined.scala 258:27]
  assign io_in_ready = ~(full_0 & full_1); // @[md4Pipelined.scala 257:18]
  assign changeWordOrder_io_in = input_X[31:0]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_1_io_in = input_X[63:32]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_2_io_in = input_X[95:64]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_3_io_in = input_X[127:96]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_4_io_in = input_X[159:128]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_5_io_in = input_X[191:160]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_6_io_in = input_X[223:192]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_7_io_in = input_X[255:224]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_8_io_in = input_X[287:256]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_9_io_in = input_X[319:288]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_10_io_in = input_X[351:320]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_11_io_in = input_X[383:352]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_12_io_in = input_X[415:384]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_13_io_in = input_X[447:416]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_14_io_in = input_X[479:448]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_15_io_in = input_X[511:480]; // @[md4Pipelined.scala 280:25]
  assign changeWordOrder_16_io_in = head ? data_1_A0 : data_0_A0; // @[md4Pipelined.scala 260:9 md4Pipelined.scala 260:9]
  assign changeWordOrder_17_io_in = head ? data_1_B0 : data_0_B0; // @[md4Pipelined.scala 260:9 md4Pipelined.scala 260:9]
  assign changeWordOrder_18_io_in = head ? data_1_C0 : data_0_C0; // @[md4Pipelined.scala 260:9 md4Pipelined.scala 260:9]
  assign changeWordOrder_19_io_in = head ? data_1_D0 : data_0_D0; // @[md4Pipelined.scala 260:9 md4Pipelined.scala 260:9]
  always @(posedge clock) begin
    if (reset) begin // @[md4Pipelined.scala 252:21]
      data_0_X <= 512'h0; // @[md4Pipelined.scala 252:21]
    end else if (io_in_valid & ~_GEN_11) begin // @[md4Pipelined.scala 263:36]
      if (~tail) begin // @[md4Pipelined.scala 265:16]
        data_0_X <= io_in_bits_X; // @[md4Pipelined.scala 265:16]
      end
    end
    if (reset) begin // @[md4Pipelined.scala 252:21]
      data_0_A0 <= 32'h0; // @[md4Pipelined.scala 252:21]
    end else if (io_in_valid & ~_GEN_11) begin // @[md4Pipelined.scala 263:36]
      if (~tail) begin // @[md4Pipelined.scala 265:16]
        data_0_A0 <= io_in_bits_A0; // @[md4Pipelined.scala 265:16]
      end
    end
    if (reset) begin // @[md4Pipelined.scala 252:21]
      data_0_B0 <= 32'h0; // @[md4Pipelined.scala 252:21]
    end else if (io_in_valid & ~_GEN_11) begin // @[md4Pipelined.scala 263:36]
      if (~tail) begin // @[md4Pipelined.scala 265:16]
        data_0_B0 <= io_in_bits_B0; // @[md4Pipelined.scala 265:16]
      end
    end
    if (reset) begin // @[md4Pipelined.scala 252:21]
      data_0_C0 <= 32'h0; // @[md4Pipelined.scala 252:21]
    end else if (io_in_valid & ~_GEN_11) begin // @[md4Pipelined.scala 263:36]
      if (~tail) begin // @[md4Pipelined.scala 265:16]
        data_0_C0 <= io_in_bits_C0; // @[md4Pipelined.scala 265:16]
      end
    end
    if (reset) begin // @[md4Pipelined.scala 252:21]
      data_0_D0 <= 32'h0; // @[md4Pipelined.scala 252:21]
    end else if (io_in_valid & ~_GEN_11) begin // @[md4Pipelined.scala 263:36]
      if (~tail) begin // @[md4Pipelined.scala 265:16]
        data_0_D0 <= io_in_bits_D0; // @[md4Pipelined.scala 265:16]
      end
    end
    if (reset) begin // @[md4Pipelined.scala 252:21]
      data_1_X <= 512'h0; // @[md4Pipelined.scala 252:21]
    end else if (io_in_valid & ~_GEN_11) begin // @[md4Pipelined.scala 263:36]
      if (tail) begin // @[md4Pipelined.scala 265:16]
        data_1_X <= io_in_bits_X; // @[md4Pipelined.scala 265:16]
      end
    end
    if (reset) begin // @[md4Pipelined.scala 252:21]
      data_1_A0 <= 32'h0; // @[md4Pipelined.scala 252:21]
    end else if (io_in_valid & ~_GEN_11) begin // @[md4Pipelined.scala 263:36]
      if (tail) begin // @[md4Pipelined.scala 265:16]
        data_1_A0 <= io_in_bits_A0; // @[md4Pipelined.scala 265:16]
      end
    end
    if (reset) begin // @[md4Pipelined.scala 252:21]
      data_1_B0 <= 32'h0; // @[md4Pipelined.scala 252:21]
    end else if (io_in_valid & ~_GEN_11) begin // @[md4Pipelined.scala 263:36]
      if (tail) begin // @[md4Pipelined.scala 265:16]
        data_1_B0 <= io_in_bits_B0; // @[md4Pipelined.scala 265:16]
      end
    end
    if (reset) begin // @[md4Pipelined.scala 252:21]
      data_1_C0 <= 32'h0; // @[md4Pipelined.scala 252:21]
    end else if (io_in_valid & ~_GEN_11) begin // @[md4Pipelined.scala 263:36]
      if (tail) begin // @[md4Pipelined.scala 265:16]
        data_1_C0 <= io_in_bits_C0; // @[md4Pipelined.scala 265:16]
      end
    end
    if (reset) begin // @[md4Pipelined.scala 252:21]
      data_1_D0 <= 32'h0; // @[md4Pipelined.scala 252:21]
    end else if (io_in_valid & ~_GEN_11) begin // @[md4Pipelined.scala 263:36]
      if (tail) begin // @[md4Pipelined.scala 265:16]
        data_1_D0 <= io_in_bits_D0; // @[md4Pipelined.scala 265:16]
      end
    end
    if (reset) begin // @[md4Pipelined.scala 253:21]
      head <= 1'h0; // @[md4Pipelined.scala 253:21]
    end else if (io_out_ready & _GEN_38) begin // @[md4Pipelined.scala 270:36]
      head <= ~head; // @[md4Pipelined.scala 272:10]
    end
    if (reset) begin // @[md4Pipelined.scala 254:21]
      tail <= 1'h0; // @[md4Pipelined.scala 254:21]
    end else if (io_in_valid & ~_GEN_11) begin // @[md4Pipelined.scala 263:36]
      tail <= _GEN_44; // @[md4Pipelined.scala 266:10]
    end
    if (reset) begin // @[md4Pipelined.scala 255:21]
      full_0 <= 1'h0; // @[md4Pipelined.scala 255:21]
    end else if (io_out_ready & _GEN_38) begin // @[md4Pipelined.scala 270:36]
      if (~head) begin // @[md4Pipelined.scala 271:16]
        full_0 <= 1'h0; // @[md4Pipelined.scala 271:16]
      end else begin
        full_0 <= _GEN_24;
      end
    end else begin
      full_0 <= _GEN_24;
    end
    if (reset) begin // @[md4Pipelined.scala 255:21]
      full_1 <= 1'h0; // @[md4Pipelined.scala 255:21]
    end else if (io_out_ready & _GEN_38) begin // @[md4Pipelined.scala 270:36]
      if (head) begin // @[md4Pipelined.scala 271:16]
        full_1 <= 1'h0; // @[md4Pipelined.scala 271:16]
      end else begin
        full_1 <= _GEN_25;
      end
    end else begin
      full_1 <= _GEN_25;
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
  data_0_X = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  data_0_A0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  data_0_B0 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  data_0_C0 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  data_0_D0 = _RAND_4[31:0];
  _RAND_5 = {16{`RANDOM}};
  data_1_X = _RAND_5[511:0];
  _RAND_6 = {1{`RANDOM}};
  data_1_A0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  data_1_B0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  data_1_C0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  data_1_D0 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  head = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  tail = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  full_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  full_1 = _RAND_13[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BufferedChangeHashOrder(
  output [127:0] io_out_bits
);
  wire [31:0] changeWordOrder_io_in; // @[md4Pipelined.scala 343:11]
  wire [31:0] changeWordOrder_io_out; // @[md4Pipelined.scala 343:11]
  wire [31:0] changeWordOrder_1_io_in; // @[md4Pipelined.scala 343:11]
  wire [31:0] changeWordOrder_1_io_out; // @[md4Pipelined.scala 343:11]
  wire [31:0] changeWordOrder_2_io_in; // @[md4Pipelined.scala 343:11]
  wire [31:0] changeWordOrder_2_io_out; // @[md4Pipelined.scala 343:11]
  wire [31:0] changeWordOrder_3_io_in; // @[md4Pipelined.scala 343:11]
  wire [31:0] changeWordOrder_3_io_out; // @[md4Pipelined.scala 343:11]
  wire [31:0] PEs_1_out = changeWordOrder_1_io_out; // @[md4Pipelined.scala 342:20 md4Pipelined.scala 342:20]
  wire [31:0] PEs_0_out = changeWordOrder_io_out; // @[md4Pipelined.scala 342:20 md4Pipelined.scala 342:20]
  wire [63:0] lo = {PEs_1_out,PEs_0_out}; // @[Cat.scala 30:58]
  wire [31:0] PEs_3_out = changeWordOrder_3_io_out; // @[md4Pipelined.scala 342:20 md4Pipelined.scala 342:20]
  wire [31:0] PEs_2_out = changeWordOrder_2_io_out; // @[md4Pipelined.scala 342:20 md4Pipelined.scala 342:20]
  wire [63:0] hi = {PEs_3_out,PEs_2_out}; // @[Cat.scala 30:58]
  changeWordOrder changeWordOrder ( // @[md4Pipelined.scala 343:11]
    .io_in(changeWordOrder_io_in),
    .io_out(changeWordOrder_io_out)
  );
  changeWordOrder changeWordOrder_1 ( // @[md4Pipelined.scala 343:11]
    .io_in(changeWordOrder_1_io_in),
    .io_out(changeWordOrder_1_io_out)
  );
  changeWordOrder changeWordOrder_2 ( // @[md4Pipelined.scala 343:11]
    .io_in(changeWordOrder_2_io_in),
    .io_out(changeWordOrder_2_io_out)
  );
  changeWordOrder changeWordOrder_3 ( // @[md4Pipelined.scala 343:11]
    .io_in(changeWordOrder_3_io_in),
    .io_out(changeWordOrder_3_io_out)
  );
  assign io_out_bits = {hi,lo}; // @[Cat.scala 30:58]
  assign changeWordOrder_io_in = 32'h0; // @[md4Pipelined.scala 346:23]
  assign changeWordOrder_1_io_in = 32'h0; // @[md4Pipelined.scala 346:23]
  assign changeWordOrder_2_io_in = 32'h0; // @[md4Pipelined.scala 346:23]
  assign changeWordOrder_3_io_in = 32'h0; // @[md4Pipelined.scala 346:23]
endmodule
module BufferedProcessingElement(
  input   clock,
  input   reset,
  output  io_in_ready,
  input   io_in_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  tail; // @[md4Pipelined.scala 103:21]
  reg  full_0; // @[md4Pipelined.scala 104:21]
  reg  full_1; // @[md4Pipelined.scala 104:21]
  wire  _GEN_19 = tail ? full_1 : full_0; // @[md4Pipelined.scala 112:23 md4Pipelined.scala 112:23]
  wire  _GEN_68 = ~tail; // @[md4Pipelined.scala 113:16 md4Pipelined.scala 113:16 md4Pipelined.scala 104:21]
  wire  _GEN_20 = ~tail | full_0; // @[md4Pipelined.scala 113:16 md4Pipelined.scala 113:16 md4Pipelined.scala 104:21]
  wire  _GEN_21 = tail | full_1; // @[md4Pipelined.scala 113:16 md4Pipelined.scala 113:16 md4Pipelined.scala 104:21]
  assign io_in_ready = ~(full_0 & full_1); // @[md4Pipelined.scala 106:18]
  always @(posedge clock) begin
    if (reset) begin // @[md4Pipelined.scala 103:21]
      tail <= 1'h0; // @[md4Pipelined.scala 103:21]
    end else if (io_in_valid & ~_GEN_19) begin // @[md4Pipelined.scala 112:36]
      tail <= _GEN_68; // @[md4Pipelined.scala 115:10]
    end
    if (reset) begin // @[md4Pipelined.scala 104:21]
      full_0 <= 1'h0; // @[md4Pipelined.scala 104:21]
    end else if (io_in_valid & ~_GEN_19) begin // @[md4Pipelined.scala 112:36]
      full_0 <= _GEN_20;
    end
    if (reset) begin // @[md4Pipelined.scala 104:21]
      full_1 <= 1'h0; // @[md4Pipelined.scala 104:21]
    end else if (io_in_valid & ~_GEN_19) begin // @[md4Pipelined.scala 112:36]
      full_1 <= _GEN_21;
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
  tail = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  full_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  full_1 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module md4Pipelined(
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
  wire  changeInput_clock; // @[md4Pipelined.scala 12:27]
  wire  changeInput_reset; // @[md4Pipelined.scala 12:27]
  wire  changeInput_io_out_ready; // @[md4Pipelined.scala 12:27]
  wire  changeInput_io_out_valid; // @[md4Pipelined.scala 12:27]
  wire  changeInput_io_in_ready; // @[md4Pipelined.scala 12:27]
  wire  changeInput_io_in_valid; // @[md4Pipelined.scala 12:27]
  wire [511:0] changeInput_io_in_bits_X; // @[md4Pipelined.scala 12:27]
  wire [31:0] changeInput_io_in_bits_A0; // @[md4Pipelined.scala 12:27]
  wire [31:0] changeInput_io_in_bits_B0; // @[md4Pipelined.scala 12:27]
  wire [31:0] changeInput_io_in_bits_C0; // @[md4Pipelined.scala 12:27]
  wire [31:0] changeInput_io_in_bits_D0; // @[md4Pipelined.scala 12:27]
  wire [127:0] changeOutput_io_out_bits; // @[md4Pipelined.scala 21:28]
  wire  PEs_0_0_clock; // @[md4Pipelined.scala 28:22]
  wire  PEs_0_0_reset; // @[md4Pipelined.scala 28:22]
  wire  PEs_0_0_io_in_ready; // @[md4Pipelined.scala 28:22]
  wire  PEs_0_0_io_in_valid; // @[md4Pipelined.scala 28:22]
  ChangeOrderMD4Input changeInput ( // @[md4Pipelined.scala 12:27]
    .clock(changeInput_clock),
    .reset(changeInput_reset),
    .io_out_ready(changeInput_io_out_ready),
    .io_out_valid(changeInput_io_out_valid),
    .io_in_ready(changeInput_io_in_ready),
    .io_in_valid(changeInput_io_in_valid),
    .io_in_bits_X(changeInput_io_in_bits_X),
    .io_in_bits_A0(changeInput_io_in_bits_A0),
    .io_in_bits_B0(changeInput_io_in_bits_B0),
    .io_in_bits_C0(changeInput_io_in_bits_C0),
    .io_in_bits_D0(changeInput_io_in_bits_D0)
  );
  BufferedChangeHashOrder changeOutput ( // @[md4Pipelined.scala 21:28]
    .io_out_bits(changeOutput_io_out_bits)
  );
  BufferedProcessingElement PEs_0_0 ( // @[md4Pipelined.scala 28:22]
    .clock(PEs_0_0_clock),
    .reset(PEs_0_0_reset),
    .io_in_ready(PEs_0_0_io_in_ready),
    .io_in_valid(PEs_0_0_io_in_valid)
  );
  assign io_in_ready = changeInput_io_in_ready; // @[md4Pipelined.scala 19:15]
  assign io_hash_valid = 1'h0; // @[md4Pipelined.scala 23:17]
  assign io_hash_bits = changeOutput_io_out_bits; // @[md4Pipelined.scala 22:16]
  assign changeInput_clock = clock;
  assign changeInput_reset = reset;
  assign changeInput_io_out_ready = PEs_0_0_io_in_ready; // @[md4Pipelined.scala 47:34]
  assign changeInput_io_in_valid = io_in_valid; // @[md4Pipelined.scala 13:27]
  assign changeInput_io_in_bits_X = io_in_bits_X; // @[md4Pipelined.scala 14:28]
  assign changeInput_io_in_bits_A0 = io_in_bits_A0; // @[md4Pipelined.scala 15:29]
  assign changeInput_io_in_bits_B0 = io_in_bits_B0; // @[md4Pipelined.scala 16:29]
  assign changeInput_io_in_bits_C0 = io_in_bits_C0; // @[md4Pipelined.scala 17:29]
  assign changeInput_io_in_bits_D0 = io_in_bits_D0; // @[md4Pipelined.scala 18:29]
  assign PEs_0_0_clock = clock;
  assign PEs_0_0_reset = reset;
  assign PEs_0_0_io_in_valid = changeInput_io_out_valid; // @[md4Pipelined.scala 37:31]
endmodule
