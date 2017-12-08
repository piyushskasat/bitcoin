`timescale 1ns/1ps

module sha256_top (
  clk,
  sdin,
  sdout,
  or_reduce_hash
);

  input clk;
  input sdin;
  output sdout;

  output or_reduce_hash;

  wire [351:0] rdata;

  wire [255:0] state0;
  wire [511:0] data;

  wire [255:0] hash1;
  wire [255:0] hash2;

  wire [31:0]  merkle_last_32;
  wire [31:0]  timestamp;
  wire [31:0]  target;
  wire [383:0] padding;
  reg [31:0]  nonce;

  spi_slave u_spi_slave (
    .ss    (1'b1),
    .sck   (clk),
    .sdin  (sdin),
    .sdout (sdout),
    .rdata (rdata)
  );

  assign state0         = rdata[351 : 96];

  assign merkle_last_32 = rdata[95 : 64];
  assign timestamp      = rdata[63 : 32];
  assign target         = rdata[31 : 0];
  assign padding        = 384'h800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000280;


  always @(posedge clk)
  begin
    nonce <= nonce + 1;
  end

  assign data = {padding, merkle_last_32, timestamp, target, nonce};

  sha256_double u_sha256_double (
    .clk(clk),
    .hash0(state0),
    .data1({merkle_last_32, timestamp, target, nonce}),
    .hash2(hash2)
  );

  assign or_reduce_hash = |hash2;
endmodule
