module Pre_Posibility (P0, P1, P2, P3, P4, P5, P6, P7, P8 ,P9, P10, RW_Pre_Posibility,
                       reset, clk, chose_index, P_out);
    
    parameter word_num = 16;
    parameter word_num_bit = 4;
    parameter p_size = 32;
    parameter POS_num = 11;
    parameter POS_num_bit = 4;
      
      input [p_size - 1:0] P0;
      input [p_size - 1:0] P1;
      input [p_size - 1:0] P2;
      input [p_size - 1:0] P3;
      input [p_size - 1:0] P4;
      input [p_size - 1:0] P5;
      input [p_size - 1:0] P6;
      input [p_size - 1:0] P7;
      input [p_size - 1:0] P8;
      input [p_size - 1:0] P9;
      input [p_size - 1:0] P10;
      input RW_Pre_Posibility, reset, clk;
      input [POS_num_bit - 1:0] chose_index;
      output [p_size - 1:0] P_out;
  
  reg [p_size - 1:0] P [POS_num - 1:0];
  
  assign P_out = (chose_index == 0) ? P[0] :
                 (chose_index == 1) ? P[1] :
                 (chose_index == 2) ? P[2] :             
                 (chose_index == 3) ? P[3] :
                 (chose_index == 4) ? P[4] :
                 (chose_index == 5) ? P[5] :
                 (chose_index == 6) ? P[6] :
                 (chose_index == 7) ? P[7] :
                 (chose_index == 8) ? P[8] :
                 (chose_index == 9) ? P[9] : P[10] ;
initial begin
          P[0] <= 0; 
          P[1] <= 0;
          P[2] <= 0;
          P[3] <= 0;
          P[4] <= 0;
          P[5] <= 0; 
          P[6] <= 0;
          P[7] <= 0;
          P[8] <= 0;
          P[9] <= 0;
          P[10] <= 0;
end

always @(negedge reset or posedge clk) begin
    if(!reset) begin
          P[0] <= 0; 
          P[1] <= 0;
          P[2] <= 0;
          P[3] <= 0;
          P[4] <= 0;
          P[5] <= 0; 
          P[6] <= 0;
          P[7] <= 0;
          P[8] <= 0;
          P[9] <= 0;
          P[10] <= 0;
    end
    else
      if(RW_Pre_Posibility) begin
              P[0] <= P0;
              P[1] <= P1;
              P[2] <= P2;
              P[3] <= P3;
              P[4] <= P4;
              P[5] <= P5;
              P[6] <= P6;
              P[7] <= P7;
              P[8] <= P8;
              P[9] <= P9;
              P[10] <= P10;
      end
end
  
endmodule
