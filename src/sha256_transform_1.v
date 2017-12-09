`timescale 1ns/1ps

// A quick define to help index 32-bit words inside a larger register.
`define IDX(x) (((x)+1)*(32)-1):((x)*(32))

`define SIM

// Perform a SHA-256 transformation on the given 512-bit data
// and 256-bit initial state
module sha256_transform_1 (
  input clk,
  input [127:0] rx_input,
  input [255:0] rx_state,
  output reg [255:0] tx_hash
);

  // Constants defined by the SHA-2 standard.

  // Data
  wire [127:0] w3_0;
  wire [127:0] w16_3_1;
  wire [127:0] w17_16_3_2;
  wire [127:0] w18_16_3_3;
  wire [127:0] w19_16;
  wire [159:0] w20_16;
  wire [191:0] w21_16;
  wire [223:0] w22_16;
  wire [255:0] w23_16;
  wire [287:0] w24_16;
  wire [319:0] w25_16;
  wire [351:0] w26_16;
  wire [383:0] w27_16;
  wire [415:0] w28_16;
  wire [447:0] w29_16;
  wire [479:0] w30_16;
  wire [511:0] w31_16;
  wire [511:0] w32_17;
  wire [511:0] w33_18;
  wire [511:0] w34_19;
  wire [511:0] w35_20;
  wire [511:0] w36_21;
  wire [511:0] w37_22;
  wire [511:0] w38_23;
  wire [511:0] w39_24;
  wire [511:0] w40_25;
  wire [511:0] w41_26;
  wire [511:0] w42_27;
  wire [511:0] w43_28;
  wire [511:0] w44_29;
  wire [511:0] w45_30;
  wire [511:0] w46_31;
  wire [511:0] w47_32;
  wire [511:0] w48_33;
  wire [511:0] w49_34;
  wire [511:0] w50_35;
  wire [511:0] w51_36;
  wire [511:0] w52_37;
  wire [511:0] w53_38;
  wire [511:0] w54_39;
  wire [511:0] w55_40;
  wire [511:0] w56_41;
  wire [511:0] w57_42;
  wire [511:0] w58_43;
  wire [511:0] w59_44;
  wire [511:0] w60_45;
  wire [511:0] w61_46;
  wire [511:0] w62_47;
  wire [511:0] w63_48;
  wire [479:0] w63_49;
  wire [447:0] w63_50;
  wire [415:0] w63_51;
  wire [383:0] w63_52;
  wire [351:0] w63_53;
  wire [319:0] w63_54;
  wire [287:0] w63_55;
  wire [255:0] w63_56;
  wire [223:0] w63_57;
  wire [191:0] w63_58;
  wire [159:0] w63_59;
  wire [127:0] w63_60;
  wire [95:0]  w63_61;
  wire [63:0]  w63_62;
  wire [31:0]  w63;

  wire [255:0] tx_state [0:63];

`ifdef SIM
  reg  [255:0] rx_state_vec [0:63];

  genvar i;
  generate
    for (i = 0; i < 64; i = i + 1) begin : HASHERS
      if(i == 0) begin
        always @(posedge clk)
          rx_state_vec[0] <= rx_state;
      end else begin
        always @(posedge clk)
          rx_state_vec[i] <= rx_state_vec[i-1];
      end
    end
  endgenerate
`endif


  //#############################//
  //                             //
  // 64 digesters fully unrolled //
  //                             //
  //#############################//
  sha256_digester_1_0 u_dig_0(
    .clk            (clk),
    .rx_state       (rx_state),
    .tx_state       (tx_state[0]),
    .w3_0_in        (rx_input[127:0]),
    .w16_3_1_out    (w16_3_1)
  );

  sha256_digester_1_1 u_dig_1(
    .clk            (clk),
    .rx_state       (tx_state[0]),
    .tx_state       (tx_state[1]),
    .w16_3_1_in     (w16_3_1),
    .w17_16_3_2_out (w17_16_3_2)
  );

  sha256_digester_1_2 u_dig_2(
    .clk            (clk),
    .rx_state       (tx_state[1]),
    .tx_state       (tx_state[2]),
    .w17_16_3_2_in  (w17_16_3_2),
    .w18_16_3_3_out (w18_16_3_3)
  );
  
  sha256_digester_1_3 u_dig_3(
    .clk            (clk),
    .rx_state       (tx_state[2]),
    .tx_state       (tx_state[3]),
    .w18_16_3_3_in  (w18_16_3_3),
    .w19_16_out     (w19_16)
  );


  sha256_digester_1_4 u_dig_4(
    .clk            (clk),
    .rx_state       (tx_state[3]),
    .tx_state       (tx_state[4]),
    .w19_16_in      (w19_16),
    .w20_16_out     (w20_16)
  );

  sha256_digester_1_5 u_dig_5(
    .clk            (clk),
    .rx_state       (tx_state[4]),
    .tx_state       (tx_state[5]),
    .w20_16_in      (w20_16),
    .w21_16_out     (w21_16)
  );

  sha256_digester_1_6 u_dig_6(
    .clk            (clk),
    .rx_state       (tx_state[5]),
    .tx_state       (tx_state[6]),
    .w21_16_in      (w21_16),
    .w22_16_out     (w22_16)
  );

  sha256_digester_1_7 u_dig_7(
    .clk            (clk),
    .rx_state       (tx_state[6]),
    .tx_state       (tx_state[7]),
    .w22_16_in      (w22_16),
    .w23_16_out     (w23_16)
  );

  sha256_digester_1_8 u_dig_8(
    .clk            (clk),
    .rx_state       (tx_state[7]),
    .tx_state       (tx_state[8]),
    .w23_16_in      (w23_16),
    .w24_16_out     (w24_16)
  );

  sha256_digester_1_9 u_dig_9(
    .clk            (clk),
    .rx_state       (tx_state[8]),
    .tx_state       (tx_state[9]),
    .w24_16_in      (w24_16),
    .w25_16_out     (w25_16)
  );

  sha256_digester_1_10 u_dig_10(
    .clk            (clk),
    .rx_state       (tx_state[9]),
    .tx_state       (tx_state[10]),
    .w25_16_in      (w25_16),
    .w26_16_out     (w26_16)
  );

  sha256_digester_1_11 u_dig_11(
    .clk            (clk),
    .rx_state       (tx_state[10]),
    .tx_state       (tx_state[11]),
    .w26_16_in      (w26_16),
    .w27_16_out     (w27_16)
  );

  sha256_digester_1_12 u_dig_12(
    .clk            (clk),
    .rx_state       (tx_state[11]),
    .tx_state       (tx_state[12]),
    .w27_16_in      (w27_16),
    .w28_16_out     (w28_16)
  );

  sha256_digester_1_13 u_dig_13(
    .clk            (clk),
    .rx_state       (tx_state[12]),
    .tx_state       (tx_state[13]),
    .w28_16_in      (w28_16),
    .w29_16_out     (w29_16)
  );

  sha256_digester_1_14 u_dig_14(
    .clk            (clk),
    .rx_state       (tx_state[13]),
    .tx_state       (tx_state[14]),
    .w29_16_in      (w29_16),
    .w30_16_out     (w30_16)
  );

  sha256_digester_1_15 u_dig_15(
    .clk            (clk),
    .rx_state       (tx_state[14]),
    .tx_state       (tx_state[15]),
    .w30_16_in      (w30_16),
    .w31_16_out     (w31_16)
  );

  sha256_digester_1_16 u_dig_16(
    .clk            (clk),
    .rx_state       (tx_state[15]),
    .tx_state       (tx_state[16]),
    .w31_16_in      (w31_16),
    .w32_17_out     (w32_17)
  );

  sha256_digester_1_17 u_dig_17(
    .clk            (clk),
    .rx_state       (tx_state[16]),
    .tx_state       (tx_state[17]),
    .w32_17_in      (w32_17),
    .w33_18_out     (w33_18)
  );

  sha256_digester_1_18 u_dig_18(
    .clk            (clk),
    .rx_state       (tx_state[17]),
    .tx_state       (tx_state[18]),
    .w33_18_in      (w33_18),
    .w34_19_out     (w34_19)
  );

  sha256_digester_1_19 u_dig_19(
    .clk            (clk),
    .rx_state       (tx_state[18]),
    .tx_state       (tx_state[19]),
    .w34_19_in      (w34_19),
    .w35_20_out     (w35_20)
  );

  sha256_digester_1_20 u_dig_20(
    .clk            (clk),
    .rx_state       (tx_state[19]),
    .tx_state       (tx_state[20]),
    .w35_20_in      (w35_20),
    .w36_21_out     (w36_21)
  );

  sha256_digester_1_21 u_dig_21(
    .clk            (clk),
    .rx_state       (tx_state[20]),
    .tx_state       (tx_state[21]),
    .w36_21_in      (w36_21),
    .w37_22_out     (w37_22)
  );

  sha256_digester_1_22 u_dig_22(
    .clk            (clk),
    .rx_state       (tx_state[21]),
    .tx_state       (tx_state[22]),
    .w37_22_in      (w37_22),
    .w38_23_out     (w38_23)
  );

  sha256_digester_1_23 u_dig_23(
    .clk            (clk),
    .rx_state       (tx_state[22]),
    .tx_state       (tx_state[23]),
    .w38_23_in      (w38_23),
    .w39_24_out     (w39_24)
  );

  sha256_digester_1_24 u_dig_24(
    .clk            (clk),
    .rx_state       (tx_state[23]),
    .tx_state       (tx_state[24]),
    .w39_24_in      (w39_24),
    .w40_25_out     (w40_25)
  );

  sha256_digester_1_25 u_dig_25(
    .clk            (clk),
    .rx_state       (tx_state[24]),
    .tx_state       (tx_state[25]),
    .w40_25_in      (w40_25),
    .w41_26_out     (w41_26)
  );

  sha256_digester_1_26 u_dig_26(
    .clk            (clk),
    .rx_state       (tx_state[25]),
    .tx_state       (tx_state[26]),
    .w41_26_in      (w41_26),
    .w42_27_out     (w42_27)
  );

  sha256_digester_1_27 u_dig_27(
    .clk            (clk),
    .rx_state       (tx_state[26]),
    .tx_state       (tx_state[27]),
    .w42_27_in      (w42_27),
    .w43_28_out     (w43_28)
  );

  sha256_digester_1_28 u_dig_28(
    .clk            (clk),
    .rx_state       (tx_state[27]),
    .tx_state       (tx_state[28]),
    .w43_28_in      (w43_28),
    .w44_29_out     (w44_29)
  );

  sha256_digester_1_29 u_dig_29(
    .clk            (clk),
    .rx_state       (tx_state[28]),
    .tx_state       (tx_state[29]),
    .w44_29_in      (w44_29),
    .w45_30_out     (w45_30)
  );

  sha256_digester_1_30 u_dig_30(
    .clk            (clk),
    .rx_state       (tx_state[29]),
    .tx_state       (tx_state[30]),
    .w45_30_in      (w45_30),
    .w46_31_out     (w46_31)
  );

  sha256_digester_1_31 u_dig_31(
    .clk            (clk),
    .rx_state       (tx_state[30]),
    .tx_state       (tx_state[31]),
    .w46_31_in      (w46_31),
    .w47_32_out     (w47_32)
  );

  sha256_digester_1_32 u_dig_32(
    .clk            (clk),
    .rx_state       (tx_state[31]),
    .tx_state       (tx_state[32]),
    .w47_32_in      (w47_32),
    .w48_33_out     (w48_33)
  );

  sha256_digester_1_33 u_dig_33(
    .clk            (clk),
    .rx_state       (tx_state[32]),
    .tx_state       (tx_state[33]),
    .w48_33_in      (w48_33),
    .w49_34_out     (w49_34)
  );

  sha256_digester_1_34 u_dig_34(
    .clk            (clk),
    .rx_state       (tx_state[33]),
    .tx_state       (tx_state[34]),
    .w49_34_in      (w49_34),
    .w50_35_out     (w50_35)
  );

  sha256_digester_1_35 u_dig_35(
    .clk            (clk),
    .rx_state       (tx_state[34]),
    .tx_state       (tx_state[35]),
    .w50_35_in      (w50_35),
    .w51_36_out     (w51_36)
  );

  sha256_digester_1_36 u_dig_36(
    .clk            (clk),
    .rx_state       (tx_state[35]),
    .tx_state       (tx_state[36]),
    .w51_36_in      (w51_36),
    .w52_37_out     (w52_37)
  );

  sha256_digester_1_37 u_dig_37(
    .clk            (clk),
    .rx_state       (tx_state[36]),
    .tx_state       (tx_state[37]),
    .w52_37_in      (w52_37),
    .w53_38_out     (w53_38)
  );

  sha256_digester_1_38 u_dig_38(
    .clk            (clk),
    .rx_state       (tx_state[37]),
    .tx_state       (tx_state[38]),
    .w53_38_in      (w53_38),
    .w54_39_out     (w54_39)
  );

  sha256_digester_1_39 u_dig_39(
    .clk            (clk),
    .rx_state       (tx_state[38]),
    .tx_state       (tx_state[39]),
    .w54_39_in      (w54_39),
    .w55_40_out     (w55_40)
  );

  sha256_digester_1_40 u_dig_40(
    .clk            (clk),
    .rx_state       (tx_state[39]),
    .tx_state       (tx_state[40]),
    .w55_40_in      (w55_40),
    .w56_41_out     (w56_41)
  );

  sha256_digester_1_41 u_dig_41(
    .clk            (clk),
    .rx_state       (tx_state[40]),
    .tx_state       (tx_state[41]),
    .w56_41_in      (w56_41),
    .w57_42_out     (w57_42)
  );

  sha256_digester_1_42 u_dig_42(
    .clk            (clk),
    .rx_state       (tx_state[41]),
    .tx_state       (tx_state[42]),
    .w57_42_in      (w57_42),
    .w58_43_out     (w58_43)
  );

  sha256_digester_1_43 u_dig_43(
    .clk            (clk),
    .rx_state       (tx_state[42]),
    .tx_state       (tx_state[43]),
    .w58_43_in      (w58_43),
    .w59_44_out     (w59_44)
  );

  sha256_digester_1_44 u_dig_44(
    .clk            (clk),
    .rx_state       (tx_state[43]),
    .tx_state       (tx_state[44]),
    .w59_44_in      (w59_44),
    .w60_45_out     (w60_45)
  );

  sha256_digester_1_45 u_dig_45(
    .clk            (clk),
    .rx_state       (tx_state[44]),
    .tx_state       (tx_state[45]),
    .w60_45_in      (w60_45),
    .w61_46_out     (w61_46)
  );

  sha256_digester_1_46 u_dig_46(
    .clk            (clk),
    .rx_state       (tx_state[45]),
    .tx_state       (tx_state[46]),
    .w61_46_in      (w61_46),
    .w62_47_out     (w62_47)
  );

  sha256_digester_1_47 u_dig_47(
    .clk            (clk),
    .rx_state       (tx_state[46]),
    .tx_state       (tx_state[47]),
    .w62_47_in      (w62_47),
    .w63_48_out     (w63_48)
  );

  sha256_digester_1_48 u_dig_48(
    .clk            (clk),
    .rx_state       (tx_state[47]),
    .tx_state       (tx_state[48]),
    .w63_48_in      (w63_48),
    .w63_49_out     (w63_49)
  );

  sha256_digester_1_49 u_dig_49(
    .clk            (clk),
    .rx_state       (tx_state[48]),
    .tx_state       (tx_state[49]),
    .w63_49_in      (w63_49),
    .w63_50_out     (w63_50)
  );

  sha256_digester_1_50 u_dig_50(
    .clk            (clk),
    .rx_state       (tx_state[49]),
    .tx_state       (tx_state[50]),
    .w63_50_in      (w63_50),
    .w63_51_out     (w63_51)
  );

  sha256_digester_1_51 u_dig_51(
    .clk            (clk),
    .rx_state       (tx_state[50]),
    .tx_state       (tx_state[51]),
    .w63_51_in      (w63_51),
    .w63_52_out     (w63_52)
  );

  sha256_digester_1_52 u_dig_52(
    .clk            (clk),
    .rx_state       (tx_state[51]),
    .tx_state       (tx_state[52]),
    .w63_52_in      (w63_52),
    .w63_53_out     (w63_53)
  );

  sha256_digester_1_53 u_dig_53(
    .clk            (clk),
    .rx_state       (tx_state[52]),
    .tx_state       (tx_state[53]),
    .w63_53_in      (w63_53),
    .w63_54_out     (w63_54)
  );

  sha256_digester_1_54 u_dig_54(
    .clk            (clk),
    .rx_state       (tx_state[53]),
    .tx_state       (tx_state[54]),
    .w63_54_in      (w63_54),
    .w63_55_out     (w63_55)
  );

  sha256_digester_1_55 u_dig_55(
    .clk            (clk),
    .rx_state       (tx_state[54]),
    .tx_state       (tx_state[55]),
    .w63_55_in      (w63_55),
    .w63_56_out     (w63_56)
  );

  sha256_digester_1_56 u_dig_56(
    .clk            (clk),
    .rx_state       (tx_state[55]),
    .tx_state       (tx_state[56]),
    .w63_56_in      (w63_56),
    .w63_57_out     (w63_57)
  );

  sha256_digester_1_57 u_dig_57(
    .clk            (clk),
    .rx_state       (tx_state[56]),
    .tx_state       (tx_state[57]),
    .w63_57_in      (w63_57),
    .w63_58_out     (w63_58)
  );

  sha256_digester_1_58 u_dig_58(
    .clk            (clk),
    .rx_state       (tx_state[57]),
    .tx_state       (tx_state[58]),
    .w63_58_in      (w63_58),
    .w63_59_out     (w63_59)
  );

  sha256_digester_1_59 u_dig_59(
    .clk            (clk),
    .rx_state       (tx_state[58]),
    .tx_state       (tx_state[59]),
    .w63_59_in      (w63_59),
    .w63_60_out     (w63_60)
  );

  sha256_digester_1_60 u_dig_60(
    .clk            (clk),
    .rx_state       (tx_state[59]),
    .tx_state       (tx_state[60]),
    .w63_60_in      (w63_60),
    .w63_61_out     (w63_61)
  );

  sha256_digester_1_61 u_dig_61(
    .clk            (clk),
    .rx_state       (tx_state[60]),
    .tx_state       (tx_state[61]),
    .w63_61_in      (w63_61),
    .w63_62_out     (w63_62)
  );

  sha256_digester_1_62 u_dig_62(
    .clk            (clk),
    .rx_state       (tx_state[61]),
    .tx_state       (tx_state[62]),
    .w63_62_in      (w63_62),
    .w63_out        (w63)
  );

  sha256_digester_1_63 u_dig_63(
    .clk            (clk),
    .rx_state       (tx_state[62]),
    .tx_state       (tx_state[63]),
    .w63_in         (w63)
  );


  always @ (posedge clk)
  begin
`ifdef SIM
    tx_hash[`IDX(0)] <= rx_state_vec[63][`IDX(0)] + tx_state[63][`IDX(0)];
    tx_hash[`IDX(1)] <= rx_state_vec[63][`IDX(1)] + tx_state[63][`IDX(1)];
    tx_hash[`IDX(2)] <= rx_state_vec[63][`IDX(2)] + tx_state[63][`IDX(2)];
    tx_hash[`IDX(3)] <= rx_state_vec[63][`IDX(3)] + tx_state[63][`IDX(3)];
    tx_hash[`IDX(4)] <= rx_state_vec[63][`IDX(4)] + tx_state[63][`IDX(4)];
    tx_hash[`IDX(5)] <= rx_state_vec[63][`IDX(5)] + tx_state[63][`IDX(5)];
    tx_hash[`IDX(6)] <= rx_state_vec[63][`IDX(6)] + tx_state[63][`IDX(6)];
    tx_hash[`IDX(7)] <= rx_state_vec[63][`IDX(7)] + tx_state[63][`IDX(7)];
`elsif
    tx_hash[`IDX(0)] <= rx_state[`IDX(0)] + tx_state[63][`IDX(0)];
    tx_hash[`IDX(1)] <= rx_state[`IDX(1)] + tx_state[63][`IDX(1)];
    tx_hash[`IDX(2)] <= rx_state[`IDX(2)] + tx_state[63][`IDX(2)];
    tx_hash[`IDX(3)] <= rx_state[`IDX(3)] + tx_state[63][`IDX(3)];
    tx_hash[`IDX(4)] <= rx_state[`IDX(4)] + tx_state[63][`IDX(4)];
    tx_hash[`IDX(5)] <= rx_state[`IDX(5)] + tx_state[63][`IDX(5)];
    tx_hash[`IDX(6)] <= rx_state[`IDX(6)] + tx_state[63][`IDX(6)];
    tx_hash[`IDX(7)] <= rx_state[`IDX(7)] + tx_state[63][`IDX(7)];
`endif
  end


endmodule


module sha256_digester_1_0 (
  clk,
  rx_state,
  tx_state,
  w3_0_in,
  w16_3_1_out
);

  input         clk;
  input [255:0] rx_state;
  input [127:0] w3_0_in;

  output reg [255:0] tx_state;
  output reg [127:0] w16_3_1_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w3_0_in[`IDX(1)], s0_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w3_0_in[`IDX(0)] + 32'h428a2f98;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w16 = s0_w + w3_0_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w16_3_1_out <= {w16, w3_0_in[127:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_1 (
  clk,
  rx_state,
  tx_state,
  w16_3_1_in,
  w17_16_3_2_out
);

  input         clk;
  input [255:0] rx_state;
  input [127:0] w16_3_1_in;

  output reg [255:0] tx_state;
  output reg [127:0] w17_16_3_2_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w16_3_1_in[`IDX(1)], s0_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w16_3_1_in[`IDX(0)] + 32'h71374491;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w17 = 32'h01100000 + s0_w + w16_3_1_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w17_16_3_2_out <= {w17, w16_3_1_in[127:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_2 (
  clk,
  rx_state,
  tx_state,
  w17_16_3_2_in,
  w18_16_3_3_out
);

  input         clk;
  input [255:0] rx_state;
  input [127:0] w17_16_3_2_in;

  output reg [255:0] tx_state;
  output reg [127:0] w18_16_3_3_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w17_16_3_2_in[`IDX(1)], s0_w);
  s1  s1_blk  (w17_16_3_2_in[`IDX(2)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w17_16_3_2_in[`IDX(0)] + 32'hb5c0fbcf;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w18 = s1_w + s0_w + w17_16_3_2_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w18_16_3_3_out <= {w18, w17_16_3_2_in[127:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_3 (
  clk,
  rx_state,
  tx_state,
  w18_16_3_3_in,
  w19_16_out
);

  input         clk;
  input [255:0] rx_state;
  input [127:0] w18_16_3_3_in;

  output reg [255:0] tx_state;
  output reg [127:0] w19_16_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s1  s1_blk  (w18_16_3_3_in[`IDX(2)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w18_16_3_3_in[`IDX(0)] + 32'he9b5dba5;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w19 = s1_w + 32'h11002000 + w18_16_3_3_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w19_16_out <= {w19, w18_16_3_3_in[127:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_4 (
  clk,
  rx_state,
  tx_state,
  w19_16_in,
  w20_16_out
);

  input         clk;
  input [255:0] rx_state;
  input [127:0] w19_16_in;

  output reg [255:0] tx_state;
  output reg [159:0] w20_16_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s1  s1_blk  (w19_16_in[`IDX(2)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + 32'hb956c25b;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w20 = s1_w + 32'h80000000;
  

  always @ (posedge clk)
  begin
    w20_16_out <= {w20, w19_16_in};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_5 (
  clk,
  rx_state,
  tx_state,
  w20_16_in,
  w21_16_out
);

  input         clk;
  input [255:0] rx_state;
  input [159:0] w20_16_in;

  output reg [255:0] tx_state;
  output reg [191:0] w21_16_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s1  s1_blk  (w20_16_in[`IDX(3)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + 32'h59f111f1;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w21 = s1_w;
  

  always @ (posedge clk)
  begin
    w21_16_out <= {w21, w20_16_in};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_6 (
  clk,
  rx_state,
  tx_state,
  w21_16_in,
  w22_16_out
);

  input         clk;
  input [255:0] rx_state;
  input [191:0] w21_16_in;

  output reg [255:0] tx_state;
  output reg [223:0] w22_16_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s1  s1_blk  (w21_16_in[`IDX(4)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + 32'h923f82a4;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w22 = s1_w + 32'h00000280;
  

  always @ (posedge clk)
  begin
    w22_16_out <= {w22, w21_16_in};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_7 (
  clk,
  rx_state,
  tx_state,
  w22_16_in,
  w23_16_out
);

  input         clk;
  input [255:0] rx_state;
  input [223:0] w22_16_in;

  output reg [255:0] tx_state;
  output reg [255:0] w23_16_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s1  s1_blk  (w22_16_in[`IDX(5)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + 32'hab1c5ed5;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w23 = s1_w + w22_16_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w23_16_out <= {w23, w22_16_in};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_8 (
  clk,
  rx_state,
  tx_state,
  w23_16_in,
  w24_16_out
);

  input         clk;
  input [255:0] rx_state;
  input [255:0] w23_16_in;

  output reg [255:0] tx_state;
  output reg [287:0] w24_16_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s1  s1_blk  (w23_16_in[`IDX(6)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + 32'hd807aa98;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w24 = s1_w + w23_16_in[`IDX(1)];
  

  always @ (posedge clk)
  begin
    w24_16_out <= {w24, w23_16_in};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_9 (
  clk,
  rx_state,
  tx_state,
  w24_16_in,
  w25_16_out
);

  input         clk;
  input [255:0] rx_state;
  input [287:0] w24_16_in;

  output reg [255:0] tx_state;
  output reg [319:0] w25_16_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s1  s1_blk  (w24_16_in[`IDX(7)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + 32'h12835b01;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w25 = s1_w + w24_16_in[`IDX(2)];
  

  always @ (posedge clk)
  begin
    w25_16_out <= {w25, w24_16_in};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_10 (
  clk,
  rx_state,
  tx_state,
  w25_16_in,
  w26_16_out
);

  input         clk;
  input [255:0] rx_state;
  input [319:0] w25_16_in;

  output reg [255:0] tx_state;
  output reg [351:0] w26_16_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s1  s1_blk  (w25_16_in[`IDX(8)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + 32'h243185be;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w26 = s1_w + w25_16_in[`IDX(3)];
  

  always @ (posedge clk)
  begin
    w26_16_out <= {w26, w25_16_in};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_11 (
  clk,
  rx_state,
  tx_state,
  w26_16_in,
  w27_16_out
);

  input         clk;
  input [255:0] rx_state;
  input [351:0] w26_16_in;

  output reg [255:0] tx_state;
  output reg [383:0] w27_16_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s1  s1_blk  (w26_16_in[`IDX(9)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + 32'h550c7dc3;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w27 = s1_w + w26_16_in[`IDX(4)];
  

  always @ (posedge clk)
  begin
    w27_16_out <= {w27, w26_16_in};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_12 (
  clk,
  rx_state,
  tx_state,
  w27_16_in,
  w28_16_out
);

  input         clk;
  input [255:0] rx_state;
  input [383:0] w27_16_in;

  output reg [255:0] tx_state;
  output reg [415:0] w28_16_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s1  s1_blk  (w27_16_in[`IDX(10)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + 32'h72be5d74;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w28 = s1_w + w27_16_in[`IDX(5)];
  

  always @ (posedge clk)
  begin
    w28_16_out <= {w28, w27_16_in};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_13 (
  clk,
  rx_state,
  tx_state,
  w28_16_in,
  w29_16_out
);

  input         clk;
  input [255:0] rx_state;
  input [415:0] w28_16_in;

  output reg [255:0] tx_state;
  output reg [447:0] w29_16_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s1  s1_blk  (w28_16_in[`IDX(11)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + 32'h80deb1fe;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w29 = s1_w + w28_16_in[`IDX(6)];
  

  always @ (posedge clk)
  begin
    w29_16_out <= {w29, w28_16_in};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_14 (
  clk,
  rx_state,
  tx_state,
  w29_16_in,
  w30_16_out
);

  input         clk;
  input [255:0] rx_state;
  input [447:0] w29_16_in;

  output reg [255:0] tx_state;
  output reg [479:0] w30_16_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s1  s1_blk  (w29_16_in[`IDX(12)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + 32'h9bdc06a7;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w30 = s1_w + w29_16_in[`IDX(7)] + 32'h00a00055;
  

  always @ (posedge clk)
  begin
    w30_16_out <= {w30, w29_16_in};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_15 (
  clk,
  rx_state,
  tx_state,
  w30_16_in,
  w31_16_out
);

  input         clk;
  input [255:0] rx_state;
  input [479:0] w30_16_in;

  output reg [255:0] tx_state;
  output reg [511:0] w31_16_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w30_16_in[`IDX(0)], s0_w);
  s1  s1_blk  (w30_16_in[`IDX(13)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + 32'hc19bf3f4;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w31 = s1_w + w30_16_in[`IDX(8)] + s0_w + 32'h00000280;
  

  always @ (posedge clk)
  begin
    w31_16_out <= {w31, w30_16_in};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_16 (
  clk,
  rx_state,
  tx_state,
  w31_16_in,
  w32_17_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w31_16_in;

  output reg [255:0] tx_state;
  output reg [511:0] w32_17_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w31_16_in[`IDX(1)], s0_w);
  s1  s1_blk  (w31_16_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w31_16_in[`IDX(0)] + 32'he49b69c1;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w32 = s1_w + w31_16_in[`IDX(9)] + s0_w + w31_16_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w32_17_out <= {w32, w31_16_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_17 (
  clk,
  rx_state,
  tx_state,
  w32_17_in,
  w33_18_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w32_17_in;

  output reg [255:0] tx_state;
  output reg [511:0] w33_18_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w32_17_in[`IDX(1)], s0_w);
  s1  s1_blk  (w32_17_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w32_17_in[`IDX(0)] + 32'hefbe4786;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w33 = s1_w + w32_17_in[`IDX(9)] + s0_w + w32_17_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w33_18_out <= {w33, w32_17_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_18 (
  clk,
  rx_state,
  tx_state,
  w33_18_in,
  w34_19_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w33_18_in;

  output reg [255:0] tx_state;
  output reg [511:0] w34_19_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w33_18_in[`IDX(1)], s0_w);
  s1  s1_blk  (w33_18_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w33_18_in[`IDX(0)] + 32'h0fc19dc6;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w34 = s1_w + w33_18_in[`IDX(9)] + s0_w + w33_18_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w34_19_out <= {w34, w33_18_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_19 (
  clk,
  rx_state,
  tx_state,
  w34_19_in,
  w35_20_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w34_19_in;

  output reg [255:0] tx_state;
  output reg [511:0] w35_20_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w34_19_in[`IDX(1)], s0_w);
  s1  s1_blk  (w34_19_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w34_19_in[`IDX(0)] + 32'h240ca1cc;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w35 = s1_w + w34_19_in[`IDX(9)] + s0_w + w34_19_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w35_20_out <= {w35, w34_19_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_20 (
  clk,
  rx_state,
  tx_state,
  w35_20_in,
  w36_21_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w35_20_in;

  output reg [255:0] tx_state;
  output reg [511:0] w36_21_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w35_20_in[`IDX(1)], s0_w);
  s1  s1_blk  (w35_20_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w35_20_in[`IDX(0)] + 32'h2de92c6f;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w36 = s1_w + w35_20_in[`IDX(9)] + s0_w + w35_20_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w36_21_out <= {w36, w35_20_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_21 (
  clk,
  rx_state,
  tx_state,
  w36_21_in,
  w37_22_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w36_21_in;

  output reg [255:0] tx_state;
  output reg [511:0] w37_22_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w36_21_in[`IDX(1)], s0_w);
  s1  s1_blk  (w36_21_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w36_21_in[`IDX(0)] + 32'h4a7484aa;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w37 = s1_w + w36_21_in[`IDX(9)] + s0_w + w36_21_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w37_22_out <= {w37, w36_21_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_22 (
  clk,
  rx_state,
  tx_state,
  w37_22_in,
  w38_23_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w37_22_in;

  output reg [255:0] tx_state;
  output reg [511:0] w38_23_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w37_22_in[`IDX(1)], s0_w);
  s1  s1_blk  (w37_22_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w37_22_in[`IDX(0)] + 32'h5cb0a9dc;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w38 = s1_w + w37_22_in[`IDX(9)] + s0_w + w37_22_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w38_23_out <= {w38, w37_22_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_23 (
  clk,
  rx_state,
  tx_state,
  w38_23_in,
  w39_24_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w38_23_in;

  output reg [255:0] tx_state;
  output reg [511:0] w39_24_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w38_23_in[`IDX(1)], s0_w);
  s1  s1_blk  (w38_23_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w38_23_in[`IDX(0)] + 32'h76f988da;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w39 = s1_w + w38_23_in[`IDX(9)] + s0_w + w38_23_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w39_24_out <= {w39, w38_23_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_24 (
  clk,
  rx_state,
  tx_state,
  w39_24_in,
  w40_25_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w39_24_in;

  output reg [255:0] tx_state;
  output reg [511:0] w40_25_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w39_24_in[`IDX(1)], s0_w);
  s1  s1_blk  (w39_24_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w39_24_in[`IDX(0)] + 32'h983e5152;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w40 = s1_w + w39_24_in[`IDX(9)] + s0_w + w39_24_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w40_25_out <= {w40, w39_24_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_25 (
  clk,
  rx_state,
  tx_state,
  w40_25_in,
  w41_26_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w40_25_in;

  output reg [255:0] tx_state;
  output reg [511:0] w41_26_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w40_25_in[`IDX(1)], s0_w);
  s1  s1_blk  (w40_25_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w40_25_in[`IDX(0)] + 32'ha831c66d;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w41 = s1_w + w40_25_in[`IDX(9)] + s0_w + w40_25_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w41_26_out <= {w41, w40_25_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_26 (
  clk,
  rx_state,
  tx_state,
  w41_26_in,
  w42_27_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w41_26_in;

  output reg [255:0] tx_state;
  output reg [511:0] w42_27_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w41_26_in[`IDX(1)], s0_w);
  s1  s1_blk  (w41_26_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w41_26_in[`IDX(0)] + 32'hb00327c8;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w42 = s1_w + w41_26_in[`IDX(9)] + s0_w + w41_26_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w42_27_out <= {w42, w41_26_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_27 (
  clk,
  rx_state,
  tx_state,
  w42_27_in,
  w43_28_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w42_27_in;

  output reg [255:0] tx_state;
  output reg [511:0] w43_28_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w42_27_in[`IDX(1)], s0_w);
  s1  s1_blk  (w42_27_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w42_27_in[`IDX(0)] + 32'hbf597fc7;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w43 = s1_w + w42_27_in[`IDX(9)] + s0_w + w42_27_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w43_28_out <= {w43, w42_27_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_28 (
  clk,
  rx_state,
  tx_state,
  w43_28_in,
  w44_29_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w43_28_in;

  output reg [255:0] tx_state;
  output reg [511:0] w44_29_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w43_28_in[`IDX(1)], s0_w);
  s1  s1_blk  (w43_28_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w43_28_in[`IDX(0)] + 32'hc6e00bf3;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w44 = s1_w + w43_28_in[`IDX(9)] + s0_w + w43_28_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w44_29_out <= {w44, w43_28_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_29 (
  clk,
  rx_state,
  tx_state,
  w44_29_in,
  w45_30_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w44_29_in;

  output reg [255:0] tx_state;
  output reg [511:0] w45_30_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w44_29_in[`IDX(1)], s0_w);
  s1  s1_blk  (w44_29_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w44_29_in[`IDX(0)] + 32'hd5a79147;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w45 = s1_w + w44_29_in[`IDX(9)] + s0_w + w44_29_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w45_30_out <= {w45, w44_29_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_30 (
  clk,
  rx_state,
  tx_state,
  w45_30_in,
  w46_31_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w45_30_in;

  output reg [255:0] tx_state;
  output reg [511:0] w46_31_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w45_30_in[`IDX(1)], s0_w);
  s1  s1_blk  (w45_30_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w45_30_in[`IDX(0)] + 32'h06ca6351;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w46 = s1_w + w45_30_in[`IDX(9)] + s0_w + w45_30_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w46_31_out <= {w46, w45_30_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_31 (
  clk,
  rx_state,
  tx_state,
  w46_31_in,
  w47_32_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w46_31_in;

  output reg [255:0] tx_state;
  output reg [511:0] w47_32_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w46_31_in[`IDX(1)], s0_w);
  s1  s1_blk  (w46_31_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w46_31_in[`IDX(0)] + 32'h14292967;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w47 = s1_w + w46_31_in[`IDX(9)] + s0_w + w46_31_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w47_32_out <= {w47, w46_31_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_32 (
  clk,
  rx_state,
  tx_state,
  w47_32_in,
  w48_33_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w47_32_in;

  output reg [255:0] tx_state;
  output reg [511:0] w48_33_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w47_32_in[`IDX(1)], s0_w);
  s1  s1_blk  (w47_32_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w47_32_in[`IDX(0)] + 32'h27b70a85;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w48 = s1_w + w47_32_in[`IDX(9)] + s0_w + w47_32_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w48_33_out <= {w48, w47_32_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_33 (
  clk,
  rx_state,
  tx_state,
  w48_33_in,
  w49_34_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w48_33_in;

  output reg [255:0] tx_state;
  output reg [511:0] w49_34_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w48_33_in[`IDX(1)], s0_w);
  s1  s1_blk  (w48_33_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w48_33_in[`IDX(0)] + 32'h2e1b2138;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w49 = s1_w + w48_33_in[`IDX(9)] + s0_w + w48_33_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w49_34_out <= {w49, w48_33_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_34 (
  clk,
  rx_state,
  tx_state,
  w49_34_in,
  w50_35_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w49_34_in;

  output reg [255:0] tx_state;
  output reg [511:0] w50_35_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w49_34_in[`IDX(1)], s0_w);
  s1  s1_blk  (w49_34_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w49_34_in[`IDX(0)] + 32'h4d2c6dfc;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w50 = s1_w + w49_34_in[`IDX(9)] + s0_w + w49_34_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w50_35_out <= {w50, w49_34_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_35 (
  clk,
  rx_state,
  tx_state,
  w50_35_in,
  w51_36_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w50_35_in;

  output reg [255:0] tx_state;
  output reg [511:0] w51_36_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w50_35_in[`IDX(1)], s0_w);
  s1  s1_blk  (w50_35_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w50_35_in[`IDX(0)] + 32'h53380d13;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w51 = s1_w + w50_35_in[`IDX(9)] + s0_w + w50_35_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w51_36_out <= {w51, w50_35_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_36 (
  clk,
  rx_state,
  tx_state,
  w51_36_in,
  w52_37_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w51_36_in;

  output reg [255:0] tx_state;
  output reg [511:0] w52_37_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w51_36_in[`IDX(1)], s0_w);
  s1  s1_blk  (w51_36_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w51_36_in[`IDX(0)] + 32'h650a7354;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w52 = s1_w + w51_36_in[`IDX(9)] + s0_w + w51_36_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w52_37_out <= {w52, w51_36_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_37 (
  clk,
  rx_state,
  tx_state,
  w52_37_in,
  w53_38_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w52_37_in;

  output reg [255:0] tx_state;
  output reg [511:0] w53_38_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w52_37_in[`IDX(1)], s0_w);
  s1  s1_blk  (w52_37_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w52_37_in[`IDX(0)] + 32'h766a0abb;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w53 = s1_w + w52_37_in[`IDX(9)] + s0_w + w52_37_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w53_38_out <= {w53, w52_37_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_38 (
  clk,
  rx_state,
  tx_state,
  w53_38_in,
  w54_39_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w53_38_in;

  output reg [255:0] tx_state;
  output reg [511:0] w54_39_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w53_38_in[`IDX(1)], s0_w);
  s1  s1_blk  (w53_38_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w53_38_in[`IDX(0)] + 32'h81c2c92e;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w54 = s1_w + w53_38_in[`IDX(9)] + s0_w + w53_38_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w54_39_out <= {w54, w53_38_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_39 (
  clk,
  rx_state,
  tx_state,
  w54_39_in,
  w55_40_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w54_39_in;

  output reg [255:0] tx_state;
  output reg [511:0] w55_40_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w54_39_in[`IDX(1)], s0_w);
  s1  s1_blk  (w54_39_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w54_39_in[`IDX(0)] + 32'h92722c85;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w55 = s1_w + w54_39_in[`IDX(9)] + s0_w + w54_39_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w55_40_out <= {w55, w54_39_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_40 (
  clk,
  rx_state,
  tx_state,
  w55_40_in,
  w56_41_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w55_40_in;

  output reg [255:0] tx_state;
  output reg [511:0] w56_41_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w55_40_in[`IDX(1)], s0_w);
  s1  s1_blk  (w55_40_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w55_40_in[`IDX(0)] + 32'ha2bfe8a1;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w56 = s1_w + w55_40_in[`IDX(9)] + s0_w + w55_40_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w56_41_out <= {w56, w55_40_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_41 (
  clk,
  rx_state,
  tx_state,
  w56_41_in,
  w57_42_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w56_41_in;

  output reg [255:0] tx_state;
  output reg [511:0] w57_42_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w56_41_in[`IDX(1)], s0_w);
  s1  s1_blk  (w56_41_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w56_41_in[`IDX(0)] + 32'ha81a664b;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w57 = s1_w + w56_41_in[`IDX(9)] + s0_w + w56_41_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w57_42_out <= {w57, w56_41_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_42 (
  clk,
  rx_state,
  tx_state,
  w57_42_in,
  w58_43_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w57_42_in;

  output reg [255:0] tx_state;
  output reg [511:0] w58_43_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w57_42_in[`IDX(1)], s0_w);
  s1  s1_blk  (w57_42_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w57_42_in[`IDX(0)] + 32'hc24b8b70;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w58 = s1_w + w57_42_in[`IDX(9)] + s0_w + w57_42_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w58_43_out <= {w58, w57_42_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_43 (
  clk,
  rx_state,
  tx_state,
  w58_43_in,
  w59_44_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w58_43_in;

  output reg [255:0] tx_state;
  output reg [511:0] w59_44_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w58_43_in[`IDX(1)], s0_w);
  s1  s1_blk  (w58_43_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w58_43_in[`IDX(0)] + 32'hc76c51a3;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w59 = s1_w + w58_43_in[`IDX(9)] + s0_w + w58_43_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w59_44_out <= {w59, w58_43_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_44 (
  clk,
  rx_state,
  tx_state,
  w59_44_in,
  w60_45_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w59_44_in;

  output reg [255:0] tx_state;
  output reg [511:0] w60_45_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w59_44_in[`IDX(1)], s0_w);
  s1  s1_blk  (w59_44_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w59_44_in[`IDX(0)] + 32'hd192e819;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w60 = s1_w + w59_44_in[`IDX(9)] + s0_w + w59_44_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w60_45_out <= {w60, w59_44_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_45 (
  clk,
  rx_state,
  tx_state,
  w60_45_in,
  w61_46_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w60_45_in;

  output reg [255:0] tx_state;
  output reg [511:0] w61_46_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w60_45_in[`IDX(1)], s0_w);
  s1  s1_blk  (w60_45_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w60_45_in[`IDX(0)] + 32'hd6990624;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w61 = s1_w + w60_45_in[`IDX(9)] + s0_w + w60_45_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w61_46_out <= {w61, w60_45_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_46 (
  clk,
  rx_state,
  tx_state,
  w61_46_in,
  w62_47_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w61_46_in;

  output reg [255:0] tx_state;
  output reg [511:0] w62_47_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w61_46_in[`IDX(1)], s0_w);
  s1  s1_blk  (w61_46_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w61_46_in[`IDX(0)] + 32'hf40e3585;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w62 = s1_w + w61_46_in[`IDX(9)] + s0_w + w61_46_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w62_47_out <= {w62, w61_46_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_47 (
  clk,
  rx_state,
  tx_state,
  w62_47_in,
  w63_48_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w62_47_in;

  output reg [255:0] tx_state;
  output reg [511:0] w63_48_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w62_47_in[`IDX(1)], s0_w);
  s1  s1_blk  (w62_47_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w62_47_in[`IDX(0)] + 32'h106aa070;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w63 = s1_w + w62_47_in[`IDX(9)] + s0_w + w62_47_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w63_48_out <= {w63, w62_47_in[511:32]};

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_48 (
  clk,
  rx_state,
  tx_state,
  w63_48_in,
  w63_49_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w63_48_in;

  output reg [255:0] tx_state;
  output reg [479:0] w63_49_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_48_in[`IDX(0)] + 32'h19a4c116;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_49_out <= w63_48_in[511:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_49 (
  clk,
  rx_state,
  tx_state,
  w63_49_in,
  w63_50_out
);

  input         clk;
  input [255:0] rx_state;
  input [479:0] w63_49_in;

  output reg [255:0] tx_state;
  output reg [447:0] w63_50_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_49_in[`IDX(0)] + 32'h1e376c08;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_50_out <= w63_49_in[479:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_50 (
  clk,
  rx_state,
  tx_state,
  w63_50_in,
  w63_51_out
);

  input         clk;
  input [255:0] rx_state;
  input [447:0] w63_50_in;

  output reg [255:0] tx_state;
  output reg [415:0] w63_51_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_50_in[`IDX(0)] + 32'h2748774c;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_51_out <= w63_50_in[447:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_51 (
  clk,
  rx_state,
  tx_state,
  w63_51_in,
  w63_52_out
);

  input         clk;
  input [255:0] rx_state;
  input [415:0] w63_51_in;

  output reg [255:0] tx_state;
  output reg [383:0] w63_52_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_51_in[`IDX(0)] + 32'h34b0bcb5;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_52_out <= w63_51_in[415:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_52 (
  clk,
  rx_state,
  tx_state,
  w63_52_in,
  w63_53_out
);

  input         clk;
  input [255:0] rx_state;
  input [383:0] w63_52_in;

  output reg [255:0] tx_state;
  output reg [351:0] w63_53_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_52_in[`IDX(0)] + 32'h391c0cb3;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_53_out <= w63_52_in[383:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_53 (
  clk,
  rx_state,
  tx_state,
  w63_53_in,
  w63_54_out
);

  input         clk;
  input [255:0] rx_state;
  input [351:0] w63_53_in;

  output reg [255:0] tx_state;
  output reg [319:0] w63_54_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_53_in[`IDX(0)] + 32'h4ed8aa4a;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_54_out <= w63_53_in[351:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_54 (
  clk,
  rx_state,
  tx_state,
  w63_54_in,
  w63_55_out
);

  input         clk;
  input [255:0] rx_state;
  input [319:0] w63_54_in;

  output reg [255:0] tx_state;
  output reg [287:0] w63_55_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_54_in[`IDX(0)] + 32'h5b9cca4f;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_55_out <= w63_54_in[319:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_55 (
  clk,
  rx_state,
  tx_state,
  w63_55_in,
  w63_56_out
);

  input         clk;
  input [255:0] rx_state;
  input [287:0] w63_55_in;

  output reg [255:0] tx_state;
  output reg [255:0] w63_56_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_55_in[`IDX(0)] + 32'h682e6ff3;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_56_out <= w63_55_in[287:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_56 (
  clk,
  rx_state,
  tx_state,
  w63_56_in,
  w63_57_out
);

  input         clk;
  input [255:0] rx_state;
  input [255:0] w63_56_in;

  output reg [255:0] tx_state;
  output reg [223:0] w63_57_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_56_in[`IDX(0)] + 32'h748f82ee;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_57_out <= w63_56_in[255:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_57 (
  clk,
  rx_state,
  tx_state,
  w63_57_in,
  w63_58_out
);

  input         clk;
  input [255:0] rx_state;
  input [223:0] w63_57_in;

  output reg [255:0] tx_state;
  output reg [191:0] w63_58_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_57_in[`IDX(0)] + 32'h78a5636f;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_58_out <= w63_57_in[223:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_58 (
  clk,
  rx_state,
  tx_state,
  w63_58_in,
  w63_59_out
);

  input         clk;
  input [255:0] rx_state;
  input [191:0] w63_58_in;

  output reg [255:0] tx_state;
  output reg [159:0] w63_59_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_58_in[`IDX(0)] + 32'h84c87814;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_59_out <= w63_58_in[191:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_59 (
  clk,
  rx_state,
  tx_state,
  w63_59_in,
  w63_60_out
);

  input         clk;
  input [255:0] rx_state;
  input [159:0] w63_59_in;

  output reg [255:0] tx_state;
  output reg [127:0] w63_60_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_59_in[`IDX(0)] + 32'h8cc70208;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_60_out <= w63_59_in[159:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_60 (
  clk,
  rx_state,
  tx_state,
  w63_60_in,
  w63_61_out
);

  input         clk;
  input [255:0] rx_state;
  input [127:0] w63_60_in;

  output reg [255:0] tx_state;
  output reg [95:0] w63_61_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_60_in[`IDX(0)] + 32'h90befffa;
  wire [31:0] t2 = e0_w + maj_w;
  

  always @ (posedge clk)
  begin
    w63_61_out <= w63_60_in[127:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_61 (
  clk,
  rx_state,
  tx_state,
  w63_61_in,
  w63_62_out
);

  input         clk;
  input [255:0] rx_state;
  input [95:0] w63_61_in;

  output reg [255:0] tx_state;
  output reg [63:0] w63_62_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_61_in[`IDX(0)] + 32'ha4506ceb;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_62_out <= w63_61_in[95:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_62 (
  clk,
  rx_state,
  tx_state,
  w63_62_in,
  w63_out
);

  input         clk;
  input [255:0] rx_state;
  input [63:0] w63_62_in;

  output reg [255:0] tx_state;
  output reg [31:0] w63_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_62_in[`IDX(0)] + 32'hbef9a3f7;
  wire [31:0] t2 = e0_w + maj_w;

  always @ (posedge clk)
  begin
    w63_out <= w63_62_in[63:32];

    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule


module sha256_digester_1_63 (
  clk,
  rx_state,
  tx_state,
  w63_in
);

  input         clk;
  input [255:0] rx_state;
  input [31:0]  w63_in;

  output reg [255:0] tx_state;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w63_in[`IDX(0)] + 32'hc67178f2;
  wire [31:0] t2 = e0_w + maj_w;
  
  always @ (posedge clk)
  begin
    tx_state[`IDX(7)] <= rx_state[`IDX(6)];
    tx_state[`IDX(6)] <= rx_state[`IDX(5)];
    tx_state[`IDX(5)] <= rx_state[`IDX(4)];
    tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
    tx_state[`IDX(3)] <= rx_state[`IDX(2)];
    tx_state[`IDX(2)] <= rx_state[`IDX(1)];
    tx_state[`IDX(1)] <= rx_state[`IDX(0)];
    tx_state[`IDX(0)] <= t1 + t2;
  end

endmodule
