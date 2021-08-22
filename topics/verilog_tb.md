# Commonly used syntax for Verilog Testbench

```verilog

// CLK and RESET_N signal generation

reg CLK;
reg RESET_N;

initial
begin
    CLK = 1'b0;
    forever
    begin
        #5 CLK = ~CLK;
    end
end

initial
begin
    RESET_N = 1'b0;
    #10 RESET_N = 1'b1;
    #10 RESET_N = 1'b0;
    #10 RESET_N = 1'b1;
end

```
