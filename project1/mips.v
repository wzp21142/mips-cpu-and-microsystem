module mips(clk, rst) ;
input  clk ;   // clock
input  rst ;   // reset
wire alusrc,ext_sel;
wire [1:0]npc_sel;
wire [31:0]imout,data1,data2,alunum_b,pc,aluout,dout,extended;
wire [2:0]aluop;
reg [4:0]wrreg;
reg [31:0]wrdata;

assign extended=ext_sel?{{16{imout[15]}},imout[15:0]}:{16'b0,imout[15:0]};
assign alunum_b=alusrc?extended:data2;
npc npc(clk,rst,npc_sel,zero,pc,imout,data1);
im_1k im(pc,imout);
dm_1k dm(aluout[11:0],data2,memwrite,clk,dout,lb_flag);
alu alu(aluop,data1,alunum_b,aluout,zero,oflow);
controller controller(imout[31:26],imout[5:0],aluop,memwrite, 
memtoreg,regdst, regwrite, alusrc,npc_sel,of_control,ext_sel,lb_flag);

always@(*)
begin
    if(imout[31:26]==6'b000011) begin wrreg=5'b11111;wrdata=pc+4; end//jal
    else begin 
    wrreg=regdst?imout[15:11]:imout[20:16];
    wrdata=memtoreg?dout:aluout;
    end
end

registers GPR(imout[25:21],imout[20:16],data1,data2,regwrite,wrreg,wrdata,rst,oflow,of_control);

endmodule