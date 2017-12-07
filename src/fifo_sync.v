module fifo_sync(
  resetn,
  clk,
  re_en,
  wr_en,
  data_in,
  data_out,
  empty,
  full
);

  parameter DATA_WIDTH = 256;
  parameter FIFO_DEPTH = 128;
  parameter FIFO_DEPTH_LOG2 = 7;
  
  input wire resetn;
  input wire clk;
  input wire re_en;
  input wire wr_en;
  input wire [DATA_WIDTH-1 : 0] data_in;
  output wire [DATA_WIDTH-1 : 0] data_out;
  output wire empty;
  output wire full;
  
  // Input pointer
  reg [FIFO_DEPTH_LOG2 : 0] idx_in;

  // Output pointer
  reg [FIFO_DEPTH_LOG2 : 0] idx_out;
  
  // FIFO RAM
  reg [DATA_WIDTH-1 : 0] fifo_ram [0 : FIFO_DEPTH-1];
  
  wire low_bits_equal;



  // Write into FIFO
  always @(posedge clk) begin
    if (!(full) && wr_en) begin
      fifo_ram[idx_in[FIFO_DEPTH_LOG2-1 : 0]] <= data_in;
    end
  end

  // Read from FIFO
  assign data_out = fifo_ram[idx_out[FIFO_DEPTH_LOG2-1 : 0]];


  // Increment input pointer if FIFO is not full
  always @(negedge resetn or posedge clk) begin
    if (resetn == 0)
      idx_in  <= 0;
    else if (!(full) && wr_en)
      idx_in <= idx_in + 1;
  end

  // Increment output pointer if FIFO is not empty
  always @(negedge resetn or posedge clk) begin
    if (resetn == 0)
      idx_out  <= 0;
    else if (!(empty) && re_en)
      idx_out <= idx_out + 1;
  end

  assign low_bits_equal = (idx_in[FIFO_DEPTH_LOG2-1 : 0] == idx_out[FIFO_DEPTH_LOG2-1 : 0]);

  assign empty  = (low_bits_equal) && (idx_in[FIFO_DEPTH_LOG2] == idx_out[FIFO_DEPTH_LOG2]);
  assign full   = (low_bits_equal) && (idx_in[FIFO_DEPTH_LOG2] != idx_out[FIFO_DEPTH_LOG2]);

endmodule
