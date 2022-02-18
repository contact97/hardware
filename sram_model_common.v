// Code your design here
module sram_model_common
#(
  parameter DEPTH = 1920,
  parameter WIDTH = 10,
  parameter A_WIDTH = 11,
)
(
  input CLK,
  input reset_n,
  input EN,
  input WE,
  input [A_WIDTH-1:0] ADDR,
  input [WIDTH-1:0] DINA,
  input [WIDTH-1:0] DOUTB
)
  reg [WIDTH-1:0] mem[DEPTH-1:0];
  
  always @(posedge clk)
  begin
    if(!EN) begin
      if(!WE)
        mem[ADDR] <= DINA;
      else if(WE)
        DOUTB <= mem[ADDR];
  end
    
endmodule