module dm_1k( addr, din, we, clk, dout ,lb_flag) ;
  input [11:0]addr;//address bus
  input [31:0]din ;// 32-bit input data
  input we;//memory write enable
  input clk;//clock
  input lb_flag;
  output [31:0]dout;//32-bit memory output
  reg [7:0]dm[1023:0];
  wire [31:0]temp,tempout;
  integer i;
  initial begin
    for(i=0;i<1024;i=i+1)
    dm[i] = 0;
  end
  always@(posedge clk)begin
    if(we)begin
      dm[addr[9:0]]<=din[7:0];
      dm[addr[9:0]+1]<=din[15:8];
      dm[addr[9:0]+2]<=din[23:16];
      dm[addr[9:0]+3]<=din[31:24];
    end
  end
  assign temp={dm[addr[9:0]+3],dm[addr[9:0]+2],dm[addr[9:0]+1],dm[addr[9:0]]};
  assign tempout=we?din:temp;
  assign dout=lb_flag?{{24{dm[addr[9:0]][7]}},dm[addr[9:0]]}:tempout;
endmodule