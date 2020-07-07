module InsReader(input [31:0] in_im,  
         input IRWr,  
         input clk, 
         output reg [31:0] out_im  );
always @(posedge clk) begin
        if(IRWr) out_im <= in_im;  
end
endmodule