// Code your testbench here
// or browse Examples
module TB;
  
parameter IO_BW = 10;
parameter OUT_BW = 10;
parameter ADDR_BW = 12;
parameter FS_BW = 13;
  
parameter vsync_gap = 1;
parameter hsync_gap = 1;
parameter den_gap = 1;
  
reg clk;
reg reset_n;
  
initial begin
  reset_n = 1'b0;
  #10 reset_n = 1'b1;
  #10 reset_n = 1'b0;
  #10 reset_n = 1'b1;
end
  
initial begin
  clk = 1'b0;
  forever begin
    #5 clk = ~clk;
  end
end
  
  
////////////////////////////////////////////
 
  reg [3:0] r_frames;
  reg [FS_BW-1:0] i_vsize;
  reg [FS_BW-1:0] i_hsize;
  reg [9:0]	r_hblank;
  reg [9:0] r_vblank;
  
  initial begin
    if($value$plusargs("FRAMES=%d", r_frames)) $display("FRAMES=%d", r_frames);
    if($value$plusargs("V_SIZE=%d", i_vsize)) $display("V_SIZE=%d", i_vsize);
    if($value$plusargs("H_SIZE=%d", i_hsize)) $display("H_SIZE=%d", i_hsize);
    if($value$plusargs("V_BLANK=%d", r_vblank)) $display("V_BLANK=%d", r_vblank);
    if($value$plusargs("H_BLANK=%d", r_hblank)) $display("H_BLANK=%d", r_hblank);
  end
  
///////////////////////////////////////////
  reg i_vsync;
  reg i_hsync;
  
  reg i_den;
  reg [IO_BW-1:0] i_data;
  
  wire o_den;
  wire [IO_BW-1:0] o_data;
  
  wire w_mem_cen;
  wire w_mem_wen;
  wire [ADDR_BW-1:0] w_mem_addr;
  wire [IO_BW-1:0] w_mem_wdata;
  wire [IO_BW-1:0] w_mem_rdata;
  
  sram_model_common
  #(
    .DEPTH (),
    .WIDTH (),
    .A_WIDTH ()
  )
  mem_0
  (
    .CLK (),
    .EN  (),
    .WE  (),
    .ADDR(),
    .DINA(),
    .DOUTB()
  )
  
  
//////////////////////////////////
  //integer f_data;
  //reg [IO_BW-1:0] s_data;
  
  initial begin
    //f_data = $fopen("file_path", "r");
    
    i_den <= 1'd0;
    i_data <= 'd0;
    i_vsync <= 'd0;
    i_hsync <= 'd0;
    
    repeat(100) begin @(posedge clk); end
    repeat(r_frames)
    begin
      i_vsync <= 'd1;
      repeat(vsync_gap) begin @(posedge clk); end
      i_vsync <= 'd0;
      repeat(r_vblank) begin @(posedge clk); end
      
      repeat(30)
      begin
        i_hsync <= 'd1;
        repeat(hsync_gap) begin @(posedge clk); end
        i_hsync <= 'd0;
        repeat(r_hblank) begin @(posedge clk); end
        repeat (i_hsize)
        begin
          repeat(den_gap+1) begin @(posedge clk); end  
        end
        repeat(100) begin @(posedge clk); end
      end
      
      repeat(i_vsize)
      begin
        i_hsync <= 'd1;
        repeat(hsync_gap) begin @(posedge clk); end
        i_hsync <= 'd0;
        repeat(r_hblank) begin @(posedge clk); end
        repeat (i_hsize)
        begin
          //$fscanf(f_data, "%d", s_data);
          //i_data <= s_data;
          i_data <= $urandom;
          i_den <= 'd1;
          repeat(1) begin @(posedge clk); end
          i_den <= 'd0;
          repeat(r_hblank) begin @(posedge clk); end
        end
        repeat(100) begin @(posedge clk); end
      end
        
      repeat(30)
      begin
        i_hsync <= 'd1;
        repeat(hsync_gap) begin @(posedge clk); end
        i_hsync <= 'd0;
        repeat(r_hblank) begin @(posedge clk); end
        repeat (i_hsize)
        begin
          repeat(den_gap+1) begin @(posedge clk); end  
        end
        repeat(100) begin @(posedge clk); end
      end
      
      repeat(r_vblank) begin @(posedge clk); end
      i_vsync <= 'd1;
      repeat(vsync_gap) begin @(posedge clk); end
      i_vsync <= 'd0;
      
    end
  end

///////////////////////////////////////
  integer f_o_data;
  
  reg [OUT_BW-1:0] s_o_data;
  
  reg w_wrongY;
  
  initial begin
    f_o_data = $fopen("file_pata", "r");
    w_wrongY = 1'b0;
    tempY= 10'b0;
  end
  
  always @(posedge clk)
    begin
      if(o_en)
        begin
          $fscanf(f_o_data, "%d", s_o_data);
          if(s_o_data != o_data) begin w_wrongY <= 1'b1; end
          else begin w_wrongY <= 1'b0; end
    end
///////////////////////////////////////////////

      initial 
      begin
        $dumpfile("temp.vcd");
        $dumpvars;
      end
      
      initial begin
        $vcdpluson;
        $vcdplusmemon;
      end
//////////////////////////////////////////////
      
endmodule