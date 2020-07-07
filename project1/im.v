module im_1k(addr,dout);
  input [31:0]addr;
  output [31:0]dout;
  wire [31:0]dout;
  reg [7:0]im[1023:0];
  initial
  begin
    $readmemh("code.txt",im);//when test lb, change filename to code-lbtest.txt
  end
  assign dout={im[addr[9:0]],im[addr[9:0]+1],im[addr[9:0]+2],im[addr[9:0]+3]};
endmodule
