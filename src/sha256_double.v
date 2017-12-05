module sha256_double(
  clk,
  hash0,
  data1,
  hash2
);

  input clk;
  input [255:0] hash0;
  input [511:0] data1;

  output [255:0] hash2;

  ///// variables /////
  wire [255:0] hash1;
  wire [255:0] hash2_calc;
  wire [255:0] hash2_rev;

  genvar i;

  sha256_transform u_sha256_1 (
    .clk(clk),
    .rx_state(hash0),
    .rx_input({384'h000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000, data1[127:0]}),
    .tx_hash(hash1)
  );

  sha256_transform u_sha256_2 (
    .clk(clk),
    .rx_state(256'h5be0cd191f83d9ab9b05688c510e527fa54ff53a3c6ef372bb67ae856a09e667),
    .rx_input({256'h0000010000000000000000000000000000000000000000000000000080000000, hash1}),
    .tx_hash(hash2_calc)
  );

  generate
    for (i = 0; i < 256; i = i+32) begin : loop_rev
      assign hash2_rev[(i + 31) : i] = hash2_calc[(255 - i) : (224 - i)];
    end
  endgenerate

  generate
    for (i = 0; i < 256; i = i+8) begin : loop_final
      assign hash2[(i + 7) : i] = hash2_rev[(255 - i) : (248 - i)];
    end
  endgenerate

endmodule
