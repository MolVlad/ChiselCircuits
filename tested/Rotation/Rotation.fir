;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Rotation : 
  module Rotation : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}}
    
    reg stateReg : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Rotation.scala 13:25]
    reg dataReg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[Rotation.scala 14:24]
    reg cntReg : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Rotation.scala 15:23]
    node _T = eq(stateReg, UInt<2>("h00")) @[Rotation.scala 17:27]
    io.in.ready <= _T @[Rotation.scala 17:15]
    node _T_1 = eq(stateReg, UInt<2>("h02")) @[Rotation.scala 18:28]
    io.out.valid <= _T_1 @[Rotation.scala 18:16]
    io.out.bits <= dataReg @[Rotation.scala 19:15]
    node _T_2 = eq(UInt<2>("h00"), stateReg) @[Conditional.scala 37:30]
    when _T_2 : @[Conditional.scala 40:58]
      when io.in.valid : @[Rotation.scala 23:26]
        dataReg <= io.in.bits @[Rotation.scala 24:17]
        cntReg <= UInt<1>("h01") @[Rotation.scala 25:16]
        stateReg <= UInt<2>("h01") @[Rotation.scala 26:18]
        skip @[Rotation.scala 23:26]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_3 = eq(UInt<2>("h01"), stateReg) @[Conditional.scala 37:30]
      when _T_3 : @[Conditional.scala 39:67]
        node hi = bits(dataReg, 0, 0) @[Rotation.scala 30:29]
        node lo = bits(dataReg, 7, 1) @[Rotation.scala 30:41]
        node _T_4 = cat(hi, lo) @[Cat.scala 30:58]
        dataReg <= _T_4 @[Rotation.scala 30:15]
        node _T_5 = eq(cntReg, UInt<4>("h08")) @[Rotation.scala 32:20]
        when _T_5 : @[Rotation.scala 32:29]
          stateReg <= UInt<2>("h02") @[Rotation.scala 33:18]
          skip @[Rotation.scala 32:29]
        else : @[Rotation.scala 34:20]
          node _T_6 = add(cntReg, UInt<1>("h01")) @[Rotation.scala 35:26]
          node _T_7 = tail(_T_6, 1) @[Rotation.scala 35:26]
          cntReg <= _T_7 @[Rotation.scala 35:16]
          skip @[Rotation.scala 34:20]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_8 = eq(UInt<2>("h02"), stateReg) @[Conditional.scala 37:30]
        when _T_8 : @[Conditional.scala 39:67]
          when io.out.ready : @[Rotation.scala 39:27]
            stateReg <= UInt<2>("h00") @[Rotation.scala 40:18]
            skip @[Rotation.scala 39:27]
          skip @[Conditional.scala 39:67]
    
