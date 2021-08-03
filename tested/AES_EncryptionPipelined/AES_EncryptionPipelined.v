module AES_InitialOperation(
  input          clock,
  output         io_in_ready,
  input          io_in_valid,
  input  [127:0] io_in_bits_text,
  input          io_out_ready,
  output         io_out_valid,
  output [31:0]  io_out_bits_state_0,
  output [31:0]  io_out_bits_state_1,
  output [31:0]  io_out_bits_state_2,
  output [31:0]  io_out_bits_state_3
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[AES_Pipelined.scala 68:26]
  wire [31:0] result_state_0 = io_in_bits_text[31:0]; // @[AES_Pipelined.scala 81:39]
  wire [31:0] result_state_1 = io_in_bits_text[63:32]; // @[AES_Pipelined.scala 81:39]
  wire [31:0] result_state_2 = io_in_bits_text[95:64]; // @[AES_Pipelined.scala 81:39]
  wire [31:0] result_state_3 = io_in_bits_text[127:96]; // @[AES_Pipelined.scala 81:39]
  assign io_in_ready = valid ? enable : 1'h1; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 72:17 AES_Pipelined.scala 75:17]
  assign io_out_valid = valid; // @[AES_Pipelined.scala 69:16]
  assign io_out_bits_state_0 = valid ? result_state_0 : 32'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_1 = valid ? result_state_1 : 32'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_2 = valid ? result_state_2 : 32'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_3 = valid ? result_state_3 : 32'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  always @(posedge clock) begin
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
  valid = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AES_FinalPermutation(
  input          clock,
  input          io_out_ready,
  output         io_out_valid,
  output [127:0] io_out_bits,
  output         io_in_ready,
  input          io_in_valid,
  input  [31:0]  io_in_bits_state_0,
  input  [31:0]  io_in_bits_state_1,
  input  [31:0]  io_in_bits_state_2,
  input  [31:0]  io_in_bits_state_3
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] input_state_0; // @[Reg.scala 15:16]
  reg [31:0] input_state_1; // @[Reg.scala 15:16]
  reg [31:0] input_state_2; // @[Reg.scala 15:16]
  reg [31:0] input_state_3; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[AES_Pipelined.scala 124:26]
  wire [127:0] result = {input_state_0,input_state_1,input_state_2,input_state_3}; // @[Cat.scala 30:58]
  assign io_out_valid = valid; // @[AES_Pipelined.scala 125:16]
  assign io_out_bits = valid ? result : 128'h0; // @[AES_Pipelined.scala 127:15 AES_Pipelined.scala 129:17 AES_Pipelined.scala 132:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[AES_Pipelined.scala 127:15 AES_Pipelined.scala 128:17 AES_Pipelined.scala 131:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_state_0 <= io_in_bits_state_0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_1 <= io_in_bits_state_1; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_2 <= io_in_bits_state_2; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_3 <= io_in_bits_state_3; // @[Reg.scala 16:23]
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
  input_state_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  input_state_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_state_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_state_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  valid = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AES_ProcessingElement(
  input         clock,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_state_0,
  output [31:0] io_out_bits_state_1,
  output [31:0] io_out_bits_state_2,
  output [31:0] io_out_bits_state_3,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_state_0,
  input  [31:0] io_in_bits_state_1,
  input  [31:0] io_in_bits_state_2,
  input  [31:0] io_in_bits_state_3
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] input_state_0; // @[Reg.scala 15:16]
  reg [31:0] input_state_1; // @[Reg.scala 15:16]
  reg [31:0] input_state_2; // @[Reg.scala 15:16]
  reg [31:0] input_state_3; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[AES_Pipelined.scala 97:26]
  assign io_out_valid = valid; // @[AES_Pipelined.scala 98:16]
  assign io_out_bits_state_0 = valid ? input_state_0 : 32'h0; // @[AES_Pipelined.scala 100:15 AES_Pipelined.scala 102:17 AES_Pipelined.scala 105:17]
  assign io_out_bits_state_1 = valid ? input_state_1 : 32'h0; // @[AES_Pipelined.scala 100:15 AES_Pipelined.scala 102:17 AES_Pipelined.scala 105:17]
  assign io_out_bits_state_2 = valid ? input_state_2 : 32'h0; // @[AES_Pipelined.scala 100:15 AES_Pipelined.scala 102:17 AES_Pipelined.scala 105:17]
  assign io_out_bits_state_3 = valid ? input_state_3 : 32'h0; // @[AES_Pipelined.scala 100:15 AES_Pipelined.scala 102:17 AES_Pipelined.scala 105:17]
  assign io_in_ready = valid ? enable : 1'h1; // @[AES_Pipelined.scala 100:15 AES_Pipelined.scala 101:17 AES_Pipelined.scala 104:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_state_0 <= io_in_bits_state_0; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_1 <= io_in_bits_state_1; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_2 <= io_in_bits_state_2; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_state_3 <= io_in_bits_state_3; // @[Reg.scala 16:23]
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
  input_state_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  input_state_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_state_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_state_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  valid = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AES_Pipelined(
  input          clock,
  input          reset,
  output         io_in_ready,
  input          io_in_valid,
  input  [127:0] io_in_bits_text,
  input  [127:0] io_in_bits_key,
  input          io_result_ready,
  output         io_result_valid,
  output [127:0] io_result_bits
);
  wire  initialPermutation_clock; // @[AES_Pipelined.scala 15:34]
  wire  initialPermutation_io_in_ready; // @[AES_Pipelined.scala 15:34]
  wire  initialPermutation_io_in_valid; // @[AES_Pipelined.scala 15:34]
  wire [127:0] initialPermutation_io_in_bits_text; // @[AES_Pipelined.scala 15:34]
  wire  initialPermutation_io_out_ready; // @[AES_Pipelined.scala 15:34]
  wire  initialPermutation_io_out_valid; // @[AES_Pipelined.scala 15:34]
  wire [31:0] initialPermutation_io_out_bits_state_0; // @[AES_Pipelined.scala 15:34]
  wire [31:0] initialPermutation_io_out_bits_state_1; // @[AES_Pipelined.scala 15:34]
  wire [31:0] initialPermutation_io_out_bits_state_2; // @[AES_Pipelined.scala 15:34]
  wire [31:0] initialPermutation_io_out_bits_state_3; // @[AES_Pipelined.scala 15:34]
  wire  finalPermutation_clock; // @[AES_Pipelined.scala 21:32]
  wire  finalPermutation_io_out_ready; // @[AES_Pipelined.scala 21:32]
  wire  finalPermutation_io_out_valid; // @[AES_Pipelined.scala 21:32]
  wire [127:0] finalPermutation_io_out_bits; // @[AES_Pipelined.scala 21:32]
  wire  finalPermutation_io_in_ready; // @[AES_Pipelined.scala 21:32]
  wire  finalPermutation_io_in_valid; // @[AES_Pipelined.scala 21:32]
  wire [31:0] finalPermutation_io_in_bits_state_0; // @[AES_Pipelined.scala 21:32]
  wire [31:0] finalPermutation_io_in_bits_state_1; // @[AES_Pipelined.scala 21:32]
  wire [31:0] finalPermutation_io_in_bits_state_2; // @[AES_Pipelined.scala 21:32]
  wire [31:0] finalPermutation_io_in_bits_state_3; // @[AES_Pipelined.scala 21:32]
  wire  PEs_0_clock; // @[AES_Pipelined.scala 27:20]
  wire  PEs_0_io_out_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_0_io_out_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_0_io_out_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_0_io_out_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_0_io_out_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_0_io_out_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_0_io_in_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_0_io_in_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_0_io_in_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_0_io_in_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_0_io_in_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_0_io_in_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_1_clock; // @[AES_Pipelined.scala 27:20]
  wire  PEs_1_io_out_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_1_io_out_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_1_io_out_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_1_io_out_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_1_io_out_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_1_io_out_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_1_io_in_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_1_io_in_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_1_io_in_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_1_io_in_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_1_io_in_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_1_io_in_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_2_clock; // @[AES_Pipelined.scala 27:20]
  wire  PEs_2_io_out_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_2_io_out_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_2_io_out_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_2_io_out_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_2_io_out_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_2_io_out_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_2_io_in_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_2_io_in_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_2_io_in_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_2_io_in_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_2_io_in_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_2_io_in_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_3_clock; // @[AES_Pipelined.scala 27:20]
  wire  PEs_3_io_out_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_3_io_out_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_3_io_out_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_3_io_out_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_3_io_out_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_3_io_out_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_3_io_in_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_3_io_in_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_3_io_in_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_3_io_in_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_3_io_in_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_3_io_in_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_4_clock; // @[AES_Pipelined.scala 27:20]
  wire  PEs_4_io_out_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_4_io_out_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_4_io_out_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_4_io_out_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_4_io_out_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_4_io_out_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_4_io_in_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_4_io_in_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_4_io_in_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_4_io_in_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_4_io_in_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_4_io_in_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_5_clock; // @[AES_Pipelined.scala 27:20]
  wire  PEs_5_io_out_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_5_io_out_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_5_io_out_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_5_io_out_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_5_io_out_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_5_io_out_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_5_io_in_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_5_io_in_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_5_io_in_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_5_io_in_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_5_io_in_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_5_io_in_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_6_clock; // @[AES_Pipelined.scala 27:20]
  wire  PEs_6_io_out_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_6_io_out_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_6_io_out_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_6_io_out_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_6_io_out_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_6_io_out_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_6_io_in_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_6_io_in_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_6_io_in_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_6_io_in_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_6_io_in_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_6_io_in_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_7_clock; // @[AES_Pipelined.scala 27:20]
  wire  PEs_7_io_out_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_7_io_out_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_7_io_out_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_7_io_out_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_7_io_out_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_7_io_out_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_7_io_in_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_7_io_in_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_7_io_in_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_7_io_in_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_7_io_in_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_7_io_in_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_8_clock; // @[AES_Pipelined.scala 27:20]
  wire  PEs_8_io_out_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_8_io_out_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_8_io_out_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_8_io_out_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_8_io_out_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_8_io_out_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_8_io_in_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_8_io_in_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_8_io_in_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_8_io_in_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_8_io_in_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_8_io_in_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_9_clock; // @[AES_Pipelined.scala 27:20]
  wire  PEs_9_io_out_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_9_io_out_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_9_io_out_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_9_io_out_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_9_io_out_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_9_io_out_bits_state_3; // @[AES_Pipelined.scala 27:20]
  wire  PEs_9_io_in_ready; // @[AES_Pipelined.scala 27:20]
  wire  PEs_9_io_in_valid; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_9_io_in_bits_state_0; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_9_io_in_bits_state_1; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_9_io_in_bits_state_2; // @[AES_Pipelined.scala 27:20]
  wire [31:0] PEs_9_io_in_bits_state_3; // @[AES_Pipelined.scala 27:20]
  AES_InitialOperation initialPermutation ( // @[AES_Pipelined.scala 15:34]
    .clock(initialPermutation_clock),
    .io_in_ready(initialPermutation_io_in_ready),
    .io_in_valid(initialPermutation_io_in_valid),
    .io_in_bits_text(initialPermutation_io_in_bits_text),
    .io_out_ready(initialPermutation_io_out_ready),
    .io_out_valid(initialPermutation_io_out_valid),
    .io_out_bits_state_0(initialPermutation_io_out_bits_state_0),
    .io_out_bits_state_1(initialPermutation_io_out_bits_state_1),
    .io_out_bits_state_2(initialPermutation_io_out_bits_state_2),
    .io_out_bits_state_3(initialPermutation_io_out_bits_state_3)
  );
  AES_FinalPermutation finalPermutation ( // @[AES_Pipelined.scala 21:32]
    .clock(finalPermutation_clock),
    .io_out_ready(finalPermutation_io_out_ready),
    .io_out_valid(finalPermutation_io_out_valid),
    .io_out_bits(finalPermutation_io_out_bits),
    .io_in_ready(finalPermutation_io_in_ready),
    .io_in_valid(finalPermutation_io_in_valid),
    .io_in_bits_state_0(finalPermutation_io_in_bits_state_0),
    .io_in_bits_state_1(finalPermutation_io_in_bits_state_1),
    .io_in_bits_state_2(finalPermutation_io_in_bits_state_2),
    .io_in_bits_state_3(finalPermutation_io_in_bits_state_3)
  );
  AES_ProcessingElement PEs_0 ( // @[AES_Pipelined.scala 27:20]
    .clock(PEs_0_clock),
    .io_out_ready(PEs_0_io_out_ready),
    .io_out_valid(PEs_0_io_out_valid),
    .io_out_bits_state_0(PEs_0_io_out_bits_state_0),
    .io_out_bits_state_1(PEs_0_io_out_bits_state_1),
    .io_out_bits_state_2(PEs_0_io_out_bits_state_2),
    .io_out_bits_state_3(PEs_0_io_out_bits_state_3),
    .io_in_ready(PEs_0_io_in_ready),
    .io_in_valid(PEs_0_io_in_valid),
    .io_in_bits_state_0(PEs_0_io_in_bits_state_0),
    .io_in_bits_state_1(PEs_0_io_in_bits_state_1),
    .io_in_bits_state_2(PEs_0_io_in_bits_state_2),
    .io_in_bits_state_3(PEs_0_io_in_bits_state_3)
  );
  AES_ProcessingElement PEs_1 ( // @[AES_Pipelined.scala 27:20]
    .clock(PEs_1_clock),
    .io_out_ready(PEs_1_io_out_ready),
    .io_out_valid(PEs_1_io_out_valid),
    .io_out_bits_state_0(PEs_1_io_out_bits_state_0),
    .io_out_bits_state_1(PEs_1_io_out_bits_state_1),
    .io_out_bits_state_2(PEs_1_io_out_bits_state_2),
    .io_out_bits_state_3(PEs_1_io_out_bits_state_3),
    .io_in_ready(PEs_1_io_in_ready),
    .io_in_valid(PEs_1_io_in_valid),
    .io_in_bits_state_0(PEs_1_io_in_bits_state_0),
    .io_in_bits_state_1(PEs_1_io_in_bits_state_1),
    .io_in_bits_state_2(PEs_1_io_in_bits_state_2),
    .io_in_bits_state_3(PEs_1_io_in_bits_state_3)
  );
  AES_ProcessingElement PEs_2 ( // @[AES_Pipelined.scala 27:20]
    .clock(PEs_2_clock),
    .io_out_ready(PEs_2_io_out_ready),
    .io_out_valid(PEs_2_io_out_valid),
    .io_out_bits_state_0(PEs_2_io_out_bits_state_0),
    .io_out_bits_state_1(PEs_2_io_out_bits_state_1),
    .io_out_bits_state_2(PEs_2_io_out_bits_state_2),
    .io_out_bits_state_3(PEs_2_io_out_bits_state_3),
    .io_in_ready(PEs_2_io_in_ready),
    .io_in_valid(PEs_2_io_in_valid),
    .io_in_bits_state_0(PEs_2_io_in_bits_state_0),
    .io_in_bits_state_1(PEs_2_io_in_bits_state_1),
    .io_in_bits_state_2(PEs_2_io_in_bits_state_2),
    .io_in_bits_state_3(PEs_2_io_in_bits_state_3)
  );
  AES_ProcessingElement PEs_3 ( // @[AES_Pipelined.scala 27:20]
    .clock(PEs_3_clock),
    .io_out_ready(PEs_3_io_out_ready),
    .io_out_valid(PEs_3_io_out_valid),
    .io_out_bits_state_0(PEs_3_io_out_bits_state_0),
    .io_out_bits_state_1(PEs_3_io_out_bits_state_1),
    .io_out_bits_state_2(PEs_3_io_out_bits_state_2),
    .io_out_bits_state_3(PEs_3_io_out_bits_state_3),
    .io_in_ready(PEs_3_io_in_ready),
    .io_in_valid(PEs_3_io_in_valid),
    .io_in_bits_state_0(PEs_3_io_in_bits_state_0),
    .io_in_bits_state_1(PEs_3_io_in_bits_state_1),
    .io_in_bits_state_2(PEs_3_io_in_bits_state_2),
    .io_in_bits_state_3(PEs_3_io_in_bits_state_3)
  );
  AES_ProcessingElement PEs_4 ( // @[AES_Pipelined.scala 27:20]
    .clock(PEs_4_clock),
    .io_out_ready(PEs_4_io_out_ready),
    .io_out_valid(PEs_4_io_out_valid),
    .io_out_bits_state_0(PEs_4_io_out_bits_state_0),
    .io_out_bits_state_1(PEs_4_io_out_bits_state_1),
    .io_out_bits_state_2(PEs_4_io_out_bits_state_2),
    .io_out_bits_state_3(PEs_4_io_out_bits_state_3),
    .io_in_ready(PEs_4_io_in_ready),
    .io_in_valid(PEs_4_io_in_valid),
    .io_in_bits_state_0(PEs_4_io_in_bits_state_0),
    .io_in_bits_state_1(PEs_4_io_in_bits_state_1),
    .io_in_bits_state_2(PEs_4_io_in_bits_state_2),
    .io_in_bits_state_3(PEs_4_io_in_bits_state_3)
  );
  AES_ProcessingElement PEs_5 ( // @[AES_Pipelined.scala 27:20]
    .clock(PEs_5_clock),
    .io_out_ready(PEs_5_io_out_ready),
    .io_out_valid(PEs_5_io_out_valid),
    .io_out_bits_state_0(PEs_5_io_out_bits_state_0),
    .io_out_bits_state_1(PEs_5_io_out_bits_state_1),
    .io_out_bits_state_2(PEs_5_io_out_bits_state_2),
    .io_out_bits_state_3(PEs_5_io_out_bits_state_3),
    .io_in_ready(PEs_5_io_in_ready),
    .io_in_valid(PEs_5_io_in_valid),
    .io_in_bits_state_0(PEs_5_io_in_bits_state_0),
    .io_in_bits_state_1(PEs_5_io_in_bits_state_1),
    .io_in_bits_state_2(PEs_5_io_in_bits_state_2),
    .io_in_bits_state_3(PEs_5_io_in_bits_state_3)
  );
  AES_ProcessingElement PEs_6 ( // @[AES_Pipelined.scala 27:20]
    .clock(PEs_6_clock),
    .io_out_ready(PEs_6_io_out_ready),
    .io_out_valid(PEs_6_io_out_valid),
    .io_out_bits_state_0(PEs_6_io_out_bits_state_0),
    .io_out_bits_state_1(PEs_6_io_out_bits_state_1),
    .io_out_bits_state_2(PEs_6_io_out_bits_state_2),
    .io_out_bits_state_3(PEs_6_io_out_bits_state_3),
    .io_in_ready(PEs_6_io_in_ready),
    .io_in_valid(PEs_6_io_in_valid),
    .io_in_bits_state_0(PEs_6_io_in_bits_state_0),
    .io_in_bits_state_1(PEs_6_io_in_bits_state_1),
    .io_in_bits_state_2(PEs_6_io_in_bits_state_2),
    .io_in_bits_state_3(PEs_6_io_in_bits_state_3)
  );
  AES_ProcessingElement PEs_7 ( // @[AES_Pipelined.scala 27:20]
    .clock(PEs_7_clock),
    .io_out_ready(PEs_7_io_out_ready),
    .io_out_valid(PEs_7_io_out_valid),
    .io_out_bits_state_0(PEs_7_io_out_bits_state_0),
    .io_out_bits_state_1(PEs_7_io_out_bits_state_1),
    .io_out_bits_state_2(PEs_7_io_out_bits_state_2),
    .io_out_bits_state_3(PEs_7_io_out_bits_state_3),
    .io_in_ready(PEs_7_io_in_ready),
    .io_in_valid(PEs_7_io_in_valid),
    .io_in_bits_state_0(PEs_7_io_in_bits_state_0),
    .io_in_bits_state_1(PEs_7_io_in_bits_state_1),
    .io_in_bits_state_2(PEs_7_io_in_bits_state_2),
    .io_in_bits_state_3(PEs_7_io_in_bits_state_3)
  );
  AES_ProcessingElement PEs_8 ( // @[AES_Pipelined.scala 27:20]
    .clock(PEs_8_clock),
    .io_out_ready(PEs_8_io_out_ready),
    .io_out_valid(PEs_8_io_out_valid),
    .io_out_bits_state_0(PEs_8_io_out_bits_state_0),
    .io_out_bits_state_1(PEs_8_io_out_bits_state_1),
    .io_out_bits_state_2(PEs_8_io_out_bits_state_2),
    .io_out_bits_state_3(PEs_8_io_out_bits_state_3),
    .io_in_ready(PEs_8_io_in_ready),
    .io_in_valid(PEs_8_io_in_valid),
    .io_in_bits_state_0(PEs_8_io_in_bits_state_0),
    .io_in_bits_state_1(PEs_8_io_in_bits_state_1),
    .io_in_bits_state_2(PEs_8_io_in_bits_state_2),
    .io_in_bits_state_3(PEs_8_io_in_bits_state_3)
  );
  AES_ProcessingElement PEs_9 ( // @[AES_Pipelined.scala 27:20]
    .clock(PEs_9_clock),
    .io_out_ready(PEs_9_io_out_ready),
    .io_out_valid(PEs_9_io_out_valid),
    .io_out_bits_state_0(PEs_9_io_out_bits_state_0),
    .io_out_bits_state_1(PEs_9_io_out_bits_state_1),
    .io_out_bits_state_2(PEs_9_io_out_bits_state_2),
    .io_out_bits_state_3(PEs_9_io_out_bits_state_3),
    .io_in_ready(PEs_9_io_in_ready),
    .io_in_valid(PEs_9_io_in_valid),
    .io_in_bits_state_0(PEs_9_io_in_bits_state_0),
    .io_in_bits_state_1(PEs_9_io_in_bits_state_1),
    .io_in_bits_state_2(PEs_9_io_in_bits_state_2),
    .io_in_bits_state_3(PEs_9_io_in_bits_state_3)
  );
  assign io_in_ready = initialPermutation_io_in_ready; // @[AES_Pipelined.scala 19:15]
  assign io_result_valid = finalPermutation_io_out_valid; // @[AES_Pipelined.scala 23:19]
  assign io_result_bits = finalPermutation_io_out_bits; // @[AES_Pipelined.scala 22:18]
  assign initialPermutation_clock = clock;
  assign initialPermutation_io_in_valid = io_in_valid; // @[AES_Pipelined.scala 16:34]
  assign initialPermutation_io_in_bits_text = io_in_bits_text; // @[AES_Pipelined.scala 17:38]
  assign initialPermutation_io_out_ready = PEs_0_io_in_ready; // @[AES_Pipelined.scala 36:39]
  assign finalPermutation_clock = clock;
  assign finalPermutation_io_out_ready = io_result_ready; // @[AES_Pipelined.scala 24:33]
  assign finalPermutation_io_in_valid = PEs_9_io_out_valid; // @[AES_Pipelined.scala 42:36]
  assign finalPermutation_io_in_bits_state_0 = PEs_9_io_out_bits_state_0; // @[AES_Pipelined.scala 43:41]
  assign finalPermutation_io_in_bits_state_1 = PEs_9_io_out_bits_state_1; // @[AES_Pipelined.scala 43:41]
  assign finalPermutation_io_in_bits_state_2 = PEs_9_io_out_bits_state_2; // @[AES_Pipelined.scala 43:41]
  assign finalPermutation_io_in_bits_state_3 = PEs_9_io_out_bits_state_3; // @[AES_Pipelined.scala 43:41]
  assign PEs_0_clock = clock;
  assign PEs_0_io_out_ready = PEs_1_io_in_ready; // @[AES_Pipelined.scala 40:27]
  assign PEs_0_io_in_valid = initialPermutation_io_out_valid; // @[AES_Pipelined.scala 34:26]
  assign PEs_0_io_in_bits_state_0 = initialPermutation_io_out_bits_state_0; // @[AES_Pipelined.scala 35:25]
  assign PEs_0_io_in_bits_state_1 = initialPermutation_io_out_bits_state_1; // @[AES_Pipelined.scala 35:25]
  assign PEs_0_io_in_bits_state_2 = initialPermutation_io_out_bits_state_2; // @[AES_Pipelined.scala 35:25]
  assign PEs_0_io_in_bits_state_3 = initialPermutation_io_out_bits_state_3; // @[AES_Pipelined.scala 35:25]
  assign PEs_1_clock = clock;
  assign PEs_1_io_out_ready = PEs_2_io_in_ready; // @[AES_Pipelined.scala 49:27]
  assign PEs_1_io_in_valid = PEs_0_io_out_valid; // @[AES_Pipelined.scala 38:28]
  assign PEs_1_io_in_bits_state_0 = PEs_0_io_out_bits_state_0; // @[AES_Pipelined.scala 39:27]
  assign PEs_1_io_in_bits_state_1 = PEs_0_io_out_bits_state_1; // @[AES_Pipelined.scala 39:27]
  assign PEs_1_io_in_bits_state_2 = PEs_0_io_out_bits_state_2; // @[AES_Pipelined.scala 39:27]
  assign PEs_1_io_in_bits_state_3 = PEs_0_io_out_bits_state_3; // @[AES_Pipelined.scala 39:27]
  assign PEs_2_clock = clock;
  assign PEs_2_io_out_ready = PEs_3_io_in_ready; // @[AES_Pipelined.scala 49:27]
  assign PEs_2_io_in_valid = PEs_1_io_out_valid; // @[AES_Pipelined.scala 47:28]
  assign PEs_2_io_in_bits_state_0 = PEs_1_io_out_bits_state_0; // @[AES_Pipelined.scala 48:27]
  assign PEs_2_io_in_bits_state_1 = PEs_1_io_out_bits_state_1; // @[AES_Pipelined.scala 48:27]
  assign PEs_2_io_in_bits_state_2 = PEs_1_io_out_bits_state_2; // @[AES_Pipelined.scala 48:27]
  assign PEs_2_io_in_bits_state_3 = PEs_1_io_out_bits_state_3; // @[AES_Pipelined.scala 48:27]
  assign PEs_3_clock = clock;
  assign PEs_3_io_out_ready = PEs_4_io_in_ready; // @[AES_Pipelined.scala 49:27]
  assign PEs_3_io_in_valid = PEs_2_io_out_valid; // @[AES_Pipelined.scala 47:28]
  assign PEs_3_io_in_bits_state_0 = PEs_2_io_out_bits_state_0; // @[AES_Pipelined.scala 48:27]
  assign PEs_3_io_in_bits_state_1 = PEs_2_io_out_bits_state_1; // @[AES_Pipelined.scala 48:27]
  assign PEs_3_io_in_bits_state_2 = PEs_2_io_out_bits_state_2; // @[AES_Pipelined.scala 48:27]
  assign PEs_3_io_in_bits_state_3 = PEs_2_io_out_bits_state_3; // @[AES_Pipelined.scala 48:27]
  assign PEs_4_clock = clock;
  assign PEs_4_io_out_ready = PEs_5_io_in_ready; // @[AES_Pipelined.scala 49:27]
  assign PEs_4_io_in_valid = PEs_3_io_out_valid; // @[AES_Pipelined.scala 47:28]
  assign PEs_4_io_in_bits_state_0 = PEs_3_io_out_bits_state_0; // @[AES_Pipelined.scala 48:27]
  assign PEs_4_io_in_bits_state_1 = PEs_3_io_out_bits_state_1; // @[AES_Pipelined.scala 48:27]
  assign PEs_4_io_in_bits_state_2 = PEs_3_io_out_bits_state_2; // @[AES_Pipelined.scala 48:27]
  assign PEs_4_io_in_bits_state_3 = PEs_3_io_out_bits_state_3; // @[AES_Pipelined.scala 48:27]
  assign PEs_5_clock = clock;
  assign PEs_5_io_out_ready = PEs_6_io_in_ready; // @[AES_Pipelined.scala 49:27]
  assign PEs_5_io_in_valid = PEs_4_io_out_valid; // @[AES_Pipelined.scala 47:28]
  assign PEs_5_io_in_bits_state_0 = PEs_4_io_out_bits_state_0; // @[AES_Pipelined.scala 48:27]
  assign PEs_5_io_in_bits_state_1 = PEs_4_io_out_bits_state_1; // @[AES_Pipelined.scala 48:27]
  assign PEs_5_io_in_bits_state_2 = PEs_4_io_out_bits_state_2; // @[AES_Pipelined.scala 48:27]
  assign PEs_5_io_in_bits_state_3 = PEs_4_io_out_bits_state_3; // @[AES_Pipelined.scala 48:27]
  assign PEs_6_clock = clock;
  assign PEs_6_io_out_ready = PEs_7_io_in_ready; // @[AES_Pipelined.scala 49:27]
  assign PEs_6_io_in_valid = PEs_5_io_out_valid; // @[AES_Pipelined.scala 47:28]
  assign PEs_6_io_in_bits_state_0 = PEs_5_io_out_bits_state_0; // @[AES_Pipelined.scala 48:27]
  assign PEs_6_io_in_bits_state_1 = PEs_5_io_out_bits_state_1; // @[AES_Pipelined.scala 48:27]
  assign PEs_6_io_in_bits_state_2 = PEs_5_io_out_bits_state_2; // @[AES_Pipelined.scala 48:27]
  assign PEs_6_io_in_bits_state_3 = PEs_5_io_out_bits_state_3; // @[AES_Pipelined.scala 48:27]
  assign PEs_7_clock = clock;
  assign PEs_7_io_out_ready = PEs_8_io_in_ready; // @[AES_Pipelined.scala 49:27]
  assign PEs_7_io_in_valid = PEs_6_io_out_valid; // @[AES_Pipelined.scala 47:28]
  assign PEs_7_io_in_bits_state_0 = PEs_6_io_out_bits_state_0; // @[AES_Pipelined.scala 48:27]
  assign PEs_7_io_in_bits_state_1 = PEs_6_io_out_bits_state_1; // @[AES_Pipelined.scala 48:27]
  assign PEs_7_io_in_bits_state_2 = PEs_6_io_out_bits_state_2; // @[AES_Pipelined.scala 48:27]
  assign PEs_7_io_in_bits_state_3 = PEs_6_io_out_bits_state_3; // @[AES_Pipelined.scala 48:27]
  assign PEs_8_clock = clock;
  assign PEs_8_io_out_ready = PEs_9_io_in_ready; // @[AES_Pipelined.scala 49:27]
  assign PEs_8_io_in_valid = PEs_7_io_out_valid; // @[AES_Pipelined.scala 47:28]
  assign PEs_8_io_in_bits_state_0 = PEs_7_io_out_bits_state_0; // @[AES_Pipelined.scala 48:27]
  assign PEs_8_io_in_bits_state_1 = PEs_7_io_out_bits_state_1; // @[AES_Pipelined.scala 48:27]
  assign PEs_8_io_in_bits_state_2 = PEs_7_io_out_bits_state_2; // @[AES_Pipelined.scala 48:27]
  assign PEs_8_io_in_bits_state_3 = PEs_7_io_out_bits_state_3; // @[AES_Pipelined.scala 48:27]
  assign PEs_9_clock = clock;
  assign PEs_9_io_out_ready = finalPermutation_io_in_ready; // @[AES_Pipelined.scala 45:27]
  assign PEs_9_io_in_valid = PEs_8_io_out_valid; // @[AES_Pipelined.scala 47:28]
  assign PEs_9_io_in_bits_state_0 = PEs_8_io_out_bits_state_0; // @[AES_Pipelined.scala 48:27]
  assign PEs_9_io_in_bits_state_1 = PEs_8_io_out_bits_state_1; // @[AES_Pipelined.scala 48:27]
  assign PEs_9_io_in_bits_state_2 = PEs_8_io_out_bits_state_2; // @[AES_Pipelined.scala 48:27]
  assign PEs_9_io_in_bits_state_3 = PEs_8_io_out_bits_state_3; // @[AES_Pipelined.scala 48:27]
endmodule
