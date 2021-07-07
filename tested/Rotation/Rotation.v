module Rotation(
  input        clock,
  input        reset,
  input        io_out_ready,
  output       io_out_valid,
  output [7:0] io_out_bits,
  output       io_in_ready,
  input        io_in_valid,
  input  [7:0] io_in_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[Rotation.scala 13:25]
  reg [7:0] dataReg; // @[Rotation.scala 14:24]
  reg [3:0] cntReg; // @[Rotation.scala 15:23]
  wire  _T_2 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_3 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  hi = dataReg[0]; // @[Rotation.scala 30:29]
  wire [6:0] lo = dataReg[7:1]; // @[Rotation.scala 30:41]
  wire [7:0] _T_4 = {hi,lo}; // @[Cat.scala 30:58]
  wire [3:0] _T_7 = cntReg + 4'h1; // @[Rotation.scala 35:26]
  wire  _T_8 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_5 = io_out_ready ? 2'h0 : stateReg; // @[Rotation.scala 39:27 Rotation.scala 40:18 Rotation.scala 13:25]
  assign io_out_valid = stateReg == 2'h2; // @[Rotation.scala 18:28]
  assign io_out_bits = dataReg; // @[Rotation.scala 19:15]
  assign io_in_ready = stateReg == 2'h0; // @[Rotation.scala 17:27]
  always @(posedge clock) begin
    if (reset) begin // @[Rotation.scala 13:25]
      stateReg <= 2'h0; // @[Rotation.scala 13:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[Rotation.scala 23:26]
        stateReg <= 2'h1; // @[Rotation.scala 26:18]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (cntReg == 4'h8) begin // @[Rotation.scala 32:29]
        stateReg <= 2'h2; // @[Rotation.scala 33:18]
      end
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_5;
    end
    if (reset) begin // @[Rotation.scala 14:24]
      dataReg <= 8'h0; // @[Rotation.scala 14:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[Rotation.scala 23:26]
        dataReg <= io_in_bits; // @[Rotation.scala 24:17]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      dataReg <= _T_4; // @[Rotation.scala 30:15]
    end
    if (reset) begin // @[Rotation.scala 15:23]
      cntReg <= 4'h0; // @[Rotation.scala 15:23]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[Rotation.scala 23:26]
        cntReg <= 4'h1; // @[Rotation.scala 25:16]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (!(cntReg == 4'h8)) begin // @[Rotation.scala 32:29]
        cntReg <= _T_7; // @[Rotation.scala 35:16]
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
  dataReg = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  cntReg = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
