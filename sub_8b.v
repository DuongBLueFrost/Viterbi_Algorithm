module sub_8b (a, b, minus);
  parameter size = 8;
  input [size-1:0] a, b;
  output reg [size-1:0] minus;
  
  always @(*) begin
    minus = a - b; 
  end
   
endmodule 
