module controller(
		input [5:0]	opcode,funct,
		output reg [2:0]aluop,
		output reg			memwrite, memtoreg,
		output reg			regdst, regwrite, alusrc,
		output reg	[1:0]npc_sel,
		output reg of_control,
		output reg ext_sel,
		output reg lb_flag);

	always @(*) begin
		aluop	= 3'b000;//000:add 001:or 010:slt 011:sub 100:lui
		alusrc		= 1'b0;//rt from reg/imm
		memtoreg	= 1'b0;
		ext_sel = 1'b1;//zero/sign ext
		memwrite	= 1'b0;//memwrite EN
		regdst		= 1'b1;//save rd/rt
		regwrite	= 1'b1;//regwrite EN
		npc_sel = 2'b00;//00:+4,01:beq,10:j/jal,11:jr
		of_control =1'b0;//overflow control
		lb_flag = 1'b0;
		case (opcode)
			6'b100011: begin	//lw
				regdst   = 1'b0;
				memtoreg = 1'b1;
				alusrc   = 1'b1;
			end
			6'b100000: begin	//lb
				regdst   = 1'b0;
				memtoreg = 1'b1;
				alusrc   = 1'b1;
				lb_flag = 1'b1;
			end
			6'b001000: begin	//addi
				regdst   = 1'b0;
				alusrc   = 1'b1;
				of_control =1'b1;
			end
			6'b001001: begin	//addiu
				regdst   = 1'b0;
				alusrc   = 1'b1;
				ext_sel = 1'b0;
			end
			6'b000100: begin	//beq
				aluop  = 3'b011;
				npc_sel = 2'b01;
				regwrite  = 1'b0;
			end
			6'b101011: begin	//sw
				memwrite = 1'b1;
				alusrc   = 1'b1;
				regwrite = 1'b0;
			end
			6'b001111: begin //lui
			  aluop  = 3'b100;
			  regwrite=1'b1;
			  regdst=1'b0;
			  alusrc=1'b1;
		  end
			6'b000010: begin	//j
				npc_sel = 2'b10;
				regwrite  = 1'b0;
			end
			6'b000011: begin	//jal
				npc_sel = 2'b10;
			end
			6'b001101: begin	//ori
				regdst   = 1'b0;
				alusrc   = 1'b1;
				aluop=3'b001;
				ext_sel = 1'b0;
			end
			6'b000000: begin//R-type
			  case(funct)
			     6'b100001:begin//addu
			      end
			     6'b100011:begin
			       aluop=3'b011;	//subu
			       end
			     6'b001000:begin
			       regwrite = 1'b0;//jr
			       npc_sel = 2'b11;
			       end
			     6'b101010:begin	//slt
				    alusrc   = 1'b1;
			     	aluop=3'b010;
			      end
		     endcase
	   end
	endcase
	end
endmodule
