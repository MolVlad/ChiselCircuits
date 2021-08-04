circuit AES_FinalOperation :
  module AES_FinalOperation :
    input clock : Clock
    input reset : UInt<1>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<128>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits_state_0_0 : UInt<8>
    input io_in_bits_state_0_1 : UInt<8>
    input io_in_bits_state_0_2 : UInt<8>
    input io_in_bits_state_0_3 : UInt<8>
    input io_in_bits_state_1_0 : UInt<8>
    input io_in_bits_state_1_1 : UInt<8>
    input io_in_bits_state_1_2 : UInt<8>
    input io_in_bits_state_1_3 : UInt<8>
    input io_in_bits_state_2_0 : UInt<8>
    input io_in_bits_state_2_1 : UInt<8>
    input io_in_bits_state_2_2 : UInt<8>
    input io_in_bits_state_2_3 : UInt<8>
    input io_in_bits_state_3_0 : UInt<8>
    input io_in_bits_state_3_1 : UInt<8>
    input io_in_bits_state_3_2 : UInt<8>
    input io_in_bits_state_3_3 : UInt<8>
    input io_in_bits_key_0_0 : UInt<8>
    input io_in_bits_key_0_1 : UInt<8>
    input io_in_bits_key_0_2 : UInt<8>
    input io_in_bits_key_0_3 : UInt<8>
    input io_in_bits_key_1_0 : UInt<8>
    input io_in_bits_key_1_1 : UInt<8>
    input io_in_bits_key_1_2 : UInt<8>
    input io_in_bits_key_1_3 : UInt<8>
    input io_in_bits_key_2_0 : UInt<8>
    input io_in_bits_key_2_1 : UInt<8>
    input io_in_bits_key_2_2 : UInt<8>
    input io_in_bits_key_2_3 : UInt<8>
    input io_in_bits_key_3_0 : UInt<8>
    input io_in_bits_key_3_1 : UInt<8>
    input io_in_bits_key_3_2 : UInt<8>
    input io_in_bits_key_3_3 : UInt<8>

    reg input_state_0_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_0_0) @[Reg.scala 15:16]
    reg input_state_0_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_0_1) @[Reg.scala 15:16]
    reg input_state_0_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_0_2) @[Reg.scala 15:16]
    reg input_state_0_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_0_3) @[Reg.scala 15:16]
    reg input_state_1_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_1_0) @[Reg.scala 15:16]
    reg input_state_1_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_1_1) @[Reg.scala 15:16]
    reg input_state_1_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_1_2) @[Reg.scala 15:16]
    reg input_state_1_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_1_3) @[Reg.scala 15:16]
    reg input_state_2_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_2_0) @[Reg.scala 15:16]
    reg input_state_2_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_2_1) @[Reg.scala 15:16]
    reg input_state_2_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_2_2) @[Reg.scala 15:16]
    reg input_state_2_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_2_3) @[Reg.scala 15:16]
    reg input_state_3_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_3_0) @[Reg.scala 15:16]
    reg input_state_3_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_3_1) @[Reg.scala 15:16]
    reg input_state_3_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_3_2) @[Reg.scala 15:16]
    reg input_state_3_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_state_3_3) @[Reg.scala 15:16]
    reg input_key_0_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_0_0) @[Reg.scala 15:16]
    reg input_key_0_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_0_1) @[Reg.scala 15:16]
    reg input_key_0_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_0_2) @[Reg.scala 15:16]
    reg input_key_0_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_0_3) @[Reg.scala 15:16]
    reg input_key_1_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_1_0) @[Reg.scala 15:16]
    reg input_key_1_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_1_1) @[Reg.scala 15:16]
    reg input_key_1_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_1_2) @[Reg.scala 15:16]
    reg input_key_1_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_1_3) @[Reg.scala 15:16]
    reg input_key_2_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_2_0) @[Reg.scala 15:16]
    reg input_key_2_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_2_1) @[Reg.scala 15:16]
    reg input_key_2_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_2_2) @[Reg.scala 15:16]
    reg input_key_2_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_2_3) @[Reg.scala 15:16]
    reg input_key_3_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_3_0) @[Reg.scala 15:16]
    reg input_key_3_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_3_1) @[Reg.scala 15:16]
    reg input_key_3_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_3_2) @[Reg.scala 15:16]
    reg input_key_3_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), input_key_3_3) @[Reg.scala 15:16]
    reg valid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), valid) @[Reg.scala 15:16]
    node _T = eq(valid, UInt<1>("h0")) @[AES_Pipelined.scala 126:29]
    node _T_1 = or(io_out_ready, _T) @[AES_Pipelined.scala 126:26]
    node enable = _T_1 @[AES_Pipelined.scala 121:20 AES_Pipelined.scala 126:10]
    node _GEN_0 = mux(enable, io_in_bits_key_0_0, input_key_0_0) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_1 = mux(enable, io_in_bits_key_0_1, input_key_0_1) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_2 = mux(enable, io_in_bits_key_0_2, input_key_0_2) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_3 = mux(enable, io_in_bits_key_0_3, input_key_0_3) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_4 = mux(enable, io_in_bits_key_1_0, input_key_1_0) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_5 = mux(enable, io_in_bits_key_1_1, input_key_1_1) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_6 = mux(enable, io_in_bits_key_1_2, input_key_1_2) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_7 = mux(enable, io_in_bits_key_1_3, input_key_1_3) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_8 = mux(enable, io_in_bits_key_2_0, input_key_2_0) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_9 = mux(enable, io_in_bits_key_2_1, input_key_2_1) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_10 = mux(enable, io_in_bits_key_2_2, input_key_2_2) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_11 = mux(enable, io_in_bits_key_2_3, input_key_2_3) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_12 = mux(enable, io_in_bits_key_3_0, input_key_3_0) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_13 = mux(enable, io_in_bits_key_3_1, input_key_3_1) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_14 = mux(enable, io_in_bits_key_3_2, input_key_3_2) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_15 = mux(enable, io_in_bits_key_3_3, input_key_3_3) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_16 = mux(enable, io_in_bits_state_0_0, input_state_0_0) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_17 = mux(enable, io_in_bits_state_0_1, input_state_0_1) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_18 = mux(enable, io_in_bits_state_0_2, input_state_0_2) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_19 = mux(enable, io_in_bits_state_0_3, input_state_0_3) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_20 = mux(enable, io_in_bits_state_1_0, input_state_1_0) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_21 = mux(enable, io_in_bits_state_1_1, input_state_1_1) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_22 = mux(enable, io_in_bits_state_1_2, input_state_1_2) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_23 = mux(enable, io_in_bits_state_1_3, input_state_1_3) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_24 = mux(enable, io_in_bits_state_2_0, input_state_2_0) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_25 = mux(enable, io_in_bits_state_2_1, input_state_2_1) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_26 = mux(enable, io_in_bits_state_2_2, input_state_2_2) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_27 = mux(enable, io_in_bits_state_2_3, input_state_2_3) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_28 = mux(enable, io_in_bits_state_3_0, input_state_3_0) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_29 = mux(enable, io_in_bits_state_3_1, input_state_3_1) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_30 = mux(enable, io_in_bits_state_3_2, input_state_3_2) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_31 = mux(enable, io_in_bits_state_3_3, input_state_3_3) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_32 = mux(enable, io_in_valid, valid) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_33 = mux(valid, enable, UInt<1>("h1")) @[AES_Pipelined.scala 129:15 AES_Pipelined.scala 130:17 AES_Pipelined.scala 133:17]
    node hi_hi_hi_hi = xor(input_state_0_0, input_key_0_0) @[AES_Pipelined.scala 138:34]
    node hi_hi_hi_lo = xor(input_state_0_1, input_key_0_1) @[AES_Pipelined.scala 138:68]
    node hi_hi_hi = cat(hi_hi_hi_hi, hi_hi_hi_lo) @[Cat.scala 30:58]
    node hi_hi_lo_hi = xor(input_state_0_2, input_key_0_2) @[AES_Pipelined.scala 139:22]
    node hi_hi_lo_lo = xor(input_state_0_3, input_key_0_3) @[AES_Pipelined.scala 139:56]
    node hi_hi_lo = cat(hi_hi_lo_hi, hi_hi_lo_lo) @[Cat.scala 30:58]
    node hi_hi = cat(hi_hi_hi, hi_hi_lo) @[Cat.scala 30:58]
    node hi_lo_hi_hi = xor(input_state_1_0, input_key_1_0) @[AES_Pipelined.scala 140:22]
    node hi_lo_hi_lo = xor(input_state_1_1, input_key_1_1) @[AES_Pipelined.scala 140:56]
    node hi_lo_hi = cat(hi_lo_hi_hi, hi_lo_hi_lo) @[Cat.scala 30:58]
    node hi_lo_lo_hi = xor(input_state_1_2, input_key_1_2) @[AES_Pipelined.scala 141:22]
    node hi_lo_lo_lo = xor(input_state_1_3, input_key_1_3) @[AES_Pipelined.scala 141:56]
    node hi_lo_lo = cat(hi_lo_lo_hi, hi_lo_lo_lo) @[Cat.scala 30:58]
    node hi_lo = cat(hi_lo_hi, hi_lo_lo) @[Cat.scala 30:58]
    node hi = cat(hi_hi, hi_lo) @[Cat.scala 30:58]
    node lo_hi_hi_hi = xor(input_state_2_0, input_key_2_0) @[AES_Pipelined.scala 142:22]
    node lo_hi_hi_lo = xor(input_state_2_1, input_key_2_1) @[AES_Pipelined.scala 142:56]
    node lo_hi_hi = cat(lo_hi_hi_hi, lo_hi_hi_lo) @[Cat.scala 30:58]
    node lo_hi_lo_hi = xor(input_state_2_2, input_key_2_2) @[AES_Pipelined.scala 143:22]
    node lo_hi_lo_lo = xor(input_state_2_3, input_key_2_3) @[AES_Pipelined.scala 143:56]
    node lo_hi_lo = cat(lo_hi_lo_hi, lo_hi_lo_lo) @[Cat.scala 30:58]
    node lo_hi = cat(lo_hi_hi, lo_hi_lo) @[Cat.scala 30:58]
    node lo_lo_hi_hi = xor(input_state_3_0, input_key_3_0) @[AES_Pipelined.scala 144:22]
    node lo_lo_hi_lo = xor(input_state_3_1, input_key_3_1) @[AES_Pipelined.scala 144:56]
    node lo_lo_hi = cat(lo_lo_hi_hi, lo_lo_hi_lo) @[Cat.scala 30:58]
    node lo_lo_lo_hi = xor(input_state_3_2, input_key_3_2) @[AES_Pipelined.scala 145:22]
    node lo_lo_lo_lo = xor(input_state_3_3, input_key_3_3) @[AES_Pipelined.scala 145:56]
    node lo_lo_lo = cat(lo_lo_lo_hi, lo_lo_lo_lo) @[Cat.scala 30:58]
    node lo_lo = cat(lo_lo_hi, lo_lo_lo) @[Cat.scala 30:58]
    node lo = cat(lo_hi, lo_lo) @[Cat.scala 30:58]
    node _T_2 = cat(hi, lo) @[Cat.scala 30:58]
    node result = _T_2
    node _WIRE = pad(UInt<1>("h0"), 128) @[AES_Pipelined.scala 134:32 AES_Pipelined.scala 134:32]
    node _GEN_34 = mux(valid, result, _WIRE) @[AES_Pipelined.scala 129:15 AES_Pipelined.scala 131:17 AES_Pipelined.scala 134:17]
    io_out_valid <= valid @[AES_Pipelined.scala 127:16]
    io_out_bits <= _GEN_34
    io_in_ready <= _GEN_33
    input_state_0_0 <= _GEN_16
    input_state_0_1 <= _GEN_17
    input_state_0_2 <= _GEN_18
    input_state_0_3 <= _GEN_19
    input_state_1_0 <= _GEN_20
    input_state_1_1 <= _GEN_21
    input_state_1_2 <= _GEN_22
    input_state_1_3 <= _GEN_23
    input_state_2_0 <= _GEN_24
    input_state_2_1 <= _GEN_25
    input_state_2_2 <= _GEN_26
    input_state_2_3 <= _GEN_27
    input_state_3_0 <= _GEN_28
    input_state_3_1 <= _GEN_29
    input_state_3_2 <= _GEN_30
    input_state_3_3 <= _GEN_31
    input_key_0_0 <= _GEN_0
    input_key_0_1 <= _GEN_1
    input_key_0_2 <= _GEN_2
    input_key_0_3 <= _GEN_3
    input_key_1_0 <= _GEN_4
    input_key_1_1 <= _GEN_5
    input_key_1_2 <= _GEN_6
    input_key_1_3 <= _GEN_7
    input_key_2_0 <= _GEN_8
    input_key_2_1 <= _GEN_9
    input_key_2_2 <= _GEN_10
    input_key_2_3 <= _GEN_11
    input_key_3_0 <= _GEN_12
    input_key_3_1 <= _GEN_13
    input_key_3_2 <= _GEN_14
    input_key_3_3 <= _GEN_15
    valid <= _GEN_32
