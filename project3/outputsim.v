module outputsim(
input clk,
input wen,
input [1:0]addr,
input [31:0]din,
output [31:0]dout
 ); 

reg [31:0] temp1,temp2;
assign dout=(addr==2'b00)?temp1:(addr==2'b01)?temp2:dout;
always@(posedge clk)begin
if(wen)
  begin
    if(addr==2'b00) temp1=din;
    if(addr==2'b01) temp2=din;
  end
end
endmodule