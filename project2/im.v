module im_1k(addr,dout);
  input [31:0]addr;
  output wire[31:0]dout;
  reg [7:0]im[1023:0];
  
  initial
  begin
    $readmemh("code.txt",im);//when testing bgezal,please load bgezal_test.txt
  end
  
    assign dout={im[addr[9:0]],im[addr[9:0]+1],im[addr[9:0]+2],im[addr[9:0]+3]};

endmodule
