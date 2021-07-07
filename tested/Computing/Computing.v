module Computing(
  input         clock,
  input         reset,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_x,
  output [31:0] io_out_bits_y,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_x,
  input  [31:0] io_in_bits_y
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[Computing.scala 13:25]
  reg [31:0] xReg; // @[Computing.scala 14:21]
  reg [31:0] yReg; // @[Computing.scala 15:21]
  reg [1:0] cntReg; // @[Computing.scala 16:23]
  wire  _T_2 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_0 = io_in_valid ? $signed(io_in_bits_x) : $signed(xReg); // @[Computing.scala 25:25 Computing.scala 26:14 Computing.scala 14:21]
  wire [31:0] _GEN_1 = io_in_valid ? $signed(io_in_bits_y) : $signed(yReg); // @[Computing.scala 25:25 Computing.scala 27:14 Computing.scala 15:21]
  wire  _T_3 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [35:0] _T_4 = $signed(xReg) * 4'sh5; // @[Computing.scala 33:20]
  wire [34:0] _T_5 = $signed(yReg) * 3'sh3; // @[Computing.scala 33:33]
  wire [35:0] _GEN_16 = {{1{_T_5[34]}},_T_5}; // @[Computing.scala 33:26]
  wire [35:0] _T_8 = $signed(_T_4) + $signed(_GEN_16); // @[Computing.scala 33:26]
  wire [34:0] _T_9 = $signed(xReg) * 3'sh3; // @[Computing.scala 34:20]
  wire [34:0] _T_10 = $signed(yReg) * 3'sh2; // @[Computing.scala 34:33]
  wire [34:0] _T_13 = $signed(_T_9) - $signed(_T_10); // @[Computing.scala 34:26]
  wire [1:0] _T_16 = cntReg + 2'h1; // @[Computing.scala 39:26]
  wire  _T_17 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_6 = io_out_ready ? 2'h0 : stateReg; // @[Computing.scala 43:26 Computing.scala 44:18 Computing.scala 13:25]
  wire [35:0] _GEN_8 = _T_3 ? $signed(_T_8) : $signed({{4{xReg[31]}},xReg}); // @[Conditional.scala 39:67 Computing.scala 33:12 Computing.scala 14:21]
  wire [34:0] _GEN_9 = _T_3 ? $signed(_T_13) : $signed({{3{yReg[31]}},yReg}); // @[Conditional.scala 39:67 Computing.scala 34:12 Computing.scala 15:21]
  wire [35:0] _GEN_12 = _T_2 ? $signed({{4{_GEN_0[31]}},_GEN_0}) : $signed(_GEN_8); // @[Conditional.scala 40:58]
  wire [34:0] _GEN_13 = _T_2 ? $signed({{3{_GEN_1[31]}},_GEN_1}) : $signed(_GEN_9); // @[Conditional.scala 40:58]
  assign io_out_valid = stateReg == 2'h2; // @[Computing.scala 19:28]
  assign io_out_bits_x = xReg; // @[Computing.scala 20:17]
  assign io_out_bits_y = yReg; // @[Computing.scala 21:17]
  assign io_in_ready = stateReg == 2'h0; // @[Computing.scala 18:27]
  always @(posedge clock) begin
    if (reset) begin // @[Computing.scala 13:25]
      stateReg <= 2'h0; // @[Computing.scala 13:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[Computing.scala 25:25]
        stateReg <= 2'h1; // @[Computing.scala 29:18]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (cntReg == 2'h2) begin // @[Computing.scala 36:28]
        stateReg <= 2'h2; // @[Computing.scala 37:18]
      end
    end else if (_T_17) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_6;
    end
    if (reset) begin // @[Computing.scala 14:21]
      xReg <= 32'sh0; // @[Computing.scala 14:21]
    end else begin
      xReg <= _GEN_12[31:0];
    end
    if (reset) begin // @[Computing.scala 15:21]
      yReg <= 32'sh0; // @[Computing.scala 15:21]
    end else begin
      yReg <= _GEN_13[31:0];
    end
    if (reset) begin // @[Computing.scala 16:23]
      cntReg <= 2'h0; // @[Computing.scala 16:23]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[Computing.scala 25:25]
        cntReg <= 2'h1; // @[Computing.scala 28:16]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (!(cntReg == 2'h2)) begin // @[Computing.scala 36:28]
        cntReg <= _T_16; // @[Computing.scala 39:16]
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
  xReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  yReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  cntReg = _RAND_3[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
