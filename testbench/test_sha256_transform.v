// Testbench for fpgaminer_top.v

`timescale 1ns/1ps

module test_sha256_transform();

  reg clk;

  reg [511:0] data0;
  reg [511:0] data1;
  wire [511:0] data0_rev;
  wire [511:0] data1_rev;

  wire [255:0] hash0;
  wire [255:0] hash1;
  wire [255:0] hash2;

  wire [255:0] hash2_rev;
  wire [255:0] hash2_out;

  reg [255:0] rx_state;

  reg [31:0]  cycle = 32'd0;


  initial begin
    clk <= 0;
    #100

   data0 <= 512'h000000207ca577280b43540bb0e0b438d1834f249ef81239d6585800000000000000000023047513b68c3a2373ed81de914922d2349d43b12dfcd78ea2813e48;

   data1 <= 512'he8efa6cc381a135a4bce0018d91277d0800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000280;

    rx_state <= 256'h5be0cd191f83d9ab9b05688c510e527fa54ff53a3c6ef372bb67ae856a09e667;

    while(1)

    begin
      #5 clk <= 1;
      #5 clk <= 0;
    end
  end

  always @ (posedge clk)
  begin
    cycle <= cycle + 32'd1;
  end


  genvar i;
  generate
    for (i = 0; i < 512; i = i+32) begin
      assign data0_rev[(i + 31) : i] = data0[(511 - i) : (480 - i)];
      assign data1_rev[(i + 31) : i] = data1[(511 - i) : (480 - i)];
    end
  endgenerate


  sha256_transform u_sha256_0 (
    .clk(clk),
    .rx_state(rx_state),
    .rx_input(data0_rev),
    .tx_hash(hash0)
  );


  sha256_transform u_sha256_1 (
    .clk(clk),
    .rx_state(hash0),
    .rx_input(data1_rev),
    .tx_hash(hash1)
  );


  sha256_transform u_sha256_2 (
    .clk(clk),
    .rx_state(rx_state),
    .rx_input({256'h0000010000000000000000000000000000000000000000000000000080000000, hash1}),
    .tx_hash(hash2)
  );

  generate
    for (i = 0; i < 256; i = i+32) begin
      assign hash2_rev[(i + 31) : i] = hash2[(255 - i) : (224 - i)];
    end
  endgenerate

  generate
    for (i = 0; i < 256; i = i+8) begin
      assign hash2_out[(i + 7) : i] = hash2_rev[(255 - i) : (248 - i)];
    end
  endgenerate
endmodule
