module Transition_matrix(previous_POS_in, current_POS_in, trans_p, previous_POS_out, current_POS_out);
  
    parameter word_num = 16;
    parameter word_num_bit = 4;
    parameter p_size = 32;
    parameter POS_num = 11;
    parameter POS_num_bit = 4;
  
  input [POS_num_bit - 1:0] previous_POS_in;
  input [POS_num_bit - 1:0] current_POS_in;
  output reg [p_size - 1:0] trans_p;
  output reg [POS_num_bit - 1:0] previous_POS_out;
  output reg [POS_num_bit - 1:0] current_POS_out;

  reg [p_size - 1:0] trans_mx[POS_num*POS_num - 1:0];
  wire [7:0] x;
  assign x = current_POS_in + POS_num*previous_POS_in;
  
  initial begin
    $readmemb("trans_bin.txt", trans_mx);
  end
  
  always @(previous_POS_in or current_POS_in) begin
    trans_p = trans_mx[x];
    previous_POS_out = previous_POS_in;
    current_POS_out = current_POS_in;
  end
endmodule


