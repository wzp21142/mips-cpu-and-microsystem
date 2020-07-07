module system(clk,rst,in);
  input clk,rst;
  input [31:0]in;
  wire [31:0]PrAddr,PrRD,PrDOut,rd1,rd2,rd3;
  wire [5:0]HWInt;
  wire [1:0]DEV_Addr;
  mips mips(clk,rst,PrAddr,PrRD,PrDOut,wen,HWInt) ;
  bridge bridge(PrAddr,PrDOut,PrRD,rd1,rd2,rd3,IRQ,HWInt,wen,outwe,twe);
  inputsim inputsim(in,rd3); 
  outputsim outputsim(clk,outwe,PrAddr[3:2],PrDOut,rd2); 
  timer timer(clk,rst,PrAddr[3:2],twe,PrDOut,rd1,IRQ);
endmodule