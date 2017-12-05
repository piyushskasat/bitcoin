// Testbench for sha256_double.v

`timescale 1ns/1ps

`define SIM
module test_sha256_transform();

  reg clk;
  reg resetn;

  reg   [511:0] data0;
  reg   [511:0] data1;
  wire  [511:0] data0_rev;
  wire  [511:0] data1_rev;
  reg   [639:0] captured_data;
  reg   [255:0] correct_hash;
  wire  [255:0] correct_hash_out;

  reg   [255:0] hash0;
  wire  [255:0] hash1;
  wire  [255:0] hash2;

  reg [31:0]  cycle = 32'd0;

  // FIFO signals
  reg re_en;
  reg wr_en;

  integer file_testvectors;
  integer scan_inputs;

  initial begin
    clk     <= 0;
    resetn  <= 0;
    #100

    resetn <= 1;

    while(1)

    begin
      #5 clk <= 1;
      #5 clk <= 0;
    end
  end


  initial begin
    file_testvectors = $fopen("../json/sha256_testvectors.txt", "r"); //Opening test vectors file

    if (file_testvectors == 0) begin               // If outputs file is not found
      $display("testvectors file handle was NULL");
      $finish;
    end
  end

  always @ (posedge clk)
  begin
    cycle <= cycle + 32'd1;
  end

  always @ (posedge clk)
  begin

    // If end of file
    // stop simulation
    if ($feof(file_testvectors)) begin
      $finish;
    end
    
    scan_inputs = $fscanf(file_testvectors, "%h\n", captured_data);
    scan_inputs = $fscanf(file_testvectors, "%h\n", hash0);
    scan_inputs = $fscanf(file_testvectors, "%h\n", correct_hash);

    data0       = captured_data[639 : 128];
    data1       = {captured_data[127 : 0], 384'h800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000280};

    wr_en       = 1'b1;
  end


  fifo_sync #(
    .DATA_WIDTH (256),
    .FIFO_DEPTH (256),
    .FIFO_DEPTH_LOG2 (8))
  correct_hash_fifo(
    .resetn   (resetn),
    .clk      (clk),
    .re_en    (re_en),
    .wr_en    (wr_en),
    .data_in  (correct_hash),
    .data_out (correct_hash_out),
    .empty    (),
    .full     ()
  );

  always @(hash2) begin
    if (correct_hash_out != hash2) begin
      $error("Wrong Hash!!");
      $stop;
    end else
      re_en <= 1'b1;
  end

  genvar i;
  generate
    for (i = 0; i < 512; i = i+32) begin
      assign data0_rev[(i + 31) : i] = data0[(511 - i) : (480 - i)];
      assign data1_rev[(i + 31) : i] = data1[(511 - i) : (480 - i)];
    end
  endgenerate

  sha256_double u_sha256_double (
    .clk(clk),
    .hash0(hash0),
    .data1(data1_rev),
    .hash2(hash2)
  );

endmodule
