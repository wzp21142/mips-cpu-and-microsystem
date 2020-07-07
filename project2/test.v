module test;
  reg clk,rst;
  mips mips(clk, rst) ;
  initial begin
    clk=0;rst=0;
    #1 rst=1;
    #1 rst=0;
  end
  always
    #10 clk=~clk;
endmodule