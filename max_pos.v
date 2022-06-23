module max_pos (enable, A, B, MAX);
  parameter size = 32;
  input [size-1:0] A, B;
  input enable;
  output reg MAX;
  
  reg [8:0]  MAX_E;
  reg [23:0] MAX_M;
  
  always @(*) begin
    if (enable) begin
      MAX_E = A[30:23] - B[30:23]; 
      if (MAX_E != 0) begin
        if (MAX_E[8] == 0)
          MAX = 0;
        else
          MAX = 1;
      end
    
      else begin
        MAX_M = A[22:0] - B[22:0];
        if (MAX_M != 0) begin
          if (MAX_M[23] == 0)
            MAX = 0;
          else
            MAX = 1;
        end
        
        else  
          MAX = 0;   
        end
      end   
  end
endmodule 




