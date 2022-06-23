module max_and_index(A, B,
  index_A, index_B,
  enable,
  max_pos,
  index_of_max); 
  
    parameter p_size = 32;
    parameter POS_num_bit = 4;
    
  input [p_size-1:0] A, B;
  input [POS_num_bit-1:0] index_A, index_B;
  input enable;
  output [p_size-1:0] max_pos;
  output [POS_num_bit-1:0] index_of_max;
  
  wire select;
  max_pos m1 (.enable(enable), .A(A), .B(B), .MAX(select));
  assign max_pos = select ? B : A;
  assign index_of_max = select ? index_B : index_A;
  
endmodule
