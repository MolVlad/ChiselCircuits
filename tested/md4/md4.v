module Operation(
  input  [31:0] io_a,
  input  [31:0] io_b,
  input  [31:0] io_c,
  input  [31:0] io_d,
  input  [31:0] io_x,
  input  [4:0]  io_s,
  input  [1:0]  io_round,
  output [31:0] io_out
);
  wire [31:0] _T = io_b & io_c; // @[md4.scala 182:14]
  wire [31:0] _T_1 = ~io_b; // @[md4.scala 182:25]
  wire [31:0] _T_2 = _T_1 & io_d; // @[md4.scala 182:31]
  wire [31:0] F = _T | _T_2; // @[md4.scala 182:22]
  wire [31:0] _T_5 = io_b & io_d; // @[md4.scala 183:30]
  wire [31:0] _T_6 = _T | _T_5; // @[md4.scala 183:22]
  wire [31:0] _T_7 = io_c & io_d; // @[md4.scala 183:46]
  wire [31:0] G = _T_6 | _T_7; // @[md4.scala 183:38]
  wire [31:0] _T_9 = io_b ^ io_c; // @[md4.scala 184:13]
  wire [31:0] H = _T_9 ^ io_d; // @[md4.scala 184:20]
  wire [31:0] _GEN_0 = io_round == 2'h1 ? G : H; // @[md4.scala 191:33 md4.scala 192:15 md4.scala 195:15]
  wire [31:0] operation = io_round == 2'h0 ? F : _GEN_0; // @[md4.scala 188:26 md4.scala 189:15]
  wire [31:0] _T_12 = io_a + operation; // @[md4.scala 186:15]
  wire [31:0] _T_14 = _T_12 + io_x; // @[md4.scala 186:27]
  wire [30:0] _GEN_1 = io_round == 2'h1 ? 31'h5a827999 : 31'h6ed9eba1; // @[md4.scala 191:33 md4.scala 193:11 md4.scala 196:11]
  wire [30:0] _GEN_3 = io_round == 2'h0 ? 31'h0 : _GEN_1; // @[md4.scala 188:26 md4.scala 190:11]
  wire [31:0] const_ = {{1'd0}, _GEN_3}; // @[md4.scala 179:19]
  wire [31:0] sum = _T_14 + const_; // @[md4.scala 186:34]
  wire  _T_19 = 5'h3 == io_s; // @[Conditional.scala 37:30]
  wire [28:0] hi = sum[28:0]; // @[md4.scala 202:24]
  wire [2:0] lo = sum[31:29]; // @[md4.scala 202:36]
  wire [31:0] _T_20 = {hi,lo}; // @[Cat.scala 30:58]
  wire  _T_21 = 5'h5 == io_s; // @[Conditional.scala 37:30]
  wire [26:0] hi_1 = sum[26:0]; // @[md4.scala 205:24]
  wire [4:0] lo_1 = sum[31:27]; // @[md4.scala 205:36]
  wire [31:0] _T_22 = {hi_1,lo_1}; // @[Cat.scala 30:58]
  wire  _T_23 = 5'h7 == io_s; // @[Conditional.scala 37:30]
  wire [24:0] hi_2 = sum[24:0]; // @[md4.scala 208:24]
  wire [6:0] lo_2 = sum[31:25]; // @[md4.scala 208:36]
  wire [31:0] _T_24 = {hi_2,lo_2}; // @[Cat.scala 30:58]
  wire  _T_25 = 5'h9 == io_s; // @[Conditional.scala 37:30]
  wire [22:0] hi_3 = sum[22:0]; // @[md4.scala 211:24]
  wire [8:0] lo_3 = sum[31:23]; // @[md4.scala 211:36]
  wire [31:0] _T_26 = {hi_3,lo_3}; // @[Cat.scala 30:58]
  wire  _T_27 = 5'hb == io_s; // @[Conditional.scala 37:30]
  wire [20:0] hi_4 = sum[20:0]; // @[md4.scala 214:24]
  wire [10:0] lo_4 = sum[31:21]; // @[md4.scala 214:36]
  wire [31:0] _T_28 = {hi_4,lo_4}; // @[Cat.scala 30:58]
  wire  _T_29 = 5'hd == io_s; // @[Conditional.scala 37:30]
  wire [18:0] hi_5 = sum[18:0]; // @[md4.scala 217:24]
  wire [12:0] lo_5 = sum[31:19]; // @[md4.scala 217:36]
  wire [31:0] _T_30 = {hi_5,lo_5}; // @[Cat.scala 30:58]
  wire  _T_31 = 5'hf == io_s; // @[Conditional.scala 37:30]
  wire [16:0] hi_6 = sum[16:0]; // @[md4.scala 220:24]
  wire [14:0] lo_6 = sum[31:17]; // @[md4.scala 220:36]
  wire [31:0] _T_32 = {hi_6,lo_6}; // @[Cat.scala 30:58]
  wire  _T_33 = 5'h13 == io_s; // @[Conditional.scala 37:30]
  wire [12:0] hi_7 = sum[12:0]; // @[md4.scala 223:24]
  wire [18:0] lo_7 = sum[31:13]; // @[md4.scala 223:36]
  wire [31:0] _T_34 = {hi_7,lo_7}; // @[Cat.scala 30:58]
  wire [31:0] _GEN_4 = _T_33 ? _T_34 : 32'h0; // @[Conditional.scala 39:67 md4.scala 223:14 md4.scala 199:10]
  wire [31:0] _GEN_5 = _T_31 ? _T_32 : _GEN_4; // @[Conditional.scala 39:67 md4.scala 220:14]
  wire [31:0] _GEN_6 = _T_29 ? _T_30 : _GEN_5; // @[Conditional.scala 39:67 md4.scala 217:14]
  wire [31:0] _GEN_7 = _T_27 ? _T_28 : _GEN_6; // @[Conditional.scala 39:67 md4.scala 214:14]
  wire [31:0] _GEN_8 = _T_25 ? _T_26 : _GEN_7; // @[Conditional.scala 39:67 md4.scala 211:14]
  wire [31:0] _GEN_9 = _T_23 ? _T_24 : _GEN_8; // @[Conditional.scala 39:67 md4.scala 208:14]
  wire [31:0] _GEN_10 = _T_21 ? _T_22 : _GEN_9; // @[Conditional.scala 39:67 md4.scala 205:14]
  assign io_out = _T_19 ? _T_20 : _GEN_10; // @[Conditional.scala 40:58 md4.scala 202:14]
endmodule
module MappingX(
  input  [511:0] io_X,
  input  [1:0]   io_round,
  input  [4:0]   io_oper,
  output [31:0]  io_out
);
  wire  _T = 2'h0 == io_round; // @[Conditional.scala 37:30]
  wire  _T_1 = 5'h0 == io_oper; // @[Conditional.scala 37:30]
  wire  _T_3 = 5'h1 == io_oper; // @[Conditional.scala 37:30]
  wire  _T_5 = 5'h2 == io_oper; // @[Conditional.scala 37:30]
  wire  _T_7 = 5'h3 == io_oper; // @[Conditional.scala 37:30]
  wire  _T_9 = 5'h4 == io_oper; // @[Conditional.scala 37:30]
  wire  _T_11 = 5'h5 == io_oper; // @[Conditional.scala 37:30]
  wire  _T_13 = 5'h6 == io_oper; // @[Conditional.scala 37:30]
  wire  _T_15 = 5'h7 == io_oper; // @[Conditional.scala 37:30]
  wire  _T_17 = 5'h8 == io_oper; // @[Conditional.scala 37:30]
  wire  _T_19 = 5'h9 == io_oper; // @[Conditional.scala 37:30]
  wire  _T_21 = 5'ha == io_oper; // @[Conditional.scala 37:30]
  wire  _T_23 = 5'hb == io_oper; // @[Conditional.scala 37:30]
  wire  _T_25 = 5'hc == io_oper; // @[Conditional.scala 37:30]
  wire  _T_27 = 5'hd == io_oper; // @[Conditional.scala 37:30]
  wire  _T_29 = 5'he == io_oper; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_1 = _T_29 ? io_X[63:32] : io_X[31:0]; // @[Conditional.scala 39:67 md4.scala 285:18]
  wire [31:0] _GEN_2 = _T_27 ? io_X[95:64] : _GEN_1; // @[Conditional.scala 39:67 md4.scala 282:18]
  wire [31:0] _GEN_3 = _T_25 ? io_X[127:96] : _GEN_2; // @[Conditional.scala 39:67 md4.scala 279:18]
  wire [31:0] _GEN_4 = _T_23 ? io_X[159:128] : _GEN_3; // @[Conditional.scala 39:67 md4.scala 276:18]
  wire [31:0] _GEN_5 = _T_21 ? io_X[191:160] : _GEN_4; // @[Conditional.scala 39:67 md4.scala 273:18]
  wire [31:0] _GEN_6 = _T_19 ? io_X[223:192] : _GEN_5; // @[Conditional.scala 39:67 md4.scala 270:18]
  wire [31:0] _GEN_7 = _T_17 ? io_X[255:224] : _GEN_6; // @[Conditional.scala 39:67 md4.scala 267:18]
  wire [31:0] _GEN_8 = _T_15 ? io_X[287:256] : _GEN_7; // @[Conditional.scala 39:67 md4.scala 264:18]
  wire [31:0] _GEN_9 = _T_13 ? io_X[319:288] : _GEN_8; // @[Conditional.scala 39:67 md4.scala 261:18]
  wire [31:0] _GEN_10 = _T_11 ? io_X[351:320] : _GEN_9; // @[Conditional.scala 39:67 md4.scala 258:18]
  wire [31:0] _GEN_11 = _T_9 ? io_X[383:352] : _GEN_10; // @[Conditional.scala 39:67 md4.scala 255:18]
  wire [31:0] _GEN_12 = _T_7 ? io_X[415:384] : _GEN_11; // @[Conditional.scala 39:67 md4.scala 252:18]
  wire [31:0] _GEN_13 = _T_5 ? io_X[447:416] : _GEN_12; // @[Conditional.scala 39:67 md4.scala 249:18]
  wire [31:0] _GEN_14 = _T_3 ? io_X[479:448] : _GEN_13; // @[Conditional.scala 39:67 md4.scala 246:18]
  wire [31:0] _GEN_15 = _T_1 ? io_X[511:480] : _GEN_14; // @[Conditional.scala 40:58 md4.scala 243:18]
  wire  _T_33 = 2'h1 == io_round; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_17 = _T_29 ? io_X[159:128] : io_X[31:0]; // @[Conditional.scala 39:67 md4.scala 337:18]
  wire [31:0] _GEN_18 = _T_27 ? io_X[287:256] : _GEN_17; // @[Conditional.scala 39:67 md4.scala 334:18]
  wire [31:0] _GEN_19 = _T_25 ? io_X[415:384] : _GEN_18; // @[Conditional.scala 39:67 md4.scala 331:18]
  wire [31:0] _GEN_20 = _T_23 ? io_X[63:32] : _GEN_19; // @[Conditional.scala 39:67 md4.scala 328:18]
  wire [31:0] _GEN_21 = _T_21 ? io_X[191:160] : _GEN_20; // @[Conditional.scala 39:67 md4.scala 325:18]
  wire [31:0] _GEN_22 = _T_19 ? io_X[319:288] : _GEN_21; // @[Conditional.scala 39:67 md4.scala 322:18]
  wire [31:0] _GEN_23 = _T_17 ? io_X[447:416] : _GEN_22; // @[Conditional.scala 39:67 md4.scala 319:18]
  wire [31:0] _GEN_24 = _T_15 ? io_X[95:64] : _GEN_23; // @[Conditional.scala 39:67 md4.scala 316:18]
  wire [31:0] _GEN_25 = _T_13 ? io_X[223:192] : _GEN_24; // @[Conditional.scala 39:67 md4.scala 313:18]
  wire [31:0] _GEN_26 = _T_11 ? io_X[351:320] : _GEN_25; // @[Conditional.scala 39:67 md4.scala 310:18]
  wire [31:0] _GEN_27 = _T_9 ? io_X[479:448] : _GEN_26; // @[Conditional.scala 39:67 md4.scala 307:18]
  wire [31:0] _GEN_28 = _T_7 ? io_X[127:96] : _GEN_27; // @[Conditional.scala 39:67 md4.scala 304:18]
  wire [31:0] _GEN_29 = _T_5 ? io_X[255:224] : _GEN_28; // @[Conditional.scala 39:67 md4.scala 301:18]
  wire [31:0] _GEN_30 = _T_3 ? io_X[383:352] : _GEN_29; // @[Conditional.scala 39:67 md4.scala 298:18]
  wire [31:0] _GEN_31 = _T_1 ? io_X[511:480] : _GEN_30; // @[Conditional.scala 40:58 md4.scala 295:18]
  wire [31:0] _GEN_33 = _T_29 ? io_X[287:256] : io_X[31:0]; // @[Conditional.scala 39:67 md4.scala 389:18]
  wire [31:0] _GEN_34 = _T_27 ? io_X[159:128] : _GEN_33; // @[Conditional.scala 39:67 md4.scala 386:18]
  wire [31:0] _GEN_35 = _T_25 ? io_X[415:384] : _GEN_34; // @[Conditional.scala 39:67 md4.scala 383:18]
  wire [31:0] _GEN_36 = _T_23 ? io_X[95:64] : _GEN_35; // @[Conditional.scala 39:67 md4.scala 380:18]
  wire [31:0] _GEN_37 = _T_21 ? io_X[351:320] : _GEN_36; // @[Conditional.scala 39:67 md4.scala 377:18]
  wire [31:0] _GEN_38 = _T_19 ? io_X[223:192] : _GEN_37; // @[Conditional.scala 39:67 md4.scala 374:18]
  wire [31:0] _GEN_39 = _T_17 ? io_X[479:448] : _GEN_38; // @[Conditional.scala 39:67 md4.scala 371:18]
  wire [31:0] _GEN_40 = _T_15 ? io_X[63:32] : _GEN_39; // @[Conditional.scala 39:67 md4.scala 368:18]
  wire [31:0] _GEN_41 = _T_13 ? io_X[319:288] : _GEN_40; // @[Conditional.scala 39:67 md4.scala 365:18]
  wire [31:0] _GEN_42 = _T_11 ? io_X[191:160] : _GEN_41; // @[Conditional.scala 39:67 md4.scala 362:18]
  wire [31:0] _GEN_43 = _T_9 ? io_X[447:416] : _GEN_42; // @[Conditional.scala 39:67 md4.scala 359:18]
  wire [31:0] _GEN_44 = _T_7 ? io_X[127:96] : _GEN_43; // @[Conditional.scala 39:67 md4.scala 356:18]
  wire [31:0] _GEN_45 = _T_5 ? io_X[383:352] : _GEN_44; // @[Conditional.scala 39:67 md4.scala 353:18]
  wire [31:0] _GEN_46 = _T_3 ? io_X[255:224] : _GEN_45; // @[Conditional.scala 39:67 md4.scala 350:18]
  wire [31:0] _GEN_47 = _T_1 ? io_X[511:480] : _GEN_46; // @[Conditional.scala 40:58 md4.scala 347:18]
  wire [31:0] _GEN_49 = _T_33 ? _GEN_31 : _GEN_47; // @[Conditional.scala 39:67]
  assign io_out = _T ? _GEN_15 : _GEN_49; // @[Conditional.scala 40:58]
endmodule
module changeWordOrder(
  input  [31:0] io_in,
  output [31:0] io_out
);
  wire [7:0] byte0 = io_in[7:0]; // @[md4.scala 406:17]
  wire [7:0] byte1 = io_in[15:8]; // @[md4.scala 407:17]
  wire [7:0] byte2 = io_in[23:16]; // @[md4.scala 408:17]
  wire [7:0] byte3 = io_in[31:24]; // @[md4.scala 409:17]
  wire [15:0] lo = {byte2,byte3}; // @[Cat.scala 30:58]
  wire [15:0] hi = {byte0,byte1}; // @[Cat.scala 30:58]
  assign io_out = {hi,lo}; // @[Cat.scala 30:58]
endmodule
module changeWordsOrder(
  input  [511:0] io_in,
  output [511:0] io_out
);
  wire [31:0] changeWordOrder_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_1_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_1_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_2_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_2_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_3_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_3_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_4_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_4_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_5_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_5_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_6_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_6_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_7_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_7_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_8_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_8_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_9_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_9_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_10_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_10_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_11_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_11_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_12_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_12_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_13_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_13_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_14_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_14_io_out; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_15_io_in; // @[md4.scala 421:11]
  wire [31:0] changeWordOrder_15_io_out; // @[md4.scala 421:11]
  wire [31:0] PEs_1_out = changeWordOrder_1_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_0_out = changeWordOrder_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_3_out = changeWordOrder_3_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_2_out = changeWordOrder_2_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_5_out = changeWordOrder_5_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_4_out = changeWordOrder_4_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_7_out = changeWordOrder_7_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_6_out = changeWordOrder_6_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [255:0] lo = {PEs_7_out,PEs_6_out,PEs_5_out,PEs_4_out,PEs_3_out,PEs_2_out,PEs_1_out,PEs_0_out}; // @[Cat.scala 30:58]
  wire [31:0] PEs_9_out = changeWordOrder_9_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_8_out = changeWordOrder_8_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_11_out = changeWordOrder_11_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_10_out = changeWordOrder_10_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_13_out = changeWordOrder_13_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_12_out = changeWordOrder_12_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_15_out = changeWordOrder_15_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [31:0] PEs_14_out = changeWordOrder_14_io_out; // @[md4.scala 420:20 md4.scala 420:20]
  wire [255:0] hi = {PEs_15_out,PEs_14_out,PEs_13_out,PEs_12_out,PEs_11_out,PEs_10_out,PEs_9_out,PEs_8_out}; // @[Cat.scala 30:58]
  changeWordOrder changeWordOrder ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_io_in),
    .io_out(changeWordOrder_io_out)
  );
  changeWordOrder changeWordOrder_1 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_1_io_in),
    .io_out(changeWordOrder_1_io_out)
  );
  changeWordOrder changeWordOrder_2 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_2_io_in),
    .io_out(changeWordOrder_2_io_out)
  );
  changeWordOrder changeWordOrder_3 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_3_io_in),
    .io_out(changeWordOrder_3_io_out)
  );
  changeWordOrder changeWordOrder_4 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_4_io_in),
    .io_out(changeWordOrder_4_io_out)
  );
  changeWordOrder changeWordOrder_5 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_5_io_in),
    .io_out(changeWordOrder_5_io_out)
  );
  changeWordOrder changeWordOrder_6 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_6_io_in),
    .io_out(changeWordOrder_6_io_out)
  );
  changeWordOrder changeWordOrder_7 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_7_io_in),
    .io_out(changeWordOrder_7_io_out)
  );
  changeWordOrder changeWordOrder_8 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_8_io_in),
    .io_out(changeWordOrder_8_io_out)
  );
  changeWordOrder changeWordOrder_9 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_9_io_in),
    .io_out(changeWordOrder_9_io_out)
  );
  changeWordOrder changeWordOrder_10 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_10_io_in),
    .io_out(changeWordOrder_10_io_out)
  );
  changeWordOrder changeWordOrder_11 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_11_io_in),
    .io_out(changeWordOrder_11_io_out)
  );
  changeWordOrder changeWordOrder_12 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_12_io_in),
    .io_out(changeWordOrder_12_io_out)
  );
  changeWordOrder changeWordOrder_13 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_13_io_in),
    .io_out(changeWordOrder_13_io_out)
  );
  changeWordOrder changeWordOrder_14 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_14_io_in),
    .io_out(changeWordOrder_14_io_out)
  );
  changeWordOrder changeWordOrder_15 ( // @[md4.scala 421:11]
    .io_in(changeWordOrder_15_io_in),
    .io_out(changeWordOrder_15_io_out)
  );
  assign io_out = {hi,lo}; // @[Cat.scala 30:58]
  assign changeWordOrder_io_in = io_in[31:0]; // @[md4.scala 424:23]
  assign changeWordOrder_1_io_in = io_in[63:32]; // @[md4.scala 424:23]
  assign changeWordOrder_2_io_in = io_in[95:64]; // @[md4.scala 424:23]
  assign changeWordOrder_3_io_in = io_in[127:96]; // @[md4.scala 424:23]
  assign changeWordOrder_4_io_in = io_in[159:128]; // @[md4.scala 424:23]
  assign changeWordOrder_5_io_in = io_in[191:160]; // @[md4.scala 424:23]
  assign changeWordOrder_6_io_in = io_in[223:192]; // @[md4.scala 424:23]
  assign changeWordOrder_7_io_in = io_in[255:224]; // @[md4.scala 424:23]
  assign changeWordOrder_8_io_in = io_in[287:256]; // @[md4.scala 424:23]
  assign changeWordOrder_9_io_in = io_in[319:288]; // @[md4.scala 424:23]
  assign changeWordOrder_10_io_in = io_in[351:320]; // @[md4.scala 424:23]
  assign changeWordOrder_11_io_in = io_in[383:352]; // @[md4.scala 424:23]
  assign changeWordOrder_12_io_in = io_in[415:384]; // @[md4.scala 424:23]
  assign changeWordOrder_13_io_in = io_in[447:416]; // @[md4.scala 424:23]
  assign changeWordOrder_14_io_in = io_in[479:448]; // @[md4.scala 424:23]
  assign changeWordOrder_15_io_in = io_in[511:480]; // @[md4.scala 424:23]
endmodule
module md4(
  input          clock,
  input          reset,
  output         io_data_ready,
  input          io_data_valid,
  input  [511:0] io_data_bits,
  output         io_dataPieces_ready,
  input          io_dataPieces_valid,
  input  [1:0]   io_dataPieces_bits,
  input          io_hash_ready,
  output         io_hash_valid,
  output [127:0] io_hash_bits
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
  reg [511:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] m_io_a; // @[md4.scala 23:17]
  wire [31:0] m_io_b; // @[md4.scala 23:17]
  wire [31:0] m_io_c; // @[md4.scala 23:17]
  wire [31:0] m_io_d; // @[md4.scala 23:17]
  wire [31:0] m_io_x; // @[md4.scala 23:17]
  wire [4:0] m_io_s; // @[md4.scala 23:17]
  wire [1:0] m_io_round; // @[md4.scala 23:17]
  wire [31:0] m_io_out; // @[md4.scala 23:17]
  wire [511:0] map_io_X; // @[md4.scala 32:19]
  wire [1:0] map_io_round; // @[md4.scala 32:19]
  wire [4:0] map_io_oper; // @[md4.scala 32:19]
  wire [31:0] map_io_out; // @[md4.scala 32:19]
  wire [511:0] change1_io_in; // @[md4.scala 38:23]
  wire [511:0] change1_io_out; // @[md4.scala 38:23]
  wire [511:0] change2_io_in; // @[md4.scala 41:23]
  wire [511:0] change2_io_out; // @[md4.scala 41:23]
  reg [2:0] stateReg; // @[md4.scala 15:25]
  reg [1:0] roundReg; // @[md4.scala 16:25]
  reg [4:0] operReg; // @[md4.scala 17:24]
  reg [31:0] A; // @[md4.scala 18:43]
  reg [31:0] B; // @[md4.scala 18:43]
  reg [31:0] C; // @[md4.scala 18:43]
  reg [31:0] D; // @[md4.scala 18:43]
  reg [31:0] AA; // @[md4.scala 18:43]
  reg [31:0] BB; // @[md4.scala 18:43]
  reg [31:0] CC; // @[md4.scala 18:43]
  reg [31:0] DD; // @[md4.scala 18:43]
  reg [511:0] X; // @[md4.scala 19:18]
  reg [1:0] dataPiecesReg; // @[md4.scala 21:30]
  wire [127:0] _T = {A,B,C,D}; // @[Cat.scala 30:58]
  wire  _T_4 = 3'h0 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _T_7 = io_dataPieces_bits - 2'h1; // @[md4.scala 60:49]
  wire [1:0] _GEN_0 = io_data_valid ? 2'h0 : roundReg; // @[md4.scala 57:31 md4.scala 58:22 md4.scala 16:25]
  wire [4:0] _GEN_1 = io_data_valid ? 5'h0 : operReg; // @[md4.scala 57:31 md4.scala 59:21 md4.scala 17:24]
  wire [1:0] _GEN_2 = io_data_valid ? _T_7 : io_dataPieces_bits; // @[md4.scala 57:31 md4.scala 60:27 md4.scala 68:27]
  wire [511:0] _GEN_3 = io_data_valid ? change1_io_out : X; // @[md4.scala 57:31 md4.scala 61:15 md4.scala 19:18]
  wire [31:0] _GEN_4 = io_data_valid ? 32'h67452301 : AA; // @[md4.scala 57:31 md4.scala 62:16 md4.scala 18:43]
  wire [31:0] _GEN_5 = io_data_valid ? 32'hefcdab89 : BB; // @[md4.scala 57:31 md4.scala 63:16 md4.scala 18:43]
  wire [31:0] _GEN_6 = io_data_valid ? 32'h98badcfe : CC; // @[md4.scala 57:31 md4.scala 64:16 md4.scala 18:43]
  wire [31:0] _GEN_7 = io_data_valid ? 32'h10325476 : DD; // @[md4.scala 57:31 md4.scala 65:16 md4.scala 18:43]
  wire [2:0] _GEN_8 = io_data_valid ? 3'h2 : 3'h1; // @[md4.scala 57:31 md4.scala 66:22 md4.scala 69:22]
  wire  _T_8 = 3'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _T_10 = dataPiecesReg - 2'h1; // @[md4.scala 78:40]
  wire  _T_11 = 3'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [4:0] _GEN_9 = operReg % 5'h4; // @[md4.scala 88:21]
  wire [2:0] _T_12 = _GEN_9[2:0]; // @[md4.scala 88:21]
  wire  _T_16 = 2'h0 == roundReg; // @[Conditional.scala 37:30]
  wire  _T_17 = 2'h1 == roundReg; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_42 = _T_17 ? 4'h5 : 4'h9; // @[Conditional.scala 39:67 md4.scala 98:20]
  wire [3:0] _GEN_43 = _T_16 ? 4'h7 : _GEN_42; // @[Conditional.scala 40:58 md4.scala 95:20]
  wire [3:0] _GEN_45 = _T_17 ? 4'h9 : 4'hb; // @[Conditional.scala 39:67 md4.scala 111:20]
  wire [3:0] _GEN_46 = _T_16 ? 4'hb : _GEN_45; // @[Conditional.scala 40:58 md4.scala 108:20]
  wire [3:0] _GEN_48 = _T_17 ? 4'hd : 4'hf; // @[Conditional.scala 39:67 md4.scala 124:20]
  wire [4:0] _GEN_49 = _T_16 ? 5'h13 : {{1'd0}, _GEN_48}; // @[Conditional.scala 40:58 md4.scala 121:20]
  wire [31:0] _GEN_50 = _T_12 == 3'h2 ? C : B; // @[md4.scala 104:44 md4.scala 105:16 md4.scala 118:16]
  wire [31:0] _GEN_51 = _T_12 == 3'h2 ? D : C; // @[md4.scala 104:44 md4.scala 105:29 md4.scala 118:29]
  wire [31:0] _GEN_52 = _T_12 == 3'h2 ? A : D; // @[md4.scala 104:44 md4.scala 105:42 md4.scala 118:42]
  wire [31:0] _GEN_53 = _T_12 == 3'h2 ? B : A; // @[md4.scala 104:44 md4.scala 105:55 md4.scala 118:55]
  wire [31:0] _GEN_54 = _T_12 == 3'h2 ? m_io_out : C; // @[md4.scala 104:44 md4.scala 105:63 md4.scala 18:43]
  wire [4:0] _GEN_55 = _T_12 == 3'h2 ? {{1'd0}, _GEN_46} : _GEN_49; // @[md4.scala 104:44]
  wire [31:0] _GEN_56 = _T_12 == 3'h2 ? B : m_io_out; // @[md4.scala 104:44 md4.scala 18:43 md4.scala 118:63]
  wire [31:0] _GEN_57 = _T_12 == 3'h1 ? D : _GEN_50; // @[md4.scala 91:44 md4.scala 92:16]
  wire [31:0] _GEN_58 = _T_12 == 3'h1 ? A : _GEN_51; // @[md4.scala 91:44 md4.scala 92:29]
  wire [31:0] _GEN_59 = _T_12 == 3'h1 ? B : _GEN_52; // @[md4.scala 91:44 md4.scala 92:42]
  wire [31:0] _GEN_60 = _T_12 == 3'h1 ? C : _GEN_53; // @[md4.scala 91:44 md4.scala 92:55]
  wire [31:0] _GEN_61 = _T_12 == 3'h1 ? m_io_out : D; // @[md4.scala 91:44 md4.scala 92:63 md4.scala 18:43]
  wire [4:0] _GEN_62 = _T_12 == 3'h1 ? {{1'd0}, _GEN_43} : _GEN_55; // @[md4.scala 91:44]
  wire [31:0] _GEN_63 = _T_12 == 3'h1 ? C : _GEN_54; // @[md4.scala 91:44 md4.scala 18:43]
  wire [31:0] _GEN_64 = _T_12 == 3'h1 ? B : _GEN_56; // @[md4.scala 91:44 md4.scala 18:43]
  wire [31:0] _GEN_69 = _T_12 == 3'h0 ? m_io_out : A; // @[md4.scala 88:37 md4.scala 89:63 md4.scala 18:43]
  wire [31:0] _GEN_71 = _T_12 == 3'h0 ? D : _GEN_61; // @[md4.scala 88:37 md4.scala 18:43]
  wire [31:0] _GEN_72 = _T_12 == 3'h0 ? C : _GEN_63; // @[md4.scala 88:37 md4.scala 18:43]
  wire [31:0] _GEN_73 = _T_12 == 3'h0 ? B : _GEN_64; // @[md4.scala 88:37 md4.scala 18:43]
  wire [1:0] _T_30 = roundReg + 2'h1; // @[md4.scala 137:32]
  wire [2:0] _GEN_74 = roundReg == 2'h2 ? 3'h3 : stateReg; // @[md4.scala 134:32 md4.scala 135:20 md4.scala 15:25]
  wire [1:0] _GEN_75 = roundReg == 2'h2 ? roundReg : _T_30; // @[md4.scala 134:32 md4.scala 16:25 md4.scala 137:20]
  wire [4:0] _T_32 = operReg + 5'h1; // @[md4.scala 140:28]
  wire [4:0] _GEN_76 = operReg == 5'hf ? 5'h0 : _T_32; // @[md4.scala 132:30 md4.scala 133:17 md4.scala 140:17]
  wire [2:0] _GEN_77 = operReg == 5'hf ? _GEN_74 : stateReg; // @[md4.scala 132:30 md4.scala 15:25]
  wire [1:0] _GEN_78 = operReg == 5'hf ? _GEN_75 : roundReg; // @[md4.scala 132:30 md4.scala 16:25]
  wire  _T_33 = 3'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _hi_T_1 = A + AA; // @[md4.scala 144:14]
  wire [31:0] _lo_T_1 = B + BB; // @[md4.scala 145:14]
  wire [31:0] _hi_T_3 = C + CC; // @[md4.scala 146:14]
  wire [31:0] _lo_T_3 = D + DD; // @[md4.scala 147:14]
  wire [2:0] _GEN_79 = dataPiecesReg == 2'h0 ? 3'h4 : 3'h1; // @[md4.scala 148:35 md4.scala 149:18 md4.scala 151:18]
  wire  _T_35 = 3'h4 == stateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_80 = io_hash_ready ? 3'h0 : stateReg; // @[md4.scala 155:27 md4.scala 156:20 md4.scala 15:25]
  wire [2:0] _GEN_81 = _T_35 ? _GEN_80 : stateReg; // @[Conditional.scala 39:67 md4.scala 15:25]
  wire [31:0] _GEN_82 = _T_33 ? _hi_T_1 : A; // @[Conditional.scala 39:67 md4.scala 144:9 md4.scala 18:43]
  wire [31:0] _GEN_83 = _T_33 ? _lo_T_1 : B; // @[Conditional.scala 39:67 md4.scala 145:9 md4.scala 18:43]
  wire [31:0] _GEN_84 = _T_33 ? _hi_T_3 : C; // @[Conditional.scala 39:67 md4.scala 146:9 md4.scala 18:43]
  wire [31:0] _GEN_85 = _T_33 ? _lo_T_3 : D; // @[Conditional.scala 39:67 md4.scala 147:9 md4.scala 18:43]
  wire [2:0] _GEN_86 = _T_33 ? _GEN_79 : _GEN_81; // @[Conditional.scala 39:67]
  Operation m ( // @[md4.scala 23:17]
    .io_a(m_io_a),
    .io_b(m_io_b),
    .io_c(m_io_c),
    .io_d(m_io_d),
    .io_x(m_io_x),
    .io_s(m_io_s),
    .io_round(m_io_round),
    .io_out(m_io_out)
  );
  MappingX map ( // @[md4.scala 32:19]
    .io_X(map_io_X),
    .io_round(map_io_round),
    .io_oper(map_io_oper),
    .io_out(map_io_out)
  );
  changeWordsOrder change1 ( // @[md4.scala 38:23]
    .io_in(change1_io_in),
    .io_out(change1_io_out)
  );
  changeWordsOrder change2 ( // @[md4.scala 41:23]
    .io_in(change2_io_in),
    .io_out(change2_io_out)
  );
  assign io_data_ready = stateReg == 3'h1; // @[md4.scala 47:29]
  assign io_dataPieces_ready = stateReg == 3'h0; // @[md4.scala 46:35]
  assign io_hash_valid = stateReg == 3'h4; // @[md4.scala 44:29]
  assign io_hash_bits = change2_io_out[127:0]; // @[md4.scala 45:16]
  assign m_io_a = _T_12 == 3'h0 ? A : _GEN_57; // @[md4.scala 88:37 md4.scala 89:16]
  assign m_io_b = _T_12 == 3'h0 ? B : _GEN_58; // @[md4.scala 88:37 md4.scala 89:29]
  assign m_io_c = _T_12 == 3'h0 ? C : _GEN_59; // @[md4.scala 88:37 md4.scala 89:42]
  assign m_io_d = _T_12 == 3'h0 ? D : _GEN_60; // @[md4.scala 88:37 md4.scala 89:55]
  assign m_io_x = map_io_out; // @[md4.scala 33:10]
  assign m_io_s = _T_12 == 3'h0 ? 5'h3 : _GEN_62; // @[md4.scala 88:37 md4.scala 90:16]
  assign m_io_round = roundReg; // @[md4.scala 30:14]
  assign map_io_X = X; // @[md4.scala 34:12]
  assign map_io_round = roundReg; // @[md4.scala 35:16]
  assign map_io_oper = operReg; // @[md4.scala 36:15]
  assign change1_io_in = io_data_bits; // @[md4.scala 39:17]
  assign change2_io_in = {{384'd0}, _T}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if (reset) begin // @[md4.scala 15:25]
      stateReg <= 3'h0; // @[md4.scala 15:25]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_dataPieces_valid) begin // @[md4.scala 51:33]
        if (io_dataPieces_bits > 2'h0) begin // @[md4.scala 52:40]
          stateReg <= _GEN_8;
        end
      end
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      if (io_data_valid) begin // @[md4.scala 75:27]
        stateReg <= 3'h2; // @[md4.scala 84:18]
      end
    end else if (_T_11) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_77;
    end else begin
      stateReg <= _GEN_86;
    end
    if (reset) begin // @[md4.scala 16:25]
      roundReg <= 2'h0; // @[md4.scala 16:25]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_dataPieces_valid) begin // @[md4.scala 51:33]
        if (io_dataPieces_bits > 2'h0) begin // @[md4.scala 52:40]
          roundReg <= _GEN_0;
        end
      end
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      roundReg <= _GEN_0;
    end else if (_T_11) begin // @[Conditional.scala 39:67]
      roundReg <= _GEN_78;
    end
    if (reset) begin // @[md4.scala 17:24]
      operReg <= 5'h0; // @[md4.scala 17:24]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_dataPieces_valid) begin // @[md4.scala 51:33]
        if (io_dataPieces_bits > 2'h0) begin // @[md4.scala 52:40]
          operReg <= _GEN_1;
        end
      end
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      operReg <= _GEN_1;
    end else if (_T_11) begin // @[Conditional.scala 39:67]
      operReg <= _GEN_76;
    end
    if (reset) begin // @[md4.scala 18:43]
      A <= 32'h0; // @[md4.scala 18:43]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_dataPieces_valid) begin // @[md4.scala 51:33]
        if (io_dataPieces_bits > 2'h0) begin // @[md4.scala 52:40]
          A <= 32'h67452301; // @[md4.scala 53:13]
        end
      end
    end else if (!(_T_8)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        A <= _GEN_69;
      end else begin
        A <= _GEN_82;
      end
    end
    if (reset) begin // @[md4.scala 18:43]
      B <= 32'h0; // @[md4.scala 18:43]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_dataPieces_valid) begin // @[md4.scala 51:33]
        if (io_dataPieces_bits > 2'h0) begin // @[md4.scala 52:40]
          B <= 32'hefcdab89; // @[md4.scala 54:13]
        end
      end
    end else if (!(_T_8)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        B <= _GEN_73;
      end else begin
        B <= _GEN_83;
      end
    end
    if (reset) begin // @[md4.scala 18:43]
      C <= 32'h0; // @[md4.scala 18:43]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_dataPieces_valid) begin // @[md4.scala 51:33]
        if (io_dataPieces_bits > 2'h0) begin // @[md4.scala 52:40]
          C <= 32'h98badcfe; // @[md4.scala 55:13]
        end
      end
    end else if (!(_T_8)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        C <= _GEN_72;
      end else begin
        C <= _GEN_84;
      end
    end
    if (reset) begin // @[md4.scala 18:43]
      D <= 32'h0; // @[md4.scala 18:43]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_dataPieces_valid) begin // @[md4.scala 51:33]
        if (io_dataPieces_bits > 2'h0) begin // @[md4.scala 52:40]
          D <= 32'h10325476; // @[md4.scala 56:13]
        end
      end
    end else if (!(_T_8)) begin // @[Conditional.scala 39:67]
      if (_T_11) begin // @[Conditional.scala 39:67]
        D <= _GEN_71;
      end else begin
        D <= _GEN_85;
      end
    end
    if (reset) begin // @[md4.scala 18:43]
      AA <= 32'h0; // @[md4.scala 18:43]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_dataPieces_valid) begin // @[md4.scala 51:33]
        if (io_dataPieces_bits > 2'h0) begin // @[md4.scala 52:40]
          AA <= _GEN_4;
        end
      end
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      if (io_data_valid) begin // @[md4.scala 75:27]
        AA <= A; // @[md4.scala 80:12]
      end
    end
    if (reset) begin // @[md4.scala 18:43]
      BB <= 32'h0; // @[md4.scala 18:43]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_dataPieces_valid) begin // @[md4.scala 51:33]
        if (io_dataPieces_bits > 2'h0) begin // @[md4.scala 52:40]
          BB <= _GEN_5;
        end
      end
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      if (io_data_valid) begin // @[md4.scala 75:27]
        BB <= B; // @[md4.scala 81:12]
      end
    end
    if (reset) begin // @[md4.scala 18:43]
      CC <= 32'h0; // @[md4.scala 18:43]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_dataPieces_valid) begin // @[md4.scala 51:33]
        if (io_dataPieces_bits > 2'h0) begin // @[md4.scala 52:40]
          CC <= _GEN_6;
        end
      end
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      if (io_data_valid) begin // @[md4.scala 75:27]
        CC <= C; // @[md4.scala 82:12]
      end
    end
    if (reset) begin // @[md4.scala 18:43]
      DD <= 32'h0; // @[md4.scala 18:43]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_dataPieces_valid) begin // @[md4.scala 51:33]
        if (io_dataPieces_bits > 2'h0) begin // @[md4.scala 52:40]
          DD <= _GEN_7;
        end
      end
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      if (io_data_valid) begin // @[md4.scala 75:27]
        DD <= D; // @[md4.scala 83:12]
      end
    end
    if (reset) begin // @[md4.scala 19:18]
      X <= 512'h0; // @[md4.scala 19:18]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_dataPieces_valid) begin // @[md4.scala 51:33]
        if (io_dataPieces_bits > 2'h0) begin // @[md4.scala 52:40]
          X <= _GEN_3;
        end
      end
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      X <= _GEN_3;
    end
    if (reset) begin // @[md4.scala 21:30]
      dataPiecesReg <= 2'h0; // @[md4.scala 21:30]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (io_dataPieces_valid) begin // @[md4.scala 51:33]
        if (io_dataPieces_bits > 2'h0) begin // @[md4.scala 52:40]
          dataPiecesReg <= _GEN_2;
        end
      end
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      if (io_data_valid) begin // @[md4.scala 75:27]
        dataPiecesReg <= _T_10; // @[md4.scala 78:23]
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
  stateReg = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  roundReg = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  operReg = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  A = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  C = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  D = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  AA = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  BB = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  CC = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  DD = _RAND_10[31:0];
  _RAND_11 = {16{`RANDOM}};
  X = _RAND_11[511:0];
  _RAND_12 = {1{`RANDOM}};
  dataPiecesReg = _RAND_12[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
