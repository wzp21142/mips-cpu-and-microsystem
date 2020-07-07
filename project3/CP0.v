module CP0(
  input [31:0]PC,
  input [31:0]DIn,
  input [5:0]HWInt,
  input [4:0]Sel,
  input Wen,EXLSet,EXLClr,clk,rst,
  output IntReq,
  output reg [31:0]EPC,
  output [31:0]DOut);
  
  reg [5:0]im;
  reg exl,ie;
  wire [31:0]SR,PrID,Cause;
  reg [5:0] hwint_pend ;
  
  initial begin
    exl=0;ie=0;im=0;hwint_pend=0;
  end
  
  assign IntReq=(|(HWInt[5:0] & im[6:0]) & ie & !exl);

  //12:SR 13:CAUSE 14:EPC 15:PrID
  assign SR ={16'b0,im,8'b0,exl,ie};
  assign Cause ={16'b0, hwint_pend, 10'b0};
  assign PrID = 32'h12345678;
  assign DOut = (Sel==12) ? SR : (Sel==13) ? Cause 
                : (Sel==14) ? EPC : (Sel==15) ? PrID : 0;
  
  always@(posedge rst)begin
    if(rst)begin
      exl=0;ie=0;im=0;hwint_pend=0;
      end
  end


  
  always@(posedge clk)
  begin
    if(EXLSet)
      exl<=1'b1;
    if(EXLClr)begin
      exl<=1'b0;
      hwint_pend[5]=0;
    end
    else hwint_pend<=HWInt;
      
    if(Wen&&Sel==12)
      {im,exl,ie}<={DIn[15:10],DIn[1],DIn[0]};
    if(PC<'h00004180)
    EPC<=PC;
  end
  
  
endmodule