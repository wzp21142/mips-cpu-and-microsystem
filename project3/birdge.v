module bridge(
    input [31:0]PrAddr,
    input [31:0]PrWD,
    output [31:0]PrRD,
    input [31:0]rd1,
    input [31:0]rd2,
    input [31:0]rd3,
    input IRQ,
    output [5:0]HWInt,
    input wen,
    output outwe,
    output twe);
    wire HitDEV_timer,HitDEV_output,HitDEV_input;
assign HWInt={5'b0,IRQ};
assign twe = wen&&(PrAddr[31:4] == 'h00007F0) ;
assign HitDEV_timer = (PrAddr[31:4] == 'h00007F0) ;
assign outwe = wen&&(PrAddr[31:4] == 'h00007F1) ;
assign HitDEV_output = (PrAddr[31:4] == 'h00007F1) ;
assign HitDEV_input = (PrAddr == 'h00007F20) ;

//0:COUNTER 1:OUTPUT 2:INPUT
assign PrRD = (HitDEV_timer)?rd1:(HitDEV_output)?rd2:(HitDEV_input)?rd3:PrWD;
endmodule