module npc(clk,rst,npc_sel,zero,pc,imout,regadd);
  input clk,rst,zero;
  input [1:0]npc_sel;//00:+4,01:beq,10:j/jal,11:jr
  input [31:0]imout,regadd;
  output [31:0]pc;
  reg [31:0]pc,pcnew;
  wire [31:0]t3,t2,t1,t0,extout,temp;
  wire [15:0]imm;
  assign imm=imout[15:0];
  assign temp={{16{imm[15]}},imm};
  assign t0=pc+4;
  assign extout=temp<<2;
  assign t1=t0+extout;
  assign t2={t0[31:28],imout[25:0],1'b0,1'b0};
  assign t3=regadd;
  always@(posedge clk,posedge rst)
    begin
      case(npc_sel)
        2'b00:pcnew=t0;
        2'b01:pcnew=zero?t1:t0;
        2'b10:pcnew=t2;
        2'b11:pcnew=t3;
      endcase
      if(rst) pc=32'h0000_3000;
      else pc=pcnew;
    end
endmodule