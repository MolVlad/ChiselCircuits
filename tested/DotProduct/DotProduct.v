module DotProduct(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_x,
  input  [31:0] io_in_bits_y,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[DotProduct.scala 16:25]
  reg [31:0] accReg; // @[DotProduct.scala 17:23]
  reg [1:0] cntReg; // @[DotProduct.scala 18:23]
  wire  _T_1 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire [63:0] _T_2 = $signed(io_in_bits_x) * $signed(io_in_bits_y); // @[DotProduct.scala 28:32]
  wire [63:0] _GEN_0 = io_in_valid ? $signed(_T_2) : $signed({{32{accReg[31]}},accReg}); // @[DotProduct.scala 27:25 DotProduct.scala 28:16 DotProduct.scala 17:23]
  wire [1:0] _GEN_1 = io_in_valid ? 2'h1 : cntReg; // @[DotProduct.scala 27:25 DotProduct.scala 29:16 DotProduct.scala 18:23]
  wire  _T_3 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_24 = {{32{accReg[31]}},accReg}; // @[DotProduct.scala 36:26]
  wire [63:0] _T_7 = $signed(_GEN_24) + $signed(_T_2); // @[DotProduct.scala 36:26]
  wire [1:0] _T_9 = cntReg + 2'h1; // @[DotProduct.scala 37:26]
  wire [1:0] _GEN_3 = cntReg == 2'h1 ? 2'h2 : stateReg; // @[DotProduct.scala 38:34 DotProduct.scala 39:20 DotProduct.scala 16:25]
  wire [63:0] _GEN_4 = io_in_valid ? $signed(_T_7) : $signed({{32{accReg[31]}},accReg}); // @[DotProduct.scala 35:25 DotProduct.scala 36:16 DotProduct.scala 17:23]
  wire  _T_11 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_8 = io_in_valid ? 2'h1 : 2'h0; // @[DotProduct.scala 47:27 DotProduct.scala 50:20 DotProduct.scala 52:20]
  wire [63:0] _GEN_9 = io_out_ready ? $signed(_GEN_0) : $signed({{32{accReg[31]}},accReg}); // @[DotProduct.scala 46:26 DotProduct.scala 17:23]
  wire [1:0] _GEN_10 = io_out_ready ? _GEN_1 : cntReg; // @[DotProduct.scala 46:26 DotProduct.scala 18:23]
  wire [1:0] _GEN_11 = io_out_ready ? _GEN_8 : stateReg; // @[DotProduct.scala 46:26 DotProduct.scala 16:25]
  wire  _GEN_12 = _T_11 ? io_out_ready : 1'h1; // @[Conditional.scala 39:67 DotProduct.scala 44:19 DotProduct.scala 20:15]
  wire [63:0] _GEN_13 = _T_11 ? $signed(_GEN_9) : $signed({{32{accReg[31]}},accReg}); // @[Conditional.scala 39:67 DotProduct.scala 17:23]
  wire  _GEN_16 = _T_3 | _GEN_12; // @[Conditional.scala 39:67 DotProduct.scala 34:19]
  wire [63:0] _GEN_17 = _T_3 ? $signed(_GEN_4) : $signed(_GEN_13); // @[Conditional.scala 39:67]
  wire [63:0] _GEN_21 = _T_1 ? $signed(_GEN_0) : $signed(_GEN_17); // @[Conditional.scala 40:58]
  assign io_in_ready = _T_1 | _GEN_16; // @[Conditional.scala 40:58 DotProduct.scala 26:19]
  assign io_out_valid = stateReg == 2'h2; // @[DotProduct.scala 21:28]
  assign io_out_bits = accReg; // @[DotProduct.scala 22:15]
  always @(posedge clock) begin
    if (reset) begin // @[DotProduct.scala 16:25]
      stateReg <= 2'h0; // @[DotProduct.scala 16:25]
    end else if (_T_1) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProduct.scala 27:25]
        stateReg <= 2'h1; // @[DotProduct.scala 30:18]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (io_in_valid) begin // @[DotProduct.scala 35:25]
        stateReg <= _GEN_3;
      end
    end else if (_T_11) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_11;
    end
    if (reset) begin // @[DotProduct.scala 17:23]
      accReg <= 32'sh0; // @[DotProduct.scala 17:23]
    end else begin
      accReg <= _GEN_21[31:0];
    end
    if (reset) begin // @[DotProduct.scala 18:23]
      cntReg <= 2'h1; // @[DotProduct.scala 18:23]
    end else if (_T_1) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[DotProduct.scala 27:25]
        cntReg <= 2'h1; // @[DotProduct.scala 29:16]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (io_in_valid) begin // @[DotProduct.scala 35:25]
        cntReg <= _T_9; // @[DotProduct.scala 37:16]
      end
    end else if (_T_11) begin // @[Conditional.scala 39:67]
      cntReg <= _GEN_10;
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
  accReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  cntReg = _RAND_2[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
