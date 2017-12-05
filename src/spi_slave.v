module spi_slave (
  ss,
  sck,
  sdin,
  sdout,
  rdata);

  input ss,sck,sdin;
  output sdout;           //slave out   master in 
  output wire [351:0] rdata;
 
  reg [351:0] rreg;
 
  assign sdout = !ss ? 1'b1 : 1'bz; //if 1=> send data  else TRI-STATE sdout
 
 
//read from sdout
always @(posedge sck)
  begin
    rreg ={sdin, rreg[351:1]};
  end
 
  assign rdata = rreg;

endmodule
