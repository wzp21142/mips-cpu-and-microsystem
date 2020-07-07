module mips(clk, rst) ;
input  clk ;
input  rst ;
wire alusrc,ext_sel,IRWr;
wire [1:0]npc_sel;
wire [31:0]imout,data1,data2,alunum_b,dmaddr,pc,aluout,dout,extended,npc,imtemp;
wire [2:0]aluop;
reg [4:0]wrreg;
reg [31:0]wrdata;
wire [1:0]of_control;
wire oflow_late,PC_change_flag;
wire [31:0]imout_late,dout_late,aluout_late;
wire [1:0]npc_sel_late;
controller controller(clk,imout[31:26],imout[5:0],oflow,bge_flag,aluop,memwrite, 
memtoreg,regwrite, alusrc,regdst, npc_sel,of_control,ext_sel,
lb_flag,sb_flag,PC_change_flag,IRWr,bgezal_flag);
datadelayer2 npc_sel_later(clk,npc_sel,npc_sel_late);

assign extended=ext_sel?{{16{imout[15]}},imout[15:0]}:{16'b0,imout[15:0]};
assign alunum_b=alusrc?extended:data2;



im_1k im(pc,imtemp);

InsReader InsReader(imtemp,IRWr,clk,imout);

datadelayer32 imout_later(clk,imout,imout_late);


registers GPR(clk,imout[25:21],imout[20:16],data1,data2,regwrite,wrreg,wrdata,rst,oflow_late,of_control);



dm_1k dm(aluout_late[11:0],data2,memwrite,clk,dout,lb_flag,sb_flag);
datadelayer32 dout_later(clk,dout,dout_late);


alu alu(aluop,data1,alunum_b,aluout,zero,oflow,bge_flag);
datadelayer32 aluout_later(clk,aluout,aluout_late);
datadelayer1 oflow_later(clk,oflow,oflow_late);

npc_module npc_module(PC_change_flag,npc_sel,zero,pc,imout,data1,npc,bgezal_flag,imout[31:26]);
PC_control PC_control(PC_change_flag,npc,clk,rst,pc);
always@(*)
begin
    if((imout[31:26]==6'b000011)||(imout[31:26]==6'b000001 && bgezal_flag)) begin wrreg=5'b11111;wrdata=pc+4; end//jal
    else begin 
    wrreg=regdst?imout[15:11]:imout[20:16];
    wrdata=memtoreg?dout_late:aluout_late;
    end
end

endmodule