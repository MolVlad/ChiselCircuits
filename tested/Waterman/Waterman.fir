;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Waterman : 
  module substituteElements : 
    input clock : Clock
    input reset : Reset
    output io : {flip first : UInt<2>, flip second : UInt<2>, out : SInt<32>}
    
    io.out <= asSInt(UInt<2>("h01")) @[DNA.scala 26:10]
    node _T = eq(io.first, io.second) @[DNA.scala 27:18]
    when _T : @[DNA.scala 27:33]
      io.out <= asSInt(UInt<2>("h01")) @[DNA.scala 28:12]
      skip @[DNA.scala 27:33]
    else : @[DNA.scala 29:16]
      io.out <= asSInt(UInt<2>("h03")) @[DNA.scala 30:12]
      skip @[DNA.scala 29:16]
    
  module Waterman : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<32>}, flip x : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<2>}, flip y : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<2>}}
    
    inst s of substituteElements @[Waterman.scala 14:17]
    s.clock <= clock
    s.reset <= reset
    s.io.first <= io.x.bits @[Waterman.scala 15:14]
    s.io.second <= io.y.bits @[Waterman.scala 16:15]
    io.out.bits <= s.io.out @[Waterman.scala 17:15]
    io.x.ready <= UInt<1>("h01") @[Waterman.scala 19:14]
    io.out.valid <= UInt<1>("h01") @[Waterman.scala 20:16]
    io.y.ready <= UInt<1>("h01") @[Waterman.scala 21:14]
    
