module IP(
  input  [63:0] io_text,
  output [31:0] io_L,
  output [31:0] io_R
);
  wire [63:0] _T_3 = {{32'd0}, io_text[63:32]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_5 = {io_text[31:0], 32'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_7 = _T_5 & 64'hffffffff00000000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_8 = _T_3 | _T_7; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_0 = {{16'd0}, _T_8[63:16]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_13 = _GEN_0 & 64'hffff0000ffff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_15 = {_T_8[47:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_17 = _T_15 & 64'hffff0000ffff0000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_18 = _T_13 | _T_17; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_1 = {{8'd0}, _T_18[63:8]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_23 = _GEN_1 & 64'hff00ff00ff00ff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_25 = {_T_18[55:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_27 = _T_25 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 103:75]
  wire [63:0] _T_28 = _T_23 | _T_27; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_2 = {{4'd0}, _T_28[63:4]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_33 = _GEN_2 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 103:31]
  wire [63:0] _T_35 = {_T_28[59:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_37 = _T_35 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 103:75]
  wire [63:0] _T_38 = _T_33 | _T_37; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_3 = {{2'd0}, _T_38[63:2]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_43 = _GEN_3 & 64'h3333333333333333; // @[Bitwise.scala 103:31]
  wire [63:0] _T_45 = {_T_38[61:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_47 = _T_45 & 64'hcccccccccccccccc; // @[Bitwise.scala 103:75]
  wire [63:0] _T_48 = _T_43 | _T_47; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_4 = {{1'd0}, _T_48[63:1]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_53 = _GEN_4 & 64'h5555555555555555; // @[Bitwise.scala 103:31]
  wire [63:0] _T_55 = {_T_48[62:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_57 = _T_55 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] reversed = _T_53 | _T_57; // @[Bitwise.scala 103:39]
  wire  hi_hi_hi_hi_hi = reversed[57]; // @[DES_EncryptionPipelinedElasticBuffer.scala 205:23]
  wire  hi_hi_hi_hi_lo = reversed[49]; // @[DES_EncryptionPipelinedElasticBuffer.scala 205:36]
  wire  hi_hi_hi_lo_hi = reversed[41]; // @[DES_EncryptionPipelinedElasticBuffer.scala 205:49]
  wire  hi_hi_hi_lo_lo = reversed[33]; // @[DES_EncryptionPipelinedElasticBuffer.scala 205:62]
  wire  hi_hi_lo_hi_hi = reversed[25]; // @[DES_EncryptionPipelinedElasticBuffer.scala 205:75]
  wire  hi_hi_lo_hi_lo = reversed[17]; // @[DES_EncryptionPipelinedElasticBuffer.scala 205:88]
  wire  hi_hi_lo_lo_hi = reversed[9]; // @[DES_EncryptionPipelinedElasticBuffer.scala 205:101]
  wire  hi_hi_lo_lo_lo = reversed[1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 205:113]
  wire  hi_lo_hi_hi_hi = reversed[59]; // @[DES_EncryptionPipelinedElasticBuffer.scala 206:13]
  wire  hi_lo_hi_hi_lo = reversed[51]; // @[DES_EncryptionPipelinedElasticBuffer.scala 206:26]
  wire  hi_lo_hi_lo_hi = reversed[43]; // @[DES_EncryptionPipelinedElasticBuffer.scala 206:39]
  wire  hi_lo_hi_lo_lo = reversed[35]; // @[DES_EncryptionPipelinedElasticBuffer.scala 206:52]
  wire  hi_lo_lo_hi_hi = reversed[27]; // @[DES_EncryptionPipelinedElasticBuffer.scala 206:65]
  wire  hi_lo_lo_hi_lo = reversed[19]; // @[DES_EncryptionPipelinedElasticBuffer.scala 206:78]
  wire  hi_lo_lo_lo_hi = reversed[11]; // @[DES_EncryptionPipelinedElasticBuffer.scala 206:91]
  wire  hi_lo_lo_lo_lo = reversed[3]; // @[DES_EncryptionPipelinedElasticBuffer.scala 206:104]
  wire  lo_hi_hi_hi_hi = reversed[61]; // @[DES_EncryptionPipelinedElasticBuffer.scala 207:13]
  wire  lo_hi_hi_hi_lo = reversed[53]; // @[DES_EncryptionPipelinedElasticBuffer.scala 207:26]
  wire  lo_hi_hi_lo_hi = reversed[45]; // @[DES_EncryptionPipelinedElasticBuffer.scala 207:39]
  wire  lo_hi_hi_lo_lo = reversed[37]; // @[DES_EncryptionPipelinedElasticBuffer.scala 207:52]
  wire  lo_hi_lo_hi_hi = reversed[29]; // @[DES_EncryptionPipelinedElasticBuffer.scala 207:65]
  wire  lo_hi_lo_hi_lo = reversed[21]; // @[DES_EncryptionPipelinedElasticBuffer.scala 207:78]
  wire  lo_hi_lo_lo_hi = reversed[13]; // @[DES_EncryptionPipelinedElasticBuffer.scala 207:91]
  wire  lo_hi_lo_lo_lo = reversed[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 207:104]
  wire  lo_lo_hi_hi_hi = reversed[63]; // @[DES_EncryptionPipelinedElasticBuffer.scala 208:13]
  wire  lo_lo_hi_hi_lo = reversed[55]; // @[DES_EncryptionPipelinedElasticBuffer.scala 208:26]
  wire  lo_lo_hi_lo_hi = reversed[47]; // @[DES_EncryptionPipelinedElasticBuffer.scala 208:39]
  wire  lo_lo_hi_lo_lo = reversed[39]; // @[DES_EncryptionPipelinedElasticBuffer.scala 208:52]
  wire  lo_lo_lo_hi_hi = reversed[31]; // @[DES_EncryptionPipelinedElasticBuffer.scala 208:65]
  wire  lo_lo_lo_hi_lo = reversed[23]; // @[DES_EncryptionPipelinedElasticBuffer.scala 208:78]
  wire  lo_lo_lo_lo_hi = reversed[15]; // @[DES_EncryptionPipelinedElasticBuffer.scala 208:91]
  wire  lo_lo_lo_lo_lo = reversed[7]; // @[DES_EncryptionPipelinedElasticBuffer.scala 208:104]
  wire [7:0] lo_lo = {lo_lo_hi_hi_hi,lo_lo_hi_hi_lo,lo_lo_hi_lo_hi,lo_lo_hi_lo_lo,lo_lo_lo_hi_hi,lo_lo_lo_hi_lo,
    lo_lo_lo_lo_hi,lo_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [15:0] lo = {lo_hi_hi_hi_hi,lo_hi_hi_hi_lo,lo_hi_hi_lo_hi,lo_hi_hi_lo_lo,lo_hi_lo_hi_hi,lo_hi_lo_hi_lo,
    lo_hi_lo_lo_hi,lo_hi_lo_lo_lo,lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] hi_lo = {hi_lo_hi_hi_hi,hi_lo_hi_hi_lo,hi_lo_hi_lo_hi,hi_lo_hi_lo_lo,hi_lo_lo_hi_hi,hi_lo_lo_hi_lo,
    hi_lo_lo_lo_hi,hi_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [15:0] hi = {hi_hi_hi_hi_hi,hi_hi_hi_hi_lo,hi_hi_hi_lo_hi,hi_hi_hi_lo_lo,hi_hi_lo_hi_hi,hi_hi_lo_hi_lo,
    hi_hi_lo_lo_hi,hi_hi_lo_lo_lo,hi_lo}; // @[Cat.scala 30:58]
  wire  hi_hi_hi_hi_hi_1 = reversed[56]; // @[DES_EncryptionPipelinedElasticBuffer.scala 210:23]
  wire  hi_hi_hi_hi_lo_1 = reversed[48]; // @[DES_EncryptionPipelinedElasticBuffer.scala 210:36]
  wire  hi_hi_hi_lo_hi_1 = reversed[40]; // @[DES_EncryptionPipelinedElasticBuffer.scala 210:49]
  wire  hi_hi_hi_lo_lo_1 = reversed[32]; // @[DES_EncryptionPipelinedElasticBuffer.scala 210:62]
  wire  hi_hi_lo_hi_hi_1 = reversed[24]; // @[DES_EncryptionPipelinedElasticBuffer.scala 210:75]
  wire  hi_hi_lo_hi_lo_1 = reversed[16]; // @[DES_EncryptionPipelinedElasticBuffer.scala 210:88]
  wire  hi_hi_lo_lo_hi_1 = reversed[8]; // @[DES_EncryptionPipelinedElasticBuffer.scala 210:101]
  wire  hi_hi_lo_lo_lo_1 = reversed[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 210:113]
  wire  hi_lo_hi_hi_hi_1 = reversed[58]; // @[DES_EncryptionPipelinedElasticBuffer.scala 211:13]
  wire  hi_lo_hi_hi_lo_1 = reversed[50]; // @[DES_EncryptionPipelinedElasticBuffer.scala 211:26]
  wire  hi_lo_hi_lo_hi_1 = reversed[42]; // @[DES_EncryptionPipelinedElasticBuffer.scala 211:39]
  wire  hi_lo_hi_lo_lo_1 = reversed[34]; // @[DES_EncryptionPipelinedElasticBuffer.scala 211:52]
  wire  hi_lo_lo_hi_hi_1 = reversed[26]; // @[DES_EncryptionPipelinedElasticBuffer.scala 211:65]
  wire  hi_lo_lo_hi_lo_1 = reversed[18]; // @[DES_EncryptionPipelinedElasticBuffer.scala 211:78]
  wire  hi_lo_lo_lo_hi_1 = reversed[10]; // @[DES_EncryptionPipelinedElasticBuffer.scala 211:91]
  wire  hi_lo_lo_lo_lo_1 = reversed[2]; // @[DES_EncryptionPipelinedElasticBuffer.scala 211:104]
  wire  lo_hi_hi_hi_hi_1 = reversed[60]; // @[DES_EncryptionPipelinedElasticBuffer.scala 212:13]
  wire  lo_hi_hi_hi_lo_1 = reversed[52]; // @[DES_EncryptionPipelinedElasticBuffer.scala 212:26]
  wire  lo_hi_hi_lo_hi_1 = reversed[44]; // @[DES_EncryptionPipelinedElasticBuffer.scala 212:39]
  wire  lo_hi_hi_lo_lo_1 = reversed[36]; // @[DES_EncryptionPipelinedElasticBuffer.scala 212:52]
  wire  lo_hi_lo_hi_hi_1 = reversed[28]; // @[DES_EncryptionPipelinedElasticBuffer.scala 212:65]
  wire  lo_hi_lo_hi_lo_1 = reversed[20]; // @[DES_EncryptionPipelinedElasticBuffer.scala 212:78]
  wire  lo_hi_lo_lo_hi_1 = reversed[12]; // @[DES_EncryptionPipelinedElasticBuffer.scala 212:91]
  wire  lo_hi_lo_lo_lo_1 = reversed[4]; // @[DES_EncryptionPipelinedElasticBuffer.scala 212:104]
  wire  lo_lo_hi_hi_hi_1 = reversed[62]; // @[DES_EncryptionPipelinedElasticBuffer.scala 213:13]
  wire  lo_lo_hi_hi_lo_1 = reversed[54]; // @[DES_EncryptionPipelinedElasticBuffer.scala 213:26]
  wire  lo_lo_hi_lo_hi_1 = reversed[46]; // @[DES_EncryptionPipelinedElasticBuffer.scala 213:39]
  wire  lo_lo_hi_lo_lo_1 = reversed[38]; // @[DES_EncryptionPipelinedElasticBuffer.scala 213:52]
  wire  lo_lo_lo_hi_hi_1 = reversed[30]; // @[DES_EncryptionPipelinedElasticBuffer.scala 213:65]
  wire  lo_lo_lo_hi_lo_1 = reversed[22]; // @[DES_EncryptionPipelinedElasticBuffer.scala 213:78]
  wire  lo_lo_lo_lo_hi_1 = reversed[14]; // @[DES_EncryptionPipelinedElasticBuffer.scala 213:91]
  wire  lo_lo_lo_lo_lo_1 = reversed[6]; // @[DES_EncryptionPipelinedElasticBuffer.scala 213:104]
  wire [7:0] lo_lo_1 = {lo_lo_hi_hi_hi_1,lo_lo_hi_hi_lo_1,lo_lo_hi_lo_hi_1,lo_lo_hi_lo_lo_1,lo_lo_lo_hi_hi_1,
    lo_lo_lo_hi_lo_1,lo_lo_lo_lo_hi_1,lo_lo_lo_lo_lo_1}; // @[Cat.scala 30:58]
  wire [15:0] lo_1 = {lo_hi_hi_hi_hi_1,lo_hi_hi_hi_lo_1,lo_hi_hi_lo_hi_1,lo_hi_hi_lo_lo_1,lo_hi_lo_hi_hi_1,
    lo_hi_lo_hi_lo_1,lo_hi_lo_lo_hi_1,lo_hi_lo_lo_lo_1,lo_lo_1}; // @[Cat.scala 30:58]
  wire [7:0] hi_lo_1 = {hi_lo_hi_hi_hi_1,hi_lo_hi_hi_lo_1,hi_lo_hi_lo_hi_1,hi_lo_hi_lo_lo_1,hi_lo_lo_hi_hi_1,
    hi_lo_lo_hi_lo_1,hi_lo_lo_lo_hi_1,hi_lo_lo_lo_lo_1}; // @[Cat.scala 30:58]
  wire [15:0] hi_1 = {hi_hi_hi_hi_hi_1,hi_hi_hi_hi_lo_1,hi_hi_hi_lo_hi_1,hi_hi_hi_lo_lo_1,hi_hi_lo_hi_hi_1,
    hi_hi_lo_hi_lo_1,hi_hi_lo_lo_hi_1,hi_hi_lo_lo_lo_1,hi_lo_1}; // @[Cat.scala 30:58]
  assign io_L = {hi,lo}; // @[Cat.scala 30:58]
  assign io_R = {hi_1,lo_1}; // @[Cat.scala 30:58]
endmodule
module PC_1(
  input  [63:0] io_key,
  output [27:0] io_C,
  output [27:0] io_D
);
  wire [63:0] _T_3 = {{32'd0}, io_key[63:32]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_5 = {io_key[31:0], 32'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_7 = _T_5 & 64'hffffffff00000000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_8 = _T_3 | _T_7; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_0 = {{16'd0}, _T_8[63:16]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_13 = _GEN_0 & 64'hffff0000ffff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_15 = {_T_8[47:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_17 = _T_15 & 64'hffff0000ffff0000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_18 = _T_13 | _T_17; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_1 = {{8'd0}, _T_18[63:8]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_23 = _GEN_1 & 64'hff00ff00ff00ff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_25 = {_T_18[55:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_27 = _T_25 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 103:75]
  wire [63:0] _T_28 = _T_23 | _T_27; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_2 = {{4'd0}, _T_28[63:4]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_33 = _GEN_2 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 103:31]
  wire [63:0] _T_35 = {_T_28[59:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_37 = _T_35 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 103:75]
  wire [63:0] _T_38 = _T_33 | _T_37; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_3 = {{2'd0}, _T_38[63:2]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_43 = _GEN_3 & 64'h3333333333333333; // @[Bitwise.scala 103:31]
  wire [63:0] _T_45 = {_T_38[61:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_47 = _T_45 & 64'hcccccccccccccccc; // @[Bitwise.scala 103:75]
  wire [63:0] _T_48 = _T_43 | _T_47; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_4 = {{1'd0}, _T_48[63:1]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_53 = _GEN_4 & 64'h5555555555555555; // @[Bitwise.scala 103:31]
  wire [63:0] _T_55 = {_T_48[62:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_57 = _T_55 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] reversed = _T_53 | _T_57; // @[Bitwise.scala 103:39]
  wire  hi_hi_hi_hi_hi = reversed[56]; // @[DES_EncryptionPipelinedElasticBuffer.scala 226:23]
  wire  hi_hi_hi_hi_lo = reversed[48]; // @[DES_EncryptionPipelinedElasticBuffer.scala 226:36]
  wire  hi_hi_hi_lo_hi = reversed[40]; // @[DES_EncryptionPipelinedElasticBuffer.scala 226:49]
  wire  hi_hi_hi_lo_lo = reversed[32]; // @[DES_EncryptionPipelinedElasticBuffer.scala 226:62]
  wire  hi_hi_lo_hi_hi = reversed[24]; // @[DES_EncryptionPipelinedElasticBuffer.scala 226:75]
  wire  hi_hi_lo_hi_lo = reversed[16]; // @[DES_EncryptionPipelinedElasticBuffer.scala 226:88]
  wire  hi_hi_lo_lo = reversed[8]; // @[DES_EncryptionPipelinedElasticBuffer.scala 226:101]
  wire  hi_lo_hi_hi_hi = reversed[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 227:13]
  wire  hi_lo_hi_hi_lo = reversed[57]; // @[DES_EncryptionPipelinedElasticBuffer.scala 227:25]
  wire  hi_lo_hi_lo_hi = reversed[49]; // @[DES_EncryptionPipelinedElasticBuffer.scala 227:38]
  wire  hi_lo_hi_lo_lo = reversed[41]; // @[DES_EncryptionPipelinedElasticBuffer.scala 227:51]
  wire  hi_lo_lo_hi_hi = reversed[33]; // @[DES_EncryptionPipelinedElasticBuffer.scala 227:64]
  wire  hi_lo_lo_hi_lo = reversed[25]; // @[DES_EncryptionPipelinedElasticBuffer.scala 227:77]
  wire  hi_lo_lo_lo = reversed[17]; // @[DES_EncryptionPipelinedElasticBuffer.scala 227:90]
  wire  lo_hi_hi_hi_hi = reversed[9]; // @[DES_EncryptionPipelinedElasticBuffer.scala 228:13]
  wire  lo_hi_hi_hi_lo = reversed[1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 228:25]
  wire  lo_hi_hi_lo_hi = reversed[58]; // @[DES_EncryptionPipelinedElasticBuffer.scala 228:37]
  wire  lo_hi_hi_lo_lo = reversed[50]; // @[DES_EncryptionPipelinedElasticBuffer.scala 228:50]
  wire  lo_hi_lo_hi_hi = reversed[42]; // @[DES_EncryptionPipelinedElasticBuffer.scala 228:63]
  wire  lo_hi_lo_hi_lo = reversed[34]; // @[DES_EncryptionPipelinedElasticBuffer.scala 228:76]
  wire  lo_hi_lo_lo = reversed[26]; // @[DES_EncryptionPipelinedElasticBuffer.scala 228:89]
  wire  lo_lo_hi_hi_hi = reversed[18]; // @[DES_EncryptionPipelinedElasticBuffer.scala 229:13]
  wire  lo_lo_hi_hi_lo = reversed[10]; // @[DES_EncryptionPipelinedElasticBuffer.scala 229:26]
  wire  lo_lo_hi_lo_hi = reversed[2]; // @[DES_EncryptionPipelinedElasticBuffer.scala 229:39]
  wire  lo_lo_hi_lo_lo = reversed[59]; // @[DES_EncryptionPipelinedElasticBuffer.scala 229:51]
  wire  lo_lo_lo_hi_hi = reversed[51]; // @[DES_EncryptionPipelinedElasticBuffer.scala 229:64]
  wire  lo_lo_lo_hi_lo = reversed[43]; // @[DES_EncryptionPipelinedElasticBuffer.scala 229:77]
  wire  lo_lo_lo_lo = reversed[35]; // @[DES_EncryptionPipelinedElasticBuffer.scala 229:90]
  wire [6:0] lo_lo = {lo_lo_hi_hi_hi,lo_lo_hi_hi_lo,lo_lo_hi_lo_hi,lo_lo_hi_lo_lo,lo_lo_lo_hi_hi,lo_lo_lo_hi_lo,
    lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [13:0] lo = {lo_hi_hi_hi_hi,lo_hi_hi_hi_lo,lo_hi_hi_lo_hi,lo_hi_hi_lo_lo,lo_hi_lo_hi_hi,lo_hi_lo_hi_lo,
    lo_hi_lo_lo,lo_lo}; // @[Cat.scala 30:58]
  wire [6:0] hi_lo = {hi_lo_hi_hi_hi,hi_lo_hi_hi_lo,hi_lo_hi_lo_hi,hi_lo_hi_lo_lo,hi_lo_lo_hi_hi,hi_lo_lo_hi_lo,
    hi_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [13:0] hi = {hi_hi_hi_hi_hi,hi_hi_hi_hi_lo,hi_hi_hi_lo_hi,hi_hi_hi_lo_lo,hi_hi_lo_hi_hi,hi_hi_lo_hi_lo,
    hi_hi_lo_lo,hi_lo}; // @[Cat.scala 30:58]
  wire  hi_hi_hi_hi_hi_1 = reversed[62]; // @[DES_EncryptionPipelinedElasticBuffer.scala 231:23]
  wire  hi_hi_hi_hi_lo_1 = reversed[54]; // @[DES_EncryptionPipelinedElasticBuffer.scala 231:36]
  wire  hi_hi_hi_lo_hi_1 = reversed[46]; // @[DES_EncryptionPipelinedElasticBuffer.scala 231:49]
  wire  hi_hi_hi_lo_lo_1 = reversed[38]; // @[DES_EncryptionPipelinedElasticBuffer.scala 231:62]
  wire  hi_hi_lo_hi_hi_1 = reversed[30]; // @[DES_EncryptionPipelinedElasticBuffer.scala 231:75]
  wire  hi_hi_lo_hi_lo_1 = reversed[22]; // @[DES_EncryptionPipelinedElasticBuffer.scala 231:88]
  wire  hi_hi_lo_lo_1 = reversed[14]; // @[DES_EncryptionPipelinedElasticBuffer.scala 231:101]
  wire  hi_lo_hi_hi_hi_1 = reversed[6]; // @[DES_EncryptionPipelinedElasticBuffer.scala 232:13]
  wire  hi_lo_hi_hi_lo_1 = reversed[61]; // @[DES_EncryptionPipelinedElasticBuffer.scala 232:25]
  wire  hi_lo_hi_lo_hi_1 = reversed[53]; // @[DES_EncryptionPipelinedElasticBuffer.scala 232:38]
  wire  hi_lo_hi_lo_lo_1 = reversed[45]; // @[DES_EncryptionPipelinedElasticBuffer.scala 232:51]
  wire  hi_lo_lo_hi_hi_1 = reversed[37]; // @[DES_EncryptionPipelinedElasticBuffer.scala 232:64]
  wire  hi_lo_lo_hi_lo_1 = reversed[29]; // @[DES_EncryptionPipelinedElasticBuffer.scala 232:77]
  wire  hi_lo_lo_lo_1 = reversed[21]; // @[DES_EncryptionPipelinedElasticBuffer.scala 232:90]
  wire  lo_hi_hi_hi_hi_1 = reversed[13]; // @[DES_EncryptionPipelinedElasticBuffer.scala 233:13]
  wire  lo_hi_hi_hi_lo_1 = reversed[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 233:26]
  wire  lo_hi_hi_lo_hi_1 = reversed[60]; // @[DES_EncryptionPipelinedElasticBuffer.scala 233:38]
  wire  lo_hi_hi_lo_lo_1 = reversed[52]; // @[DES_EncryptionPipelinedElasticBuffer.scala 233:51]
  wire  lo_hi_lo_hi_hi_1 = reversed[44]; // @[DES_EncryptionPipelinedElasticBuffer.scala 233:64]
  wire  lo_hi_lo_hi_lo_1 = reversed[36]; // @[DES_EncryptionPipelinedElasticBuffer.scala 233:77]
  wire  lo_hi_lo_lo_1 = reversed[28]; // @[DES_EncryptionPipelinedElasticBuffer.scala 233:90]
  wire  lo_lo_hi_hi_hi_1 = reversed[20]; // @[DES_EncryptionPipelinedElasticBuffer.scala 234:13]
  wire  lo_lo_hi_hi_lo_1 = reversed[12]; // @[DES_EncryptionPipelinedElasticBuffer.scala 234:26]
  wire  lo_lo_hi_lo_hi_1 = reversed[4]; // @[DES_EncryptionPipelinedElasticBuffer.scala 234:39]
  wire  lo_lo_hi_lo_lo_1 = reversed[27]; // @[DES_EncryptionPipelinedElasticBuffer.scala 234:51]
  wire  lo_lo_lo_hi_hi_1 = reversed[19]; // @[DES_EncryptionPipelinedElasticBuffer.scala 234:64]
  wire  lo_lo_lo_hi_lo_1 = reversed[11]; // @[DES_EncryptionPipelinedElasticBuffer.scala 234:77]
  wire  lo_lo_lo_lo_1 = reversed[3]; // @[DES_EncryptionPipelinedElasticBuffer.scala 234:90]
  wire [6:0] lo_lo_1 = {lo_lo_hi_hi_hi_1,lo_lo_hi_hi_lo_1,lo_lo_hi_lo_hi_1,lo_lo_hi_lo_lo_1,lo_lo_lo_hi_hi_1,
    lo_lo_lo_hi_lo_1,lo_lo_lo_lo_1}; // @[Cat.scala 30:58]
  wire [13:0] lo_1 = {lo_hi_hi_hi_hi_1,lo_hi_hi_hi_lo_1,lo_hi_hi_lo_hi_1,lo_hi_hi_lo_lo_1,lo_hi_lo_hi_hi_1,
    lo_hi_lo_hi_lo_1,lo_hi_lo_lo_1,lo_lo_1}; // @[Cat.scala 30:58]
  wire [6:0] hi_lo_1 = {hi_lo_hi_hi_hi_1,hi_lo_hi_hi_lo_1,hi_lo_hi_lo_hi_1,hi_lo_hi_lo_lo_1,hi_lo_lo_hi_hi_1,
    hi_lo_lo_hi_lo_1,hi_lo_lo_lo_1}; // @[Cat.scala 30:58]
  wire [13:0] hi_1 = {hi_hi_hi_hi_hi_1,hi_hi_hi_hi_lo_1,hi_hi_hi_lo_hi_1,hi_hi_hi_lo_lo_1,hi_hi_lo_hi_hi_1,
    hi_hi_lo_hi_lo_1,hi_hi_lo_lo_1,hi_lo_1}; // @[Cat.scala 30:58]
  assign io_C = {hi,lo}; // @[Cat.scala 30:58]
  assign io_D = {hi_1,lo_1}; // @[Cat.scala 30:58]
endmodule
module DES_InitialPermutation(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [63:0] io_in_bits_text,
  input  [63:0] io_in_bits_key,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_L,
  output [31:0] io_out_bits_R,
  output [27:0] io_out_bits_C,
  output [27:0] io_out_bits_D
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] IP_io_text; // @[DES_EncryptionPipelinedElasticBuffer.scala 90:18]
  wire [31:0] IP_io_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 90:18]
  wire [31:0] IP_io_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 90:18]
  wire [63:0] PC_1_io_key; // @[DES_EncryptionPipelinedElasticBuffer.scala 95:20]
  wire [27:0] PC_1_io_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 95:20]
  wire [27:0] PC_1_io_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 95:20]
  reg [63:0] data_0_text; // @[DES_EncryptionPipelinedElasticBuffer.scala 65:21]
  reg [63:0] data_0_key; // @[DES_EncryptionPipelinedElasticBuffer.scala 65:21]
  reg [63:0] data_1_text; // @[DES_EncryptionPipelinedElasticBuffer.scala 65:21]
  reg [63:0] data_1_key; // @[DES_EncryptionPipelinedElasticBuffer.scala 65:21]
  reg  head; // @[DES_EncryptionPipelinedElasticBuffer.scala 67:21]
  reg  tail; // @[DES_EncryptionPipelinedElasticBuffer.scala 68:21]
  reg  full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 69:21]
  reg  full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 69:21]
  wire  _GEN_5 = tail ? full_1 : full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 77:23 DES_EncryptionPipelinedElasticBuffer.scala 77:23]
  wire  _GEN_26 = ~tail; // @[DES_EncryptionPipelinedElasticBuffer.scala 78:16 DES_EncryptionPipelinedElasticBuffer.scala 78:16 DES_EncryptionPipelinedElasticBuffer.scala 69:21]
  wire  _GEN_6 = ~tail | full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 78:16 DES_EncryptionPipelinedElasticBuffer.scala 78:16 DES_EncryptionPipelinedElasticBuffer.scala 69:21]
  wire  _GEN_7 = tail | full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 78:16 DES_EncryptionPipelinedElasticBuffer.scala 78:16 DES_EncryptionPipelinedElasticBuffer.scala 69:21]
  wire  _GEN_12 = io_in_valid & ~_GEN_5 ? _GEN_6 : full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 77:36 DES_EncryptionPipelinedElasticBuffer.scala 69:21]
  wire  _GEN_13 = io_in_valid & ~_GEN_5 ? _GEN_7 : full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 77:36 DES_EncryptionPipelinedElasticBuffer.scala 69:21]
  wire  _GEN_20 = head ? full_1 : full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 84:21 DES_EncryptionPipelinedElasticBuffer.scala 84:21]
  IP IP ( // @[DES_EncryptionPipelinedElasticBuffer.scala 90:18]
    .io_text(IP_io_text),
    .io_L(IP_io_L),
    .io_R(IP_io_R)
  );
  PC_1 PC_1 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 95:20]
    .io_key(PC_1_io_key),
    .io_C(PC_1_io_C),
    .io_D(PC_1_io_D)
  );
  assign io_in_ready = ~(full_0 & full_1); // @[DES_EncryptionPipelinedElasticBuffer.scala 71:18]
  assign io_out_valid = full_0 | full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 72:27]
  assign io_out_bits_L = IP_io_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 63:20 DES_EncryptionPipelinedElasticBuffer.scala 92:12]
  assign io_out_bits_R = IP_io_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 63:20 DES_EncryptionPipelinedElasticBuffer.scala 93:12]
  assign io_out_bits_C = PC_1_io_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 63:20 DES_EncryptionPipelinedElasticBuffer.scala 97:12]
  assign io_out_bits_D = PC_1_io_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 63:20 DES_EncryptionPipelinedElasticBuffer.scala 98:12]
  assign IP_io_text = head ? data_1_text : data_0_text; // @[DES_EncryptionPipelinedElasticBuffer.scala 74:9 DES_EncryptionPipelinedElasticBuffer.scala 74:9]
  assign PC_1_io_key = head ? data_1_key : data_0_key; // @[DES_EncryptionPipelinedElasticBuffer.scala 74:9 DES_EncryptionPipelinedElasticBuffer.scala 74:9]
  always @(posedge clock) begin
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 65:21]
      data_0_text <= 64'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 65:21]
    end else if (io_in_valid & ~_GEN_5) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 77:36]
      if (~tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 79:16]
        data_0_text <= io_in_bits_text; // @[DES_EncryptionPipelinedElasticBuffer.scala 79:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 65:21]
      data_0_key <= 64'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 65:21]
    end else if (io_in_valid & ~_GEN_5) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 77:36]
      if (~tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 79:16]
        data_0_key <= io_in_bits_key; // @[DES_EncryptionPipelinedElasticBuffer.scala 79:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 65:21]
      data_1_text <= 64'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 65:21]
    end else if (io_in_valid & ~_GEN_5) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 77:36]
      if (tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 79:16]
        data_1_text <= io_in_bits_text; // @[DES_EncryptionPipelinedElasticBuffer.scala 79:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 65:21]
      data_1_key <= 64'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 65:21]
    end else if (io_in_valid & ~_GEN_5) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 77:36]
      if (tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 79:16]
        data_1_key <= io_in_bits_key; // @[DES_EncryptionPipelinedElasticBuffer.scala 79:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 67:21]
      head <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 67:21]
    end else if (io_out_ready & _GEN_20) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 84:36]
      head <= ~head; // @[DES_EncryptionPipelinedElasticBuffer.scala 86:10]
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 68:21]
      tail <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 68:21]
    end else if (io_in_valid & ~_GEN_5) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 77:36]
      tail <= _GEN_26; // @[DES_EncryptionPipelinedElasticBuffer.scala 80:10]
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 69:21]
      full_0 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 69:21]
    end else if (io_out_ready & _GEN_20) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 84:36]
      if (~head) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 85:16]
        full_0 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 85:16]
      end else begin
        full_0 <= _GEN_12;
      end
    end else begin
      full_0 <= _GEN_12;
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 69:21]
      full_1 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 69:21]
    end else if (io_out_ready & _GEN_20) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 84:36]
      if (head) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 85:16]
        full_1 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 85:16]
      end else begin
        full_1 <= _GEN_13;
      end
    end else begin
      full_1 <= _GEN_13;
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
  _RAND_0 = {2{`RANDOM}};
  data_0_text = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  data_0_key = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  data_1_text = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  data_1_key = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  head = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  tail = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  full_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  full_1 = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DES_FinalPermutation(
  input         clock,
  input         reset,
  input         io_out_ready,
  output        io_out_valid,
  output [63:0] io_out_bits,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_L,
  input  [31:0] io_in_bits_R
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] data_0_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 157:21]
  reg [31:0] data_0_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 157:21]
  reg [31:0] data_1_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 157:21]
  reg [31:0] data_1_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 157:21]
  reg  head; // @[DES_EncryptionPipelinedElasticBuffer.scala 159:21]
  reg  tail; // @[DES_EncryptionPipelinedElasticBuffer.scala 160:21]
  reg  full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 161:21]
  reg  full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 161:21]
  wire [31:0] input_L = head ? data_1_L : data_0_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 166:9 DES_EncryptionPipelinedElasticBuffer.scala 166:9]
  wire [31:0] input_R = head ? data_1_R : data_0_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 166:9 DES_EncryptionPipelinedElasticBuffer.scala 166:9]
  wire  _GEN_5 = tail ? full_1 : full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 169:23 DES_EncryptionPipelinedElasticBuffer.scala 169:23]
  wire  _GEN_26 = ~tail; // @[DES_EncryptionPipelinedElasticBuffer.scala 170:16 DES_EncryptionPipelinedElasticBuffer.scala 170:16 DES_EncryptionPipelinedElasticBuffer.scala 161:21]
  wire  _GEN_6 = ~tail | full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 170:16 DES_EncryptionPipelinedElasticBuffer.scala 170:16 DES_EncryptionPipelinedElasticBuffer.scala 161:21]
  wire  _GEN_7 = tail | full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 170:16 DES_EncryptionPipelinedElasticBuffer.scala 170:16 DES_EncryptionPipelinedElasticBuffer.scala 161:21]
  wire  _GEN_12 = io_in_valid & ~_GEN_5 ? _GEN_6 : full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 169:36 DES_EncryptionPipelinedElasticBuffer.scala 161:21]
  wire  _GEN_13 = io_in_valid & ~_GEN_5 ? _GEN_7 : full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 169:36 DES_EncryptionPipelinedElasticBuffer.scala 161:21]
  wire  _GEN_20 = head ? full_1 : full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 176:21 DES_EncryptionPipelinedElasticBuffer.scala 176:21]
  wire [63:0] _T_8 = {input_R,input_L}; // @[Cat.scala 30:58]
  wire [63:0] _T_12 = {{32'd0}, _T_8[63:32]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_14 = {_T_8[31:0], 32'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_16 = _T_14 & 64'hffffffff00000000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_17 = _T_12 | _T_16; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_27 = {{16'd0}, _T_17[63:16]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_22 = _GEN_27 & 64'hffff0000ffff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_24 = {_T_17[47:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_26 = _T_24 & 64'hffff0000ffff0000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_27 = _T_22 | _T_26; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_28 = {{8'd0}, _T_27[63:8]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_32 = _GEN_28 & 64'hff00ff00ff00ff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_34 = {_T_27[55:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_36 = _T_34 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 103:75]
  wire [63:0] _T_37 = _T_32 | _T_36; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_29 = {{4'd0}, _T_37[63:4]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_42 = _GEN_29 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 103:31]
  wire [63:0] _T_44 = {_T_37[59:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_46 = _T_44 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 103:75]
  wire [63:0] _T_47 = _T_42 | _T_46; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_30 = {{2'd0}, _T_47[63:2]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_52 = _GEN_30 & 64'h3333333333333333; // @[Bitwise.scala 103:31]
  wire [63:0] _T_54 = {_T_47[61:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_56 = _T_54 & 64'hcccccccccccccccc; // @[Bitwise.scala 103:75]
  wire [63:0] _T_57 = _T_52 | _T_56; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_31 = {{1'd0}, _T_57[63:1]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_62 = _GEN_31 & 64'h5555555555555555; // @[Bitwise.scala 103:31]
  wire [63:0] _T_64 = {_T_57[62:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_66 = _T_64 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] concat = _T_62 | _T_66; // @[Bitwise.scala 103:39]
  wire  hi_hi_hi_hi_hi_hi = concat[39]; // @[DES_EncryptionPipelinedElasticBuffer.scala 185:23]
  wire  hi_hi_hi_hi_hi_lo = concat[7]; // @[DES_EncryptionPipelinedElasticBuffer.scala 185:34]
  wire  hi_hi_hi_hi_lo_hi = concat[47]; // @[DES_EncryptionPipelinedElasticBuffer.scala 185:44]
  wire  hi_hi_hi_hi_lo_lo = concat[15]; // @[DES_EncryptionPipelinedElasticBuffer.scala 185:55]
  wire  hi_hi_hi_lo_hi_hi = concat[55]; // @[DES_EncryptionPipelinedElasticBuffer.scala 185:66]
  wire  hi_hi_hi_lo_hi_lo = concat[23]; // @[DES_EncryptionPipelinedElasticBuffer.scala 185:77]
  wire  hi_hi_hi_lo_lo_hi = concat[63]; // @[DES_EncryptionPipelinedElasticBuffer.scala 185:88]
  wire  hi_hi_hi_lo_lo_lo = concat[31]; // @[DES_EncryptionPipelinedElasticBuffer.scala 185:99]
  wire  hi_hi_lo_hi_hi_hi = concat[38]; // @[DES_EncryptionPipelinedElasticBuffer.scala 186:11]
  wire  hi_hi_lo_hi_hi_lo = concat[6]; // @[DES_EncryptionPipelinedElasticBuffer.scala 186:22]
  wire  hi_hi_lo_hi_lo_hi = concat[46]; // @[DES_EncryptionPipelinedElasticBuffer.scala 186:32]
  wire  hi_hi_lo_hi_lo_lo = concat[14]; // @[DES_EncryptionPipelinedElasticBuffer.scala 186:43]
  wire  hi_hi_lo_lo_hi_hi = concat[54]; // @[DES_EncryptionPipelinedElasticBuffer.scala 186:54]
  wire  hi_hi_lo_lo_hi_lo = concat[22]; // @[DES_EncryptionPipelinedElasticBuffer.scala 186:65]
  wire  hi_hi_lo_lo_lo_hi = concat[62]; // @[DES_EncryptionPipelinedElasticBuffer.scala 186:76]
  wire  hi_hi_lo_lo_lo_lo = concat[30]; // @[DES_EncryptionPipelinedElasticBuffer.scala 186:87]
  wire  hi_lo_hi_hi_hi_hi = concat[37]; // @[DES_EncryptionPipelinedElasticBuffer.scala 187:11]
  wire  hi_lo_hi_hi_hi_lo = concat[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 187:22]
  wire  hi_lo_hi_hi_lo_hi = concat[45]; // @[DES_EncryptionPipelinedElasticBuffer.scala 187:32]
  wire  hi_lo_hi_hi_lo_lo = concat[13]; // @[DES_EncryptionPipelinedElasticBuffer.scala 187:43]
  wire  hi_lo_hi_lo_hi_hi = concat[53]; // @[DES_EncryptionPipelinedElasticBuffer.scala 187:54]
  wire  hi_lo_hi_lo_hi_lo = concat[21]; // @[DES_EncryptionPipelinedElasticBuffer.scala 187:65]
  wire  hi_lo_hi_lo_lo_hi = concat[61]; // @[DES_EncryptionPipelinedElasticBuffer.scala 187:76]
  wire  hi_lo_hi_lo_lo_lo = concat[29]; // @[DES_EncryptionPipelinedElasticBuffer.scala 187:87]
  wire  hi_lo_lo_hi_hi_hi = concat[36]; // @[DES_EncryptionPipelinedElasticBuffer.scala 188:11]
  wire  hi_lo_lo_hi_hi_lo = concat[4]; // @[DES_EncryptionPipelinedElasticBuffer.scala 188:22]
  wire  hi_lo_lo_hi_lo_hi = concat[44]; // @[DES_EncryptionPipelinedElasticBuffer.scala 188:32]
  wire  hi_lo_lo_hi_lo_lo = concat[12]; // @[DES_EncryptionPipelinedElasticBuffer.scala 188:43]
  wire  hi_lo_lo_lo_hi_hi = concat[52]; // @[DES_EncryptionPipelinedElasticBuffer.scala 188:54]
  wire  hi_lo_lo_lo_hi_lo = concat[20]; // @[DES_EncryptionPipelinedElasticBuffer.scala 188:65]
  wire  hi_lo_lo_lo_lo_hi = concat[60]; // @[DES_EncryptionPipelinedElasticBuffer.scala 188:76]
  wire  hi_lo_lo_lo_lo_lo = concat[28]; // @[DES_EncryptionPipelinedElasticBuffer.scala 188:87]
  wire  lo_hi_hi_hi_hi_hi = concat[35]; // @[DES_EncryptionPipelinedElasticBuffer.scala 189:11]
  wire  lo_hi_hi_hi_hi_lo = concat[3]; // @[DES_EncryptionPipelinedElasticBuffer.scala 189:22]
  wire  lo_hi_hi_hi_lo_hi = concat[43]; // @[DES_EncryptionPipelinedElasticBuffer.scala 189:32]
  wire  lo_hi_hi_hi_lo_lo = concat[11]; // @[DES_EncryptionPipelinedElasticBuffer.scala 189:43]
  wire  lo_hi_hi_lo_hi_hi = concat[51]; // @[DES_EncryptionPipelinedElasticBuffer.scala 189:54]
  wire  lo_hi_hi_lo_hi_lo = concat[19]; // @[DES_EncryptionPipelinedElasticBuffer.scala 189:65]
  wire  lo_hi_hi_lo_lo_hi = concat[59]; // @[DES_EncryptionPipelinedElasticBuffer.scala 189:76]
  wire  lo_hi_hi_lo_lo_lo = concat[27]; // @[DES_EncryptionPipelinedElasticBuffer.scala 189:87]
  wire  lo_hi_lo_hi_hi_hi = concat[34]; // @[DES_EncryptionPipelinedElasticBuffer.scala 190:11]
  wire  lo_hi_lo_hi_hi_lo = concat[2]; // @[DES_EncryptionPipelinedElasticBuffer.scala 190:22]
  wire  lo_hi_lo_hi_lo_hi = concat[42]; // @[DES_EncryptionPipelinedElasticBuffer.scala 190:32]
  wire  lo_hi_lo_hi_lo_lo = concat[10]; // @[DES_EncryptionPipelinedElasticBuffer.scala 190:43]
  wire  lo_hi_lo_lo_hi_hi = concat[50]; // @[DES_EncryptionPipelinedElasticBuffer.scala 190:54]
  wire  lo_hi_lo_lo_hi_lo = concat[18]; // @[DES_EncryptionPipelinedElasticBuffer.scala 190:65]
  wire  lo_hi_lo_lo_lo_hi = concat[58]; // @[DES_EncryptionPipelinedElasticBuffer.scala 190:76]
  wire  lo_hi_lo_lo_lo_lo = concat[26]; // @[DES_EncryptionPipelinedElasticBuffer.scala 190:87]
  wire  lo_lo_hi_hi_hi_hi = concat[33]; // @[DES_EncryptionPipelinedElasticBuffer.scala 191:11]
  wire  lo_lo_hi_hi_hi_lo = concat[1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 191:22]
  wire  lo_lo_hi_hi_lo_hi = concat[41]; // @[DES_EncryptionPipelinedElasticBuffer.scala 191:32]
  wire  lo_lo_hi_hi_lo_lo = concat[9]; // @[DES_EncryptionPipelinedElasticBuffer.scala 191:43]
  wire  lo_lo_hi_lo_hi_hi = concat[49]; // @[DES_EncryptionPipelinedElasticBuffer.scala 191:53]
  wire  lo_lo_hi_lo_hi_lo = concat[17]; // @[DES_EncryptionPipelinedElasticBuffer.scala 191:64]
  wire  lo_lo_hi_lo_lo_hi = concat[57]; // @[DES_EncryptionPipelinedElasticBuffer.scala 191:75]
  wire  lo_lo_hi_lo_lo_lo = concat[25]; // @[DES_EncryptionPipelinedElasticBuffer.scala 191:86]
  wire  lo_lo_lo_hi_hi_hi = concat[32]; // @[DES_EncryptionPipelinedElasticBuffer.scala 192:11]
  wire  lo_lo_lo_hi_hi_lo = concat[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 192:22]
  wire  lo_lo_lo_hi_lo_hi = concat[40]; // @[DES_EncryptionPipelinedElasticBuffer.scala 192:32]
  wire  lo_lo_lo_hi_lo_lo = concat[8]; // @[DES_EncryptionPipelinedElasticBuffer.scala 192:43]
  wire  lo_lo_lo_lo_hi_hi = concat[48]; // @[DES_EncryptionPipelinedElasticBuffer.scala 192:53]
  wire  lo_lo_lo_lo_hi_lo = concat[16]; // @[DES_EncryptionPipelinedElasticBuffer.scala 192:64]
  wire  lo_lo_lo_lo_lo_hi = concat[56]; // @[DES_EncryptionPipelinedElasticBuffer.scala 192:75]
  wire  lo_lo_lo_lo_lo_lo = concat[24]; // @[DES_EncryptionPipelinedElasticBuffer.scala 192:86]
  wire [7:0] lo_lo_lo = {lo_lo_lo_hi_hi_hi,lo_lo_lo_hi_hi_lo,lo_lo_lo_hi_lo_hi,lo_lo_lo_hi_lo_lo,lo_lo_lo_lo_hi_hi,
    lo_lo_lo_lo_hi_lo,lo_lo_lo_lo_lo_hi,lo_lo_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [15:0] lo_lo = {lo_lo_hi_hi_hi_hi,lo_lo_hi_hi_hi_lo,lo_lo_hi_hi_lo_hi,lo_lo_hi_hi_lo_lo,lo_lo_hi_lo_hi_hi,
    lo_lo_hi_lo_hi_lo,lo_lo_hi_lo_lo_hi,lo_lo_hi_lo_lo_lo,lo_lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] lo_hi_lo = {lo_hi_lo_hi_hi_hi,lo_hi_lo_hi_hi_lo,lo_hi_lo_hi_lo_hi,lo_hi_lo_hi_lo_lo,lo_hi_lo_lo_hi_hi,
    lo_hi_lo_lo_hi_lo,lo_hi_lo_lo_lo_hi,lo_hi_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [31:0] lo = {lo_hi_hi_hi_hi_hi,lo_hi_hi_hi_hi_lo,lo_hi_hi_hi_lo_hi,lo_hi_hi_hi_lo_lo,lo_hi_hi_lo_hi_hi,
    lo_hi_hi_lo_hi_lo,lo_hi_hi_lo_lo_hi,lo_hi_hi_lo_lo_lo,lo_hi_lo,lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] hi_lo_lo = {hi_lo_lo_hi_hi_hi,hi_lo_lo_hi_hi_lo,hi_lo_lo_hi_lo_hi,hi_lo_lo_hi_lo_lo,hi_lo_lo_lo_hi_hi,
    hi_lo_lo_lo_hi_lo,hi_lo_lo_lo_lo_hi,hi_lo_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [15:0] hi_lo = {hi_lo_hi_hi_hi_hi,hi_lo_hi_hi_hi_lo,hi_lo_hi_hi_lo_hi,hi_lo_hi_hi_lo_lo,hi_lo_hi_lo_hi_hi,
    hi_lo_hi_lo_hi_lo,hi_lo_hi_lo_lo_hi,hi_lo_hi_lo_lo_lo,hi_lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] hi_hi_lo = {hi_hi_lo_hi_hi_hi,hi_hi_lo_hi_hi_lo,hi_hi_lo_hi_lo_hi,hi_hi_lo_hi_lo_lo,hi_hi_lo_lo_hi_hi,
    hi_hi_lo_lo_hi_lo,hi_hi_lo_lo_lo_hi,hi_hi_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [31:0] hi = {hi_hi_hi_hi_hi_hi,hi_hi_hi_hi_hi_lo,hi_hi_hi_hi_lo_hi,hi_hi_hi_hi_lo_lo,hi_hi_hi_lo_hi_hi,
    hi_hi_hi_lo_hi_lo,hi_hi_hi_lo_lo_hi,hi_hi_hi_lo_lo_lo,hi_hi_lo,hi_lo}; // @[Cat.scala 30:58]
  assign io_out_valid = full_0 | full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 164:27]
  assign io_out_bits = {hi,lo}; // @[Cat.scala 30:58]
  assign io_in_ready = ~(full_0 & full_1); // @[DES_EncryptionPipelinedElasticBuffer.scala 163:18]
  always @(posedge clock) begin
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 157:21]
      data_0_L <= 32'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 157:21]
    end else if (io_in_valid & ~_GEN_5) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 169:36]
      if (~tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 171:16]
        data_0_L <= io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 171:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 157:21]
      data_0_R <= 32'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 157:21]
    end else if (io_in_valid & ~_GEN_5) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 169:36]
      if (~tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 171:16]
        data_0_R <= io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 171:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 157:21]
      data_1_L <= 32'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 157:21]
    end else if (io_in_valid & ~_GEN_5) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 169:36]
      if (tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 171:16]
        data_1_L <= io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 171:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 157:21]
      data_1_R <= 32'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 157:21]
    end else if (io_in_valid & ~_GEN_5) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 169:36]
      if (tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 171:16]
        data_1_R <= io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 171:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 159:21]
      head <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 159:21]
    end else if (io_out_ready & _GEN_20) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 176:36]
      head <= ~head; // @[DES_EncryptionPipelinedElasticBuffer.scala 178:10]
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 160:21]
      tail <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 160:21]
    end else if (io_in_valid & ~_GEN_5) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 169:36]
      tail <= _GEN_26; // @[DES_EncryptionPipelinedElasticBuffer.scala 172:10]
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 161:21]
      full_0 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 161:21]
    end else if (io_out_ready & _GEN_20) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 176:36]
      if (~head) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 177:16]
        full_0 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 177:16]
      end else begin
        full_0 <= _GEN_12;
      end
    end else begin
      full_0 <= _GEN_12;
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 161:21]
      full_1 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 161:21]
    end else if (io_out_ready & _GEN_20) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 176:36]
      if (head) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 177:16]
        full_1 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 177:16]
      end else begin
        full_1 <= _GEN_13;
      end
    end else begin
      full_1 <= _GEN_13;
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
  data_0_L = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  data_0_R = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  data_1_L = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  data_1_R = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  head = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  tail = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  full_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  full_1 = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DES_keys(
  input  [27:0] io_C,
  input  [27:0] io_D,
  output [27:0] io_C_next,
  output [27:0] io_D_next,
  output [47:0] io_K
);
  wire [26:0] hi = io_C[26:0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 270:26]
  wire  lo = io_C[27]; // @[DES_EncryptionPipelinedElasticBuffer.scala 270:37]
  wire [26:0] hi_1 = io_D[26:0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 271:26]
  wire  lo_1 = io_D[27]; // @[DES_EncryptionPipelinedElasticBuffer.scala 271:37]
  wire [55:0] _T_2 = {hi,lo,hi_1,lo_1}; // @[Cat.scala 30:58]
  wire [31:0] _T_7 = {{16'd0}, _T_2[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_9 = {_T_2[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_11 = _T_9 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_12 = _T_7 | _T_11; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_0 = {{8'd0}, _T_12[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_17 = _GEN_0 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_19 = {_T_12[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_21 = _T_19 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_22 = _T_17 | _T_21; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_1 = {{4'd0}, _T_22[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_27 = _GEN_1 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_29 = {_T_22[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_31 = _T_29 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_32 = _T_27 | _T_31; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_2 = {{2'd0}, _T_32[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_37 = _GEN_2 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_39 = {_T_32[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_41 = _T_39 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_42 = _T_37 | _T_41; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_3 = {{1'd0}, _T_42[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_47 = _GEN_3 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_49 = {_T_42[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_51 = _T_49 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [31:0] hi_2 = _T_47 | _T_51; // @[Bitwise.scala 103:39]
  wire [15:0] _T_57 = {{8'd0}, _T_2[47:40]}; // @[Bitwise.scala 103:31]
  wire [15:0] _T_59 = {_T_2[39:32], 8'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _T_61 = _T_59 & 16'hff00; // @[Bitwise.scala 103:75]
  wire [15:0] _T_62 = _T_57 | _T_61; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_4 = {{4'd0}, _T_62[15:4]}; // @[Bitwise.scala 103:31]
  wire [15:0] _T_67 = _GEN_4 & 16'hf0f; // @[Bitwise.scala 103:31]
  wire [15:0] _T_69 = {_T_62[11:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _T_71 = _T_69 & 16'hf0f0; // @[Bitwise.scala 103:75]
  wire [15:0] _T_72 = _T_67 | _T_71; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_5 = {{2'd0}, _T_72[15:2]}; // @[Bitwise.scala 103:31]
  wire [15:0] _T_77 = _GEN_5 & 16'h3333; // @[Bitwise.scala 103:31]
  wire [15:0] _T_79 = {_T_72[13:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _T_81 = _T_79 & 16'hcccc; // @[Bitwise.scala 103:75]
  wire [15:0] _T_82 = _T_77 | _T_81; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_6 = {{1'd0}, _T_82[15:1]}; // @[Bitwise.scala 103:31]
  wire [15:0] _T_87 = _GEN_6 & 16'h5555; // @[Bitwise.scala 103:31]
  wire [15:0] _T_89 = {_T_82[14:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _T_91 = _T_89 & 16'haaaa; // @[Bitwise.scala 103:75]
  wire [15:0] hi_3 = _T_87 | _T_91; // @[Bitwise.scala 103:39]
  wire [7:0] _T_96 = {{4'd0}, _T_2[55:52]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_98 = {_T_2[51:48], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_100 = _T_98 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_101 = _T_96 | _T_100; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_7 = {{2'd0}, _T_101[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_106 = _GEN_7 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_108 = {_T_101[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_110 = _T_108 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_111 = _T_106 | _T_110; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_8 = {{1'd0}, _T_111[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_116 = _GEN_8 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_118 = {_T_111[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_120 = _T_118 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] lo_2 = _T_116 | _T_120; // @[Bitwise.scala 103:39]
  wire [55:0] concat = {hi_2,hi_3,lo_2}; // @[Cat.scala 30:58]
  wire  hi_hi_hi_hi_hi_hi = concat[13]; // @[DES_EncryptionPipelinedElasticBuffer.scala 281:21]
  wire  hi_hi_hi_hi_hi_lo = concat[16]; // @[DES_EncryptionPipelinedElasticBuffer.scala 281:32]
  wire  hi_hi_hi_hi_lo = concat[10]; // @[DES_EncryptionPipelinedElasticBuffer.scala 281:43]
  wire  hi_hi_hi_lo_hi_hi = concat[23]; // @[DES_EncryptionPipelinedElasticBuffer.scala 281:54]
  wire  hi_hi_hi_lo_hi_lo = concat[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 281:65]
  wire  hi_hi_hi_lo_lo = concat[4]; // @[DES_EncryptionPipelinedElasticBuffer.scala 281:75]
  wire  hi_hi_lo_hi_hi_hi = concat[2]; // @[DES_EncryptionPipelinedElasticBuffer.scala 282:11]
  wire  hi_hi_lo_hi_hi_lo = concat[27]; // @[DES_EncryptionPipelinedElasticBuffer.scala 282:21]
  wire  hi_hi_lo_hi_lo = concat[14]; // @[DES_EncryptionPipelinedElasticBuffer.scala 282:32]
  wire  hi_hi_lo_lo_hi_hi = concat[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 282:43]
  wire  hi_hi_lo_lo_hi_lo = concat[20]; // @[DES_EncryptionPipelinedElasticBuffer.scala 282:53]
  wire  hi_hi_lo_lo_lo = concat[9]; // @[DES_EncryptionPipelinedElasticBuffer.scala 282:64]
  wire  hi_lo_hi_hi_hi_hi = concat[22]; // @[DES_EncryptionPipelinedElasticBuffer.scala 283:11]
  wire  hi_lo_hi_hi_hi_lo = concat[18]; // @[DES_EncryptionPipelinedElasticBuffer.scala 283:22]
  wire  hi_lo_hi_hi_lo = concat[11]; // @[DES_EncryptionPipelinedElasticBuffer.scala 283:33]
  wire  hi_lo_hi_lo_hi_hi = concat[3]; // @[DES_EncryptionPipelinedElasticBuffer.scala 283:44]
  wire  hi_lo_hi_lo_hi_lo = concat[25]; // @[DES_EncryptionPipelinedElasticBuffer.scala 283:54]
  wire  hi_lo_hi_lo_lo = concat[7]; // @[DES_EncryptionPipelinedElasticBuffer.scala 283:65]
  wire  hi_lo_lo_hi_hi_hi = concat[15]; // @[DES_EncryptionPipelinedElasticBuffer.scala 284:11]
  wire  hi_lo_lo_hi_hi_lo = concat[6]; // @[DES_EncryptionPipelinedElasticBuffer.scala 284:22]
  wire  hi_lo_lo_hi_lo = concat[26]; // @[DES_EncryptionPipelinedElasticBuffer.scala 284:32]
  wire  hi_lo_lo_lo_hi_hi = concat[19]; // @[DES_EncryptionPipelinedElasticBuffer.scala 284:43]
  wire  hi_lo_lo_lo_hi_lo = concat[12]; // @[DES_EncryptionPipelinedElasticBuffer.scala 284:54]
  wire  hi_lo_lo_lo_lo = concat[1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 284:65]
  wire  lo_hi_hi_hi_hi_hi = concat[40]; // @[DES_EncryptionPipelinedElasticBuffer.scala 285:11]
  wire  lo_hi_hi_hi_hi_lo = concat[51]; // @[DES_EncryptionPipelinedElasticBuffer.scala 285:22]
  wire  lo_hi_hi_hi_lo = concat[30]; // @[DES_EncryptionPipelinedElasticBuffer.scala 285:33]
  wire  lo_hi_hi_lo_hi_hi = concat[36]; // @[DES_EncryptionPipelinedElasticBuffer.scala 285:44]
  wire  lo_hi_hi_lo_hi_lo = concat[46]; // @[DES_EncryptionPipelinedElasticBuffer.scala 285:55]
  wire  lo_hi_hi_lo_lo = concat[54]; // @[DES_EncryptionPipelinedElasticBuffer.scala 285:66]
  wire  lo_hi_lo_hi_hi_hi = concat[29]; // @[DES_EncryptionPipelinedElasticBuffer.scala 286:11]
  wire  lo_hi_lo_hi_hi_lo = concat[39]; // @[DES_EncryptionPipelinedElasticBuffer.scala 286:22]
  wire  lo_hi_lo_hi_lo = concat[50]; // @[DES_EncryptionPipelinedElasticBuffer.scala 286:33]
  wire  lo_hi_lo_lo_hi_hi = concat[44]; // @[DES_EncryptionPipelinedElasticBuffer.scala 286:44]
  wire  lo_hi_lo_lo_hi_lo = concat[32]; // @[DES_EncryptionPipelinedElasticBuffer.scala 286:55]
  wire  lo_hi_lo_lo_lo = concat[47]; // @[DES_EncryptionPipelinedElasticBuffer.scala 286:66]
  wire  lo_lo_hi_hi_hi_hi = concat[43]; // @[DES_EncryptionPipelinedElasticBuffer.scala 287:11]
  wire  lo_lo_hi_hi_hi_lo = concat[48]; // @[DES_EncryptionPipelinedElasticBuffer.scala 287:22]
  wire  lo_lo_hi_hi_lo = concat[38]; // @[DES_EncryptionPipelinedElasticBuffer.scala 287:33]
  wire  lo_lo_hi_lo_hi_hi = concat[55]; // @[DES_EncryptionPipelinedElasticBuffer.scala 287:44]
  wire  lo_lo_hi_lo_hi_lo = concat[33]; // @[DES_EncryptionPipelinedElasticBuffer.scala 287:55]
  wire  lo_lo_hi_lo_lo = concat[52]; // @[DES_EncryptionPipelinedElasticBuffer.scala 287:66]
  wire  lo_lo_lo_hi_hi_hi = concat[45]; // @[DES_EncryptionPipelinedElasticBuffer.scala 288:11]
  wire  lo_lo_lo_hi_hi_lo = concat[41]; // @[DES_EncryptionPipelinedElasticBuffer.scala 288:22]
  wire  lo_lo_lo_hi_lo = concat[49]; // @[DES_EncryptionPipelinedElasticBuffer.scala 288:33]
  wire  lo_lo_lo_lo_hi_hi = concat[35]; // @[DES_EncryptionPipelinedElasticBuffer.scala 288:44]
  wire  lo_lo_lo_lo_hi_lo = concat[28]; // @[DES_EncryptionPipelinedElasticBuffer.scala 288:55]
  wire  lo_lo_lo_lo_lo = concat[31]; // @[DES_EncryptionPipelinedElasticBuffer.scala 288:66]
  wire [5:0] lo_lo_lo = {lo_lo_lo_hi_hi_hi,lo_lo_lo_hi_hi_lo,lo_lo_lo_hi_lo,lo_lo_lo_lo_hi_hi,lo_lo_lo_lo_hi_lo,
    lo_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [11:0] lo_lo = {lo_lo_hi_hi_hi_hi,lo_lo_hi_hi_hi_lo,lo_lo_hi_hi_lo,lo_lo_hi_lo_hi_hi,lo_lo_hi_lo_hi_lo,
    lo_lo_hi_lo_lo,lo_lo_lo}; // @[Cat.scala 30:58]
  wire [5:0] lo_hi_lo = {lo_hi_lo_hi_hi_hi,lo_hi_lo_hi_hi_lo,lo_hi_lo_hi_lo,lo_hi_lo_lo_hi_hi,lo_hi_lo_lo_hi_lo,
    lo_hi_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [23:0] lo_4 = {lo_hi_hi_hi_hi_hi,lo_hi_hi_hi_hi_lo,lo_hi_hi_hi_lo,lo_hi_hi_lo_hi_hi,lo_hi_hi_lo_hi_lo,
    lo_hi_hi_lo_lo,lo_hi_lo,lo_lo}; // @[Cat.scala 30:58]
  wire [5:0] hi_lo_lo = {hi_lo_lo_hi_hi_hi,hi_lo_lo_hi_hi_lo,hi_lo_lo_hi_lo,hi_lo_lo_lo_hi_hi,hi_lo_lo_lo_hi_lo,
    hi_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [11:0] hi_lo = {hi_lo_hi_hi_hi_hi,hi_lo_hi_hi_hi_lo,hi_lo_hi_hi_lo,hi_lo_hi_lo_hi_hi,hi_lo_hi_lo_hi_lo,
    hi_lo_hi_lo_lo,hi_lo_lo}; // @[Cat.scala 30:58]
  wire [5:0] hi_hi_lo = {hi_hi_lo_hi_hi_hi,hi_hi_lo_hi_hi_lo,hi_hi_lo_hi_lo,hi_hi_lo_lo_hi_hi,hi_hi_lo_lo_hi_lo,
    hi_hi_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [23:0] hi_4 = {hi_hi_hi_hi_hi_hi,hi_hi_hi_hi_hi_lo,hi_hi_hi_hi_lo,hi_hi_hi_lo_hi_hi,hi_hi_hi_lo_hi_lo,
    hi_hi_hi_lo_lo,hi_hi_lo,hi_lo}; // @[Cat.scala 30:58]
  assign io_C_next = {hi,lo}; // @[Cat.scala 30:58]
  assign io_D_next = {hi_1,lo_1}; // @[Cat.scala 30:58]
  assign io_K = {hi_4,lo_4}; // @[Cat.scala 30:58]
endmodule
module DES_E(
  input  [31:0] io_R,
  output [47:0] io_E
);
  wire [31:0] _T_3 = {{16'd0}, io_R[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_5 = {io_R[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_7 = _T_5 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_8 = _T_3 | _T_7; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_0 = {{8'd0}, _T_8[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_13 = _GEN_0 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_15 = {_T_8[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_17 = _T_15 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_18 = _T_13 | _T_17; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_1 = {{4'd0}, _T_18[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_23 = _GEN_1 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_25 = {_T_18[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_27 = _T_25 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_28 = _T_23 | _T_27; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_2 = {{2'd0}, _T_28[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_33 = _GEN_2 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_35 = {_T_28[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_37 = _T_35 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_38 = _T_33 | _T_37; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_3 = {{1'd0}, _T_38[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_43 = _GEN_3 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_45 = {_T_38[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_47 = _T_45 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [31:0] reversed = _T_43 | _T_47; // @[Bitwise.scala 103:39]
  wire  hi_hi_hi_hi_hi_hi = reversed[31]; // @[DES_EncryptionPipelinedElasticBuffer.scala 492:23]
  wire  hi_hi_hi_hi_hi_lo = reversed[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 492:36]
  wire  hi_hi_hi_hi_lo = reversed[1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 492:48]
  wire  hi_hi_hi_lo_hi_hi = reversed[2]; // @[DES_EncryptionPipelinedElasticBuffer.scala 492:60]
  wire  hi_hi_hi_lo_hi_lo = reversed[3]; // @[DES_EncryptionPipelinedElasticBuffer.scala 492:72]
  wire  hi_hi_hi_lo_lo = reversed[4]; // @[DES_EncryptionPipelinedElasticBuffer.scala 492:84]
  wire  hi_hi_lo_hi_lo = reversed[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 493:37]
  wire  hi_hi_lo_lo_hi_hi = reversed[6]; // @[DES_EncryptionPipelinedElasticBuffer.scala 493:49]
  wire  hi_hi_lo_lo_hi_lo = reversed[7]; // @[DES_EncryptionPipelinedElasticBuffer.scala 493:61]
  wire  hi_hi_lo_lo_lo = reversed[8]; // @[DES_EncryptionPipelinedElasticBuffer.scala 493:73]
  wire  hi_lo_hi_hi_lo = reversed[9]; // @[DES_EncryptionPipelinedElasticBuffer.scala 494:37]
  wire  hi_lo_hi_lo_hi_hi = reversed[10]; // @[DES_EncryptionPipelinedElasticBuffer.scala 494:49]
  wire  hi_lo_hi_lo_hi_lo = reversed[11]; // @[DES_EncryptionPipelinedElasticBuffer.scala 494:62]
  wire  hi_lo_hi_lo_lo = reversed[12]; // @[DES_EncryptionPipelinedElasticBuffer.scala 494:75]
  wire  hi_lo_lo_hi_lo = reversed[13]; // @[DES_EncryptionPipelinedElasticBuffer.scala 495:39]
  wire  hi_lo_lo_lo_hi_hi = reversed[14]; // @[DES_EncryptionPipelinedElasticBuffer.scala 495:52]
  wire  hi_lo_lo_lo_hi_lo = reversed[15]; // @[DES_EncryptionPipelinedElasticBuffer.scala 495:65]
  wire  hi_lo_lo_lo_lo = reversed[16]; // @[DES_EncryptionPipelinedElasticBuffer.scala 495:78]
  wire  lo_hi_hi_hi_lo = reversed[17]; // @[DES_EncryptionPipelinedElasticBuffer.scala 496:39]
  wire  lo_hi_hi_lo_hi_hi = reversed[18]; // @[DES_EncryptionPipelinedElasticBuffer.scala 496:52]
  wire  lo_hi_hi_lo_hi_lo = reversed[19]; // @[DES_EncryptionPipelinedElasticBuffer.scala 496:65]
  wire  lo_hi_hi_lo_lo = reversed[20]; // @[DES_EncryptionPipelinedElasticBuffer.scala 496:78]
  wire  lo_hi_lo_hi_lo = reversed[21]; // @[DES_EncryptionPipelinedElasticBuffer.scala 497:39]
  wire  lo_hi_lo_lo_hi_hi = reversed[22]; // @[DES_EncryptionPipelinedElasticBuffer.scala 497:52]
  wire  lo_hi_lo_lo_hi_lo = reversed[23]; // @[DES_EncryptionPipelinedElasticBuffer.scala 497:65]
  wire  lo_hi_lo_lo_lo = reversed[24]; // @[DES_EncryptionPipelinedElasticBuffer.scala 497:78]
  wire  lo_lo_hi_hi_lo = reversed[25]; // @[DES_EncryptionPipelinedElasticBuffer.scala 498:39]
  wire  lo_lo_hi_lo_hi_hi = reversed[26]; // @[DES_EncryptionPipelinedElasticBuffer.scala 498:52]
  wire  lo_lo_hi_lo_hi_lo = reversed[27]; // @[DES_EncryptionPipelinedElasticBuffer.scala 498:65]
  wire  lo_lo_hi_lo_lo = reversed[28]; // @[DES_EncryptionPipelinedElasticBuffer.scala 498:78]
  wire  lo_lo_lo_hi_lo = reversed[29]; // @[DES_EncryptionPipelinedElasticBuffer.scala 499:39]
  wire  lo_lo_lo_lo_hi_hi = reversed[30]; // @[DES_EncryptionPipelinedElasticBuffer.scala 499:52]
  wire [5:0] lo_lo_lo = {lo_lo_hi_lo_hi_lo,lo_lo_hi_lo_lo,lo_lo_lo_hi_lo,lo_lo_lo_lo_hi_hi,hi_hi_hi_hi_hi_hi,
    hi_hi_hi_hi_hi_lo}; // @[Cat.scala 30:58]
  wire [11:0] lo_lo = {lo_hi_lo_lo_hi_lo,lo_hi_lo_lo_lo,lo_lo_hi_hi_lo,lo_lo_hi_lo_hi_hi,lo_lo_hi_lo_hi_lo,
    lo_lo_hi_lo_lo,lo_lo_lo}; // @[Cat.scala 30:58]
  wire [5:0] lo_hi_lo = {lo_hi_hi_lo_hi_lo,lo_hi_hi_lo_lo,lo_hi_lo_hi_lo,lo_hi_lo_lo_hi_hi,lo_hi_lo_lo_hi_lo,
    lo_hi_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [23:0] lo = {hi_lo_lo_lo_hi_lo,hi_lo_lo_lo_lo,lo_hi_hi_hi_lo,lo_hi_hi_lo_hi_hi,lo_hi_hi_lo_hi_lo,lo_hi_hi_lo_lo,
    lo_hi_lo,lo_lo}; // @[Cat.scala 30:58]
  wire [5:0] hi_lo_lo = {hi_lo_hi_lo_hi_lo,hi_lo_hi_lo_lo,hi_lo_lo_hi_lo,hi_lo_lo_lo_hi_hi,hi_lo_lo_lo_hi_lo,
    hi_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [11:0] hi_lo = {hi_hi_lo_lo_hi_lo,hi_hi_lo_lo_lo,hi_lo_hi_hi_lo,hi_lo_hi_lo_hi_hi,hi_lo_hi_lo_hi_lo,
    hi_lo_hi_lo_lo,hi_lo_lo}; // @[Cat.scala 30:58]
  wire [5:0] hi_hi_lo = {hi_hi_hi_lo_hi_lo,hi_hi_hi_lo_lo,hi_hi_lo_hi_lo,hi_hi_lo_lo_hi_hi,hi_hi_lo_lo_hi_lo,
    hi_hi_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [23:0] hi = {hi_hi_hi_hi_hi_hi,hi_hi_hi_hi_hi_lo,hi_hi_hi_hi_lo,hi_hi_hi_lo_hi_hi,hi_hi_hi_lo_hi_lo,
    hi_hi_hi_lo_lo,hi_hi_lo,hi_lo}; // @[Cat.scala 30:58]
  assign io_E = {hi,lo}; // @[Cat.scala 30:58]
endmodule
module DES_S(
  input  [47:0] io_in,
  output [31:0] io_out
);
  wire [5:0] B_7 = io_in[5:0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 319:20]
  wire  hi = B_7[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:27]
  wire  lo = B_7[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:37]
  wire [1:0] row_7 = {hi,lo}; // @[Cat.scala 30:58]
  wire [3:0] col_7 = B_7[4:1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 321:23]
  wire [5:0] B_6 = io_in[11:6]; // @[DES_EncryptionPipelinedElasticBuffer.scala 319:20]
  wire  hi_1 = B_6[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:27]
  wire  lo_1 = B_6[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:37]
  wire [1:0] row_6 = {hi_1,lo_1}; // @[Cat.scala 30:58]
  wire [3:0] col_6 = B_6[4:1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 321:23]
  wire [5:0] B_5 = io_in[17:12]; // @[DES_EncryptionPipelinedElasticBuffer.scala 319:20]
  wire  hi_2 = B_5[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:27]
  wire  lo_2 = B_5[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:37]
  wire [1:0] row_5 = {hi_2,lo_2}; // @[Cat.scala 30:58]
  wire [3:0] col_5 = B_5[4:1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 321:23]
  wire [5:0] B_4 = io_in[23:18]; // @[DES_EncryptionPipelinedElasticBuffer.scala 319:20]
  wire  hi_3 = B_4[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:27]
  wire  lo_3 = B_4[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:37]
  wire [1:0] row_4 = {hi_3,lo_3}; // @[Cat.scala 30:58]
  wire [3:0] col_4 = B_4[4:1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 321:23]
  wire [5:0] B_3 = io_in[29:24]; // @[DES_EncryptionPipelinedElasticBuffer.scala 319:20]
  wire  hi_4 = B_3[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:27]
  wire  lo_4 = B_3[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:37]
  wire [1:0] row_3 = {hi_4,lo_4}; // @[Cat.scala 30:58]
  wire [3:0] col_3 = B_3[4:1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 321:23]
  wire [5:0] B_2 = io_in[35:30]; // @[DES_EncryptionPipelinedElasticBuffer.scala 319:20]
  wire  hi_5 = B_2[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:27]
  wire  lo_5 = B_2[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:37]
  wire [1:0] row_2 = {hi_5,lo_5}; // @[Cat.scala 30:58]
  wire [3:0] col_2 = B_2[4:1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 321:23]
  wire [5:0] B_1 = io_in[41:36]; // @[DES_EncryptionPipelinedElasticBuffer.scala 319:20]
  wire  hi_6 = B_1[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:27]
  wire  lo_6 = B_1[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:37]
  wire [1:0] row_1 = {hi_6,lo_6}; // @[Cat.scala 30:58]
  wire [3:0] col_1 = B_1[4:1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 321:23]
  wire [5:0] B_0 = io_in[47:42]; // @[DES_EncryptionPipelinedElasticBuffer.scala 319:20]
  wire  hi_7 = B_0[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:27]
  wire  lo_7 = B_0[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 320:37]
  wire [1:0] row_0 = {hi_7,lo_7}; // @[Cat.scala 30:58]
  wire [3:0] col_0 = B_0[4:1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 321:23]
  wire [3:0] _GEN_1 = 4'h0 == col_6 & 2'h1 == row_6 ? 4'hd : 4'h4; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_2 = 4'h0 == col_6 & 2'h2 == row_6 ? 4'h1 : _GEN_1; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_3 = 4'h0 == col_6 & 2'h3 == row_6 ? 4'h6 : _GEN_2; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_4 = 4'h1 == col_6 & 2'h0 == row_6 ? 4'hb : _GEN_3; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_5 = 4'h1 == col_6 & 2'h1 == row_6 ? 4'h0 : _GEN_4; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_6 = 4'h1 == col_6 & 2'h2 == row_6 ? 4'h4 : _GEN_5; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_7 = 4'h1 == col_6 & 2'h3 == row_6 ? 4'hb : _GEN_6; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_8 = 4'h2 == col_6 & 2'h0 == row_6 ? 4'h2 : _GEN_7; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_9 = 4'h2 == col_6 & 2'h1 == row_6 ? 4'hb : _GEN_8; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_10 = 4'h2 == col_6 & 2'h2 == row_6 ? 4'hb : _GEN_9; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_11 = 4'h2 == col_6 & 2'h3 == row_6 ? 4'hd : _GEN_10; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_12 = 4'h3 == col_6 & 2'h0 == row_6 ? 4'he : _GEN_11; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_13 = 4'h3 == col_6 & 2'h1 == row_6 ? 4'h7 : _GEN_12; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_14 = 4'h3 == col_6 & 2'h2 == row_6 ? 4'hd : _GEN_13; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_15 = 4'h3 == col_6 & 2'h3 == row_6 ? 4'h8 : _GEN_14; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_16 = 4'h4 == col_6 & 2'h0 == row_6 ? 4'hf : _GEN_15; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_17 = 4'h4 == col_6 & 2'h1 == row_6 ? 4'h4 : _GEN_16; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_18 = 4'h4 == col_6 & 2'h2 == row_6 ? 4'hc : _GEN_17; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_19 = 4'h4 == col_6 & 2'h3 == row_6 ? 4'h1 : _GEN_18; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_20 = 4'h5 == col_6 & 2'h0 == row_6 ? 4'h0 : _GEN_19; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_21 = 4'h5 == col_6 & 2'h1 == row_6 ? 4'h9 : _GEN_20; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_22 = 4'h5 == col_6 & 2'h2 == row_6 ? 4'h3 : _GEN_21; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_23 = 4'h5 == col_6 & 2'h3 == row_6 ? 4'h4 : _GEN_22; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_24 = 4'h6 == col_6 & 2'h0 == row_6 ? 4'h8 : _GEN_23; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_25 = 4'h6 == col_6 & 2'h1 == row_6 ? 4'h1 : _GEN_24; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_26 = 4'h6 == col_6 & 2'h2 == row_6 ? 4'h7 : _GEN_25; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_27 = 4'h6 == col_6 & 2'h3 == row_6 ? 4'ha : _GEN_26; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_28 = 4'h7 == col_6 & 2'h0 == row_6 ? 4'hd : _GEN_27; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_29 = 4'h7 == col_6 & 2'h1 == row_6 ? 4'ha : _GEN_28; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_30 = 4'h7 == col_6 & 2'h2 == row_6 ? 4'he : _GEN_29; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_31 = 4'h7 == col_6 & 2'h3 == row_6 ? 4'h7 : _GEN_30; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_32 = 4'h8 == col_6 & 2'h0 == row_6 ? 4'h3 : _GEN_31; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_33 = 4'h8 == col_6 & 2'h1 == row_6 ? 4'he : _GEN_32; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_34 = 4'h8 == col_6 & 2'h2 == row_6 ? 4'ha : _GEN_33; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_35 = 4'h8 == col_6 & 2'h3 == row_6 ? 4'h9 : _GEN_34; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_36 = 4'h9 == col_6 & 2'h0 == row_6 ? 4'hc : _GEN_35; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_37 = 4'h9 == col_6 & 2'h1 == row_6 ? 4'h3 : _GEN_36; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_38 = 4'h9 == col_6 & 2'h2 == row_6 ? 4'hf : _GEN_37; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_39 = 4'h9 == col_6 & 2'h3 == row_6 ? 4'h5 : _GEN_38; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_40 = 4'ha == col_6 & 2'h0 == row_6 ? 4'h9 : _GEN_39; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_41 = 4'ha == col_6 & 2'h1 == row_6 ? 4'h5 : _GEN_40; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_42 = 4'ha == col_6 & 2'h2 == row_6 ? 4'h6 : _GEN_41; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_43 = 4'ha == col_6 & 2'h3 == row_6 ? 4'h0 : _GEN_42; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_44 = 4'hb == col_6 & 2'h0 == row_6 ? 4'h7 : _GEN_43; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_45 = 4'hb == col_6 & 2'h1 == row_6 ? 4'hc : _GEN_44; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_46 = 4'hb == col_6 & 2'h2 == row_6 ? 4'h8 : _GEN_45; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_47 = 4'hb == col_6 & 2'h3 == row_6 ? 4'hf : _GEN_46; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_48 = 4'hc == col_6 & 2'h0 == row_6 ? 4'h5 : _GEN_47; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_49 = 4'hc == col_6 & 2'h1 == row_6 ? 4'h2 : _GEN_48; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_50 = 4'hc == col_6 & 2'h2 == row_6 ? 4'h0 : _GEN_49; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_51 = 4'hc == col_6 & 2'h3 == row_6 ? 4'he : _GEN_50; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_52 = 4'hd == col_6 & 2'h0 == row_6 ? 4'ha : _GEN_51; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_53 = 4'hd == col_6 & 2'h1 == row_6 ? 4'hf : _GEN_52; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_54 = 4'hd == col_6 & 2'h2 == row_6 ? 4'h5 : _GEN_53; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_55 = 4'hd == col_6 & 2'h3 == row_6 ? 4'h2 : _GEN_54; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_56 = 4'he == col_6 & 2'h0 == row_6 ? 4'h6 : _GEN_55; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_57 = 4'he == col_6 & 2'h1 == row_6 ? 4'h8 : _GEN_56; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_58 = 4'he == col_6 & 2'h2 == row_6 ? 4'h9 : _GEN_57; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_59 = 4'he == col_6 & 2'h3 == row_6 ? 4'h3 : _GEN_58; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_60 = 4'hf == col_6 & 2'h0 == row_6 ? 4'h1 : _GEN_59; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_61 = 4'hf == col_6 & 2'h1 == row_6 ? 4'h6 : _GEN_60; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_62 = 4'hf == col_6 & 2'h2 == row_6 ? 4'h2 : _GEN_61; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_63 = 4'hf == col_6 & 2'h3 == row_6 ? 4'hc : _GEN_62; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_65 = 4'h0 == col_7 & 2'h1 == row_7 ? 4'h1 : 4'hd; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_66 = 4'h0 == col_7 & 2'h2 == row_7 ? 4'h7 : _GEN_65; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_67 = 4'h0 == col_7 & 2'h3 == row_7 ? 4'h2 : _GEN_66; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_68 = 4'h1 == col_7 & 2'h0 == row_7 ? 4'h2 : _GEN_67; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_69 = 4'h1 == col_7 & 2'h1 == row_7 ? 4'hf : _GEN_68; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_70 = 4'h1 == col_7 & 2'h2 == row_7 ? 4'hb : _GEN_69; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_71 = 4'h1 == col_7 & 2'h3 == row_7 ? 4'h1 : _GEN_70; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_72 = 4'h2 == col_7 & 2'h0 == row_7 ? 4'h8 : _GEN_71; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_73 = 4'h2 == col_7 & 2'h1 == row_7 ? 4'hd : _GEN_72; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_74 = 4'h2 == col_7 & 2'h2 == row_7 ? 4'h4 : _GEN_73; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_75 = 4'h2 == col_7 & 2'h3 == row_7 ? 4'he : _GEN_74; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_76 = 4'h3 == col_7 & 2'h0 == row_7 ? 4'h4 : _GEN_75; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_77 = 4'h3 == col_7 & 2'h1 == row_7 ? 4'h8 : _GEN_76; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_78 = 4'h3 == col_7 & 2'h2 == row_7 ? 4'h1 : _GEN_77; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_79 = 4'h3 == col_7 & 2'h3 == row_7 ? 4'h7 : _GEN_78; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_80 = 4'h4 == col_7 & 2'h0 == row_7 ? 4'h6 : _GEN_79; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_81 = 4'h4 == col_7 & 2'h1 == row_7 ? 4'ha : _GEN_80; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_82 = 4'h4 == col_7 & 2'h2 == row_7 ? 4'h9 : _GEN_81; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_83 = 4'h4 == col_7 & 2'h3 == row_7 ? 4'h4 : _GEN_82; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_84 = 4'h5 == col_7 & 2'h0 == row_7 ? 4'hf : _GEN_83; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_85 = 4'h5 == col_7 & 2'h1 == row_7 ? 4'h3 : _GEN_84; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_86 = 4'h5 == col_7 & 2'h2 == row_7 ? 4'hc : _GEN_85; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_87 = 4'h5 == col_7 & 2'h3 == row_7 ? 4'ha : _GEN_86; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_88 = 4'h6 == col_7 & 2'h0 == row_7 ? 4'hb : _GEN_87; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_89 = 4'h6 == col_7 & 2'h1 == row_7 ? 4'h7 : _GEN_88; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_90 = 4'h6 == col_7 & 2'h2 == row_7 ? 4'he : _GEN_89; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_91 = 4'h6 == col_7 & 2'h3 == row_7 ? 4'h8 : _GEN_90; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_92 = 4'h7 == col_7 & 2'h0 == row_7 ? 4'h1 : _GEN_91; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_93 = 4'h7 == col_7 & 2'h1 == row_7 ? 4'h4 : _GEN_92; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_94 = 4'h7 == col_7 & 2'h2 == row_7 ? 4'h2 : _GEN_93; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_95 = 4'h7 == col_7 & 2'h3 == row_7 ? 4'hd : _GEN_94; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_96 = 4'h8 == col_7 & 2'h0 == row_7 ? 4'ha : _GEN_95; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_97 = 4'h8 == col_7 & 2'h1 == row_7 ? 4'hc : _GEN_96; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_98 = 4'h8 == col_7 & 2'h2 == row_7 ? 4'h0 : _GEN_97; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_99 = 4'h8 == col_7 & 2'h3 == row_7 ? 4'hf : _GEN_98; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_100 = 4'h9 == col_7 & 2'h0 == row_7 ? 4'h9 : _GEN_99; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_101 = 4'h9 == col_7 & 2'h1 == row_7 ? 4'h5 : _GEN_100; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_102 = 4'h9 == col_7 & 2'h2 == row_7 ? 4'h6 : _GEN_101; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_103 = 4'h9 == col_7 & 2'h3 == row_7 ? 4'hc : _GEN_102; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_104 = 4'ha == col_7 & 2'h0 == row_7 ? 4'h3 : _GEN_103; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_105 = 4'ha == col_7 & 2'h1 == row_7 ? 4'h6 : _GEN_104; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_106 = 4'ha == col_7 & 2'h2 == row_7 ? 4'ha : _GEN_105; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_107 = 4'ha == col_7 & 2'h3 == row_7 ? 4'h9 : _GEN_106; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_108 = 4'hb == col_7 & 2'h0 == row_7 ? 4'he : _GEN_107; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_109 = 4'hb == col_7 & 2'h1 == row_7 ? 4'hb : _GEN_108; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_110 = 4'hb == col_7 & 2'h2 == row_7 ? 4'hd : _GEN_109; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_111 = 4'hb == col_7 & 2'h3 == row_7 ? 4'h0 : _GEN_110; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_112 = 4'hc == col_7 & 2'h0 == row_7 ? 4'h5 : _GEN_111; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_113 = 4'hc == col_7 & 2'h1 == row_7 ? 4'h0 : _GEN_112; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_114 = 4'hc == col_7 & 2'h2 == row_7 ? 4'hf : _GEN_113; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_115 = 4'hc == col_7 & 2'h3 == row_7 ? 4'h3 : _GEN_114; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_116 = 4'hd == col_7 & 2'h0 == row_7 ? 4'h0 : _GEN_115; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_117 = 4'hd == col_7 & 2'h1 == row_7 ? 4'he : _GEN_116; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_118 = 4'hd == col_7 & 2'h2 == row_7 ? 4'h3 : _GEN_117; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_119 = 4'hd == col_7 & 2'h3 == row_7 ? 4'h5 : _GEN_118; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_120 = 4'he == col_7 & 2'h0 == row_7 ? 4'hc : _GEN_119; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_121 = 4'he == col_7 & 2'h1 == row_7 ? 4'h9 : _GEN_120; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_122 = 4'he == col_7 & 2'h2 == row_7 ? 4'h5 : _GEN_121; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_123 = 4'he == col_7 & 2'h3 == row_7 ? 4'h6 : _GEN_122; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_124 = 4'hf == col_7 & 2'h0 == row_7 ? 4'h7 : _GEN_123; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_125 = 4'hf == col_7 & 2'h1 == row_7 ? 4'h2 : _GEN_124; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_126 = 4'hf == col_7 & 2'h2 == row_7 ? 4'h8 : _GEN_125; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_127 = 4'hf == col_7 & 2'h3 == row_7 ? 4'hb : _GEN_126; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_129 = 4'h0 == col_4 & 2'h1 == row_4 ? 4'he : 4'h2; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_130 = 4'h0 == col_4 & 2'h2 == row_4 ? 4'h4 : _GEN_129; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_131 = 4'h0 == col_4 & 2'h3 == row_4 ? 4'hb : _GEN_130; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_132 = 4'h1 == col_4 & 2'h0 == row_4 ? 4'hc : _GEN_131; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_133 = 4'h1 == col_4 & 2'h1 == row_4 ? 4'hb : _GEN_132; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_134 = 4'h1 == col_4 & 2'h2 == row_4 ? 4'h2 : _GEN_133; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_135 = 4'h1 == col_4 & 2'h3 == row_4 ? 4'h8 : _GEN_134; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_136 = 4'h2 == col_4 & 2'h0 == row_4 ? 4'h4 : _GEN_135; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_137 = 4'h2 == col_4 & 2'h1 == row_4 ? 4'h2 : _GEN_136; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_138 = 4'h2 == col_4 & 2'h2 == row_4 ? 4'h1 : _GEN_137; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_139 = 4'h2 == col_4 & 2'h3 == row_4 ? 4'hc : _GEN_138; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_140 = 4'h3 == col_4 & 2'h0 == row_4 ? 4'h1 : _GEN_139; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_141 = 4'h3 == col_4 & 2'h1 == row_4 ? 4'hc : _GEN_140; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_142 = 4'h3 == col_4 & 2'h2 == row_4 ? 4'hb : _GEN_141; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_143 = 4'h3 == col_4 & 2'h3 == row_4 ? 4'h7 : _GEN_142; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_144 = 4'h4 == col_4 & 2'h0 == row_4 ? 4'h7 : _GEN_143; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_145 = 4'h4 == col_4 & 2'h1 == row_4 ? 4'h4 : _GEN_144; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_146 = 4'h4 == col_4 & 2'h2 == row_4 ? 4'ha : _GEN_145; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_147 = 4'h4 == col_4 & 2'h3 == row_4 ? 4'h1 : _GEN_146; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_148 = 4'h5 == col_4 & 2'h0 == row_4 ? 4'ha : _GEN_147; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_149 = 4'h5 == col_4 & 2'h1 == row_4 ? 4'h7 : _GEN_148; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_150 = 4'h5 == col_4 & 2'h2 == row_4 ? 4'hd : _GEN_149; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_151 = 4'h5 == col_4 & 2'h3 == row_4 ? 4'he : _GEN_150; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_152 = 4'h6 == col_4 & 2'h0 == row_4 ? 4'hb : _GEN_151; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_153 = 4'h6 == col_4 & 2'h1 == row_4 ? 4'hd : _GEN_152; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_154 = 4'h6 == col_4 & 2'h2 == row_4 ? 4'h7 : _GEN_153; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_155 = 4'h6 == col_4 & 2'h3 == row_4 ? 4'h2 : _GEN_154; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_156 = 4'h7 == col_4 & 2'h0 == row_4 ? 4'h6 : _GEN_155; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_157 = 4'h7 == col_4 & 2'h1 == row_4 ? 4'h1 : _GEN_156; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_158 = 4'h7 == col_4 & 2'h2 == row_4 ? 4'h8 : _GEN_157; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_159 = 4'h7 == col_4 & 2'h3 == row_4 ? 4'hd : _GEN_158; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_160 = 4'h8 == col_4 & 2'h0 == row_4 ? 4'h8 : _GEN_159; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_161 = 4'h8 == col_4 & 2'h1 == row_4 ? 4'h5 : _GEN_160; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_162 = 4'h8 == col_4 & 2'h2 == row_4 ? 4'hf : _GEN_161; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_163 = 4'h8 == col_4 & 2'h3 == row_4 ? 4'h6 : _GEN_162; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_164 = 4'h9 == col_4 & 2'h0 == row_4 ? 4'h5 : _GEN_163; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_165 = 4'h9 == col_4 & 2'h1 == row_4 ? 4'h0 : _GEN_164; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_166 = 4'h9 == col_4 & 2'h2 == row_4 ? 4'h9 : _GEN_165; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_167 = 4'h9 == col_4 & 2'h3 == row_4 ? 4'hf : _GEN_166; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_168 = 4'ha == col_4 & 2'h0 == row_4 ? 4'h3 : _GEN_167; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_169 = 4'ha == col_4 & 2'h1 == row_4 ? 4'hf : _GEN_168; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_170 = 4'ha == col_4 & 2'h2 == row_4 ? 4'hc : _GEN_169; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_171 = 4'ha == col_4 & 2'h3 == row_4 ? 4'h0 : _GEN_170; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_172 = 4'hb == col_4 & 2'h0 == row_4 ? 4'hf : _GEN_171; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_173 = 4'hb == col_4 & 2'h1 == row_4 ? 4'ha : _GEN_172; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_174 = 4'hb == col_4 & 2'h2 == row_4 ? 4'h5 : _GEN_173; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_175 = 4'hb == col_4 & 2'h3 == row_4 ? 4'h9 : _GEN_174; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_176 = 4'hc == col_4 & 2'h0 == row_4 ? 4'hd : _GEN_175; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_177 = 4'hc == col_4 & 2'h1 == row_4 ? 4'h3 : _GEN_176; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_178 = 4'hc == col_4 & 2'h2 == row_4 ? 4'h6 : _GEN_177; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_179 = 4'hc == col_4 & 2'h3 == row_4 ? 4'ha : _GEN_178; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_180 = 4'hd == col_4 & 2'h0 == row_4 ? 4'h0 : _GEN_179; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_181 = 4'hd == col_4 & 2'h1 == row_4 ? 4'h9 : _GEN_180; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_182 = 4'hd == col_4 & 2'h2 == row_4 ? 4'h3 : _GEN_181; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_183 = 4'hd == col_4 & 2'h3 == row_4 ? 4'h4 : _GEN_182; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_184 = 4'he == col_4 & 2'h0 == row_4 ? 4'he : _GEN_183; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_185 = 4'he == col_4 & 2'h1 == row_4 ? 4'h8 : _GEN_184; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_186 = 4'he == col_4 & 2'h2 == row_4 ? 4'h0 : _GEN_185; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_187 = 4'he == col_4 & 2'h3 == row_4 ? 4'h5 : _GEN_186; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_188 = 4'hf == col_4 & 2'h0 == row_4 ? 4'h9 : _GEN_187; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_189 = 4'hf == col_4 & 2'h1 == row_4 ? 4'h6 : _GEN_188; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_190 = 4'hf == col_4 & 2'h2 == row_4 ? 4'he : _GEN_189; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_191 = 4'hf == col_4 & 2'h3 == row_4 ? 4'h3 : _GEN_190; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_193 = 4'h0 == col_5 & 2'h1 == row_5 ? 4'ha : 4'hc; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_194 = 4'h0 == col_5 & 2'h2 == row_5 ? 4'h9 : _GEN_193; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_195 = 4'h0 == col_5 & 2'h3 == row_5 ? 4'h4 : _GEN_194; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_196 = 4'h1 == col_5 & 2'h0 == row_5 ? 4'h1 : _GEN_195; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_197 = 4'h1 == col_5 & 2'h1 == row_5 ? 4'hf : _GEN_196; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_198 = 4'h1 == col_5 & 2'h2 == row_5 ? 4'he : _GEN_197; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_199 = 4'h1 == col_5 & 2'h3 == row_5 ? 4'h3 : _GEN_198; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_200 = 4'h2 == col_5 & 2'h0 == row_5 ? 4'ha : _GEN_199; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_201 = 4'h2 == col_5 & 2'h1 == row_5 ? 4'h4 : _GEN_200; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_202 = 4'h2 == col_5 & 2'h2 == row_5 ? 4'hf : _GEN_201; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_203 = 4'h2 == col_5 & 2'h3 == row_5 ? 4'h2 : _GEN_202; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_204 = 4'h3 == col_5 & 2'h0 == row_5 ? 4'hf : _GEN_203; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_205 = 4'h3 == col_5 & 2'h1 == row_5 ? 4'h2 : _GEN_204; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_206 = 4'h3 == col_5 & 2'h2 == row_5 ? 4'h5 : _GEN_205; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_207 = 4'h3 == col_5 & 2'h3 == row_5 ? 4'hc : _GEN_206; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_208 = 4'h4 == col_5 & 2'h0 == row_5 ? 4'h9 : _GEN_207; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_209 = 4'h4 == col_5 & 2'h1 == row_5 ? 4'h7 : _GEN_208; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_210 = 4'h4 == col_5 & 2'h2 == row_5 ? 4'h2 : _GEN_209; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_211 = 4'h4 == col_5 & 2'h3 == row_5 ? 4'h9 : _GEN_210; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_212 = 4'h5 == col_5 & 2'h0 == row_5 ? 4'h2 : _GEN_211; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_213 = 4'h5 == col_5 & 2'h1 == row_5 ? 4'hc : _GEN_212; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_214 = 4'h5 == col_5 & 2'h2 == row_5 ? 4'h8 : _GEN_213; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_215 = 4'h5 == col_5 & 2'h3 == row_5 ? 4'h5 : _GEN_214; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_216 = 4'h6 == col_5 & 2'h0 == row_5 ? 4'h6 : _GEN_215; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_217 = 4'h6 == col_5 & 2'h1 == row_5 ? 4'h9 : _GEN_216; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_218 = 4'h6 == col_5 & 2'h2 == row_5 ? 4'hc : _GEN_217; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_219 = 4'h6 == col_5 & 2'h3 == row_5 ? 4'hf : _GEN_218; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_220 = 4'h7 == col_5 & 2'h0 == row_5 ? 4'h8 : _GEN_219; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_221 = 4'h7 == col_5 & 2'h1 == row_5 ? 4'h5 : _GEN_220; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_222 = 4'h7 == col_5 & 2'h2 == row_5 ? 4'h3 : _GEN_221; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_223 = 4'h7 == col_5 & 2'h3 == row_5 ? 4'ha : _GEN_222; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_224 = 4'h8 == col_5 & 2'h0 == row_5 ? 4'h0 : _GEN_223; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_225 = 4'h8 == col_5 & 2'h1 == row_5 ? 4'h6 : _GEN_224; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_226 = 4'h8 == col_5 & 2'h2 == row_5 ? 4'h7 : _GEN_225; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_227 = 4'h8 == col_5 & 2'h3 == row_5 ? 4'hb : _GEN_226; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_228 = 4'h9 == col_5 & 2'h0 == row_5 ? 4'hd : _GEN_227; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_229 = 4'h9 == col_5 & 2'h1 == row_5 ? 4'h1 : _GEN_228; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_230 = 4'h9 == col_5 & 2'h2 == row_5 ? 4'h0 : _GEN_229; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_231 = 4'h9 == col_5 & 2'h3 == row_5 ? 4'he : _GEN_230; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_232 = 4'ha == col_5 & 2'h0 == row_5 ? 4'h3 : _GEN_231; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_233 = 4'ha == col_5 & 2'h1 == row_5 ? 4'hd : _GEN_232; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_234 = 4'ha == col_5 & 2'h2 == row_5 ? 4'h4 : _GEN_233; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_235 = 4'ha == col_5 & 2'h3 == row_5 ? 4'h1 : _GEN_234; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_236 = 4'hb == col_5 & 2'h0 == row_5 ? 4'h4 : _GEN_235; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_237 = 4'hb == col_5 & 2'h1 == row_5 ? 4'he : _GEN_236; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_238 = 4'hb == col_5 & 2'h2 == row_5 ? 4'ha : _GEN_237; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_239 = 4'hb == col_5 & 2'h3 == row_5 ? 4'h7 : _GEN_238; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_240 = 4'hc == col_5 & 2'h0 == row_5 ? 4'he : _GEN_239; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_241 = 4'hc == col_5 & 2'h1 == row_5 ? 4'h0 : _GEN_240; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_242 = 4'hc == col_5 & 2'h2 == row_5 ? 4'h1 : _GEN_241; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_243 = 4'hc == col_5 & 2'h3 == row_5 ? 4'h6 : _GEN_242; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_244 = 4'hd == col_5 & 2'h0 == row_5 ? 4'h7 : _GEN_243; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_245 = 4'hd == col_5 & 2'h1 == row_5 ? 4'hb : _GEN_244; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_246 = 4'hd == col_5 & 2'h2 == row_5 ? 4'hd : _GEN_245; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_247 = 4'hd == col_5 & 2'h3 == row_5 ? 4'h0 : _GEN_246; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_248 = 4'he == col_5 & 2'h0 == row_5 ? 4'h5 : _GEN_247; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_249 = 4'he == col_5 & 2'h1 == row_5 ? 4'h3 : _GEN_248; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_250 = 4'he == col_5 & 2'h2 == row_5 ? 4'hb : _GEN_249; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_251 = 4'he == col_5 & 2'h3 == row_5 ? 4'h8 : _GEN_250; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_252 = 4'hf == col_5 & 2'h0 == row_5 ? 4'hb : _GEN_251; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_253 = 4'hf == col_5 & 2'h1 == row_5 ? 4'h8 : _GEN_252; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_254 = 4'hf == col_5 & 2'h2 == row_5 ? 4'h6 : _GEN_253; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_255 = 4'hf == col_5 & 2'h3 == row_5 ? 4'hd : _GEN_254; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [15:0] lo_8 = {_GEN_191,_GEN_255,_GEN_63,_GEN_127}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_257 = 4'h0 == col_2 & 2'h1 == row_2 ? 4'hd : 4'ha; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_258 = 4'h0 == col_2 & 2'h2 == row_2 ? 4'hd : _GEN_257; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_259 = 4'h0 == col_2 & 2'h3 == row_2 ? 4'h1 : _GEN_258; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_260 = 4'h1 == col_2 & 2'h0 == row_2 ? 4'h0 : _GEN_259; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_261 = 4'h1 == col_2 & 2'h1 == row_2 ? 4'h7 : _GEN_260; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_262 = 4'h1 == col_2 & 2'h2 == row_2 ? 4'h6 : _GEN_261; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_263 = 4'h1 == col_2 & 2'h3 == row_2 ? 4'ha : _GEN_262; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_264 = 4'h2 == col_2 & 2'h0 == row_2 ? 4'h9 : _GEN_263; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_265 = 4'h2 == col_2 & 2'h1 == row_2 ? 4'h0 : _GEN_264; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_266 = 4'h2 == col_2 & 2'h2 == row_2 ? 4'h4 : _GEN_265; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_267 = 4'h2 == col_2 & 2'h3 == row_2 ? 4'hd : _GEN_266; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_268 = 4'h3 == col_2 & 2'h0 == row_2 ? 4'he : _GEN_267; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_269 = 4'h3 == col_2 & 2'h1 == row_2 ? 4'h9 : _GEN_268; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_270 = 4'h3 == col_2 & 2'h2 == row_2 ? 4'h9 : _GEN_269; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_271 = 4'h3 == col_2 & 2'h3 == row_2 ? 4'h0 : _GEN_270; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_272 = 4'h4 == col_2 & 2'h0 == row_2 ? 4'h6 : _GEN_271; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_273 = 4'h4 == col_2 & 2'h1 == row_2 ? 4'h3 : _GEN_272; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_274 = 4'h4 == col_2 & 2'h2 == row_2 ? 4'h8 : _GEN_273; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_275 = 4'h4 == col_2 & 2'h3 == row_2 ? 4'h6 : _GEN_274; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_276 = 4'h5 == col_2 & 2'h0 == row_2 ? 4'h3 : _GEN_275; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_277 = 4'h5 == col_2 & 2'h1 == row_2 ? 4'h4 : _GEN_276; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_278 = 4'h5 == col_2 & 2'h2 == row_2 ? 4'hf : _GEN_277; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_279 = 4'h5 == col_2 & 2'h3 == row_2 ? 4'h9 : _GEN_278; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_280 = 4'h6 == col_2 & 2'h0 == row_2 ? 4'hf : _GEN_279; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_281 = 4'h6 == col_2 & 2'h1 == row_2 ? 4'h6 : _GEN_280; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_282 = 4'h6 == col_2 & 2'h2 == row_2 ? 4'h3 : _GEN_281; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_283 = 4'h6 == col_2 & 2'h3 == row_2 ? 4'h8 : _GEN_282; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_284 = 4'h7 == col_2 & 2'h0 == row_2 ? 4'h5 : _GEN_283; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_285 = 4'h7 == col_2 & 2'h1 == row_2 ? 4'ha : _GEN_284; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_286 = 4'h7 == col_2 & 2'h2 == row_2 ? 4'h0 : _GEN_285; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_287 = 4'h7 == col_2 & 2'h3 == row_2 ? 4'h7 : _GEN_286; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_288 = 4'h8 == col_2 & 2'h0 == row_2 ? 4'h1 : _GEN_287; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_289 = 4'h8 == col_2 & 2'h1 == row_2 ? 4'h2 : _GEN_288; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_290 = 4'h8 == col_2 & 2'h2 == row_2 ? 4'hb : _GEN_289; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_291 = 4'h8 == col_2 & 2'h3 == row_2 ? 4'h4 : _GEN_290; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_292 = 4'h9 == col_2 & 2'h0 == row_2 ? 4'hd : _GEN_291; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_293 = 4'h9 == col_2 & 2'h1 == row_2 ? 4'h8 : _GEN_292; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_294 = 4'h9 == col_2 & 2'h2 == row_2 ? 4'h1 : _GEN_293; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_295 = 4'h9 == col_2 & 2'h3 == row_2 ? 4'hf : _GEN_294; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_296 = 4'ha == col_2 & 2'h0 == row_2 ? 4'hc : _GEN_295; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_297 = 4'ha == col_2 & 2'h1 == row_2 ? 4'h5 : _GEN_296; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_298 = 4'ha == col_2 & 2'h2 == row_2 ? 4'h2 : _GEN_297; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_299 = 4'ha == col_2 & 2'h3 == row_2 ? 4'he : _GEN_298; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_300 = 4'hb == col_2 & 2'h0 == row_2 ? 4'h7 : _GEN_299; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_301 = 4'hb == col_2 & 2'h1 == row_2 ? 4'he : _GEN_300; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_302 = 4'hb == col_2 & 2'h2 == row_2 ? 4'hc : _GEN_301; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_303 = 4'hb == col_2 & 2'h3 == row_2 ? 4'h3 : _GEN_302; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_304 = 4'hc == col_2 & 2'h0 == row_2 ? 4'hb : _GEN_303; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_305 = 4'hc == col_2 & 2'h1 == row_2 ? 4'hc : _GEN_304; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_306 = 4'hc == col_2 & 2'h2 == row_2 ? 4'h5 : _GEN_305; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_307 = 4'hc == col_2 & 2'h3 == row_2 ? 4'hb : _GEN_306; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_308 = 4'hd == col_2 & 2'h0 == row_2 ? 4'h4 : _GEN_307; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_309 = 4'hd == col_2 & 2'h1 == row_2 ? 4'hb : _GEN_308; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_310 = 4'hd == col_2 & 2'h2 == row_2 ? 4'ha : _GEN_309; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_311 = 4'hd == col_2 & 2'h3 == row_2 ? 4'h5 : _GEN_310; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_312 = 4'he == col_2 & 2'h0 == row_2 ? 4'h2 : _GEN_311; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_313 = 4'he == col_2 & 2'h1 == row_2 ? 4'hf : _GEN_312; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_314 = 4'he == col_2 & 2'h2 == row_2 ? 4'he : _GEN_313; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_315 = 4'he == col_2 & 2'h3 == row_2 ? 4'h2 : _GEN_314; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_316 = 4'hf == col_2 & 2'h0 == row_2 ? 4'h8 : _GEN_315; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_317 = 4'hf == col_2 & 2'h1 == row_2 ? 4'h1 : _GEN_316; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_318 = 4'hf == col_2 & 2'h2 == row_2 ? 4'h7 : _GEN_317; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_319 = 4'hf == col_2 & 2'h3 == row_2 ? 4'hc : _GEN_318; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_321 = 4'h0 == col_3 & 2'h1 == row_3 ? 4'hd : 4'h7; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_322 = 4'h0 == col_3 & 2'h2 == row_3 ? 4'ha : _GEN_321; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_323 = 4'h0 == col_3 & 2'h3 == row_3 ? 4'h3 : _GEN_322; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_324 = 4'h1 == col_3 & 2'h0 == row_3 ? 4'hd : _GEN_323; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_325 = 4'h1 == col_3 & 2'h1 == row_3 ? 4'h8 : _GEN_324; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_326 = 4'h1 == col_3 & 2'h2 == row_3 ? 4'h6 : _GEN_325; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_327 = 4'h1 == col_3 & 2'h3 == row_3 ? 4'hf : _GEN_326; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_328 = 4'h2 == col_3 & 2'h0 == row_3 ? 4'he : _GEN_327; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_329 = 4'h2 == col_3 & 2'h1 == row_3 ? 4'hb : _GEN_328; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_330 = 4'h2 == col_3 & 2'h2 == row_3 ? 4'h9 : _GEN_329; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_331 = 4'h2 == col_3 & 2'h3 == row_3 ? 4'h0 : _GEN_330; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_332 = 4'h3 == col_3 & 2'h0 == row_3 ? 4'h3 : _GEN_331; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_333 = 4'h3 == col_3 & 2'h1 == row_3 ? 4'h5 : _GEN_332; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_334 = 4'h3 == col_3 & 2'h2 == row_3 ? 4'h0 : _GEN_333; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_335 = 4'h3 == col_3 & 2'h3 == row_3 ? 4'h6 : _GEN_334; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_336 = 4'h4 == col_3 & 2'h0 == row_3 ? 4'h0 : _GEN_335; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_337 = 4'h4 == col_3 & 2'h1 == row_3 ? 4'h6 : _GEN_336; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_338 = 4'h4 == col_3 & 2'h2 == row_3 ? 4'hc : _GEN_337; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_339 = 4'h4 == col_3 & 2'h3 == row_3 ? 4'ha : _GEN_338; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_340 = 4'h5 == col_3 & 2'h0 == row_3 ? 4'h6 : _GEN_339; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_341 = 4'h5 == col_3 & 2'h1 == row_3 ? 4'hf : _GEN_340; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_342 = 4'h5 == col_3 & 2'h2 == row_3 ? 4'hb : _GEN_341; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_343 = 4'h5 == col_3 & 2'h3 == row_3 ? 4'h1 : _GEN_342; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_344 = 4'h6 == col_3 & 2'h0 == row_3 ? 4'h9 : _GEN_343; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_345 = 4'h6 == col_3 & 2'h1 == row_3 ? 4'h0 : _GEN_344; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_346 = 4'h6 == col_3 & 2'h2 == row_3 ? 4'h7 : _GEN_345; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_347 = 4'h6 == col_3 & 2'h3 == row_3 ? 4'hd : _GEN_346; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_348 = 4'h7 == col_3 & 2'h0 == row_3 ? 4'ha : _GEN_347; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_349 = 4'h7 == col_3 & 2'h1 == row_3 ? 4'h3 : _GEN_348; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_350 = 4'h7 == col_3 & 2'h2 == row_3 ? 4'hd : _GEN_349; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_351 = 4'h7 == col_3 & 2'h3 == row_3 ? 4'h8 : _GEN_350; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_352 = 4'h8 == col_3 & 2'h0 == row_3 ? 4'h1 : _GEN_351; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_353 = 4'h8 == col_3 & 2'h1 == row_3 ? 4'h4 : _GEN_352; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_354 = 4'h8 == col_3 & 2'h2 == row_3 ? 4'hf : _GEN_353; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_355 = 4'h8 == col_3 & 2'h3 == row_3 ? 4'h9 : _GEN_354; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_356 = 4'h9 == col_3 & 2'h0 == row_3 ? 4'h2 : _GEN_355; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_357 = 4'h9 == col_3 & 2'h1 == row_3 ? 4'h7 : _GEN_356; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_358 = 4'h9 == col_3 & 2'h2 == row_3 ? 4'h1 : _GEN_357; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_359 = 4'h9 == col_3 & 2'h3 == row_3 ? 4'h4 : _GEN_358; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_360 = 4'ha == col_3 & 2'h0 == row_3 ? 4'h8 : _GEN_359; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_361 = 4'ha == col_3 & 2'h1 == row_3 ? 4'h2 : _GEN_360; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_362 = 4'ha == col_3 & 2'h2 == row_3 ? 4'h3 : _GEN_361; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_363 = 4'ha == col_3 & 2'h3 == row_3 ? 4'h5 : _GEN_362; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_364 = 4'hb == col_3 & 2'h0 == row_3 ? 4'h5 : _GEN_363; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_365 = 4'hb == col_3 & 2'h1 == row_3 ? 4'hc : _GEN_364; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_366 = 4'hb == col_3 & 2'h2 == row_3 ? 4'he : _GEN_365; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_367 = 4'hb == col_3 & 2'h3 == row_3 ? 4'hb : _GEN_366; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_368 = 4'hc == col_3 & 2'h0 == row_3 ? 4'hb : _GEN_367; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_369 = 4'hc == col_3 & 2'h1 == row_3 ? 4'h1 : _GEN_368; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_370 = 4'hc == col_3 & 2'h2 == row_3 ? 4'h5 : _GEN_369; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_371 = 4'hc == col_3 & 2'h3 == row_3 ? 4'hc : _GEN_370; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_372 = 4'hd == col_3 & 2'h0 == row_3 ? 4'hc : _GEN_371; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_373 = 4'hd == col_3 & 2'h1 == row_3 ? 4'ha : _GEN_372; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_374 = 4'hd == col_3 & 2'h2 == row_3 ? 4'h2 : _GEN_373; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_375 = 4'hd == col_3 & 2'h3 == row_3 ? 4'h7 : _GEN_374; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_376 = 4'he == col_3 & 2'h0 == row_3 ? 4'h4 : _GEN_375; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_377 = 4'he == col_3 & 2'h1 == row_3 ? 4'he : _GEN_376; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_378 = 4'he == col_3 & 2'h2 == row_3 ? 4'h8 : _GEN_377; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_379 = 4'he == col_3 & 2'h3 == row_3 ? 4'h2 : _GEN_378; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_380 = 4'hf == col_3 & 2'h0 == row_3 ? 4'hf : _GEN_379; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_381 = 4'hf == col_3 & 2'h1 == row_3 ? 4'h9 : _GEN_380; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_382 = 4'hf == col_3 & 2'h2 == row_3 ? 4'h4 : _GEN_381; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_383 = 4'hf == col_3 & 2'h3 == row_3 ? 4'he : _GEN_382; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_385 = 4'h0 == col_0 & 2'h1 == row_0 ? 4'h0 : 4'he; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_386 = 4'h0 == col_0 & 2'h2 == row_0 ? 4'h4 : _GEN_385; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_387 = 4'h0 == col_0 & 2'h3 == row_0 ? 4'hf : _GEN_386; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_388 = 4'h1 == col_0 & 2'h0 == row_0 ? 4'h4 : _GEN_387; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_389 = 4'h1 == col_0 & 2'h1 == row_0 ? 4'hf : _GEN_388; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_390 = 4'h1 == col_0 & 2'h2 == row_0 ? 4'h1 : _GEN_389; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_391 = 4'h1 == col_0 & 2'h3 == row_0 ? 4'hc : _GEN_390; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_392 = 4'h2 == col_0 & 2'h0 == row_0 ? 4'hd : _GEN_391; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_393 = 4'h2 == col_0 & 2'h1 == row_0 ? 4'h7 : _GEN_392; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_394 = 4'h2 == col_0 & 2'h2 == row_0 ? 4'he : _GEN_393; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_395 = 4'h2 == col_0 & 2'h3 == row_0 ? 4'h8 : _GEN_394; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_396 = 4'h3 == col_0 & 2'h0 == row_0 ? 4'h1 : _GEN_395; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_397 = 4'h3 == col_0 & 2'h1 == row_0 ? 4'h4 : _GEN_396; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_398 = 4'h3 == col_0 & 2'h2 == row_0 ? 4'h8 : _GEN_397; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_399 = 4'h3 == col_0 & 2'h3 == row_0 ? 4'h2 : _GEN_398; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_400 = 4'h4 == col_0 & 2'h0 == row_0 ? 4'h2 : _GEN_399; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_401 = 4'h4 == col_0 & 2'h1 == row_0 ? 4'he : _GEN_400; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_402 = 4'h4 == col_0 & 2'h2 == row_0 ? 4'hd : _GEN_401; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_403 = 4'h4 == col_0 & 2'h3 == row_0 ? 4'h4 : _GEN_402; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_404 = 4'h5 == col_0 & 2'h0 == row_0 ? 4'hf : _GEN_403; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_405 = 4'h5 == col_0 & 2'h1 == row_0 ? 4'h2 : _GEN_404; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_406 = 4'h5 == col_0 & 2'h2 == row_0 ? 4'h6 : _GEN_405; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_407 = 4'h5 == col_0 & 2'h3 == row_0 ? 4'h9 : _GEN_406; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_408 = 4'h6 == col_0 & 2'h0 == row_0 ? 4'hb : _GEN_407; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_409 = 4'h6 == col_0 & 2'h1 == row_0 ? 4'hd : _GEN_408; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_410 = 4'h6 == col_0 & 2'h2 == row_0 ? 4'h2 : _GEN_409; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_411 = 4'h6 == col_0 & 2'h3 == row_0 ? 4'h1 : _GEN_410; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_412 = 4'h7 == col_0 & 2'h0 == row_0 ? 4'h8 : _GEN_411; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_413 = 4'h7 == col_0 & 2'h1 == row_0 ? 4'h1 : _GEN_412; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_414 = 4'h7 == col_0 & 2'h2 == row_0 ? 4'hb : _GEN_413; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_415 = 4'h7 == col_0 & 2'h3 == row_0 ? 4'h7 : _GEN_414; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_416 = 4'h8 == col_0 & 2'h0 == row_0 ? 4'h3 : _GEN_415; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_417 = 4'h8 == col_0 & 2'h1 == row_0 ? 4'ha : _GEN_416; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_418 = 4'h8 == col_0 & 2'h2 == row_0 ? 4'hf : _GEN_417; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_419 = 4'h8 == col_0 & 2'h3 == row_0 ? 4'h5 : _GEN_418; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_420 = 4'h9 == col_0 & 2'h0 == row_0 ? 4'ha : _GEN_419; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_421 = 4'h9 == col_0 & 2'h1 == row_0 ? 4'h6 : _GEN_420; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_422 = 4'h9 == col_0 & 2'h2 == row_0 ? 4'hc : _GEN_421; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_423 = 4'h9 == col_0 & 2'h3 == row_0 ? 4'hb : _GEN_422; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_424 = 4'ha == col_0 & 2'h0 == row_0 ? 4'h6 : _GEN_423; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_425 = 4'ha == col_0 & 2'h1 == row_0 ? 4'hc : _GEN_424; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_426 = 4'ha == col_0 & 2'h2 == row_0 ? 4'h9 : _GEN_425; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_427 = 4'ha == col_0 & 2'h3 == row_0 ? 4'h3 : _GEN_426; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_428 = 4'hb == col_0 & 2'h0 == row_0 ? 4'hc : _GEN_427; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_429 = 4'hb == col_0 & 2'h1 == row_0 ? 4'hb : _GEN_428; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_430 = 4'hb == col_0 & 2'h2 == row_0 ? 4'h7 : _GEN_429; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_431 = 4'hb == col_0 & 2'h3 == row_0 ? 4'he : _GEN_430; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_432 = 4'hc == col_0 & 2'h0 == row_0 ? 4'h5 : _GEN_431; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_433 = 4'hc == col_0 & 2'h1 == row_0 ? 4'h9 : _GEN_432; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_434 = 4'hc == col_0 & 2'h2 == row_0 ? 4'h3 : _GEN_433; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_435 = 4'hc == col_0 & 2'h3 == row_0 ? 4'ha : _GEN_434; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_436 = 4'hd == col_0 & 2'h0 == row_0 ? 4'h9 : _GEN_435; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_437 = 4'hd == col_0 & 2'h1 == row_0 ? 4'h5 : _GEN_436; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_438 = 4'hd == col_0 & 2'h2 == row_0 ? 4'ha : _GEN_437; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_439 = 4'hd == col_0 & 2'h3 == row_0 ? 4'h0 : _GEN_438; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_440 = 4'he == col_0 & 2'h0 == row_0 ? 4'h0 : _GEN_439; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_441 = 4'he == col_0 & 2'h1 == row_0 ? 4'h3 : _GEN_440; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_442 = 4'he == col_0 & 2'h2 == row_0 ? 4'h5 : _GEN_441; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_443 = 4'he == col_0 & 2'h3 == row_0 ? 4'h6 : _GEN_442; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_444 = 4'hf == col_0 & 2'h0 == row_0 ? 4'h7 : _GEN_443; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_445 = 4'hf == col_0 & 2'h1 == row_0 ? 4'h8 : _GEN_444; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_446 = 4'hf == col_0 & 2'h2 == row_0 ? 4'h0 : _GEN_445; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_447 = 4'hf == col_0 & 2'h3 == row_0 ? 4'hd : _GEN_446; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_449 = 4'h0 == col_1 & 2'h1 == row_1 ? 4'h3 : 4'hf; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_450 = 4'h0 == col_1 & 2'h2 == row_1 ? 4'h0 : _GEN_449; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_451 = 4'h0 == col_1 & 2'h3 == row_1 ? 4'hd : _GEN_450; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_452 = 4'h1 == col_1 & 2'h0 == row_1 ? 4'h1 : _GEN_451; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_453 = 4'h1 == col_1 & 2'h1 == row_1 ? 4'hd : _GEN_452; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_454 = 4'h1 == col_1 & 2'h2 == row_1 ? 4'he : _GEN_453; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_455 = 4'h1 == col_1 & 2'h3 == row_1 ? 4'h8 : _GEN_454; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_456 = 4'h2 == col_1 & 2'h0 == row_1 ? 4'h8 : _GEN_455; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_457 = 4'h2 == col_1 & 2'h1 == row_1 ? 4'h4 : _GEN_456; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_458 = 4'h2 == col_1 & 2'h2 == row_1 ? 4'h7 : _GEN_457; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_459 = 4'h2 == col_1 & 2'h3 == row_1 ? 4'ha : _GEN_458; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_460 = 4'h3 == col_1 & 2'h0 == row_1 ? 4'he : _GEN_459; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_461 = 4'h3 == col_1 & 2'h1 == row_1 ? 4'h7 : _GEN_460; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_462 = 4'h3 == col_1 & 2'h2 == row_1 ? 4'hb : _GEN_461; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_463 = 4'h3 == col_1 & 2'h3 == row_1 ? 4'h1 : _GEN_462; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_464 = 4'h4 == col_1 & 2'h0 == row_1 ? 4'h6 : _GEN_463; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_465 = 4'h4 == col_1 & 2'h1 == row_1 ? 4'hf : _GEN_464; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_466 = 4'h4 == col_1 & 2'h2 == row_1 ? 4'ha : _GEN_465; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_467 = 4'h4 == col_1 & 2'h3 == row_1 ? 4'h3 : _GEN_466; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_468 = 4'h5 == col_1 & 2'h0 == row_1 ? 4'hb : _GEN_467; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_469 = 4'h5 == col_1 & 2'h1 == row_1 ? 4'h2 : _GEN_468; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_470 = 4'h5 == col_1 & 2'h2 == row_1 ? 4'h4 : _GEN_469; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_471 = 4'h5 == col_1 & 2'h3 == row_1 ? 4'hf : _GEN_470; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_472 = 4'h6 == col_1 & 2'h0 == row_1 ? 4'h3 : _GEN_471; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_473 = 4'h6 == col_1 & 2'h1 == row_1 ? 4'h8 : _GEN_472; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_474 = 4'h6 == col_1 & 2'h2 == row_1 ? 4'hd : _GEN_473; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_475 = 4'h6 == col_1 & 2'h3 == row_1 ? 4'h4 : _GEN_474; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_476 = 4'h7 == col_1 & 2'h0 == row_1 ? 4'h4 : _GEN_475; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_477 = 4'h7 == col_1 & 2'h1 == row_1 ? 4'he : _GEN_476; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_478 = 4'h7 == col_1 & 2'h2 == row_1 ? 4'h1 : _GEN_477; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_479 = 4'h7 == col_1 & 2'h3 == row_1 ? 4'h2 : _GEN_478; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_480 = 4'h8 == col_1 & 2'h0 == row_1 ? 4'h9 : _GEN_479; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_481 = 4'h8 == col_1 & 2'h1 == row_1 ? 4'hc : _GEN_480; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_482 = 4'h8 == col_1 & 2'h2 == row_1 ? 4'h5 : _GEN_481; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_483 = 4'h8 == col_1 & 2'h3 == row_1 ? 4'hb : _GEN_482; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_484 = 4'h9 == col_1 & 2'h0 == row_1 ? 4'h7 : _GEN_483; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_485 = 4'h9 == col_1 & 2'h1 == row_1 ? 4'h0 : _GEN_484; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_486 = 4'h9 == col_1 & 2'h2 == row_1 ? 4'h8 : _GEN_485; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_487 = 4'h9 == col_1 & 2'h3 == row_1 ? 4'h6 : _GEN_486; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_488 = 4'ha == col_1 & 2'h0 == row_1 ? 4'h2 : _GEN_487; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_489 = 4'ha == col_1 & 2'h1 == row_1 ? 4'h1 : _GEN_488; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_490 = 4'ha == col_1 & 2'h2 == row_1 ? 4'hc : _GEN_489; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_491 = 4'ha == col_1 & 2'h3 == row_1 ? 4'h7 : _GEN_490; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_492 = 4'hb == col_1 & 2'h0 == row_1 ? 4'hd : _GEN_491; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_493 = 4'hb == col_1 & 2'h1 == row_1 ? 4'ha : _GEN_492; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_494 = 4'hb == col_1 & 2'h2 == row_1 ? 4'h6 : _GEN_493; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_495 = 4'hb == col_1 & 2'h3 == row_1 ? 4'hc : _GEN_494; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_496 = 4'hc == col_1 & 2'h0 == row_1 ? 4'hc : _GEN_495; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_497 = 4'hc == col_1 & 2'h1 == row_1 ? 4'h6 : _GEN_496; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_498 = 4'hc == col_1 & 2'h2 == row_1 ? 4'h9 : _GEN_497; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_499 = 4'hc == col_1 & 2'h3 == row_1 ? 4'h0 : _GEN_498; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_500 = 4'hd == col_1 & 2'h0 == row_1 ? 4'h0 : _GEN_499; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_501 = 4'hd == col_1 & 2'h1 == row_1 ? 4'h9 : _GEN_500; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_502 = 4'hd == col_1 & 2'h2 == row_1 ? 4'h3 : _GEN_501; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_503 = 4'hd == col_1 & 2'h3 == row_1 ? 4'h5 : _GEN_502; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_504 = 4'he == col_1 & 2'h0 == row_1 ? 4'h5 : _GEN_503; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_505 = 4'he == col_1 & 2'h1 == row_1 ? 4'hb : _GEN_504; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_506 = 4'he == col_1 & 2'h2 == row_1 ? 4'h2 : _GEN_505; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_507 = 4'he == col_1 & 2'h3 == row_1 ? 4'he : _GEN_506; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_508 = 4'hf == col_1 & 2'h0 == row_1 ? 4'ha : _GEN_507; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_509 = 4'hf == col_1 & 2'h1 == row_1 ? 4'h5 : _GEN_508; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_510 = 4'hf == col_1 & 2'h2 == row_1 ? 4'hf : _GEN_509; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_511 = 4'hf == col_1 & 2'h3 == row_1 ? 4'h9 : _GEN_510; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [15:0] hi_8 = {_GEN_447,_GEN_511,_GEN_319,_GEN_383}; // @[Cat.scala 30:58]
  assign io_out = {hi_8,lo_8}; // @[Cat.scala 30:58]
endmodule
module DES_P(
  input  [31:0] io_in,
  output [31:0] io_out
);
  wire [31:0] _T_3 = {{16'd0}, io_in[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_5 = {io_in[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_7 = _T_5 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_8 = _T_3 | _T_7; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_0 = {{8'd0}, _T_8[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_13 = _GEN_0 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_15 = {_T_8[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_17 = _T_15 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_18 = _T_13 | _T_17; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_1 = {{4'd0}, _T_18[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_23 = _GEN_1 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_25 = {_T_18[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_27 = _T_25 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_28 = _T_23 | _T_27; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_2 = {{2'd0}, _T_28[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_33 = _GEN_2 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_35 = {_T_28[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_37 = _T_35 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_38 = _T_33 | _T_37; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_3 = {{1'd0}, _T_38[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_43 = _GEN_3 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_45 = {_T_38[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_47 = _T_45 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [31:0] reversed = _T_43 | _T_47; // @[Bitwise.scala 103:39]
  wire  hi_hi_hi_hi_hi = reversed[15]; // @[DES_EncryptionPipelinedElasticBuffer.scala 473:25]
  wire  hi_hi_hi_hi_lo = reversed[6]; // @[DES_EncryptionPipelinedElasticBuffer.scala 473:38]
  wire  hi_hi_hi_lo_hi = reversed[19]; // @[DES_EncryptionPipelinedElasticBuffer.scala 473:50]
  wire  hi_hi_hi_lo_lo = reversed[20]; // @[DES_EncryptionPipelinedElasticBuffer.scala 473:63]
  wire  hi_hi_lo_hi_hi = reversed[28]; // @[DES_EncryptionPipelinedElasticBuffer.scala 474:13]
  wire  hi_hi_lo_hi_lo = reversed[11]; // @[DES_EncryptionPipelinedElasticBuffer.scala 474:26]
  wire  hi_hi_lo_lo_hi = reversed[27]; // @[DES_EncryptionPipelinedElasticBuffer.scala 474:39]
  wire  hi_hi_lo_lo_lo = reversed[16]; // @[DES_EncryptionPipelinedElasticBuffer.scala 474:52]
  wire  hi_lo_hi_hi_hi = reversed[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 475:13]
  wire  hi_lo_hi_hi_lo = reversed[14]; // @[DES_EncryptionPipelinedElasticBuffer.scala 475:25]
  wire  hi_lo_hi_lo_hi = reversed[22]; // @[DES_EncryptionPipelinedElasticBuffer.scala 475:38]
  wire  hi_lo_hi_lo_lo = reversed[25]; // @[DES_EncryptionPipelinedElasticBuffer.scala 475:51]
  wire  hi_lo_lo_hi_hi = reversed[4]; // @[DES_EncryptionPipelinedElasticBuffer.scala 476:13]
  wire  hi_lo_lo_hi_lo = reversed[17]; // @[DES_EncryptionPipelinedElasticBuffer.scala 476:25]
  wire  hi_lo_lo_lo_hi = reversed[30]; // @[DES_EncryptionPipelinedElasticBuffer.scala 476:38]
  wire  hi_lo_lo_lo_lo = reversed[9]; // @[DES_EncryptionPipelinedElasticBuffer.scala 476:51]
  wire  lo_hi_hi_hi_hi = reversed[1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 477:13]
  wire  lo_hi_hi_hi_lo = reversed[7]; // @[DES_EncryptionPipelinedElasticBuffer.scala 477:25]
  wire  lo_hi_hi_lo_hi = reversed[23]; // @[DES_EncryptionPipelinedElasticBuffer.scala 477:37]
  wire  lo_hi_hi_lo_lo = reversed[13]; // @[DES_EncryptionPipelinedElasticBuffer.scala 477:50]
  wire  lo_hi_lo_hi_hi = reversed[31]; // @[DES_EncryptionPipelinedElasticBuffer.scala 478:13]
  wire  lo_hi_lo_hi_lo = reversed[26]; // @[DES_EncryptionPipelinedElasticBuffer.scala 478:26]
  wire  lo_hi_lo_lo_hi = reversed[2]; // @[DES_EncryptionPipelinedElasticBuffer.scala 478:39]
  wire  lo_hi_lo_lo_lo = reversed[8]; // @[DES_EncryptionPipelinedElasticBuffer.scala 478:51]
  wire  lo_lo_hi_hi_hi = reversed[18]; // @[DES_EncryptionPipelinedElasticBuffer.scala 479:13]
  wire  lo_lo_hi_hi_lo = reversed[12]; // @[DES_EncryptionPipelinedElasticBuffer.scala 479:26]
  wire  lo_lo_hi_lo_hi = reversed[29]; // @[DES_EncryptionPipelinedElasticBuffer.scala 479:39]
  wire  lo_lo_hi_lo_lo = reversed[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 479:52]
  wire  lo_lo_lo_hi_hi = reversed[21]; // @[DES_EncryptionPipelinedElasticBuffer.scala 480:13]
  wire  lo_lo_lo_hi_lo = reversed[10]; // @[DES_EncryptionPipelinedElasticBuffer.scala 480:26]
  wire  lo_lo_lo_lo_hi = reversed[3]; // @[DES_EncryptionPipelinedElasticBuffer.scala 480:39]
  wire  lo_lo_lo_lo_lo = reversed[24]; // @[DES_EncryptionPipelinedElasticBuffer.scala 480:51]
  wire [7:0] lo_lo = {lo_lo_hi_hi_hi,lo_lo_hi_hi_lo,lo_lo_hi_lo_hi,lo_lo_hi_lo_lo,lo_lo_lo_hi_hi,lo_lo_lo_hi_lo,
    lo_lo_lo_lo_hi,lo_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [15:0] lo = {lo_hi_hi_hi_hi,lo_hi_hi_hi_lo,lo_hi_hi_lo_hi,lo_hi_hi_lo_lo,lo_hi_lo_hi_hi,lo_hi_lo_hi_lo,
    lo_hi_lo_lo_hi,lo_hi_lo_lo_lo,lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] hi_lo = {hi_lo_hi_hi_hi,hi_lo_hi_hi_lo,hi_lo_hi_lo_hi,hi_lo_hi_lo_lo,hi_lo_lo_hi_hi,hi_lo_lo_hi_lo,
    hi_lo_lo_lo_hi,hi_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [15:0] hi = {hi_hi_hi_hi_hi,hi_hi_hi_hi_lo,hi_hi_hi_lo_hi,hi_hi_hi_lo_lo,hi_hi_lo_hi_hi,hi_hi_lo_hi_lo,
    hi_hi_lo_lo_hi,hi_hi_lo_lo_lo,hi_lo}; // @[Cat.scala 30:58]
  assign io_out = {hi,lo}; // @[Cat.scala 30:58]
endmodule
module DES_f(
  input  [31:0] io_R,
  input  [47:0] io_K,
  output [31:0] io_out
);
  wire [31:0] E_io_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 298:17]
  wire [47:0] E_io_E; // @[DES_EncryptionPipelinedElasticBuffer.scala 298:17]
  wire [47:0] S_io_in; // @[DES_EncryptionPipelinedElasticBuffer.scala 301:17]
  wire [31:0] S_io_out; // @[DES_EncryptionPipelinedElasticBuffer.scala 301:17]
  wire [31:0] P_io_in; // @[DES_EncryptionPipelinedElasticBuffer.scala 304:17]
  wire [31:0] P_io_out; // @[DES_EncryptionPipelinedElasticBuffer.scala 304:17]
  DES_E E ( // @[DES_EncryptionPipelinedElasticBuffer.scala 298:17]
    .io_R(E_io_R),
    .io_E(E_io_E)
  );
  DES_S S ( // @[DES_EncryptionPipelinedElasticBuffer.scala 301:17]
    .io_in(S_io_in),
    .io_out(S_io_out)
  );
  DES_P P ( // @[DES_EncryptionPipelinedElasticBuffer.scala 304:17]
    .io_in(P_io_in),
    .io_out(P_io_out)
  );
  assign io_out = P_io_out; // @[DES_EncryptionPipelinedElasticBuffer.scala 306:10]
  assign E_io_R = io_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 299:10]
  assign S_io_in = E_io_E ^ io_K; // @[DES_EncryptionPipelinedElasticBuffer.scala 302:21]
  assign P_io_in = S_io_out; // @[DES_EncryptionPipelinedElasticBuffer.scala 305:11]
endmodule
module DES_ProcessingElement(
  input         clock,
  input         reset,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_L,
  output [31:0] io_out_bits_R,
  output [27:0] io_out_bits_C,
  output [27:0] io_out_bits_D,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_L,
  input  [31:0] io_in_bits_R,
  input  [27:0] io_in_bits_C,
  input  [27:0] io_in_bits_D
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  wire [27:0] keys_io_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 132:20]
  wire [27:0] keys_io_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 132:20]
  wire [27:0] keys_io_C_next; // @[DES_EncryptionPipelinedElasticBuffer.scala 132:20]
  wire [27:0] keys_io_D_next; // @[DES_EncryptionPipelinedElasticBuffer.scala 132:20]
  wire [47:0] keys_io_K; // @[DES_EncryptionPipelinedElasticBuffer.scala 132:20]
  wire [31:0] f_io_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 136:17]
  wire [47:0] f_io_K; // @[DES_EncryptionPipelinedElasticBuffer.scala 136:17]
  wire [31:0] f_io_out; // @[DES_EncryptionPipelinedElasticBuffer.scala 136:17]
  reg [31:0] data_0_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [31:0] data_0_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [27:0] data_0_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [27:0] data_0_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [31:0] data_1_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [31:0] data_1_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [27:0] data_1_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [27:0] data_1_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg  head; // @[DES_EncryptionPipelinedElasticBuffer.scala 109:21]
  reg  tail; // @[DES_EncryptionPipelinedElasticBuffer.scala 110:21]
  reg  full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  reg  full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  wire [31:0] input_L = head ? data_1_L : data_0_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 116:9 DES_EncryptionPipelinedElasticBuffer.scala 116:9]
  wire  _GEN_9 = tail ? full_1 : full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 119:23 DES_EncryptionPipelinedElasticBuffer.scala 119:23]
  wire  _GEN_38 = ~tail; // @[DES_EncryptionPipelinedElasticBuffer.scala 120:16 DES_EncryptionPipelinedElasticBuffer.scala 120:16 DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  wire  _GEN_10 = ~tail | full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 120:16 DES_EncryptionPipelinedElasticBuffer.scala 120:16 DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  wire  _GEN_11 = tail | full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 120:16 DES_EncryptionPipelinedElasticBuffer.scala 120:16 DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  wire  _GEN_20 = io_in_valid & ~_GEN_9 ? _GEN_10 : full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36 DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  wire  _GEN_21 = io_in_valid & ~_GEN_9 ? _GEN_11 : full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36 DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  wire  _GEN_32 = head ? full_1 : full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 126:21 DES_EncryptionPipelinedElasticBuffer.scala 126:21]
  DES_keys keys ( // @[DES_EncryptionPipelinedElasticBuffer.scala 132:20]
    .io_C(keys_io_C),
    .io_D(keys_io_D),
    .io_C_next(keys_io_C_next),
    .io_D_next(keys_io_D_next),
    .io_K(keys_io_K)
  );
  DES_f f ( // @[DES_EncryptionPipelinedElasticBuffer.scala 136:17]
    .io_R(f_io_R),
    .io_K(f_io_K),
    .io_out(f_io_out)
  );
  assign io_out_valid = full_0 | full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 114:27]
  assign io_out_bits_L = head ? data_1_R : data_0_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 116:9 DES_EncryptionPipelinedElasticBuffer.scala 116:9]
  assign io_out_bits_R = input_L ^ f_io_out; // @[DES_EncryptionPipelinedElasticBuffer.scala 141:23]
  assign io_out_bits_C = keys_io_C_next; // @[DES_EncryptionPipelinedElasticBuffer.scala 107:27 DES_EncryptionPipelinedElasticBuffer.scala 142:12]
  assign io_out_bits_D = keys_io_D_next; // @[DES_EncryptionPipelinedElasticBuffer.scala 107:27 DES_EncryptionPipelinedElasticBuffer.scala 143:12]
  assign io_in_ready = ~(full_0 & full_1); // @[DES_EncryptionPipelinedElasticBuffer.scala 113:18]
  assign keys_io_C = head ? data_1_C : data_0_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 116:9 DES_EncryptionPipelinedElasticBuffer.scala 116:9]
  assign keys_io_D = head ? data_1_D : data_0_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 116:9 DES_EncryptionPipelinedElasticBuffer.scala 116:9]
  assign f_io_R = head ? data_1_R : data_0_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 116:9 DES_EncryptionPipelinedElasticBuffer.scala 116:9]
  assign f_io_K = keys_io_K; // @[DES_EncryptionPipelinedElasticBuffer.scala 138:10]
  always @(posedge clock) begin
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_0_L <= 32'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (~tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_0_L <= io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_0_R <= 32'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (~tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_0_R <= io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_0_C <= 28'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (~tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_0_C <= io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_0_D <= 28'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (~tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_0_D <= io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_1_L <= 32'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_1_L <= io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_1_R <= 32'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_1_R <= io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_1_C <= 28'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_1_C <= io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_1_D <= 28'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_1_D <= io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 109:21]
      head <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 109:21]
    end else if (io_out_ready & _GEN_32) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 126:36]
      head <= ~head; // @[DES_EncryptionPipelinedElasticBuffer.scala 128:10]
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 110:21]
      tail <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 110:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      tail <= _GEN_38; // @[DES_EncryptionPipelinedElasticBuffer.scala 122:10]
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 111:21]
      full_0 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 111:21]
    end else if (io_out_ready & _GEN_32) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 126:36]
      if (~head) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 127:16]
        full_0 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 127:16]
      end else begin
        full_0 <= _GEN_20;
      end
    end else begin
      full_0 <= _GEN_20;
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 111:21]
      full_1 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 111:21]
    end else if (io_out_ready & _GEN_32) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 126:36]
      if (head) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 127:16]
        full_1 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 127:16]
      end else begin
        full_1 <= _GEN_21;
      end
    end else begin
      full_1 <= _GEN_21;
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
  data_0_L = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  data_0_R = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  data_0_C = _RAND_2[27:0];
  _RAND_3 = {1{`RANDOM}};
  data_0_D = _RAND_3[27:0];
  _RAND_4 = {1{`RANDOM}};
  data_1_L = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  data_1_R = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  data_1_C = _RAND_6[27:0];
  _RAND_7 = {1{`RANDOM}};
  data_1_D = _RAND_7[27:0];
  _RAND_8 = {1{`RANDOM}};
  head = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  tail = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  full_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  full_1 = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DES_keys_2(
  input  [27:0] io_C,
  input  [27:0] io_D,
  output [27:0] io_C_next,
  output [27:0] io_D_next,
  output [47:0] io_K
);
  wire [25:0] hi = io_C[25:0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 273:26]
  wire [1:0] lo = io_C[27:26]; // @[DES_EncryptionPipelinedElasticBuffer.scala 273:37]
  wire [25:0] hi_1 = io_D[25:0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 274:26]
  wire [1:0] lo_1 = io_D[27:26]; // @[DES_EncryptionPipelinedElasticBuffer.scala 274:37]
  wire [55:0] _T_2 = {hi,lo,hi_1,lo_1}; // @[Cat.scala 30:58]
  wire [31:0] _T_7 = {{16'd0}, _T_2[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_9 = {_T_2[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_11 = _T_9 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_12 = _T_7 | _T_11; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_0 = {{8'd0}, _T_12[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_17 = _GEN_0 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_19 = {_T_12[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_21 = _T_19 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_22 = _T_17 | _T_21; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_1 = {{4'd0}, _T_22[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_27 = _GEN_1 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_29 = {_T_22[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_31 = _T_29 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_32 = _T_27 | _T_31; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_2 = {{2'd0}, _T_32[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_37 = _GEN_2 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_39 = {_T_32[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_41 = _T_39 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_42 = _T_37 | _T_41; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_3 = {{1'd0}, _T_42[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_47 = _GEN_3 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_49 = {_T_42[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_51 = _T_49 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [31:0] hi_2 = _T_47 | _T_51; // @[Bitwise.scala 103:39]
  wire [15:0] _T_57 = {{8'd0}, _T_2[47:40]}; // @[Bitwise.scala 103:31]
  wire [15:0] _T_59 = {_T_2[39:32], 8'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _T_61 = _T_59 & 16'hff00; // @[Bitwise.scala 103:75]
  wire [15:0] _T_62 = _T_57 | _T_61; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_4 = {{4'd0}, _T_62[15:4]}; // @[Bitwise.scala 103:31]
  wire [15:0] _T_67 = _GEN_4 & 16'hf0f; // @[Bitwise.scala 103:31]
  wire [15:0] _T_69 = {_T_62[11:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _T_71 = _T_69 & 16'hf0f0; // @[Bitwise.scala 103:75]
  wire [15:0] _T_72 = _T_67 | _T_71; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_5 = {{2'd0}, _T_72[15:2]}; // @[Bitwise.scala 103:31]
  wire [15:0] _T_77 = _GEN_5 & 16'h3333; // @[Bitwise.scala 103:31]
  wire [15:0] _T_79 = {_T_72[13:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _T_81 = _T_79 & 16'hcccc; // @[Bitwise.scala 103:75]
  wire [15:0] _T_82 = _T_77 | _T_81; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_6 = {{1'd0}, _T_82[15:1]}; // @[Bitwise.scala 103:31]
  wire [15:0] _T_87 = _GEN_6 & 16'h5555; // @[Bitwise.scala 103:31]
  wire [15:0] _T_89 = {_T_82[14:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _T_91 = _T_89 & 16'haaaa; // @[Bitwise.scala 103:75]
  wire [15:0] hi_3 = _T_87 | _T_91; // @[Bitwise.scala 103:39]
  wire [7:0] _T_96 = {{4'd0}, _T_2[55:52]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_98 = {_T_2[51:48], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_100 = _T_98 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_101 = _T_96 | _T_100; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_7 = {{2'd0}, _T_101[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_106 = _GEN_7 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_108 = {_T_101[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_110 = _T_108 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_111 = _T_106 | _T_110; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_8 = {{1'd0}, _T_111[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_116 = _GEN_8 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_118 = {_T_111[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_120 = _T_118 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] lo_2 = _T_116 | _T_120; // @[Bitwise.scala 103:39]
  wire [55:0] concat = {hi_2,hi_3,lo_2}; // @[Cat.scala 30:58]
  wire  hi_hi_hi_hi_hi_hi = concat[13]; // @[DES_EncryptionPipelinedElasticBuffer.scala 281:21]
  wire  hi_hi_hi_hi_hi_lo = concat[16]; // @[DES_EncryptionPipelinedElasticBuffer.scala 281:32]
  wire  hi_hi_hi_hi_lo = concat[10]; // @[DES_EncryptionPipelinedElasticBuffer.scala 281:43]
  wire  hi_hi_hi_lo_hi_hi = concat[23]; // @[DES_EncryptionPipelinedElasticBuffer.scala 281:54]
  wire  hi_hi_hi_lo_hi_lo = concat[0]; // @[DES_EncryptionPipelinedElasticBuffer.scala 281:65]
  wire  hi_hi_hi_lo_lo = concat[4]; // @[DES_EncryptionPipelinedElasticBuffer.scala 281:75]
  wire  hi_hi_lo_hi_hi_hi = concat[2]; // @[DES_EncryptionPipelinedElasticBuffer.scala 282:11]
  wire  hi_hi_lo_hi_hi_lo = concat[27]; // @[DES_EncryptionPipelinedElasticBuffer.scala 282:21]
  wire  hi_hi_lo_hi_lo = concat[14]; // @[DES_EncryptionPipelinedElasticBuffer.scala 282:32]
  wire  hi_hi_lo_lo_hi_hi = concat[5]; // @[DES_EncryptionPipelinedElasticBuffer.scala 282:43]
  wire  hi_hi_lo_lo_hi_lo = concat[20]; // @[DES_EncryptionPipelinedElasticBuffer.scala 282:53]
  wire  hi_hi_lo_lo_lo = concat[9]; // @[DES_EncryptionPipelinedElasticBuffer.scala 282:64]
  wire  hi_lo_hi_hi_hi_hi = concat[22]; // @[DES_EncryptionPipelinedElasticBuffer.scala 283:11]
  wire  hi_lo_hi_hi_hi_lo = concat[18]; // @[DES_EncryptionPipelinedElasticBuffer.scala 283:22]
  wire  hi_lo_hi_hi_lo = concat[11]; // @[DES_EncryptionPipelinedElasticBuffer.scala 283:33]
  wire  hi_lo_hi_lo_hi_hi = concat[3]; // @[DES_EncryptionPipelinedElasticBuffer.scala 283:44]
  wire  hi_lo_hi_lo_hi_lo = concat[25]; // @[DES_EncryptionPipelinedElasticBuffer.scala 283:54]
  wire  hi_lo_hi_lo_lo = concat[7]; // @[DES_EncryptionPipelinedElasticBuffer.scala 283:65]
  wire  hi_lo_lo_hi_hi_hi = concat[15]; // @[DES_EncryptionPipelinedElasticBuffer.scala 284:11]
  wire  hi_lo_lo_hi_hi_lo = concat[6]; // @[DES_EncryptionPipelinedElasticBuffer.scala 284:22]
  wire  hi_lo_lo_hi_lo = concat[26]; // @[DES_EncryptionPipelinedElasticBuffer.scala 284:32]
  wire  hi_lo_lo_lo_hi_hi = concat[19]; // @[DES_EncryptionPipelinedElasticBuffer.scala 284:43]
  wire  hi_lo_lo_lo_hi_lo = concat[12]; // @[DES_EncryptionPipelinedElasticBuffer.scala 284:54]
  wire  hi_lo_lo_lo_lo = concat[1]; // @[DES_EncryptionPipelinedElasticBuffer.scala 284:65]
  wire  lo_hi_hi_hi_hi_hi = concat[40]; // @[DES_EncryptionPipelinedElasticBuffer.scala 285:11]
  wire  lo_hi_hi_hi_hi_lo = concat[51]; // @[DES_EncryptionPipelinedElasticBuffer.scala 285:22]
  wire  lo_hi_hi_hi_lo = concat[30]; // @[DES_EncryptionPipelinedElasticBuffer.scala 285:33]
  wire  lo_hi_hi_lo_hi_hi = concat[36]; // @[DES_EncryptionPipelinedElasticBuffer.scala 285:44]
  wire  lo_hi_hi_lo_hi_lo = concat[46]; // @[DES_EncryptionPipelinedElasticBuffer.scala 285:55]
  wire  lo_hi_hi_lo_lo = concat[54]; // @[DES_EncryptionPipelinedElasticBuffer.scala 285:66]
  wire  lo_hi_lo_hi_hi_hi = concat[29]; // @[DES_EncryptionPipelinedElasticBuffer.scala 286:11]
  wire  lo_hi_lo_hi_hi_lo = concat[39]; // @[DES_EncryptionPipelinedElasticBuffer.scala 286:22]
  wire  lo_hi_lo_hi_lo = concat[50]; // @[DES_EncryptionPipelinedElasticBuffer.scala 286:33]
  wire  lo_hi_lo_lo_hi_hi = concat[44]; // @[DES_EncryptionPipelinedElasticBuffer.scala 286:44]
  wire  lo_hi_lo_lo_hi_lo = concat[32]; // @[DES_EncryptionPipelinedElasticBuffer.scala 286:55]
  wire  lo_hi_lo_lo_lo = concat[47]; // @[DES_EncryptionPipelinedElasticBuffer.scala 286:66]
  wire  lo_lo_hi_hi_hi_hi = concat[43]; // @[DES_EncryptionPipelinedElasticBuffer.scala 287:11]
  wire  lo_lo_hi_hi_hi_lo = concat[48]; // @[DES_EncryptionPipelinedElasticBuffer.scala 287:22]
  wire  lo_lo_hi_hi_lo = concat[38]; // @[DES_EncryptionPipelinedElasticBuffer.scala 287:33]
  wire  lo_lo_hi_lo_hi_hi = concat[55]; // @[DES_EncryptionPipelinedElasticBuffer.scala 287:44]
  wire  lo_lo_hi_lo_hi_lo = concat[33]; // @[DES_EncryptionPipelinedElasticBuffer.scala 287:55]
  wire  lo_lo_hi_lo_lo = concat[52]; // @[DES_EncryptionPipelinedElasticBuffer.scala 287:66]
  wire  lo_lo_lo_hi_hi_hi = concat[45]; // @[DES_EncryptionPipelinedElasticBuffer.scala 288:11]
  wire  lo_lo_lo_hi_hi_lo = concat[41]; // @[DES_EncryptionPipelinedElasticBuffer.scala 288:22]
  wire  lo_lo_lo_hi_lo = concat[49]; // @[DES_EncryptionPipelinedElasticBuffer.scala 288:33]
  wire  lo_lo_lo_lo_hi_hi = concat[35]; // @[DES_EncryptionPipelinedElasticBuffer.scala 288:44]
  wire  lo_lo_lo_lo_hi_lo = concat[28]; // @[DES_EncryptionPipelinedElasticBuffer.scala 288:55]
  wire  lo_lo_lo_lo_lo = concat[31]; // @[DES_EncryptionPipelinedElasticBuffer.scala 288:66]
  wire [5:0] lo_lo_lo = {lo_lo_lo_hi_hi_hi,lo_lo_lo_hi_hi_lo,lo_lo_lo_hi_lo,lo_lo_lo_lo_hi_hi,lo_lo_lo_lo_hi_lo,
    lo_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [11:0] lo_lo = {lo_lo_hi_hi_hi_hi,lo_lo_hi_hi_hi_lo,lo_lo_hi_hi_lo,lo_lo_hi_lo_hi_hi,lo_lo_hi_lo_hi_lo,
    lo_lo_hi_lo_lo,lo_lo_lo}; // @[Cat.scala 30:58]
  wire [5:0] lo_hi_lo = {lo_hi_lo_hi_hi_hi,lo_hi_lo_hi_hi_lo,lo_hi_lo_hi_lo,lo_hi_lo_lo_hi_hi,lo_hi_lo_lo_hi_lo,
    lo_hi_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [23:0] lo_4 = {lo_hi_hi_hi_hi_hi,lo_hi_hi_hi_hi_lo,lo_hi_hi_hi_lo,lo_hi_hi_lo_hi_hi,lo_hi_hi_lo_hi_lo,
    lo_hi_hi_lo_lo,lo_hi_lo,lo_lo}; // @[Cat.scala 30:58]
  wire [5:0] hi_lo_lo = {hi_lo_lo_hi_hi_hi,hi_lo_lo_hi_hi_lo,hi_lo_lo_hi_lo,hi_lo_lo_lo_hi_hi,hi_lo_lo_lo_hi_lo,
    hi_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [11:0] hi_lo = {hi_lo_hi_hi_hi_hi,hi_lo_hi_hi_hi_lo,hi_lo_hi_hi_lo,hi_lo_hi_lo_hi_hi,hi_lo_hi_lo_hi_lo,
    hi_lo_hi_lo_lo,hi_lo_lo}; // @[Cat.scala 30:58]
  wire [5:0] hi_hi_lo = {hi_hi_lo_hi_hi_hi,hi_hi_lo_hi_hi_lo,hi_hi_lo_hi_lo,hi_hi_lo_lo_hi_hi,hi_hi_lo_lo_hi_lo,
    hi_hi_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [23:0] hi_4 = {hi_hi_hi_hi_hi_hi,hi_hi_hi_hi_hi_lo,hi_hi_hi_hi_lo,hi_hi_hi_lo_hi_hi,hi_hi_hi_lo_hi_lo,
    hi_hi_hi_lo_lo,hi_hi_lo,hi_lo}; // @[Cat.scala 30:58]
  assign io_C_next = {hi,lo}; // @[Cat.scala 30:58]
  assign io_D_next = {hi_1,lo_1}; // @[Cat.scala 30:58]
  assign io_K = {hi_4,lo_4}; // @[Cat.scala 30:58]
endmodule
module DES_ProcessingElement_2(
  input         clock,
  input         reset,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_L,
  output [31:0] io_out_bits_R,
  output [27:0] io_out_bits_C,
  output [27:0] io_out_bits_D,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_L,
  input  [31:0] io_in_bits_R,
  input  [27:0] io_in_bits_C,
  input  [27:0] io_in_bits_D
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  wire [27:0] keys_io_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 132:20]
  wire [27:0] keys_io_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 132:20]
  wire [27:0] keys_io_C_next; // @[DES_EncryptionPipelinedElasticBuffer.scala 132:20]
  wire [27:0] keys_io_D_next; // @[DES_EncryptionPipelinedElasticBuffer.scala 132:20]
  wire [47:0] keys_io_K; // @[DES_EncryptionPipelinedElasticBuffer.scala 132:20]
  wire [31:0] f_io_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 136:17]
  wire [47:0] f_io_K; // @[DES_EncryptionPipelinedElasticBuffer.scala 136:17]
  wire [31:0] f_io_out; // @[DES_EncryptionPipelinedElasticBuffer.scala 136:17]
  reg [31:0] data_0_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [31:0] data_0_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [27:0] data_0_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [27:0] data_0_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [31:0] data_1_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [31:0] data_1_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [27:0] data_1_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg [27:0] data_1_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
  reg  head; // @[DES_EncryptionPipelinedElasticBuffer.scala 109:21]
  reg  tail; // @[DES_EncryptionPipelinedElasticBuffer.scala 110:21]
  reg  full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  reg  full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  wire [31:0] input_L = head ? data_1_L : data_0_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 116:9 DES_EncryptionPipelinedElasticBuffer.scala 116:9]
  wire  _GEN_9 = tail ? full_1 : full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 119:23 DES_EncryptionPipelinedElasticBuffer.scala 119:23]
  wire  _GEN_38 = ~tail; // @[DES_EncryptionPipelinedElasticBuffer.scala 120:16 DES_EncryptionPipelinedElasticBuffer.scala 120:16 DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  wire  _GEN_10 = ~tail | full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 120:16 DES_EncryptionPipelinedElasticBuffer.scala 120:16 DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  wire  _GEN_11 = tail | full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 120:16 DES_EncryptionPipelinedElasticBuffer.scala 120:16 DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  wire  _GEN_20 = io_in_valid & ~_GEN_9 ? _GEN_10 : full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36 DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  wire  _GEN_21 = io_in_valid & ~_GEN_9 ? _GEN_11 : full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36 DES_EncryptionPipelinedElasticBuffer.scala 111:21]
  wire  _GEN_32 = head ? full_1 : full_0; // @[DES_EncryptionPipelinedElasticBuffer.scala 126:21 DES_EncryptionPipelinedElasticBuffer.scala 126:21]
  DES_keys_2 keys ( // @[DES_EncryptionPipelinedElasticBuffer.scala 132:20]
    .io_C(keys_io_C),
    .io_D(keys_io_D),
    .io_C_next(keys_io_C_next),
    .io_D_next(keys_io_D_next),
    .io_K(keys_io_K)
  );
  DES_f f ( // @[DES_EncryptionPipelinedElasticBuffer.scala 136:17]
    .io_R(f_io_R),
    .io_K(f_io_K),
    .io_out(f_io_out)
  );
  assign io_out_valid = full_0 | full_1; // @[DES_EncryptionPipelinedElasticBuffer.scala 114:27]
  assign io_out_bits_L = head ? data_1_R : data_0_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 116:9 DES_EncryptionPipelinedElasticBuffer.scala 116:9]
  assign io_out_bits_R = input_L ^ f_io_out; // @[DES_EncryptionPipelinedElasticBuffer.scala 141:23]
  assign io_out_bits_C = keys_io_C_next; // @[DES_EncryptionPipelinedElasticBuffer.scala 107:27 DES_EncryptionPipelinedElasticBuffer.scala 142:12]
  assign io_out_bits_D = keys_io_D_next; // @[DES_EncryptionPipelinedElasticBuffer.scala 107:27 DES_EncryptionPipelinedElasticBuffer.scala 143:12]
  assign io_in_ready = ~(full_0 & full_1); // @[DES_EncryptionPipelinedElasticBuffer.scala 113:18]
  assign keys_io_C = head ? data_1_C : data_0_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 116:9 DES_EncryptionPipelinedElasticBuffer.scala 116:9]
  assign keys_io_D = head ? data_1_D : data_0_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 116:9 DES_EncryptionPipelinedElasticBuffer.scala 116:9]
  assign f_io_R = head ? data_1_R : data_0_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 116:9 DES_EncryptionPipelinedElasticBuffer.scala 116:9]
  assign f_io_K = keys_io_K; // @[DES_EncryptionPipelinedElasticBuffer.scala 138:10]
  always @(posedge clock) begin
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_0_L <= 32'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (~tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_0_L <= io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_0_R <= 32'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (~tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_0_R <= io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_0_C <= 28'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (~tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_0_C <= io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_0_D <= 28'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (~tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_0_D <= io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_1_L <= 32'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_1_L <= io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_1_R <= 32'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_1_R <= io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_1_C <= 28'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_1_C <= io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
      data_1_D <= 28'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 108:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      if (tail) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
        data_1_D <= io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 121:16]
      end
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 109:21]
      head <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 109:21]
    end else if (io_out_ready & _GEN_32) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 126:36]
      head <= ~head; // @[DES_EncryptionPipelinedElasticBuffer.scala 128:10]
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 110:21]
      tail <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 110:21]
    end else if (io_in_valid & ~_GEN_9) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 119:36]
      tail <= _GEN_38; // @[DES_EncryptionPipelinedElasticBuffer.scala 122:10]
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 111:21]
      full_0 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 111:21]
    end else if (io_out_ready & _GEN_32) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 126:36]
      if (~head) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 127:16]
        full_0 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 127:16]
      end else begin
        full_0 <= _GEN_20;
      end
    end else begin
      full_0 <= _GEN_20;
    end
    if (reset) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 111:21]
      full_1 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 111:21]
    end else if (io_out_ready & _GEN_32) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 126:36]
      if (head) begin // @[DES_EncryptionPipelinedElasticBuffer.scala 127:16]
        full_1 <= 1'h0; // @[DES_EncryptionPipelinedElasticBuffer.scala 127:16]
      end else begin
        full_1 <= _GEN_21;
      end
    end else begin
      full_1 <= _GEN_21;
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
  data_0_L = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  data_0_R = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  data_0_C = _RAND_2[27:0];
  _RAND_3 = {1{`RANDOM}};
  data_0_D = _RAND_3[27:0];
  _RAND_4 = {1{`RANDOM}};
  data_1_L = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  data_1_R = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  data_1_C = _RAND_6[27:0];
  _RAND_7 = {1{`RANDOM}};
  data_1_D = _RAND_7[27:0];
  _RAND_8 = {1{`RANDOM}};
  head = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  tail = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  full_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  full_1 = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DES_EncryptionPipelinedElasticBuffer(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [63:0] io_in_bits_text,
  input  [63:0] io_in_bits_key,
  input         io_encrypted_ready,
  output        io_encrypted_valid,
  output [63:0] io_encrypted_bits
);
  wire  initialPermutation_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 15:34]
  wire  initialPermutation_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 15:34]
  wire  initialPermutation_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 15:34]
  wire  initialPermutation_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 15:34]
  wire [63:0] initialPermutation_io_in_bits_text; // @[DES_EncryptionPipelinedElasticBuffer.scala 15:34]
  wire [63:0] initialPermutation_io_in_bits_key; // @[DES_EncryptionPipelinedElasticBuffer.scala 15:34]
  wire  initialPermutation_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 15:34]
  wire  initialPermutation_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 15:34]
  wire [31:0] initialPermutation_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 15:34]
  wire [31:0] initialPermutation_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 15:34]
  wire [27:0] initialPermutation_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 15:34]
  wire [27:0] initialPermutation_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 15:34]
  wire  finalPermutation_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 21:32]
  wire  finalPermutation_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 21:32]
  wire  finalPermutation_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 21:32]
  wire  finalPermutation_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 21:32]
  wire [63:0] finalPermutation_io_out_bits; // @[DES_EncryptionPipelinedElasticBuffer.scala 21:32]
  wire  finalPermutation_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 21:32]
  wire  finalPermutation_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 21:32]
  wire [31:0] finalPermutation_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 21:32]
  wire [31:0] finalPermutation_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 21:32]
  wire  PEs_0_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_0_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_0_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_0_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_0_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_0_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_0_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_0_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_0_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_0_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_0_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_0_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_0_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_0_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_1_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_1_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_1_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_1_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_1_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_1_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_1_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_1_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_1_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_1_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_1_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_1_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_1_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_1_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_2_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_2_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_2_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_2_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_2_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_2_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_2_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_2_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_2_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_2_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_2_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_2_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_2_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_2_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_3_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_3_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_3_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_3_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_3_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_3_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_3_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_3_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_3_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_3_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_3_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_3_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_3_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_3_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_4_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_4_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_4_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_4_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_4_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_4_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_4_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_4_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_4_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_4_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_4_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_4_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_4_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_4_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_5_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_5_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_5_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_5_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_5_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_5_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_5_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_5_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_5_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_5_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_5_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_5_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_5_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_5_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_6_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_6_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_6_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_6_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_6_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_6_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_6_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_6_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_6_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_6_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_6_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_6_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_6_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_6_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_7_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_7_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_7_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_7_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_7_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_7_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_7_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_7_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_7_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_7_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_7_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_7_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_7_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_7_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_8_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_8_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_8_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_8_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_8_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_8_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_8_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_8_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_8_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_8_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_8_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_8_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_8_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_8_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_9_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_9_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_9_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_9_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_9_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_9_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_9_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_9_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_9_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_9_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_9_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_9_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_9_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_9_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_10_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_10_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_10_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_10_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_10_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_10_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_10_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_10_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_10_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_10_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_10_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_10_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_10_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_10_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_11_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_11_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_11_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_11_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_11_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_11_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_11_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_11_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_11_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_11_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_11_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_11_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_11_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_11_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_12_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_12_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_12_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_12_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_12_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_12_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_12_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_12_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_12_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_12_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_12_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_12_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_12_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_12_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_13_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_13_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_13_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_13_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_13_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_13_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_13_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_13_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_13_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_13_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_13_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_13_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_13_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_13_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_14_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_14_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_14_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_14_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_14_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_14_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_14_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_14_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_14_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_14_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_14_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_14_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_14_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_14_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_15_clock; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_15_reset; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_15_io_out_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_15_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_15_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_15_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_15_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_15_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_15_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire  PEs_15_io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_15_io_in_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [31:0] PEs_15_io_in_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_15_io_in_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  wire [27:0] PEs_15_io_in_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
  DES_InitialPermutation initialPermutation ( // @[DES_EncryptionPipelinedElasticBuffer.scala 15:34]
    .clock(initialPermutation_clock),
    .reset(initialPermutation_reset),
    .io_in_ready(initialPermutation_io_in_ready),
    .io_in_valid(initialPermutation_io_in_valid),
    .io_in_bits_text(initialPermutation_io_in_bits_text),
    .io_in_bits_key(initialPermutation_io_in_bits_key),
    .io_out_ready(initialPermutation_io_out_ready),
    .io_out_valid(initialPermutation_io_out_valid),
    .io_out_bits_L(initialPermutation_io_out_bits_L),
    .io_out_bits_R(initialPermutation_io_out_bits_R),
    .io_out_bits_C(initialPermutation_io_out_bits_C),
    .io_out_bits_D(initialPermutation_io_out_bits_D)
  );
  DES_FinalPermutation finalPermutation ( // @[DES_EncryptionPipelinedElasticBuffer.scala 21:32]
    .clock(finalPermutation_clock),
    .reset(finalPermutation_reset),
    .io_out_ready(finalPermutation_io_out_ready),
    .io_out_valid(finalPermutation_io_out_valid),
    .io_out_bits(finalPermutation_io_out_bits),
    .io_in_ready(finalPermutation_io_in_ready),
    .io_in_valid(finalPermutation_io_in_valid),
    .io_in_bits_L(finalPermutation_io_in_bits_L),
    .io_in_bits_R(finalPermutation_io_in_bits_R)
  );
  DES_ProcessingElement PEs_0 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_0_clock),
    .reset(PEs_0_reset),
    .io_out_ready(PEs_0_io_out_ready),
    .io_out_valid(PEs_0_io_out_valid),
    .io_out_bits_L(PEs_0_io_out_bits_L),
    .io_out_bits_R(PEs_0_io_out_bits_R),
    .io_out_bits_C(PEs_0_io_out_bits_C),
    .io_out_bits_D(PEs_0_io_out_bits_D),
    .io_in_ready(PEs_0_io_in_ready),
    .io_in_valid(PEs_0_io_in_valid),
    .io_in_bits_L(PEs_0_io_in_bits_L),
    .io_in_bits_R(PEs_0_io_in_bits_R),
    .io_in_bits_C(PEs_0_io_in_bits_C),
    .io_in_bits_D(PEs_0_io_in_bits_D)
  );
  DES_ProcessingElement PEs_1 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_1_clock),
    .reset(PEs_1_reset),
    .io_out_ready(PEs_1_io_out_ready),
    .io_out_valid(PEs_1_io_out_valid),
    .io_out_bits_L(PEs_1_io_out_bits_L),
    .io_out_bits_R(PEs_1_io_out_bits_R),
    .io_out_bits_C(PEs_1_io_out_bits_C),
    .io_out_bits_D(PEs_1_io_out_bits_D),
    .io_in_ready(PEs_1_io_in_ready),
    .io_in_valid(PEs_1_io_in_valid),
    .io_in_bits_L(PEs_1_io_in_bits_L),
    .io_in_bits_R(PEs_1_io_in_bits_R),
    .io_in_bits_C(PEs_1_io_in_bits_C),
    .io_in_bits_D(PEs_1_io_in_bits_D)
  );
  DES_ProcessingElement_2 PEs_2 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_2_clock),
    .reset(PEs_2_reset),
    .io_out_ready(PEs_2_io_out_ready),
    .io_out_valid(PEs_2_io_out_valid),
    .io_out_bits_L(PEs_2_io_out_bits_L),
    .io_out_bits_R(PEs_2_io_out_bits_R),
    .io_out_bits_C(PEs_2_io_out_bits_C),
    .io_out_bits_D(PEs_2_io_out_bits_D),
    .io_in_ready(PEs_2_io_in_ready),
    .io_in_valid(PEs_2_io_in_valid),
    .io_in_bits_L(PEs_2_io_in_bits_L),
    .io_in_bits_R(PEs_2_io_in_bits_R),
    .io_in_bits_C(PEs_2_io_in_bits_C),
    .io_in_bits_D(PEs_2_io_in_bits_D)
  );
  DES_ProcessingElement_2 PEs_3 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_3_clock),
    .reset(PEs_3_reset),
    .io_out_ready(PEs_3_io_out_ready),
    .io_out_valid(PEs_3_io_out_valid),
    .io_out_bits_L(PEs_3_io_out_bits_L),
    .io_out_bits_R(PEs_3_io_out_bits_R),
    .io_out_bits_C(PEs_3_io_out_bits_C),
    .io_out_bits_D(PEs_3_io_out_bits_D),
    .io_in_ready(PEs_3_io_in_ready),
    .io_in_valid(PEs_3_io_in_valid),
    .io_in_bits_L(PEs_3_io_in_bits_L),
    .io_in_bits_R(PEs_3_io_in_bits_R),
    .io_in_bits_C(PEs_3_io_in_bits_C),
    .io_in_bits_D(PEs_3_io_in_bits_D)
  );
  DES_ProcessingElement_2 PEs_4 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_4_clock),
    .reset(PEs_4_reset),
    .io_out_ready(PEs_4_io_out_ready),
    .io_out_valid(PEs_4_io_out_valid),
    .io_out_bits_L(PEs_4_io_out_bits_L),
    .io_out_bits_R(PEs_4_io_out_bits_R),
    .io_out_bits_C(PEs_4_io_out_bits_C),
    .io_out_bits_D(PEs_4_io_out_bits_D),
    .io_in_ready(PEs_4_io_in_ready),
    .io_in_valid(PEs_4_io_in_valid),
    .io_in_bits_L(PEs_4_io_in_bits_L),
    .io_in_bits_R(PEs_4_io_in_bits_R),
    .io_in_bits_C(PEs_4_io_in_bits_C),
    .io_in_bits_D(PEs_4_io_in_bits_D)
  );
  DES_ProcessingElement_2 PEs_5 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_5_clock),
    .reset(PEs_5_reset),
    .io_out_ready(PEs_5_io_out_ready),
    .io_out_valid(PEs_5_io_out_valid),
    .io_out_bits_L(PEs_5_io_out_bits_L),
    .io_out_bits_R(PEs_5_io_out_bits_R),
    .io_out_bits_C(PEs_5_io_out_bits_C),
    .io_out_bits_D(PEs_5_io_out_bits_D),
    .io_in_ready(PEs_5_io_in_ready),
    .io_in_valid(PEs_5_io_in_valid),
    .io_in_bits_L(PEs_5_io_in_bits_L),
    .io_in_bits_R(PEs_5_io_in_bits_R),
    .io_in_bits_C(PEs_5_io_in_bits_C),
    .io_in_bits_D(PEs_5_io_in_bits_D)
  );
  DES_ProcessingElement_2 PEs_6 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_6_clock),
    .reset(PEs_6_reset),
    .io_out_ready(PEs_6_io_out_ready),
    .io_out_valid(PEs_6_io_out_valid),
    .io_out_bits_L(PEs_6_io_out_bits_L),
    .io_out_bits_R(PEs_6_io_out_bits_R),
    .io_out_bits_C(PEs_6_io_out_bits_C),
    .io_out_bits_D(PEs_6_io_out_bits_D),
    .io_in_ready(PEs_6_io_in_ready),
    .io_in_valid(PEs_6_io_in_valid),
    .io_in_bits_L(PEs_6_io_in_bits_L),
    .io_in_bits_R(PEs_6_io_in_bits_R),
    .io_in_bits_C(PEs_6_io_in_bits_C),
    .io_in_bits_D(PEs_6_io_in_bits_D)
  );
  DES_ProcessingElement_2 PEs_7 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_7_clock),
    .reset(PEs_7_reset),
    .io_out_ready(PEs_7_io_out_ready),
    .io_out_valid(PEs_7_io_out_valid),
    .io_out_bits_L(PEs_7_io_out_bits_L),
    .io_out_bits_R(PEs_7_io_out_bits_R),
    .io_out_bits_C(PEs_7_io_out_bits_C),
    .io_out_bits_D(PEs_7_io_out_bits_D),
    .io_in_ready(PEs_7_io_in_ready),
    .io_in_valid(PEs_7_io_in_valid),
    .io_in_bits_L(PEs_7_io_in_bits_L),
    .io_in_bits_R(PEs_7_io_in_bits_R),
    .io_in_bits_C(PEs_7_io_in_bits_C),
    .io_in_bits_D(PEs_7_io_in_bits_D)
  );
  DES_ProcessingElement PEs_8 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_8_clock),
    .reset(PEs_8_reset),
    .io_out_ready(PEs_8_io_out_ready),
    .io_out_valid(PEs_8_io_out_valid),
    .io_out_bits_L(PEs_8_io_out_bits_L),
    .io_out_bits_R(PEs_8_io_out_bits_R),
    .io_out_bits_C(PEs_8_io_out_bits_C),
    .io_out_bits_D(PEs_8_io_out_bits_D),
    .io_in_ready(PEs_8_io_in_ready),
    .io_in_valid(PEs_8_io_in_valid),
    .io_in_bits_L(PEs_8_io_in_bits_L),
    .io_in_bits_R(PEs_8_io_in_bits_R),
    .io_in_bits_C(PEs_8_io_in_bits_C),
    .io_in_bits_D(PEs_8_io_in_bits_D)
  );
  DES_ProcessingElement_2 PEs_9 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_9_clock),
    .reset(PEs_9_reset),
    .io_out_ready(PEs_9_io_out_ready),
    .io_out_valid(PEs_9_io_out_valid),
    .io_out_bits_L(PEs_9_io_out_bits_L),
    .io_out_bits_R(PEs_9_io_out_bits_R),
    .io_out_bits_C(PEs_9_io_out_bits_C),
    .io_out_bits_D(PEs_9_io_out_bits_D),
    .io_in_ready(PEs_9_io_in_ready),
    .io_in_valid(PEs_9_io_in_valid),
    .io_in_bits_L(PEs_9_io_in_bits_L),
    .io_in_bits_R(PEs_9_io_in_bits_R),
    .io_in_bits_C(PEs_9_io_in_bits_C),
    .io_in_bits_D(PEs_9_io_in_bits_D)
  );
  DES_ProcessingElement_2 PEs_10 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_10_clock),
    .reset(PEs_10_reset),
    .io_out_ready(PEs_10_io_out_ready),
    .io_out_valid(PEs_10_io_out_valid),
    .io_out_bits_L(PEs_10_io_out_bits_L),
    .io_out_bits_R(PEs_10_io_out_bits_R),
    .io_out_bits_C(PEs_10_io_out_bits_C),
    .io_out_bits_D(PEs_10_io_out_bits_D),
    .io_in_ready(PEs_10_io_in_ready),
    .io_in_valid(PEs_10_io_in_valid),
    .io_in_bits_L(PEs_10_io_in_bits_L),
    .io_in_bits_R(PEs_10_io_in_bits_R),
    .io_in_bits_C(PEs_10_io_in_bits_C),
    .io_in_bits_D(PEs_10_io_in_bits_D)
  );
  DES_ProcessingElement_2 PEs_11 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_11_clock),
    .reset(PEs_11_reset),
    .io_out_ready(PEs_11_io_out_ready),
    .io_out_valid(PEs_11_io_out_valid),
    .io_out_bits_L(PEs_11_io_out_bits_L),
    .io_out_bits_R(PEs_11_io_out_bits_R),
    .io_out_bits_C(PEs_11_io_out_bits_C),
    .io_out_bits_D(PEs_11_io_out_bits_D),
    .io_in_ready(PEs_11_io_in_ready),
    .io_in_valid(PEs_11_io_in_valid),
    .io_in_bits_L(PEs_11_io_in_bits_L),
    .io_in_bits_R(PEs_11_io_in_bits_R),
    .io_in_bits_C(PEs_11_io_in_bits_C),
    .io_in_bits_D(PEs_11_io_in_bits_D)
  );
  DES_ProcessingElement_2 PEs_12 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_12_clock),
    .reset(PEs_12_reset),
    .io_out_ready(PEs_12_io_out_ready),
    .io_out_valid(PEs_12_io_out_valid),
    .io_out_bits_L(PEs_12_io_out_bits_L),
    .io_out_bits_R(PEs_12_io_out_bits_R),
    .io_out_bits_C(PEs_12_io_out_bits_C),
    .io_out_bits_D(PEs_12_io_out_bits_D),
    .io_in_ready(PEs_12_io_in_ready),
    .io_in_valid(PEs_12_io_in_valid),
    .io_in_bits_L(PEs_12_io_in_bits_L),
    .io_in_bits_R(PEs_12_io_in_bits_R),
    .io_in_bits_C(PEs_12_io_in_bits_C),
    .io_in_bits_D(PEs_12_io_in_bits_D)
  );
  DES_ProcessingElement_2 PEs_13 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_13_clock),
    .reset(PEs_13_reset),
    .io_out_ready(PEs_13_io_out_ready),
    .io_out_valid(PEs_13_io_out_valid),
    .io_out_bits_L(PEs_13_io_out_bits_L),
    .io_out_bits_R(PEs_13_io_out_bits_R),
    .io_out_bits_C(PEs_13_io_out_bits_C),
    .io_out_bits_D(PEs_13_io_out_bits_D),
    .io_in_ready(PEs_13_io_in_ready),
    .io_in_valid(PEs_13_io_in_valid),
    .io_in_bits_L(PEs_13_io_in_bits_L),
    .io_in_bits_R(PEs_13_io_in_bits_R),
    .io_in_bits_C(PEs_13_io_in_bits_C),
    .io_in_bits_D(PEs_13_io_in_bits_D)
  );
  DES_ProcessingElement_2 PEs_14 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_14_clock),
    .reset(PEs_14_reset),
    .io_out_ready(PEs_14_io_out_ready),
    .io_out_valid(PEs_14_io_out_valid),
    .io_out_bits_L(PEs_14_io_out_bits_L),
    .io_out_bits_R(PEs_14_io_out_bits_R),
    .io_out_bits_C(PEs_14_io_out_bits_C),
    .io_out_bits_D(PEs_14_io_out_bits_D),
    .io_in_ready(PEs_14_io_in_ready),
    .io_in_valid(PEs_14_io_in_valid),
    .io_in_bits_L(PEs_14_io_in_bits_L),
    .io_in_bits_R(PEs_14_io_in_bits_R),
    .io_in_bits_C(PEs_14_io_in_bits_C),
    .io_in_bits_D(PEs_14_io_in_bits_D)
  );
  DES_ProcessingElement PEs_15 ( // @[DES_EncryptionPipelinedElasticBuffer.scala 27:20]
    .clock(PEs_15_clock),
    .reset(PEs_15_reset),
    .io_out_ready(PEs_15_io_out_ready),
    .io_out_valid(PEs_15_io_out_valid),
    .io_out_bits_L(PEs_15_io_out_bits_L),
    .io_out_bits_R(PEs_15_io_out_bits_R),
    .io_out_bits_C(PEs_15_io_out_bits_C),
    .io_out_bits_D(PEs_15_io_out_bits_D),
    .io_in_ready(PEs_15_io_in_ready),
    .io_in_valid(PEs_15_io_in_valid),
    .io_in_bits_L(PEs_15_io_in_bits_L),
    .io_in_bits_R(PEs_15_io_in_bits_R),
    .io_in_bits_C(PEs_15_io_in_bits_C),
    .io_in_bits_D(PEs_15_io_in_bits_D)
  );
  assign io_in_ready = initialPermutation_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 19:15]
  assign io_encrypted_valid = finalPermutation_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 23:22]
  assign io_encrypted_bits = finalPermutation_io_out_bits; // @[DES_EncryptionPipelinedElasticBuffer.scala 22:21]
  assign initialPermutation_clock = clock;
  assign initialPermutation_reset = reset;
  assign initialPermutation_io_in_valid = io_in_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 16:34]
  assign initialPermutation_io_in_bits_text = io_in_bits_text; // @[DES_EncryptionPipelinedElasticBuffer.scala 17:38]
  assign initialPermutation_io_in_bits_key = io_in_bits_key; // @[DES_EncryptionPipelinedElasticBuffer.scala 18:37]
  assign initialPermutation_io_out_ready = PEs_0_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 36:39]
  assign finalPermutation_clock = clock;
  assign finalPermutation_reset = reset;
  assign finalPermutation_io_out_ready = io_encrypted_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 24:33]
  assign finalPermutation_io_in_valid = PEs_15_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 42:36]
  assign finalPermutation_io_in_bits_L = PEs_15_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 43:37]
  assign finalPermutation_io_in_bits_R = PEs_15_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 44:37]
  assign PEs_0_clock = clock;
  assign PEs_0_reset = reset;
  assign PEs_0_io_out_ready = PEs_1_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 40:27]
  assign PEs_0_io_in_valid = initialPermutation_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 34:26]
  assign PEs_0_io_in_bits_L = initialPermutation_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 35:25]
  assign PEs_0_io_in_bits_R = initialPermutation_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 35:25]
  assign PEs_0_io_in_bits_C = initialPermutation_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 35:25]
  assign PEs_0_io_in_bits_D = initialPermutation_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 35:25]
  assign PEs_1_clock = clock;
  assign PEs_1_reset = reset;
  assign PEs_1_io_out_ready = PEs_2_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_1_io_in_valid = PEs_0_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 38:28]
  assign PEs_1_io_in_bits_L = PEs_0_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 39:27]
  assign PEs_1_io_in_bits_R = PEs_0_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 39:27]
  assign PEs_1_io_in_bits_C = PEs_0_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 39:27]
  assign PEs_1_io_in_bits_D = PEs_0_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 39:27]
  assign PEs_2_clock = clock;
  assign PEs_2_reset = reset;
  assign PEs_2_io_out_ready = PEs_3_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_2_io_in_valid = PEs_1_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_2_io_in_bits_L = PEs_1_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_2_io_in_bits_R = PEs_1_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_2_io_in_bits_C = PEs_1_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_2_io_in_bits_D = PEs_1_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_3_clock = clock;
  assign PEs_3_reset = reset;
  assign PEs_3_io_out_ready = PEs_4_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_3_io_in_valid = PEs_2_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_3_io_in_bits_L = PEs_2_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_3_io_in_bits_R = PEs_2_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_3_io_in_bits_C = PEs_2_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_3_io_in_bits_D = PEs_2_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_4_clock = clock;
  assign PEs_4_reset = reset;
  assign PEs_4_io_out_ready = PEs_5_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_4_io_in_valid = PEs_3_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_4_io_in_bits_L = PEs_3_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_4_io_in_bits_R = PEs_3_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_4_io_in_bits_C = PEs_3_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_4_io_in_bits_D = PEs_3_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_5_clock = clock;
  assign PEs_5_reset = reset;
  assign PEs_5_io_out_ready = PEs_6_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_5_io_in_valid = PEs_4_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_5_io_in_bits_L = PEs_4_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_5_io_in_bits_R = PEs_4_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_5_io_in_bits_C = PEs_4_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_5_io_in_bits_D = PEs_4_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_6_clock = clock;
  assign PEs_6_reset = reset;
  assign PEs_6_io_out_ready = PEs_7_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_6_io_in_valid = PEs_5_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_6_io_in_bits_L = PEs_5_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_6_io_in_bits_R = PEs_5_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_6_io_in_bits_C = PEs_5_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_6_io_in_bits_D = PEs_5_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_7_clock = clock;
  assign PEs_7_reset = reset;
  assign PEs_7_io_out_ready = PEs_8_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_7_io_in_valid = PEs_6_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_7_io_in_bits_L = PEs_6_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_7_io_in_bits_R = PEs_6_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_7_io_in_bits_C = PEs_6_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_7_io_in_bits_D = PEs_6_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_8_clock = clock;
  assign PEs_8_reset = reset;
  assign PEs_8_io_out_ready = PEs_9_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_8_io_in_valid = PEs_7_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_8_io_in_bits_L = PEs_7_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_8_io_in_bits_R = PEs_7_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_8_io_in_bits_C = PEs_7_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_8_io_in_bits_D = PEs_7_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_9_clock = clock;
  assign PEs_9_reset = reset;
  assign PEs_9_io_out_ready = PEs_10_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_9_io_in_valid = PEs_8_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_9_io_in_bits_L = PEs_8_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_9_io_in_bits_R = PEs_8_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_9_io_in_bits_C = PEs_8_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_9_io_in_bits_D = PEs_8_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_10_clock = clock;
  assign PEs_10_reset = reset;
  assign PEs_10_io_out_ready = PEs_11_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_10_io_in_valid = PEs_9_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_10_io_in_bits_L = PEs_9_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_10_io_in_bits_R = PEs_9_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_10_io_in_bits_C = PEs_9_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_10_io_in_bits_D = PEs_9_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_11_clock = clock;
  assign PEs_11_reset = reset;
  assign PEs_11_io_out_ready = PEs_12_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_11_io_in_valid = PEs_10_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_11_io_in_bits_L = PEs_10_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_11_io_in_bits_R = PEs_10_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_11_io_in_bits_C = PEs_10_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_11_io_in_bits_D = PEs_10_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_12_clock = clock;
  assign PEs_12_reset = reset;
  assign PEs_12_io_out_ready = PEs_13_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_12_io_in_valid = PEs_11_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_12_io_in_bits_L = PEs_11_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_12_io_in_bits_R = PEs_11_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_12_io_in_bits_C = PEs_11_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_12_io_in_bits_D = PEs_11_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_13_clock = clock;
  assign PEs_13_reset = reset;
  assign PEs_13_io_out_ready = PEs_14_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_13_io_in_valid = PEs_12_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_13_io_in_bits_L = PEs_12_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_13_io_in_bits_R = PEs_12_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_13_io_in_bits_C = PEs_12_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_13_io_in_bits_D = PEs_12_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_14_clock = clock;
  assign PEs_14_reset = reset;
  assign PEs_14_io_out_ready = PEs_15_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 49:27]
  assign PEs_14_io_in_valid = PEs_13_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_14_io_in_bits_L = PEs_13_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_14_io_in_bits_R = PEs_13_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_14_io_in_bits_C = PEs_13_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_14_io_in_bits_D = PEs_13_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_15_clock = clock;
  assign PEs_15_reset = reset;
  assign PEs_15_io_out_ready = finalPermutation_io_in_ready; // @[DES_EncryptionPipelinedElasticBuffer.scala 45:27]
  assign PEs_15_io_in_valid = PEs_14_io_out_valid; // @[DES_EncryptionPipelinedElasticBuffer.scala 47:28]
  assign PEs_15_io_in_bits_L = PEs_14_io_out_bits_L; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_15_io_in_bits_R = PEs_14_io_out_bits_R; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_15_io_in_bits_C = PEs_14_io_out_bits_C; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
  assign PEs_15_io_in_bits_D = PEs_14_io_out_bits_D; // @[DES_EncryptionPipelinedElasticBuffer.scala 48:27]
endmodule
