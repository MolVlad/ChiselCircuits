circuit Test :
  module Test :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<1>
    input io_B : UInt<1>
    input io_data : SInt<32>
    input io_output_valid : UInt<1>
    input io_input_ready : UInt<1>
    output io_out1 : SInt<32>
    output io_out2 : UInt<1>

    node _T = and(io_output_valid, io_input_ready) @[Test.scala 17:30]
    node _T_1 = and(_T, io_A) @[Test.scala 17:48]
    node _T_2 = and(_T_1, io_B) @[Test.scala 17:56]
    io_out1 <= io_data @[Test.scala 16:11]
    io_out2 <= _T_2 @[Test.scala 17:11]
