module controller(
    input clk,
		input [5:0]	opcode,funct,
		input of_flag,bge_flag,
		output reg [2:0]aluop,
		output reg			memwrite, memtoreg,
		output reg			 regwrite, alusrc,regdst,
		output reg	[1:0]npc_sel,
		output reg [1:0]of_control,
		output reg ext_sel,
		output reg lb_flag,
		output reg sb_flag,
		output reg PC_change_flag,
		output reg IRWr,
		output reg bgezal_flag
		);
	reg of_wire_flag,bge_wire_flag;
	reg [2:0]state,next_state;//000:if 001:dcd/rf 010:exe 011:mem 100:wb	  
	parameter [5:0] j_op = 6'b000010;
	parameter [5:0] jal_op = 6'b000011;
	parameter [5:0] jr_op = 6'b000000		,jr_func = 6'b001000;
	parameter [5:0] addu_op = 6'b000000		,addu_func = 6'b100001;
	parameter [5:0] subu_op = 6'b000000		,subu_func = 6'b100011;
	parameter [5:0] slt_op = 6'b000000		,slt_func = 6'b101010;
	parameter [5:0] ori_op = 6'b001101;
	parameter [5:0] lw_op = 6'b100011;
	parameter [5:0] sw_op = 6'b101011;
	parameter [5:0] beq_op = 6'b000100;
	parameter [5:0] lui_op = 6'b001111;
	parameter [5:0] addi_op = 6'b001000;
	parameter [5:0] addiu_op = 6'b001001;
	parameter [5:0] lb_op = 6'b100000;
	parameter [5:0] sb_op = 6'b101000;
	parameter [5:0] bgezal_op = 6'b000001;
	
	reg firstflag=0;
	initial begin
		aluop	= 3'b000;//000:add 001:or 010:slt 011:sub 100:lui
		alusrc		= 1'b0;//rt from reg/imm
		memtoreg	= 1'b0;
		ext_sel = 1'b0;//zero/sign ext
		memwrite	= 1'b0;//memwrite EN
		regdst		= 1'b0;//save rd/rt
		regwrite	= 1'b0;//regwrite EN
		npc_sel = 2'b00;//00:+4,01:beq,10:j/jal,11:jr
		of_control =2'b0;//overflow control
		lb_flag = 1'b0;
		sb_flag = 1'b0;
	  PC_change_flag = 1'b0;//PC changes only when this flag eqauls 1 
	  state = 3'b000;
	  end
	always @(posedge clk) 
		begin
			state <= next_state;
		end
	
	always @(state or opcode or funct) begin
		case(state)
			3'b000: //if
				begin
					next_state = 3'b001;
				end
				
			3'b001: //rf
				begin
					case (opcode)
						j_op:
							begin
								next_state = 3'b000;						// j
								$display("rf next:if");
							end
						jal_op:
							begin
								next_state = 3'b100;					// jal
								$display("rf next:wb");
							end
						bgezal_op:
							begin
								next_state = 3'b100;					// jal
								$display("rf next:wb");
							end
						6'b000000://R-type
							begin
								if(funct == jr_func) 
									begin
										next_state = 3'b000;	//jr
										$display("rf next:if");
									end
								else 
									begin
										next_state = 3'b010;				//all R-type except jr
										$display("rf next:exe");
									end
							end
						default: 
							begin
								next_state = 3'b010; //all else(I-type)
								$display("rf next:exe");
							end
					endcase
				end
				
			3'b010: //exe
				begin
					case (opcode)
						beq_op: 
							begin
								next_state = 3'b000;				// beq
								$display("exe next:if");
							end
						lw_op: 
							begin
								next_state = 3'b011;			 	// lw
								$display("exe next:mem");
							end
						sw_op: 
							begin
								next_state = 3'b011;				// sw
								$display("exe next:mem");
							end
						lb_op: 
							begin
								next_state = 3'b011;			 	// lb
								$display("exe next:mem");
							end
						sb_op: 
							begin
								next_state = 3'b011;				// sb
								$display("exe next:mem");
							end
						default:
							begin
								next_state = 3'b100; 					//all else(not connected with dm)
								$display("exe next:wb");
							end
					endcase
				end
			
			3'b011://mem
				begin
					if(opcode == lw_op || opcode == lb_op)
						begin
							next_state = 3'b100;						//lw lb
							$display("mem next:wb");
						end
					else 
						begin
							next_state = 3'b000;						//sw sb
							$display("mem next:if");
						end			
				end
				
			3'b100: //wb
				begin
				  firstflag=1;
					next_state = 3'b000;
					$display("wb next:if");
				end
				
		endcase
		
		//debug
		begin
			if(opcode==6'b000010)							    $display($time,"J");
			else if(opcode==6'b000011)						$display($time,"JAL");
			else if(opcode==6'b000000 && funct==6'b001000)	$display($time,"JR");
			else if(opcode==6'b000000 && funct==6'b100001)	$display($time,"ADDU");
			else if(opcode==6'b000000 && funct==6'b100011)	$display($time,"SUBU");
			else if(opcode==6'b000000 && funct==6'b101010)	$display($time,"SLT");
			else if(opcode==6'b001101)						$display($time,"ORI");
			else if(opcode==6'b100011)						$display($time,"LW");
			else if(opcode==6'b101011)						$display($time,"SW");
			else if(opcode==6'b000100)						$display($time,"BEQ");
			else if(opcode==6'b001111)						$display($time,"LUI");
			else if(opcode==6'b001000)					 $display($time,"ADDI");
			else if(opcode==6'b001001)					 $display($time,"ADDIU");
			else if(opcode==6'b100000)						$display($time,"LB");
			else if(opcode==6'b101000)						$display($time,"SB");
			else $display($time,"INSTRUCTIONS EXECUTED OVER");

		end
	end	
		
	//ctrl signals
	always @(*) 
	begin
	  
	  //if state1
	  
	  //figure out IRWr
	  if (state == 3'b000)IRWr = 1;
		else IRWr = 0;
		  
	  //figure out PC_change_flag
	  if(firstflag)
	  if (state == 3'b000)PC_change_flag = 1;
		else PC_change_flag = 0;
		  
	  //rf state2
	  
	      //figure out npc_sel
	  if ((state == 3'b001||state==3'b000)&&opcode==j_op) npc_sel=2'b10;
	  else if ((state == 3'b010||state==3'b000) && opcode == beq_op) npc_sel=2'b01;
    else if (state == 3'b000&&opcode==jal_op) npc_sel=2'b10;
    else if(state == 3'b000&&opcode==bgezal_op) npc_sel=2'b01;
    else if (opcode == jr_op && funct == jr_func && (state == 3'b001||state == 3'b000))  npc_sel=2'b11;
    else npc_sel=2'b00;
        
	  //exe state3
	  
	  		  //figure out aluop,000:add,001:or,010:slt,011:sub,100:lui,other:0
    if (state == 3'b010)
			begin
				if (opcode == addu_op && funct == addu_func) aluop = 3'b000;
				else if (opcode == subu_op && funct == subu_func) aluop = 3'b011;
				else if (opcode == beq_op) aluop=3'b011;
				else if (opcode == slt_op && funct == slt_func) aluop = 3'b010;
				else if (opcode == ori_op) aluop = 3'b001;
				else if (opcode == lw_op || opcode == sw_op || opcode == addi_op || opcode == addiu_op 
				|| opcode == lb_op || opcode == sb_op)  aluop = 3'b000;
				else if (opcode == lui_op)  aluop = 3'b100;
				else aluop = 3'b111;
			end
        else if(state==3'b011&&(opcode == lw_op || opcode == sw_op 
        ||opcode == lb_op || opcode == sb_op)) aluop=3'b000;
        else aluop = 3'b111;
          
	    //figure out alusrc
      if (state == 3'b010)
			begin
				if(opcode == 6'b000000 && (funct == addu_func || funct == subu_func || funct == slt_func)) alusrc = 0;
				else if(opcode == ori_op || opcode == lw_op || opcode == sw_op || 
				opcode == lui_op || opcode == addi_op 
				|| opcode == addiu_op || opcode == lb_op || opcode == sb_op) alusrc = 1;
				else alusrc = 0;
			end
		  else if(state == 3'b100 && funct == ori_op) alusrc = 1;//special state
		  else if(state == 3'b011 && (opcode == lw_op || opcode == sw_op 
        ||opcode == lb_op || opcode == sb_op)) alusrc = 1;
		  else alusrc = 0;
		 
		  //figure out ext_sel
		  if (state == 3'b010 &&(opcode == ori_op||opcode == addiu_op)) ext_sel = 1'b0;
      else ext_sel = 1'b1;
          
		  //mem state4
		
		  //figure out sb_flag
		  if (state == 3'b011 && opcode == sb_op) sb_flag = 1;
		  else sb_flag = 0;
		  
		  //figure out lb_flag
		  if (state == 3'b011 && opcode == lb_op) lb_flag = 1;
		  else lb_flag = 0;
		  
      //figure out memwrite
      if (state == 3'b011 && (opcode == sw_op || opcode == sb_op)) memwrite = 1;
      else memwrite = 0;
          
		 
		  //wb state5
		  
		  //figure out regdst
      if (state == 3'b100)
			begin
				if(opcode==lw_op||opcode==lb_op||opcode==addi_op||opcode==addiu_op||opcode==lui_op
				  ||opcode==ori_op) regdst=1'b0;//I-type except sw,sb,beq
				else regdst = 1'b1;
			end
		  else regdst = 1'b1;
		  
      //figure out memtoreg
      if(state == 3'b100)
			begin
				if(opcode == lw_op||opcode == lb_op) memtoreg = 1'b1;
				else memtoreg = 1'b0;
			end
        else memtoreg = 1'b0;
		  
        //figure out regwrite
      if (state == 3'b100)
   			  //as long as in the wb state,every ins can write reg.
 			     regwrite = 1'b1;
      else regwrite = 1'b0;
          
		    //figure out of_control
		  if (state == 3'b010)
		    of_wire_flag=of_flag;
      if (state == 3'b100 && opcode==addi_op && of_wire_flag)
 			     of_control = 2'b11;
 			else if (state == 3'b100 && opcode==addi_op && !of_wire_flag)
 			      of_control = 2'b10;
      else of_control = 2'b0;
        
      if((state == 3'b000||state == 3'b100) && bge_flag==1)
        bge_wire_flag=1;
    else bge_wire_flag=0;
      if (state == 3'b000 && opcode==bgezal_op && bge_wire_flag)
 			     bgezal_flag =1;
 			else if(state == 3'b100 && opcode==bgezal_op && bge_wire_flag)
 			     bgezal_flag =1;
      else bgezal_flag = 0;  
        
	end
endmodule