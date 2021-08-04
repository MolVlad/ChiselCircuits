module AES_InitialOperation(
  input          clock,
  input          reset,
  output         io_in_ready,
  input          io_in_valid,
  input  [127:0] io_in_bits_text,
  input  [127:0] io_in_bits_key,
  input          io_out_ready,
  output         io_out_valid,
  output [7:0]   io_out_bits_state_0_0,
  output [7:0]   io_out_bits_state_0_1,
  output [7:0]   io_out_bits_state_0_2,
  output [7:0]   io_out_bits_state_0_3,
  output [7:0]   io_out_bits_state_1_0,
  output [7:0]   io_out_bits_state_1_1,
  output [7:0]   io_out_bits_state_1_2,
  output [7:0]   io_out_bits_state_1_3,
  output [7:0]   io_out_bits_state_2_0,
  output [7:0]   io_out_bits_state_2_1,
  output [7:0]   io_out_bits_state_2_2,
  output [7:0]   io_out_bits_state_2_3,
  output [7:0]   io_out_bits_state_3_0,
  output [7:0]   io_out_bits_state_3_1,
  output [7:0]   io_out_bits_state_3_2,
  output [7:0]   io_out_bits_state_3_3,
  output [7:0]   io_out_bits_key_0_0,
  output [7:0]   io_out_bits_key_0_1,
  output [7:0]   io_out_bits_key_0_2,
  output [7:0]   io_out_bits_key_0_3,
  output [7:0]   io_out_bits_key_1_0,
  output [7:0]   io_out_bits_key_1_1,
  output [7:0]   io_out_bits_key_1_2,
  output [7:0]   io_out_bits_key_1_3,
  output [7:0]   io_out_bits_key_2_0,
  output [7:0]   io_out_bits_key_2_1,
  output [7:0]   io_out_bits_key_2_2,
  output [7:0]   io_out_bits_key_2_3,
  output [7:0]   io_out_bits_key_3_0,
  output [7:0]   io_out_bits_key_3_1,
  output [7:0]   io_out_bits_key_3_2,
  output [7:0]   io_out_bits_key_3_3
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [127:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] input_text; // @[Reg.scala 15:16]
  reg [127:0] input_key; // @[Reg.scala 15:16]
  reg  valid; // @[Reg.scala 15:16]
  wire  enable = io_out_ready | ~valid; // @[AES_Pipelined.scala 68:26]
  wire [7:0] result_key_0_0 = input_key[127:120]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_0_1 = input_key[119:112]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_0_2 = input_key[111:104]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_0_3 = input_key[103:96]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_1_0 = input_key[95:88]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_1_1 = input_key[87:80]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_1_2 = input_key[79:72]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_1_3 = input_key[71:64]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_2_0 = input_key[63:56]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_2_1 = input_key[55:48]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_2_2 = input_key[47:40]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_2_3 = input_key[39:32]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_3_0 = input_key[31:24]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_3_1 = input_key[23:16]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_3_2 = input_key[15:8]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_key_3_3 = input_key[7:0]; // @[AES_Pipelined.scala 83:40]
  wire [7:0] result_state_0_0 = input_text[127:120]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_0_1 = input_text[119:112]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_0_2 = input_text[111:104]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_0_3 = input_text[103:96]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_1_0 = input_text[95:88]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_1_1 = input_text[87:80]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_1_2 = input_text[79:72]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_1_3 = input_text[71:64]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_2_0 = input_text[63:56]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_2_1 = input_text[55:48]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_2_2 = input_text[47:40]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_2_3 = input_text[39:32]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_3_0 = input_text[31:24]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_3_1 = input_text[23:16]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_3_2 = input_text[15:8]; // @[AES_Pipelined.scala 82:43]
  wire [7:0] result_state_3_3 = input_text[7:0]; // @[AES_Pipelined.scala 82:43]
  assign io_in_ready = valid ? enable : 1'h1; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 72:17 AES_Pipelined.scala 75:17]
  assign io_out_valid = valid; // @[AES_Pipelined.scala 69:16]
  assign io_out_bits_state_0_0 = valid ? result_state_0_0 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_0_1 = valid ? result_state_0_1 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_0_2 = valid ? result_state_0_2 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_0_3 = valid ? result_state_0_3 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_1_0 = valid ? result_state_1_0 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_1_1 = valid ? result_state_1_1 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_1_2 = valid ? result_state_1_2 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_1_3 = valid ? result_state_1_3 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_2_0 = valid ? result_state_2_0 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_2_1 = valid ? result_state_2_1 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_2_2 = valid ? result_state_2_2 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_2_3 = valid ? result_state_2_3 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_3_0 = valid ? result_state_3_0 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_3_1 = valid ? result_state_3_1 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_3_2 = valid ? result_state_3_2 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_state_3_3 = valid ? result_state_3_3 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_0_0 = valid ? result_key_0_0 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_0_1 = valid ? result_key_0_1 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_0_2 = valid ? result_key_0_2 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_0_3 = valid ? result_key_0_3 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_1_0 = valid ? result_key_1_0 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_1_1 = valid ? result_key_1_1 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_1_2 = valid ? result_key_1_2 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_1_3 = valid ? result_key_1_3 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_2_0 = valid ? result_key_2_0 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_2_1 = valid ? result_key_2_1 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_2_2 = valid ? result_key_2_2 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_2_3 = valid ? result_key_2_3 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_3_0 = valid ? result_key_3_0 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_3_1 = valid ? result_key_3_1 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_3_2 = valid ? result_key_3_2 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  assign io_out_bits_key_3_3 = valid ? result_key_3_3 : 8'h0; // @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
  always @(posedge clock) begin
    if (enable) begin // @[Reg.scala 16:19]
      input_text <= io_in_bits_text; // @[Reg.scala 16:23]
    end
    if (enable) begin // @[Reg.scala 16:19]
      input_key <= io_in_bits_key; // @[Reg.scala 16:23]
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
  input_text = _RAND_0[127:0];
  _RAND_1 = {4{`RANDOM}};
  input_key = _RAND_1[127:0];
  _RAND_2 = {1{`RANDOM}};
  valid = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
