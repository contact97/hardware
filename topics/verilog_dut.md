# Verilog Design coding styles

```verilog

/********************************Input Enable Pipeline*******************************/

localparam PIPELINE=10;

reg r_en[PIPELINE:0];

integer i;

always @(posedge CLK or negedge RESET_N)
begin
    if (!RESET_N)
    begin
        for (i=0; i<(PIPELINE+1); i=i+1)
            r_en[i] <= 1'b0;
    end
    else
    begin
        r_en[0] <= I_EN;
        for (i=0; i<PIPELINE; i=i+1)
            r_en[i+1] <= r_en[i];
    end
end

/************************************************************************************/

```
