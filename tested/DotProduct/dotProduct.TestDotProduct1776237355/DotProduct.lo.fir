circuit DotProduct :
  module DotProduct :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits_x : SInt<32>
    input io_in_bits_y : SInt<32>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<32>

    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[DotProduct.scala 16:25]
    reg accReg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), accReg) @[DotProduct.scala 17:23]
    reg cntReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[DotProduct.scala 18:23]
    node _T = eq(stateReg, UInt<2>("h2")) @[DotProduct.scala 21:28]
    node _T_1 = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _T_2 = mul(io_in_bits_x, io_in_bits_y) @[DotProduct.scala 28:32]
    node _GEN_0 = mux(io_in_valid, _T_2, accReg) @[DotProduct.scala 27:25 DotProduct.scala 28:16 DotProduct.scala 17:23]
    node _GEN_1 = mux(io_in_valid, UInt<1>("h1"), cntReg) @[DotProduct.scala 27:25 DotProduct.scala 29:16 DotProduct.scala 18:23]
    node _GEN_2 = mux(io_in_valid, UInt<2>("h1"), stateReg) @[DotProduct.scala 27:25 DotProduct.scala 30:18 DotProduct.scala 16:25]
    node _T_3 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_4 = mul(io_in_bits_x, io_in_bits_y) @[DotProduct.scala 36:41]
    node _T_5 = add(accReg, _T_4) @[DotProduct.scala 36:26]
    node _T_6 = tail(_T_5, 1) @[DotProduct.scala 36:26]
    node _T_7 = asSInt(_T_6) @[DotProduct.scala 36:26]
    node _T_8 = add(cntReg, UInt<1>("h1")) @[DotProduct.scala 37:26]
    node _T_9 = tail(_T_8, 1) @[DotProduct.scala 37:26]
    node _T_10 = eq(cntReg, UInt<1>("h1")) @[DotProduct.scala 38:21]
    node _GEN_3 = mux(_T_10, UInt<2>("h2"), stateReg) @[DotProduct.scala 38:34 DotProduct.scala 39:20 DotProduct.scala 16:25]
    node _GEN_4 = mux(io_in_valid, _T_7, accReg) @[DotProduct.scala 35:25 DotProduct.scala 36:16 DotProduct.scala 17:23]
    node _GEN_5 = mux(io_in_valid, _T_9, cntReg) @[DotProduct.scala 35:25 DotProduct.scala 37:16 DotProduct.scala 18:23]
    node _GEN_6 = mux(io_in_valid, _GEN_3, stateReg) @[DotProduct.scala 35:25 DotProduct.scala 16:25]
    node _T_11 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _T_12 = mul(io_in_bits_x, io_in_bits_y) @[DotProduct.scala 48:34]
    node _GEN_7 = mux(io_in_valid, _T_12, accReg) @[DotProduct.scala 47:27 DotProduct.scala 48:18 DotProduct.scala 17:23]
    node _GEN_8 = mux(io_in_valid, UInt<2>("h1"), UInt<2>("h0")) @[DotProduct.scala 47:27 DotProduct.scala 50:20 DotProduct.scala 52:20]
    node _GEN_9 = mux(io_out_ready, _GEN_7, accReg) @[DotProduct.scala 46:26 DotProduct.scala 17:23]
    node _GEN_10 = mux(io_out_ready, _GEN_1, cntReg) @[DotProduct.scala 46:26 DotProduct.scala 18:23]
    node _GEN_11 = mux(io_out_ready, _GEN_8, stateReg) @[DotProduct.scala 46:26 DotProduct.scala 16:25]
    node _GEN_12 = mux(_T_11, io_out_ready, UInt<1>("h1")) @[Conditional.scala 39:67 DotProduct.scala 44:19 DotProduct.scala 20:15]
    node _GEN_13 = mux(_T_11, _GEN_9, accReg) @[Conditional.scala 39:67 DotProduct.scala 17:23]
    node _GEN_14 = mux(_T_11, _GEN_10, cntReg) @[Conditional.scala 39:67 DotProduct.scala 18:23]
    node _GEN_15 = mux(_T_11, _GEN_11, stateReg) @[Conditional.scala 39:67 DotProduct.scala 16:25]
    node _GEN_16 = mux(_T_3, UInt<1>("h1"), _GEN_12) @[Conditional.scala 39:67 DotProduct.scala 34:19]
    node _GEN_17 = mux(_T_3, _GEN_4, _GEN_13) @[Conditional.scala 39:67]
    node _GEN_18 = mux(_T_3, _GEN_5, _GEN_14) @[Conditional.scala 39:67]
    node _GEN_19 = mux(_T_3, _GEN_6, _GEN_15) @[Conditional.scala 39:67]
    node _GEN_20 = mux(_T_1, UInt<1>("h1"), _GEN_16) @[Conditional.scala 40:58 DotProduct.scala 26:19]
    node _GEN_21 = mux(_T_1, _GEN_0, _GEN_17) @[Conditional.scala 40:58]
    node _GEN_22 = mux(_T_1, _GEN_1, _GEN_18) @[Conditional.scala 40:58]
    node _GEN_23 = mux(_T_1, _GEN_2, _GEN_19) @[Conditional.scala 40:58]
    io_in_ready <= _GEN_20
    io_out_valid <= _T @[DotProduct.scala 21:16]
    io_out_bits <= accReg @[DotProduct.scala 22:15]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_23) @[DotProduct.scala 16:25 DotProduct.scala 16:25]
    accReg <= mux(reset, asSInt(UInt<32>("h0")), asSInt(bits(_GEN_21, 31, 0))) @[DotProduct.scala 17:23 DotProduct.scala 17:23]
    cntReg <= mux(reset, UInt<2>("h1"), _GEN_22) @[DotProduct.scala 18:23 DotProduct.scala 18:23]
