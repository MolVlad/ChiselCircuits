;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Test : 
  module Test : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip A : UInt<1>, flip B : UInt<1>, flip data : SInt<32>, flip output_valid : UInt<1>, flip input_ready : UInt<1>, out1 : SInt<32>, out2 : UInt<1>}
    
    io.out1 <= io.data @[Test.scala 16:11]
    node _T = and(io.output_valid, io.input_ready) @[Test.scala 17:30]
    node _T_1 = and(_T, io.A) @[Test.scala 17:48]
    node _T_2 = and(_T_1, io.B) @[Test.scala 17:56]
    io.out2 <= _T_2 @[Test.scala 17:11]
    
