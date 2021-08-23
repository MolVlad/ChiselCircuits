module Test(
  input         clock,
  input         reset,
  input         io_A,
  input         io_B,
  input  [31:0] io_data,
  input         io_output_valid,
  input         io_input_ready,
  output [31:0] io_out1,
  output        io_out2
);
  assign io_out1 = io_data; // @[Test.scala 16:11]
  assign io_out2 = io_output_valid & io_input_ready & io_A & io_B; // @[Test.scala 17:56]
endmodule
