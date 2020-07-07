module alu(aluop,a,b,out,zero,oflow,bge_flag);
		input		[2:0]	aluop;
		input		[31:0]	a, b;
		output reg	[31:0]	out;
		output				zero;
		output	bge_flag;
    output oflow;
	wire [31:0] sub_ab;
	wire [31:0] add_ab;
	wire 		oflow_add;
	wire 		oflow_sub;
	wire 		oflow;
	wire 		slt;

	assign zero = (out == 0);

	assign sub_ab = a - b;
	assign add_ab = a + b;

	assign oflow_add = (a[31] == b[31] && add_ab[31] != a[31]) ? 1 : 0;
	assign oflow_sub = (a[31] == b[31] && sub_ab[31] != a[31]) ? 1 : 0;

	assign oflow = (aluop == 4'b0010) ? oflow_add : oflow_sub;

	assign slt = oflow_sub ? ~(a[31]) : a[31];
  assign bge_flag = (a<268435456)?1:0;
  
	always @(*) begin
		case (aluop)//000:add 001:or 010:stl 011:sub 100:lui
			3'd0:  out <= add_ab;				/* add */
			3'd1:  out <= a | b;				/* or */
			3'd2:  out <= {{31{1'b0}}, slt};	/* slt */
			3'd3:  out <= sub_ab;				/* sub */
			3'd4:  out <= {b[15:0],16'b0};
			default: out <= 0;
		endcase
	end

endmodule