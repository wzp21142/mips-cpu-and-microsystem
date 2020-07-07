module inputsim(
input [31:0]din,
output [31:0]dout
 ); 
reg [31:0]temp;
assign dout=temp;
always@(*)
temp=din;
endmodule