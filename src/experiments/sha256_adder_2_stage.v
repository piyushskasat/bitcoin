// A quick define to help index 32-bit words inside a larger register.
`define IDX(x) (((x)+1)*(32)-1):((x)*(32))

module sha256_adder_2_stage(
  clk,
  rx_state,
  tx_state,
  w_in,
  w_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w_in;

  output reg [255:0] tx_state;
  output reg [511:0] w_out;

  wire [255:0] tx_state_int;
  wire [511:0] w_int;

  sha256_digester_clocked dig_0(
    .clk(clk),
    .rx_state(rx_state),
    .tx_state(tx_state_int),
    .w_in(w_in),
    .w_out(w_int)
  );

  sha256_digester_clocked dig_1(
    .clk(clk),
    .rx_state(tx_state_int),
    .tx_state(tx_state),
    .w_in(w_int),
    .w_out(w_out)
  );

endmodule


module sha256_digester_clocked (
  clk,
  rx_state,
  tx_state,
  w_in,
  w_out
);

  input         clk;
  input [255:0] rx_state;
  input [511:0] w_in;

  output reg [255:0] tx_state;
  output reg [511:0] w_out;

  wire [31:0] e0_w, e1_w, ch_w, maj_w, s0_w, s1_w;

  e0  e0_blk  (rx_state[`IDX(0)], e0_w);
  e1  e1_blk  (rx_state[`IDX(4)], e1_w);
  ch  ch_blk  (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
  maj maj_blk (rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

  s0  s0_blk  (w_in[`IDX(1)], s0_w);
  s1  s1_blk  (w_in[`IDX(14)], s1_w);

  wire [31:0] t1 = rx_state[`IDX(7)] + e1_w + ch_w + w_in[`IDX(0)] + 32'h0fc19dc6;
  wire [31:0] t2 = e0_w + maj_w;

  wire [31:0] w_new = s1_w + w_in[`IDX(9)] + s0_w + w_in[`IDX(0)];
  

  always @ (posedge clk)
  begin
    w_out <= {w_new, w_in[511:32]};

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
