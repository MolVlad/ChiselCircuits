circuit AES_InitialOperation :
  module AES_InitialOperation :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits_text : UInt<128>
    input io_in_bits_key : UInt<128>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits_state_0_0 : UInt<8>
    output io_out_bits_state_0_1 : UInt<8>
    output io_out_bits_state_0_2 : UInt<8>
    output io_out_bits_state_0_3 : UInt<8>
    output io_out_bits_state_1_0 : UInt<8>
    output io_out_bits_state_1_1 : UInt<8>
    output io_out_bits_state_1_2 : UInt<8>
    output io_out_bits_state_1_3 : UInt<8>
    output io_out_bits_state_2_0 : UInt<8>
    output io_out_bits_state_2_1 : UInt<8>
    output io_out_bits_state_2_2 : UInt<8>
    output io_out_bits_state_2_3 : UInt<8>
    output io_out_bits_state_3_0 : UInt<8>
    output io_out_bits_state_3_1 : UInt<8>
    output io_out_bits_state_3_2 : UInt<8>
    output io_out_bits_state_3_3 : UInt<8>
    output io_out_bits_key_0_0 : UInt<8>
    output io_out_bits_key_0_1 : UInt<8>
    output io_out_bits_key_0_2 : UInt<8>
    output io_out_bits_key_0_3 : UInt<8>
    output io_out_bits_key_1_0 : UInt<8>
    output io_out_bits_key_1_1 : UInt<8>
    output io_out_bits_key_1_2 : UInt<8>
    output io_out_bits_key_1_3 : UInt<8>
    output io_out_bits_key_2_0 : UInt<8>
    output io_out_bits_key_2_1 : UInt<8>
    output io_out_bits_key_2_2 : UInt<8>
    output io_out_bits_key_2_3 : UInt<8>
    output io_out_bits_key_3_0 : UInt<8>
    output io_out_bits_key_3_1 : UInt<8>
    output io_out_bits_key_3_2 : UInt<8>
    output io_out_bits_key_3_3 : UInt<8>

    reg input_text : UInt<128>, clock with :
      reset => (UInt<1>("h0"), input_text) @[Reg.scala 15:16]
    reg input_key : UInt<128>, clock with :
      reset => (UInt<1>("h0"), input_key) @[Reg.scala 15:16]
    reg valid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), valid) @[Reg.scala 15:16]
    node _T = eq(valid, UInt<1>("h0")) @[AES_Pipelined.scala 68:29]
    node _T_1 = or(io_out_ready, _T) @[AES_Pipelined.scala 68:26]
    node enable = _T_1 @[AES_Pipelined.scala 63:20 AES_Pipelined.scala 68:10]
    node _GEN_0 = mux(enable, io_in_bits_key, input_key) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_1 = mux(enable, io_in_bits_text, input_text) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_2 = mux(enable, io_in_valid, valid) @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
    node _GEN_3 = mux(valid, enable, UInt<1>("h1")) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 72:17 AES_Pipelined.scala 75:17]
    node _T_33 = bits(input_key, 127, 120) @[AES_Pipelined.scala 83:40]
    node result_key_0_0 = _T_33
    node _WIRE_key_0_0 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_4 = mux(valid, result_key_0_0, _WIRE_key_0_0) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_31 = bits(input_key, 119, 112) @[AES_Pipelined.scala 83:40]
    node result_key_0_1 = _T_31
    node _WIRE_key_0_1 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_5 = mux(valid, result_key_0_1, _WIRE_key_0_1) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_29 = bits(input_key, 111, 104) @[AES_Pipelined.scala 83:40]
    node result_key_0_2 = _T_29
    node _WIRE_key_0_2 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_6 = mux(valid, result_key_0_2, _WIRE_key_0_2) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_27 = bits(input_key, 103, 96) @[AES_Pipelined.scala 83:40]
    node result_key_0_3 = _T_27
    node _WIRE_key_0_3 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_7 = mux(valid, result_key_0_3, _WIRE_key_0_3) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_25 = bits(input_key, 95, 88) @[AES_Pipelined.scala 83:40]
    node result_key_1_0 = _T_25
    node _WIRE_key_1_0 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_8 = mux(valid, result_key_1_0, _WIRE_key_1_0) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_23 = bits(input_key, 87, 80) @[AES_Pipelined.scala 83:40]
    node result_key_1_1 = _T_23
    node _WIRE_key_1_1 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_9 = mux(valid, result_key_1_1, _WIRE_key_1_1) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_21 = bits(input_key, 79, 72) @[AES_Pipelined.scala 83:40]
    node result_key_1_2 = _T_21
    node _WIRE_key_1_2 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_10 = mux(valid, result_key_1_2, _WIRE_key_1_2) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_19 = bits(input_key, 71, 64) @[AES_Pipelined.scala 83:40]
    node result_key_1_3 = _T_19
    node _WIRE_key_1_3 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_11 = mux(valid, result_key_1_3, _WIRE_key_1_3) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_17 = bits(input_key, 63, 56) @[AES_Pipelined.scala 83:40]
    node result_key_2_0 = _T_17
    node _WIRE_key_2_0 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_12 = mux(valid, result_key_2_0, _WIRE_key_2_0) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_15 = bits(input_key, 55, 48) @[AES_Pipelined.scala 83:40]
    node result_key_2_1 = _T_15
    node _WIRE_key_2_1 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_13 = mux(valid, result_key_2_1, _WIRE_key_2_1) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_13 = bits(input_key, 47, 40) @[AES_Pipelined.scala 83:40]
    node result_key_2_2 = _T_13
    node _WIRE_key_2_2 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_14 = mux(valid, result_key_2_2, _WIRE_key_2_2) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_11 = bits(input_key, 39, 32) @[AES_Pipelined.scala 83:40]
    node result_key_2_3 = _T_11
    node _WIRE_key_2_3 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_15 = mux(valid, result_key_2_3, _WIRE_key_2_3) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_9 = bits(input_key, 31, 24) @[AES_Pipelined.scala 83:40]
    node result_key_3_0 = _T_9
    node _WIRE_key_3_0 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_16 = mux(valid, result_key_3_0, _WIRE_key_3_0) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_7 = bits(input_key, 23, 16) @[AES_Pipelined.scala 83:40]
    node result_key_3_1 = _T_7
    node _WIRE_key_3_1 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_17 = mux(valid, result_key_3_1, _WIRE_key_3_1) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_5 = bits(input_key, 15, 8) @[AES_Pipelined.scala 83:40]
    node result_key_3_2 = _T_5
    node _WIRE_key_3_2 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_18 = mux(valid, result_key_3_2, _WIRE_key_3_2) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_3 = bits(input_key, 7, 0) @[AES_Pipelined.scala 83:40]
    node result_key_3_3 = _T_3
    node _WIRE_key_3_3 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_19 = mux(valid, result_key_3_3, _WIRE_key_3_3) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_32 = bits(input_text, 127, 120) @[AES_Pipelined.scala 82:43]
    node result_state_0_0 = _T_32
    node _WIRE_state_0_0 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_20 = mux(valid, result_state_0_0, _WIRE_state_0_0) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_30 = bits(input_text, 119, 112) @[AES_Pipelined.scala 82:43]
    node result_state_0_1 = _T_30
    node _WIRE_state_0_1 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_21 = mux(valid, result_state_0_1, _WIRE_state_0_1) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_28 = bits(input_text, 111, 104) @[AES_Pipelined.scala 82:43]
    node result_state_0_2 = _T_28
    node _WIRE_state_0_2 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_22 = mux(valid, result_state_0_2, _WIRE_state_0_2) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_26 = bits(input_text, 103, 96) @[AES_Pipelined.scala 82:43]
    node result_state_0_3 = _T_26
    node _WIRE_state_0_3 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_23 = mux(valid, result_state_0_3, _WIRE_state_0_3) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_24 = bits(input_text, 95, 88) @[AES_Pipelined.scala 82:43]
    node result_state_1_0 = _T_24
    node _WIRE_state_1_0 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_24 = mux(valid, result_state_1_0, _WIRE_state_1_0) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_22 = bits(input_text, 87, 80) @[AES_Pipelined.scala 82:43]
    node result_state_1_1 = _T_22
    node _WIRE_state_1_1 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_25 = mux(valid, result_state_1_1, _WIRE_state_1_1) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_20 = bits(input_text, 79, 72) @[AES_Pipelined.scala 82:43]
    node result_state_1_2 = _T_20
    node _WIRE_state_1_2 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_26 = mux(valid, result_state_1_2, _WIRE_state_1_2) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_18 = bits(input_text, 71, 64) @[AES_Pipelined.scala 82:43]
    node result_state_1_3 = _T_18
    node _WIRE_state_1_3 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_27 = mux(valid, result_state_1_3, _WIRE_state_1_3) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_16 = bits(input_text, 63, 56) @[AES_Pipelined.scala 82:43]
    node result_state_2_0 = _T_16
    node _WIRE_state_2_0 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_28 = mux(valid, result_state_2_0, _WIRE_state_2_0) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_14 = bits(input_text, 55, 48) @[AES_Pipelined.scala 82:43]
    node result_state_2_1 = _T_14
    node _WIRE_state_2_1 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_29 = mux(valid, result_state_2_1, _WIRE_state_2_1) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_12 = bits(input_text, 47, 40) @[AES_Pipelined.scala 82:43]
    node result_state_2_2 = _T_12
    node _WIRE_state_2_2 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_30 = mux(valid, result_state_2_2, _WIRE_state_2_2) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_10 = bits(input_text, 39, 32) @[AES_Pipelined.scala 82:43]
    node result_state_2_3 = _T_10
    node _WIRE_state_2_3 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_31 = mux(valid, result_state_2_3, _WIRE_state_2_3) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_8 = bits(input_text, 31, 24) @[AES_Pipelined.scala 82:43]
    node result_state_3_0 = _T_8
    node _WIRE_state_3_0 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_32 = mux(valid, result_state_3_0, _WIRE_state_3_0) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_6 = bits(input_text, 23, 16) @[AES_Pipelined.scala 82:43]
    node result_state_3_1 = _T_6
    node _WIRE_state_3_1 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_33 = mux(valid, result_state_3_1, _WIRE_state_3_1) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_4 = bits(input_text, 15, 8) @[AES_Pipelined.scala 82:43]
    node result_state_3_2 = _T_4
    node _WIRE_state_3_2 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_34 = mux(valid, result_state_3_2, _WIRE_state_3_2) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    node _T_2 = bits(input_text, 7, 0) @[AES_Pipelined.scala 82:43]
    node result_state_3_3 = _T_2
    node _WIRE_state_3_3 = UInt<8>("h0") @[AES_Pipelined.scala 76:32 AES_Pipelined.scala 76:32]
    node _GEN_35 = mux(valid, result_state_3_3, _WIRE_state_3_3) @[AES_Pipelined.scala 71:15 AES_Pipelined.scala 73:17 AES_Pipelined.scala 76:17]
    io_in_ready <= _GEN_3
    io_out_valid <= valid @[AES_Pipelined.scala 69:16]
    io_out_bits_state_0_0 <= _GEN_20
    io_out_bits_state_0_1 <= _GEN_21
    io_out_bits_state_0_2 <= _GEN_22
    io_out_bits_state_0_3 <= _GEN_23
    io_out_bits_state_1_0 <= _GEN_24
    io_out_bits_state_1_1 <= _GEN_25
    io_out_bits_state_1_2 <= _GEN_26
    io_out_bits_state_1_3 <= _GEN_27
    io_out_bits_state_2_0 <= _GEN_28
    io_out_bits_state_2_1 <= _GEN_29
    io_out_bits_state_2_2 <= _GEN_30
    io_out_bits_state_2_3 <= _GEN_31
    io_out_bits_state_3_0 <= _GEN_32
    io_out_bits_state_3_1 <= _GEN_33
    io_out_bits_state_3_2 <= _GEN_34
    io_out_bits_state_3_3 <= _GEN_35
    io_out_bits_key_0_0 <= _GEN_4
    io_out_bits_key_0_1 <= _GEN_5
    io_out_bits_key_0_2 <= _GEN_6
    io_out_bits_key_0_3 <= _GEN_7
    io_out_bits_key_1_0 <= _GEN_8
    io_out_bits_key_1_1 <= _GEN_9
    io_out_bits_key_1_2 <= _GEN_10
    io_out_bits_key_1_3 <= _GEN_11
    io_out_bits_key_2_0 <= _GEN_12
    io_out_bits_key_2_1 <= _GEN_13
    io_out_bits_key_2_2 <= _GEN_14
    io_out_bits_key_2_3 <= _GEN_15
    io_out_bits_key_3_0 <= _GEN_16
    io_out_bits_key_3_1 <= _GEN_17
    io_out_bits_key_3_2 <= _GEN_18
    io_out_bits_key_3_3 <= _GEN_19
    input_text <= _GEN_1
    input_key <= _GEN_0
    valid <= _GEN_2
