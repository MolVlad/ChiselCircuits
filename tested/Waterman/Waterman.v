module substituteElements(
  input  [1:0]  io_first,
  input  [1:0]  io_second,
  output [31:0] io_out
);
  wire [1:0] _GEN_0 = io_first == io_second ? $signed(2'sh1) : $signed(-2'sh1); // @[DNA.scala 27:33 DNA.scala 28:12 DNA.scala 30:12]
  assign io_out = {{30{_GEN_0[1]}},_GEN_0}; // @[DNA.scala 27:33 DNA.scala 28:12 DNA.scala 30:12]
endmodule
module Waterman(
  input         clock,
  input         reset,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits,
  output        io_x_ready,
  input         io_x_valid,
  input  [1:0]  io_x_bits,
  output        io_y_ready,
  input         io_y_valid,
  input  [1:0]  io_y_bits
);
  wire [1:0] s_io_first; // @[Waterman.scala 14:17]
  wire [1:0] s_io_second; // @[Waterman.scala 14:17]
  wire [31:0] s_io_out; // @[Waterman.scala 14:17]
  substituteElements s ( // @[Waterman.scala 14:17]
    .io_first(s_io_first),
    .io_second(s_io_second),
    .io_out(s_io_out)
  );
  assign io_out_valid = 1'h1; // @[Waterman.scala 20:16]
  assign io_out_bits = s_io_out; // @[Waterman.scala 17:15]
  assign io_x_ready = 1'h1; // @[Waterman.scala 19:14]
  assign io_y_ready = 1'h1; // @[Waterman.scala 21:14]
  assign s_io_first = io_x_bits; // @[Waterman.scala 15:14]
  assign s_io_second = io_y_bits; // @[Waterman.scala 16:15]
endmodule
