module timer(
				input CLK_I,
				input RST_I,
				input [3:2] ADD_I,	
				input WE_I,
				input [31:0] DAT_I,
				output [31:0] DAT_O,
				output reg IRQ
			);
	reg [31:0] CTRL;/*[31:4]reserved [3]IM,break enable			
	                   [2:1]mode 00:mode0	01:mode1 [0]enable:counter enable*/
	//mode0:when count to 0, stop counting until starter is written again.
	//mode1:when count to 0, automatically load starter and keep counting.
	reg [31:0] PRESET;//save the initial data
	
	reg [31:0] counter;
	assign DAT_O=(ADD_I==2'b00)?CTRL:(ADD_I==2'b01)?PRESET:(ADD_I==2'b10)?counter:DAT_O;
	initial
		begin
			CTRL = 0;
			IRQ = 1'b0;
		end
	
	
	always @(posedge CLK_I or negedge RST_I)
		begin
		  if(WE_I)begin
		    if (ADD_I==2'b00) CTRL = DAT_I;
		    else if (ADD_I==2'b01) begin PRESET = DAT_I; counter = PRESET;  end
		  end
		  if(IRQ==1) IRQ<=0;
			if(CTRL[2:1]==2'b00)//mode 0
				begin
					if(counter == 2'b0)
						begin
							CTRL[0] <= 0;
							if(CTRL[3]==1) begin IRQ <= 1'b1; CTRL[3] <=0; end
						end
					else if(CTRL[0]==1)counter <= counter - 1;
				end
				
			else if(CTRL[2:1]==2'b01)//mode 1
				begin
					if(counter == 2'b0)
						begin
							counter <= PRESET;
							if(CTRL[3]==1) IRQ <= 1'b1;
						end
					else if(CTRL[0]==1)counter <= counter - 1;
		  end
	end
endmodule