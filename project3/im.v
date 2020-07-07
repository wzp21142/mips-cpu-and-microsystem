module im_8k(addr,dout);
  input [31:0]addr;
  output wire[31:0]dout;
  reg [7:0]im[8191:0];
  
  initial
  begin
    $readmemh("main.txt",im,'h1000);
    $readmemh("exception.txt",im,'h0180);
  end
  
    assign dout={im[addr[12:0]],im[addr[12:0]+1],im[addr[12:0]+2],im[addr[12:0]+3]};

endmodule
