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
  wire [31:0] _T = io_b & io_c; // @[MD4FSM.scala 179:14]
  wire [31:0] _T_1 = ~io_b; // @[MD4FSM.scala 179:26]
  wire [31:0] _T_2 = _T_1 & io_d; // @[MD4FSM.scala 179:40]
  wire [31:0] F = _T | _T_2; // @[MD4FSM.scala 179:22]
  wire [31:0] _T_5 = io_b & io_d; // @[MD4FSM.scala 180:30]
  wire [31:0] _T_6 = _T | _T_5; // @[MD4FSM.scala 180:22]
  wire [31:0] _T_7 = io_c & io_d; // @[MD4FSM.scala 180:46]
  wire [31:0] G = _T_6 | _T_7; // @[MD4FSM.scala 180:38]
  wire [31:0] _T_9 = io_b ^ io_c; // @[MD4FSM.scala 181:13]
  wire [31:0] H = _T_9 ^ io_d; // @[MD4FSM.scala 181:20]
  wire [31:0] _GEN_0 = io_round == 2'h1 ? G : H; // @[MD4FSM.scala 188:33 MD4FSM.scala 189:15 MD4FSM.scala 192:15]
  wire [31:0] operation = io_round == 2'h0 ? F : _GEN_0; // @[MD4FSM.scala 185:26 MD4FSM.scala 186:15]
  wire [31:0] _T_12 = io_a + operation; // @[MD4FSM.scala 183:15]
  wire [31:0] _T_14 = _T_12 + io_x; // @[MD4FSM.scala 183:27]
  wire [30:0] _GEN_1 = io_round == 2'h1 ? 31'h5a827999 : 31'h6ed9eba1; // @[MD4FSM.scala 188:33 MD4FSM.scala 190:11 MD4FSM.scala 193:11]
  wire [30:0] _GEN_3 = io_round == 2'h0 ? 31'h0 : _GEN_1; // @[MD4FSM.scala 185:26 MD4FSM.scala 187:11]
  wire [31:0] const_ = {{1'd0}, _GEN_3}; // @[MD4FSM.scala 176:19]
  wire [31:0] sum = _T_14 + const_; // @[MD4FSM.scala 183:34]
  wire  _T_19 = 5'h3 == io_s; // @[Conditional.scala 37:30]
  wire [28:0] hi = sum[28:0]; // @[MD4FSM.scala 199:24]
  wire [2:0] lo = sum[31:29]; // @[MD4FSM.scala 199:36]
  wire [31:0] _T_20 = {hi,lo}; // @[Cat.scala 30:58]
  wire  _T_21 = 5'h5 == io_s; // @[Conditional.scala 37:30]
  wire [26:0] hi_1 = sum[26:0]; // @[MD4FSM.scala 202:24]
  wire [4:0] lo_1 = sum[31:27]; // @[MD4FSM.scala 202:36]
  wire [31:0] _T_22 = {hi_1,lo_1}; // @[Cat.scala 30:58]
  wire  _T_23 = 5'h7 == io_s; // @[Conditional.scala 37:30]
  wire [24:0] hi_2 = sum[24:0]; // @[MD4FSM.scala 205:24]
  wire [6:0] lo_2 = sum[31:25]; // @[MD4FSM.scala 205:36]
  wire [31:0] _T_24 = {hi_2,lo_2}; // @[Cat.scala 30:58]
  wire  _T_25 = 5'h9 == io_s; // @[Conditional.scala 37:30]
  wire [22:0] hi_3 = sum[22:0]; // @[MD4FSM.scala 208:24]
  wire [8:0] lo_3 = sum[31:23]; // @[MD4FSM.scala 208:36]
  wire [31:0] _T_26 = {hi_3,lo_3}; // @[Cat.scala 30:58]
  wire  _T_27 = 5'hb == io_s; // @[Conditional.scala 37:30]
  wire [20:0] hi_4 = sum[20:0]; // @[MD4FSM.scala 211:24]
  wire [10:0] lo_4 = sum[31:21]; // @[MD4FSM.scala 211:36]
  wire [31:0] _T_28 = {hi_4,lo_4}; // @[Cat.scala 30:58]
  wire  _T_29 = 5'hd == io_s; // @[Conditional.scala 37:30]
  wire [18:0] hi_5 = sum[18:0]; // @[MD4FSM.scala 214:24]
  wire [12:0] lo_5 = sum[31:19]; // @[MD4FSM.scala 214:36]
  wire [31:0] _T_30 = {hi_5,lo_5}; // @[Cat.scala 30:58]
  wire  _T_31 = 5'hf == io_s; // @[Conditional.scala 37:30]
  wire [16:0] hi_6 = sum[16:0]; // @[MD4FSM.scala 217:24]
  wire [14:0] lo_6 = sum[31:17]; // @[MD4FSM.scala 217:36]
  wire [31:0] _T_32 = {hi_6,lo_6}; // @[Cat.scala 30:58]
  wire  _T_33 = 5'h13 == io_s; // @[Conditional.scala 37:30]
  wire [12:0] hi_7 = sum[12:0]; // @[MD4FSM.scala 220:24]
  wire [18:0] lo_7 = sum[31:13]; // @[MD4FSM.scala 220:36]
  wire [31:0] _T_34 = {hi_7,lo_7}; // @[Cat.scala 30:58]
  wire [31:0] _GEN_4 = _T_33 ? _T_34 : 32'h0; // @[Conditional.scala 39:67 MD4FSM.scala 220:14 MD4FSM.scala 196:10]
  wire [31:0] _GEN_5 = _T_31 ? _T_32 : _GEN_4; // @[Conditional.scala 39:67 MD4FSM.scala 217:14]
  wire [31:0] _GEN_6 = _T_29 ? _T_30 : _GEN_5; // @[Conditional.scala 39:67 MD4FSM.scala 214:14]
  wire [31:0] _GEN_7 = _T_27 ? _T_28 : _GEN_6; // @[Conditional.scala 39:67 MD4FSM.scala 211:14]
  wire [31:0] _GEN_8 = _T_25 ? _T_26 : _GEN_7; // @[Conditional.scala 39:67 MD4FSM.scala 208:14]
  wire [31:0] _GEN_9 = _T_23 ? _T_24 : _GEN_8; // @[Conditional.scala 39:67 MD4FSM.scala 205:14]
  wire [31:0] _GEN_10 = _T_21 ? _T_22 : _GEN_9; // @[Conditional.scala 39:67 MD4FSM.scala 202:14]
  assign io_out = _T_19 ? _T_20 : _GEN_10; // @[Conditional.scala 40:58 MD4FSM.scala 199:14]
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
  wire [31:0] _GEN_1 = _T_29 ? io_X[63:32] : io_X[31:0]; // @[Conditional.scala 39:67 MD4FSM.scala 282:18]
  wire [31:0] _GEN_2 = _T_27 ? io_X[95:64] : _GEN_1; // @[Conditional.scala 39:67 MD4FSM.scala 279:18]
  wire [31:0] _GEN_3 = _T_25 ? io_X[127:96] : _GEN_2; // @[Conditional.scala 39:67 MD4FSM.scala 276:18]
  wire [31:0] _GEN_4 = _T_23 ? io_X[159:128] : _GEN_3; // @[Conditional.scala 39:67 MD4FSM.scala 273:18]
  wire [31:0] _GEN_5 = _T_21 ? io_X[191:160] : _GEN_4; // @[Conditional.scala 39:67 MD4FSM.scala 270:18]
  wire [31:0] _GEN_6 = _T_19 ? io_X[223:192] : _GEN_5; // @[Conditional.scala 39:67 MD4FSM.scala 267:18]
  wire [31:0] _GEN_7 = _T_17 ? io_X[255:224] : _GEN_6; // @[Conditional.scala 39:67 MD4FSM.scala 264:18]
  wire [31:0] _GEN_8 = _T_15 ? io_X[287:256] : _GEN_7; // @[Conditional.scala 39:67 MD4FSM.scala 261:18]
  wire [31:0] _GEN_9 = _T_13 ? io_X[319:288] : _GEN_8; // @[Conditional.scala 39:67 MD4FSM.scala 258:18]
  wire [31:0] _GEN_10 = _T_11 ? io_X[351:320] : _GEN_9; // @[Conditional.scala 39:67 MD4FSM.scala 255:18]
  wire [31:0] _GEN_11 = _T_9 ? io_X[383:352] : _GEN_10; // @[Conditional.scala 39:67 MD4FSM.scala 252:18]
  wire [31:0] _GEN_12 = _T_7 ? io_X[415:384] : _GEN_11; // @[Conditional.scala 39:67 MD4FSM.scala 249:18]
  wire [31:0] _GEN_13 = _T_5 ? io_X[447:416] : _GEN_12; // @[Conditional.scala 39:67 MD4FSM.scala 246:18]
  wire [31:0] _GEN_14 = _T_3 ? io_X[479:448] : _GEN_13; // @[Conditional.scala 39:67 MD4FSM.scala 243:18]
  wire [31:0] _GEN_15 = _T_1 ? io_X[511:480] : _GEN_14; // @[Conditional.scala 40:58 MD4FSM.scala 240:18]
  wire  _T_33 = 2'h1 == io_round; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_17 = _T_29 ? io_X[159:128] : io_X[31:0]; // @[Conditional.scala 39:67 MD4FSM.scala 334:18]
  wire [31:0] _GEN_18 = _T_27 ? io_X[287:256] : _GEN_17; // @[Conditional.scala 39:67 MD4FSM.scala 331:18]
  wire [31:0] _GEN_19 = _T_25 ? io_X[415:384] : _GEN_18; // @[Conditional.scala 39:67 MD4FSM.scala 328:18]
  wire [31:0] _GEN_20 = _T_23 ? io_X[63:32] : _GEN_19; // @[Conditional.scala 39:67 MD4FSM.scala 325:18]
  wire [31:0] _GEN_21 = _T_21 ? io_X[191:160] : _GEN_20; // @[Conditional.scala 39:67 MD4FSM.scala 322:18]
  wire [31:0] _GEN_22 = _T_19 ? io_X[319:288] : _GEN_21; // @[Conditional.scala 39:67 MD4FSM.scala 319:18]
  wire [31:0] _GEN_23 = _T_17 ? io_X[447:416] : _GEN_22; // @[Conditional.scala 39:67 MD4FSM.scala 316:18]
  wire [31:0] _GEN_24 = _T_15 ? io_X[95:64] : _GEN_23; // @[Conditional.scala 39:67 MD4FSM.scala 313:18]
  wire [31:0] _GEN_25 = _T_13 ? io_X[223:192] : _GEN_24; // @[Conditional.scala 39:67 MD4FSM.scala 310:18]
  wire [31:0] _GEN_26 = _T_11 ? io_X[351:320] : _GEN_25; // @[Conditional.scala 39:67 MD4FSM.scala 307:18]
  wire [31:0] _GEN_27 = _T_9 ? io_X[479:448] : _GEN_26; // @[Conditional.scala 39:67 MD4FSM.scala 304:18]
  wire [31:0] _GEN_28 = _T_7 ? io_X[127:96] : _GEN_27; // @[Conditional.scala 39:67 MD4FSM.scala 301:18]
  wire [31:0] _GEN_29 = _T_5 ? io_X[255:224] : _GEN_28; // @[Conditional.scala 39:67 MD4FSM.scala 298:18]
  wire [31:0] _GEN_30 = _T_3 ? io_X[383:352] : _GEN_29; // @[Conditional.scala 39:67 MD4FSM.scala 295:18]
  wire [31:0] _GEN_31 = _T_1 ? io_X[511:480] : _GEN_30; // @[Conditional.scala 40:58 MD4FSM.scala 292:18]
  wire [31:0] _GEN_33 = _T_29 ? io_X[287:256] : io_X[31:0]; // @[Conditional.scala 39:67 MD4FSM.scala 386:18]
  wire [31:0] _GEN_34 = _T_27 ? io_X[159:128] : _GEN_33; // @[Conditional.scala 39:67 MD4FSM.scala 383:18]
  wire [31:0] _GEN_35 = _T_25 ? io_X[415:384] : _GEN_34; // @[Conditional.scala 39:67 MD4FSM.scala 380:18]
  wire [31:0] _GEN_36 = _T_23 ? io_X[95:64] : _GEN_35; // @[Conditional.scala 39:67 MD4FSM.scala 377:18]
  wire [31:0] _GEN_37 = _T_21 ? io_X[351:320] : _GEN_36; // @[Conditional.scala 39:67 MD4FSM.scala 374:18]
  wire [31:0] _GEN_38 = _T_19 ? io_X[223:192] : _GEN_37; // @[Conditional.scala 39:67 MD4FSM.scala 371:18]
  wire [31:0] _GEN_39 = _T_17 ? io_X[479:448] : _GEN_38; // @[Conditional.scala 39:67 MD4FSM.scala 368:18]
  wire [31:0] _GEN_40 = _T_15 ? io_X[63:32] : _GEN_39; // @[Conditional.scala 39:67 MD4FSM.scala 365:18]
  wire [31:0] _GEN_41 = _T_13 ? io_X[319:288] : _GEN_40; // @[Conditional.scala 39:67 MD4FSM.scala 362:18]
  wire [31:0] _GEN_42 = _T_11 ? io_X[191:160] : _GEN_41; // @[Conditional.scala 39:67 MD4FSM.scala 359:18]
  wire [31:0] _GEN_43 = _T_9 ? io_X[447:416] : _GEN_42; // @[Conditional.scala 39:67 MD4FSM.scala 356:18]
  wire [31:0] _GEN_44 = _T_7 ? io_X[127:96] : _GEN_43; // @[Conditional.scala 39:67 MD4FSM.scala 353:18]
  wire [31:0] _GEN_45 = _T_5 ? io_X[383:352] : _GEN_44; // @[Conditional.scala 39:67 MD4FSM.scala 350:18]
  wire [31:0] _GEN_46 = _T_3 ? io_X[255:224] : _GEN_45; // @[Conditional.scala 39:67 MD4FSM.scala 347:18]
  wire [31:0] _GEN_47 = _T_1 ? io_X[511:480] : _GEN_46; // @[Conditional.scala 40:58 MD4FSM.scala 344:18]
  wire [31:0] _GEN_49 = _T_33 ? _GEN_31 : _GEN_47; // @[Conditional.scala 39:67]
  assign io_out = _T ? _GEN_15 : _GEN_49; // @[Conditional.scala 40:58]
endmodule
module changeWordOrder(
  input  [31:0] io_in,
  output [31:0] io_out
);
  wire [7:0] byte0 = io_in[7:0]; // @[MD4FSM.scala 420:17]
  wire [7:0] byte1 = io_in[15:8]; // @[MD4FSM.scala 421:17]
  wire [7:0] byte2 = io_in[23:16]; // @[MD4FSM.scala 422:17]
  wire [7:0] byte3 = io_in[31:24]; // @[MD4FSM.scala 423:17]
  wire [15:0] lo = {byte2,byte3}; // @[Cat.scala 30:58]
  wire [15:0] hi = {byte0,byte1}; // @[Cat.scala 30:58]
  assign io_out = {hi,lo}; // @[Cat.scala 30:58]
endmodule
module changeWordsOrder(
  input  [511:0] io_in,
  output [511:0] io_out
);
  wire [31:0] changeWordOrder_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_1_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_1_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_2_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_2_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_3_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_3_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_4_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_4_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_5_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_5_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_6_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_6_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_7_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_7_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_8_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_8_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_9_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_9_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_10_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_10_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_11_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_11_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_12_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_12_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_13_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_13_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_14_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_14_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_15_io_in; // @[MD4FSM.scala 403:11]
  wire [31:0] changeWordOrder_15_io_out; // @[MD4FSM.scala 403:11]
  wire [31:0] PEs_1_out = changeWordOrder_1_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_0_out = changeWordOrder_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_3_out = changeWordOrder_3_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_2_out = changeWordOrder_2_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_5_out = changeWordOrder_5_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_4_out = changeWordOrder_4_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_7_out = changeWordOrder_7_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_6_out = changeWordOrder_6_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [255:0] lo = {PEs_7_out,PEs_6_out,PEs_5_out,PEs_4_out,PEs_3_out,PEs_2_out,PEs_1_out,PEs_0_out}; // @[Cat.scala 30:58]
  wire [31:0] PEs_9_out = changeWordOrder_9_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_8_out = changeWordOrder_8_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_11_out = changeWordOrder_11_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_10_out = changeWordOrder_10_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_13_out = changeWordOrder_13_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_12_out = changeWordOrder_12_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_15_out = changeWordOrder_15_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [31:0] PEs_14_out = changeWordOrder_14_io_out; // @[MD4FSM.scala 402:20 MD4FSM.scala 402:20]
  wire [255:0] hi = {PEs_15_out,PEs_14_out,PEs_13_out,PEs_12_out,PEs_11_out,PEs_10_out,PEs_9_out,PEs_8_out}; // @[Cat.scala 30:58]
  changeWordOrder changeWordOrder ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_io_in),
    .io_out(changeWordOrder_io_out)
  );
  changeWordOrder changeWordOrder_1 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_1_io_in),
    .io_out(changeWordOrder_1_io_out)
  );
  changeWordOrder changeWordOrder_2 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_2_io_in),
    .io_out(changeWordOrder_2_io_out)
  );
  changeWordOrder changeWordOrder_3 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_3_io_in),
    .io_out(changeWordOrder_3_io_out)
  );
  changeWordOrder changeWordOrder_4 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_4_io_in),
    .io_out(changeWordOrder_4_io_out)
  );
  changeWordOrder changeWordOrder_5 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_5_io_in),
    .io_out(changeWordOrder_5_io_out)
  );
  changeWordOrder changeWordOrder_6 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_6_io_in),
    .io_out(changeWordOrder_6_io_out)
  );
  changeWordOrder changeWordOrder_7 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_7_io_in),
    .io_out(changeWordOrder_7_io_out)
  );
  changeWordOrder changeWordOrder_8 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_8_io_in),
    .io_out(changeWordOrder_8_io_out)
  );
  changeWordOrder changeWordOrder_9 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_9_io_in),
    .io_out(changeWordOrder_9_io_out)
  );
  changeWordOrder changeWordOrder_10 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_10_io_in),
    .io_out(changeWordOrder_10_io_out)
  );
  changeWordOrder changeWordOrder_11 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_11_io_in),
    .io_out(changeWordOrder_11_io_out)
  );
  changeWordOrder changeWordOrder_12 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_12_io_in),
    .io_out(changeWordOrder_12_io_out)
  );
  changeWordOrder changeWordOrder_13 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_13_io_in),
    .io_out(changeWordOrder_13_io_out)
  );
  changeWordOrder changeWordOrder_14 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_14_io_in),
    .io_out(changeWordOrder_14_io_out)
  );
  changeWordOrder changeWordOrder_15 ( // @[MD4FSM.scala 403:11]
    .io_in(changeWordOrder_15_io_in),
    .io_out(changeWordOrder_15_io_out)
  );
  assign io_out = {hi,lo}; // @[Cat.scala 30:58]
  assign changeWordOrder_io_in = io_in[31:0]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_1_io_in = io_in[63:32]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_2_io_in = io_in[95:64]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_3_io_in = io_in[127:96]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_4_io_in = io_in[159:128]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_5_io_in = io_in[191:160]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_6_io_in = io_in[223:192]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_7_io_in = io_in[255:224]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_8_io_in = io_in[287:256]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_9_io_in = io_in[319:288]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_10_io_in = io_in[351:320]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_11_io_in = io_in[383:352]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_12_io_in = io_in[415:384]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_13_io_in = io_in[447:416]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_14_io_in = io_in[479:448]; // @[MD4FSM.scala 406:23]
  assign changeWordOrder_15_io_in = io_in[511:480]; // @[MD4FSM.scala 406:23]
endmodule
module MD4FSM(
  input          clock,
  input          reset,
  output         io_data_ready,
  input          io_data_valid,
  input  [511:0] io_data_bits,
  output         io_extraDataPieces_ready,
  input          io_extraDataPieces_valid,
  input  [1:0]   io_extraDataPieces_bits,
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
  wire [31:0] m_io_a; // @[MD4FSM.scala 22:17]
  wire [31:0] m_io_b; // @[MD4FSM.scala 22:17]
  wire [31:0] m_io_c; // @[MD4FSM.scala 22:17]
  wire [31:0] m_io_d; // @[MD4FSM.scala 22:17]
  wire [31:0] m_io_x; // @[MD4FSM.scala 22:17]
  wire [4:0] m_io_s; // @[MD4FSM.scala 22:17]
  wire [1:0] m_io_round; // @[MD4FSM.scala 22:17]
  wire [31:0] m_io_out; // @[MD4FSM.scala 22:17]
  wire [511:0] map_io_X; // @[MD4FSM.scala 31:19]
  wire [1:0] map_io_round; // @[MD4FSM.scala 31:19]
  wire [4:0] map_io_oper; // @[MD4FSM.scala 31:19]
  wire [31:0] map_io_out; // @[MD4FSM.scala 31:19]
  wire [511:0] change1_io_in; // @[MD4FSM.scala 37:23]
  wire [511:0] change1_io_out; // @[MD4FSM.scala 37:23]
  wire [511:0] change2_io_in; // @[MD4FSM.scala 40:23]
  wire [511:0] change2_io_out; // @[MD4FSM.scala 40:23]
  reg [2:0] stateReg; // @[MD4FSM.scala 14:25]
  reg [1:0] roundReg; // @[MD4FSM.scala 15:25]
  reg [4:0] operReg; // @[MD4FSM.scala 16:24]
  reg [31:0] A; // @[MD4FSM.scala 17:43]
  reg [31:0] B; // @[MD4FSM.scala 17:43]
  reg [31:0] C; // @[MD4FSM.scala 17:43]
  reg [31:0] D; // @[MD4FSM.scala 17:43]
  reg [31:0] AA; // @[MD4FSM.scala 17:43]
  reg [31:0] BB; // @[MD4FSM.scala 17:43]
  reg [31:0] CC; // @[MD4FSM.scala 17:43]
  reg [31:0] DD; // @[MD4FSM.scala 17:43]
  reg [511:0] X; // @[MD4FSM.scala 18:18]
  reg [1:0] extraDataPiecesReg; // @[MD4FSM.scala 20:35]
  wire [127:0] _T = {A,B,C,D}; // @[Cat.scala 30:58]
  wire  _T_2 = stateReg == 3'h0; // @[MD4FSM.scala 45:40]
  wire  _T_6 = 3'h0 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _T_8 = io_extraDataPieces_bits + 2'h1; // @[MD4FSM.scala 66:57]
  wire [1:0] _GEN_0 = io_data_valid ? 2'h0 : roundReg; // @[MD4FSM.scala 55:29 MD4FSM.scala 56:20 MD4FSM.scala 15:25]
  wire [4:0] _GEN_1 = io_data_valid ? 5'h0 : operReg; // @[MD4FSM.scala 55:29 MD4FSM.scala 57:19 MD4FSM.scala 16:24]
  wire [511:0] _GEN_3 = io_data_valid ? change1_io_out : X; // @[MD4FSM.scala 55:29 MD4FSM.scala 59:13 MD4FSM.scala 18:18]
  wire  _T_9 = 3'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _T_11 = extraDataPiecesReg - 2'h1; // @[MD4FSM.scala 75:50]
  wire  _T_12 = 3'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [4:0] _GEN_2 = operReg % 5'h4; // @[MD4FSM.scala 85:21]
  wire [2:0] _T_13 = _GEN_2[2:0]; // @[MD4FSM.scala 85:21]
  wire  _T_17 = 2'h0 == roundReg; // @[Conditional.scala 37:30]
  wire  _T_18 = 2'h1 == roundReg; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_29 = _T_18 ? 4'h5 : 4'h9; // @[Conditional.scala 39:67 MD4FSM.scala 95:20]
  wire [3:0] _GEN_30 = _T_17 ? 4'h7 : _GEN_29; // @[Conditional.scala 40:58 MD4FSM.scala 92:20]
  wire [3:0] _GEN_32 = _T_18 ? 4'h9 : 4'hb; // @[Conditional.scala 39:67 MD4FSM.scala 108:20]
  wire [3:0] _GEN_33 = _T_17 ? 4'hb : _GEN_32; // @[Conditional.scala 40:58 MD4FSM.scala 105:20]
  wire [3:0] _GEN_35 = _T_18 ? 4'hd : 4'hf; // @[Conditional.scala 39:67 MD4FSM.scala 121:20]
  wire [4:0] _GEN_36 = _T_17 ? 5'h13 : {{1'd0}, _GEN_35}; // @[Conditional.scala 40:58 MD4FSM.scala 118:20]
  wire [31:0] _GEN_37 = _T_13 == 3'h2 ? C : B; // @[MD4FSM.scala 101:44 MD4FSM.scala 102:16 MD4FSM.scala 115:16]
  wire [31:0] _GEN_38 = _T_13 == 3'h2 ? D : C; // @[MD4FSM.scala 101:44 MD4FSM.scala 102:29 MD4FSM.scala 115:29]
  wire [31:0] _GEN_39 = _T_13 == 3'h2 ? A : D; // @[MD4FSM.scala 101:44 MD4FSM.scala 102:42 MD4FSM.scala 115:42]
  wire [31:0] _GEN_40 = _T_13 == 3'h2 ? B : A; // @[MD4FSM.scala 101:44 MD4FSM.scala 102:55 MD4FSM.scala 115:55]
  wire [31:0] _GEN_41 = _T_13 == 3'h2 ? m_io_out : C; // @[MD4FSM.scala 101:44 MD4FSM.scala 102:63 MD4FSM.scala 17:43]
  wire [4:0] _GEN_42 = _T_13 == 3'h2 ? {{1'd0}, _GEN_33} : _GEN_36; // @[MD4FSM.scala 101:44]
  wire [31:0] _GEN_43 = _T_13 == 3'h2 ? B : m_io_out; // @[MD4FSM.scala 101:44 MD4FSM.scala 17:43 MD4FSM.scala 115:63]
  wire [31:0] _GEN_44 = _T_13 == 3'h1 ? D : _GEN_37; // @[MD4FSM.scala 88:44 MD4FSM.scala 89:16]
  wire [31:0] _GEN_45 = _T_13 == 3'h1 ? A : _GEN_38; // @[MD4FSM.scala 88:44 MD4FSM.scala 89:29]
  wire [31:0] _GEN_46 = _T_13 == 3'h1 ? B : _GEN_39; // @[MD4FSM.scala 88:44 MD4FSM.scala 89:42]
  wire [31:0] _GEN_47 = _T_13 == 3'h1 ? C : _GEN_40; // @[MD4FSM.scala 88:44 MD4FSM.scala 89:55]
  wire [31:0] _GEN_48 = _T_13 == 3'h1 ? m_io_out : D; // @[MD4FSM.scala 88:44 MD4FSM.scala 89:63 MD4FSM.scala 17:43]
  wire [4:0] _GEN_49 = _T_13 == 3'h1 ? {{1'd0}, _GEN_30} : _GEN_42; // @[MD4FSM.scala 88:44]
  wire [31:0] _GEN_50 = _T_13 == 3'h1 ? C : _GEN_41; // @[MD4FSM.scala 88:44 MD4FSM.scala 17:43]
  wire [31:0] _GEN_51 = _T_13 == 3'h1 ? B : _GEN_43; // @[MD4FSM.scala 88:44 MD4FSM.scala 17:43]
  wire [31:0] _GEN_56 = _T_13 == 3'h0 ? m_io_out : A; // @[MD4FSM.scala 85:37 MD4FSM.scala 86:63 MD4FSM.scala 17:43]
  wire [31:0] _GEN_58 = _T_13 == 3'h0 ? D : _GEN_48; // @[MD4FSM.scala 85:37 MD4FSM.scala 17:43]
  wire [31:0] _GEN_59 = _T_13 == 3'h0 ? C : _GEN_50; // @[MD4FSM.scala 85:37 MD4FSM.scala 17:43]
  wire [31:0] _GEN_60 = _T_13 == 3'h0 ? B : _GEN_51; // @[MD4FSM.scala 85:37 MD4FSM.scala 17:43]
  wire [1:0] _T_31 = roundReg + 2'h1; // @[MD4FSM.scala 134:32]
  wire [2:0] _GEN_61 = roundReg == 2'h2 ? 3'h3 : stateReg; // @[MD4FSM.scala 131:32 MD4FSM.scala 132:20 MD4FSM.scala 14:25]
  wire [1:0] _GEN_62 = roundReg == 2'h2 ? roundReg : _T_31; // @[MD4FSM.scala 131:32 MD4FSM.scala 15:25 MD4FSM.scala 134:20]
  wire [4:0] _T_33 = operReg + 5'h1; // @[MD4FSM.scala 137:28]
  wire [4:0] _GEN_63 = operReg == 5'hf ? 5'h0 : _T_33; // @[MD4FSM.scala 129:30 MD4FSM.scala 130:17 MD4FSM.scala 137:17]
  wire [2:0] _GEN_64 = operReg == 5'hf ? _GEN_61 : stateReg; // @[MD4FSM.scala 129:30 MD4FSM.scala 14:25]
  wire [1:0] _GEN_65 = operReg == 5'hf ? _GEN_62 : roundReg; // @[MD4FSM.scala 129:30 MD4FSM.scala 15:25]
  wire  _T_34 = 3'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _hi_T_1 = A + AA; // @[MD4FSM.scala 141:14]
  wire [31:0] _lo_T_1 = B + BB; // @[MD4FSM.scala 142:14]
  wire [31:0] _hi_T_3 = C + CC; // @[MD4FSM.scala 143:14]
  wire [31:0] _lo_T_3 = D + DD; // @[MD4FSM.scala 144:14]
  wire [2:0] _GEN_66 = extraDataPiecesReg == 2'h0 ? 3'h4 : 3'h1; // @[MD4FSM.scala 145:40 MD4FSM.scala 146:18 MD4FSM.scala 148:18]
  wire  _T_36 = 3'h4 == stateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_67 = io_hash_ready ? 3'h0 : stateReg; // @[MD4FSM.scala 152:27 MD4FSM.scala 153:20 MD4FSM.scala 14:25]
  wire [2:0] _GEN_68 = _T_36 ? _GEN_67 : stateReg; // @[Conditional.scala 39:67 MD4FSM.scala 14:25]
  wire [31:0] _GEN_69 = _T_34 ? _hi_T_1 : A; // @[Conditional.scala 39:67 MD4FSM.scala 141:9 MD4FSM.scala 17:43]
  wire [31:0] _GEN_70 = _T_34 ? _lo_T_1 : B; // @[Conditional.scala 39:67 MD4FSM.scala 142:9 MD4FSM.scala 17:43]
  wire [31:0] _GEN_71 = _T_34 ? _hi_T_3 : C; // @[Conditional.scala 39:67 MD4FSM.scala 143:9 MD4FSM.scala 17:43]
  wire [31:0] _GEN_72 = _T_34 ? _lo_T_3 : D; // @[Conditional.scala 39:67 MD4FSM.scala 144:9 MD4FSM.scala 17:43]
  wire [2:0] _GEN_73 = _T_34 ? _GEN_66 : _GEN_68; // @[Conditional.scala 39:67]
  Operation m ( // @[MD4FSM.scala 22:17]
    .io_a(m_io_a),
    .io_b(m_io_b),
    .io_c(m_io_c),
    .io_d(m_io_d),
    .io_x(m_io_x),
    .io_s(m_io_s),
    .io_round(m_io_round),
    .io_out(m_io_out)
  );
  MappingX map ( // @[MD4FSM.scala 31:19]
    .io_X(map_io_X),
    .io_round(map_io_round),
    .io_oper(map_io_oper),
    .io_out(map_io_out)
  );
  changeWordsOrder change1 ( // @[MD4FSM.scala 37:23]
    .io_in(change1_io_in),
    .io_out(change1_io_out)
  );
  changeWordsOrder change2 ( // @[MD4FSM.scala 40:23]
    .io_in(change2_io_in),
    .io_out(change2_io_out)
  );
  assign io_data_ready = _T_2 | stateReg == 3'h1; // @[MD4FSM.scala 46:49]
  assign io_extraDataPieces_ready = stateReg == 3'h0; // @[MD4FSM.scala 45:40]
  assign io_hash_valid = stateReg == 3'h4; // @[MD4FSM.scala 43:29]
  assign io_hash_bits = change2_io_out[127:0]; // @[MD4FSM.scala 44:16]
  assign m_io_a = _T_13 == 3'h0 ? A : _GEN_44; // @[MD4FSM.scala 85:37 MD4FSM.scala 86:16]
  assign m_io_b = _T_13 == 3'h0 ? B : _GEN_45; // @[MD4FSM.scala 85:37 MD4FSM.scala 86:29]
  assign m_io_c = _T_13 == 3'h0 ? C : _GEN_46; // @[MD4FSM.scala 85:37 MD4FSM.scala 86:42]
  assign m_io_d = _T_13 == 3'h0 ? D : _GEN_47; // @[MD4FSM.scala 85:37 MD4FSM.scala 86:55]
  assign m_io_x = map_io_out; // @[MD4FSM.scala 32:10]
  assign m_io_s = _T_13 == 3'h0 ? 5'h3 : _GEN_49; // @[MD4FSM.scala 85:37 MD4FSM.scala 87:16]
  assign m_io_round = roundReg; // @[MD4FSM.scala 29:14]
  assign map_io_X = X; // @[MD4FSM.scala 33:12]
  assign map_io_round = roundReg; // @[MD4FSM.scala 34:16]
  assign map_io_oper = operReg; // @[MD4FSM.scala 35:15]
  assign change1_io_in = io_data_bits; // @[MD4FSM.scala 38:17]
  assign change2_io_in = {{384'd0}, _T}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if (reset) begin // @[MD4FSM.scala 14:25]
      stateReg <= 3'h0; // @[MD4FSM.scala 14:25]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_extraDataPieces_valid) begin // @[MD4FSM.scala 50:38]
        if (io_data_valid) begin // @[MD4FSM.scala 55:29]
          stateReg <= 3'h2; // @[MD4FSM.scala 64:20]
        end else begin
          stateReg <= 3'h1; // @[MD4FSM.scala 67:20]
        end
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      if (io_data_valid) begin // @[MD4FSM.scala 72:27]
        stateReg <= 3'h2; // @[MD4FSM.scala 81:18]
      end
    end else if (_T_12) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_64;
    end else begin
      stateReg <= _GEN_73;
    end
    if (reset) begin // @[MD4FSM.scala 15:25]
      roundReg <= 2'h0; // @[MD4FSM.scala 15:25]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_extraDataPieces_valid) begin // @[MD4FSM.scala 50:38]
        roundReg <= _GEN_0;
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      roundReg <= _GEN_0;
    end else if (_T_12) begin // @[Conditional.scala 39:67]
      roundReg <= _GEN_65;
    end
    if (reset) begin // @[MD4FSM.scala 16:24]
      operReg <= 5'h0; // @[MD4FSM.scala 16:24]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_extraDataPieces_valid) begin // @[MD4FSM.scala 50:38]
        operReg <= _GEN_1;
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      operReg <= _GEN_1;
    end else if (_T_12) begin // @[Conditional.scala 39:67]
      operReg <= _GEN_63;
    end
    if (reset) begin // @[MD4FSM.scala 17:43]
      A <= 32'h0; // @[MD4FSM.scala 17:43]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_extraDataPieces_valid) begin // @[MD4FSM.scala 50:38]
        A <= 32'h67452301; // @[MD4FSM.scala 51:11]
      end
    end else if (!(_T_9)) begin // @[Conditional.scala 39:67]
      if (_T_12) begin // @[Conditional.scala 39:67]
        A <= _GEN_56;
      end else begin
        A <= _GEN_69;
      end
    end
    if (reset) begin // @[MD4FSM.scala 17:43]
      B <= 32'h0; // @[MD4FSM.scala 17:43]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_extraDataPieces_valid) begin // @[MD4FSM.scala 50:38]
        B <= 32'hefcdab89; // @[MD4FSM.scala 52:11]
      end
    end else if (!(_T_9)) begin // @[Conditional.scala 39:67]
      if (_T_12) begin // @[Conditional.scala 39:67]
        B <= _GEN_60;
      end else begin
        B <= _GEN_70;
      end
    end
    if (reset) begin // @[MD4FSM.scala 17:43]
      C <= 32'h0; // @[MD4FSM.scala 17:43]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_extraDataPieces_valid) begin // @[MD4FSM.scala 50:38]
        C <= 32'h98badcfe; // @[MD4FSM.scala 53:11]
      end
    end else if (!(_T_9)) begin // @[Conditional.scala 39:67]
      if (_T_12) begin // @[Conditional.scala 39:67]
        C <= _GEN_59;
      end else begin
        C <= _GEN_71;
      end
    end
    if (reset) begin // @[MD4FSM.scala 17:43]
      D <= 32'h0; // @[MD4FSM.scala 17:43]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_extraDataPieces_valid) begin // @[MD4FSM.scala 50:38]
        D <= 32'h10325476; // @[MD4FSM.scala 54:11]
      end
    end else if (!(_T_9)) begin // @[Conditional.scala 39:67]
      if (_T_12) begin // @[Conditional.scala 39:67]
        D <= _GEN_58;
      end else begin
        D <= _GEN_72;
      end
    end
    if (reset) begin // @[MD4FSM.scala 17:43]
      AA <= 32'h0; // @[MD4FSM.scala 17:43]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_extraDataPieces_valid) begin // @[MD4FSM.scala 50:38]
        if (io_data_valid) begin // @[MD4FSM.scala 55:29]
          AA <= 32'h67452301; // @[MD4FSM.scala 60:14]
        end
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      if (io_data_valid) begin // @[MD4FSM.scala 72:27]
        AA <= A; // @[MD4FSM.scala 77:12]
      end
    end
    if (reset) begin // @[MD4FSM.scala 17:43]
      BB <= 32'h0; // @[MD4FSM.scala 17:43]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_extraDataPieces_valid) begin // @[MD4FSM.scala 50:38]
        if (io_data_valid) begin // @[MD4FSM.scala 55:29]
          BB <= 32'hefcdab89; // @[MD4FSM.scala 61:14]
        end
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      if (io_data_valid) begin // @[MD4FSM.scala 72:27]
        BB <= B; // @[MD4FSM.scala 78:12]
      end
    end
    if (reset) begin // @[MD4FSM.scala 17:43]
      CC <= 32'h0; // @[MD4FSM.scala 17:43]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_extraDataPieces_valid) begin // @[MD4FSM.scala 50:38]
        if (io_data_valid) begin // @[MD4FSM.scala 55:29]
          CC <= 32'h98badcfe; // @[MD4FSM.scala 62:14]
        end
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      if (io_data_valid) begin // @[MD4FSM.scala 72:27]
        CC <= C; // @[MD4FSM.scala 79:12]
      end
    end
    if (reset) begin // @[MD4FSM.scala 17:43]
      DD <= 32'h0; // @[MD4FSM.scala 17:43]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_extraDataPieces_valid) begin // @[MD4FSM.scala 50:38]
        if (io_data_valid) begin // @[MD4FSM.scala 55:29]
          DD <= 32'h10325476; // @[MD4FSM.scala 63:14]
        end
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      if (io_data_valid) begin // @[MD4FSM.scala 72:27]
        DD <= D; // @[MD4FSM.scala 80:12]
      end
    end
    if (reset) begin // @[MD4FSM.scala 18:18]
      X <= 512'h0; // @[MD4FSM.scala 18:18]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_extraDataPieces_valid) begin // @[MD4FSM.scala 50:38]
        X <= _GEN_3;
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      X <= _GEN_3;
    end
    if (reset) begin // @[MD4FSM.scala 20:35]
      extraDataPiecesReg <= 2'h0; // @[MD4FSM.scala 20:35]
    end else if (_T_6) begin // @[Conditional.scala 40:58]
      if (io_extraDataPieces_valid) begin // @[MD4FSM.scala 50:38]
        if (io_data_valid) begin // @[MD4FSM.scala 55:29]
          extraDataPiecesReg <= io_extraDataPieces_bits; // @[MD4FSM.scala 58:30]
        end else begin
          extraDataPiecesReg <= _T_8; // @[MD4FSM.scala 66:30]
        end
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      if (io_data_valid) begin // @[MD4FSM.scala 72:27]
        extraDataPiecesReg <= _T_11; // @[MD4FSM.scala 75:28]
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
  extraDataPiecesReg = _RAND_12[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
