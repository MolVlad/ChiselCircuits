;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit DotProductFSM : 
  module DotProductPE : 
    input clock : Clock
    input reset : Reset
    output io : {flip x : SInt<32>, flip y : SInt<32>, flip reset : UInt<1>, out : SInt<32>}
    
    reg accReg : SInt<32>, clock with : (reset => (reset, asSInt(UInt<32>("h00")))) @[DotProductFSM.scala 67:23]
    io.out <= accReg @[DotProductFSM.scala 68:10]
    when io.reset : @[DotProductFSM.scala 70:19]
      accReg <= asSInt(UInt<1>("h00")) @[DotProductFSM.scala 71:12]
      skip @[DotProductFSM.scala 70:19]
    else : @[DotProductFSM.scala 72:16]
      node _T = mul(io.x, io.y) @[DotProductFSM.scala 73:29]
      node _T_1 = add(accReg, _T) @[DotProductFSM.scala 73:22]
      node _T_2 = tail(_T_1, 1) @[DotProductFSM.scala 73:22]
      node _T_3 = asSInt(_T_2) @[DotProductFSM.scala 73:22]
      accReg <= _T_3 @[DotProductFSM.scala 73:12]
      skip @[DotProductFSM.scala 72:16]
    
  module DotProductFSM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : {x : SInt<32>, y : SInt<32>}}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<32>}}
    
    reg stateReg : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[DotProductFSM.scala 16:25]
    reg xReg : SInt<32>, clock with : (reset => (reset, asSInt(UInt<32>("h00")))) @[DotProductFSM.scala 17:21]
    reg yReg : SInt<32>, clock with : (reset => (reset, asSInt(UInt<32>("h00")))) @[DotProductFSM.scala 18:21]
    reg cntReg : UInt<2>, clock with : (reset => (reset, UInt<2>("h01"))) @[DotProductFSM.scala 19:23]
    inst pe of DotProductPE @[DotProductFSM.scala 21:18]
    pe.clock <= clock
    pe.reset <= reset
    pe.io.x <= asSInt(UInt<1>("h00")) @[DotProductFSM.scala 22:11]
    pe.io.y <= asSInt(UInt<1>("h00")) @[DotProductFSM.scala 23:11]
    pe.io.reset <= UInt<1>("h00") @[DotProductFSM.scala 24:15]
    io.out.bits <= pe.io.out @[DotProductFSM.scala 25:15]
    node _T = eq(stateReg, UInt<2>("h00")) @[DotProductFSM.scala 27:27]
    io.in.ready <= _T @[DotProductFSM.scala 27:15]
    node _T_1 = eq(stateReg, UInt<2>("h02")) @[DotProductFSM.scala 28:28]
    io.out.valid <= _T_1 @[DotProductFSM.scala 28:16]
    node _T_2 = eq(UInt<2>("h00"), stateReg) @[Conditional.scala 37:30]
    when _T_2 : @[Conditional.scala 40:58]
      when io.in.valid : @[DotProductFSM.scala 32:25]
        xReg <= io.in.bits.x @[DotProductFSM.scala 33:14]
        yReg <= io.in.bits.y @[DotProductFSM.scala 34:14]
        stateReg <= UInt<2>("h01") @[DotProductFSM.scala 35:18]
        skip @[DotProductFSM.scala 32:25]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_3 = eq(UInt<2>("h01"), stateReg) @[Conditional.scala 37:30]
      when _T_3 : @[Conditional.scala 39:67]
        pe.io.x <= xReg @[DotProductFSM.scala 39:15]
        pe.io.y <= yReg @[DotProductFSM.scala 40:15]
        node _T_4 = add(cntReg, UInt<1>("h01")) @[DotProductFSM.scala 41:24]
        node _T_5 = tail(_T_4, 1) @[DotProductFSM.scala 41:24]
        cntReg <= _T_5 @[DotProductFSM.scala 41:14]
        node _T_6 = eq(cntReg, UInt<2>("h02")) @[DotProductFSM.scala 43:19]
        when _T_6 : @[DotProductFSM.scala 43:28]
          stateReg <= UInt<2>("h02") @[DotProductFSM.scala 44:18]
          skip @[DotProductFSM.scala 43:28]
        else : @[DotProductFSM.scala 45:20]
          stateReg <= UInt<2>("h00") @[DotProductFSM.scala 46:18]
          skip @[DotProductFSM.scala 45:20]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_7 = eq(UInt<2>("h02"), stateReg) @[Conditional.scala 37:30]
        when _T_7 : @[Conditional.scala 39:67]
          when io.out.ready : @[DotProductFSM.scala 50:26]
            cntReg <= UInt<1>("h01") @[DotProductFSM.scala 51:16]
            pe.io.reset <= UInt<1>("h01") @[DotProductFSM.scala 52:21]
            stateReg <= UInt<2>("h00") @[DotProductFSM.scala 53:18]
            skip @[DotProductFSM.scala 50:26]
          skip @[Conditional.scala 39:67]
    
