module registers(read1,read2,data1,data2,regwrite,wrreg,wrdata,rst,overflow_flag,of_control);
	input rst,overflow_flag,of_control;
	input [4:0]	read1, read2;
	output reg [31:0]	data1, data2;
	input regwrite;
	input [4:0]wrreg;
	input [31:0]wrdata;
	reg [31:0]memory[0:31];
	wire [1:0]of_wr_flag;
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
	
	assign  of_wr_flag=(overflow_flag==1 && of_control==1)?2'b11:(overflow_flag==0 && of_control==1)?
	2'b10:2'b00;
	always @(of_wr_flag)
	begin
		if(of_wr_flag[1]==1)
		  memory[30][0]=of_wr_flag[0];
	end
	//assign data1=((read1==wrreg)&&regwrite)?wrdata:memory[read1];
	//assign data2=((read2==wrreg)&&regwrite)?wrdata:memory[read2];
	always @(read1 or read2)
	begin
	 	if (read1 == 5'd0)
			data1 = 32'd0;
		else if ((read1 == wrreg) && regwrite)
			data1 = wrdata;
		else
			data1 = memory[read1][31:0];
			
	if (read2 == 5'd0)
			data2 = 32'd0;
		else if ((read2 == wrreg) && regwrite)
			data2 = wrdata;
		else
			data2 = memory[read2][31:0];
			
	 if (regwrite && wrreg != 5'd0)
			memory[wrreg] = wrdata;		
			
	end
endmodule