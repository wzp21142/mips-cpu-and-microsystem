module datadelayer32 (
	input clk,
	input [31:0] in,
	output reg [31:0] out);
	
	always @(negedge clk) begin
			out <= in;
	end
endmodule

module datadelayer1 (
	input clk,
	input  in,
	output reg  out);
	
	always @(negedge clk) begin
			out <= in;
	end
endmodule

module datadelayer2 (
	input clk,
	input [1:0] in,
	output reg [1:0] out);
	
	always @(negedge clk) begin
			out <= in;
	end
endmodule