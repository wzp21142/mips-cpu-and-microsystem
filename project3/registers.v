`ifndef DEBUG_CPU_REG
`define DEBUG_CPU_REG 0
`endif

module registers(clk,read1,read2,data1,data2,regwrite,wrreg,wrdata,rst,of_control);
	input clk,rst;
	input [1:0]of_control;
	input [4:0]	read1, read2;
	output [31:0]	data1, data2;
	input regwrite;
	input [4:0]wrreg;
	input [31:0]wrdata;
	reg [31:0]memory[0:31];
	reg [31:0]_data1,_data2;
	integer i;
	
  initial begin
    for(i=0;i<32;i=i+1)
    memory[i] = 0;
	end
	
	always @(negedge rst)
	begin
	  if(rst) begin
	   for(i=0;i<32;i=i+1)
	    memory[i] <= 0;
	   end
	end
	
	always @(*) begin		
	 	if (read1 == 5'd0)
			_data1 = 32'd0;
		else if ((read1 == wrreg) && regwrite)
			_data1 = wrdata;
		else
			_data1 = memory[read1][31:0];
			
	if (read2 == 5'd0)
			_data2 = 32'd0;
		else if ((read2 == wrreg) && regwrite)
			_data2 = wrdata;
		else
			_data2 = memory[read2][31:0];
	end
	//to prevent the influence of instant signal change,data must be assigned after always.
	assign data1=_data1;
	assign data2=_data2;
	
	always@(negedge clk)begin
		if (regwrite && wrreg != 5'd0)begin
			memory[wrreg] <= wrdata;
			$display($time,,"WRITING: WriteReg-%d <= Data-%h", wrreg, wrdata);
			
			//debugger,show all GPRs every time a GPR changes.
			/*#1
					begin
						$display($time,,"(Show GPRs)");
						for(i = 0; i < 32; i = i + 1)
						begin
							$display($time,,"$%d = %h", i, memory[i]);
						end
					end*/
		end
		
		if(of_control[1]&&wrreg!=5'b0)begin
		  memory[30][0]<=of_control[0];
		  $display($time,,"overflow written!");
		 end
	end
endmodule