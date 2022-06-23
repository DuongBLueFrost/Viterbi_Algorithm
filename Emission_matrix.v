module Emission_matrix(word_Emission_matrix, POS_Emission_matrix_in, emiss_p, POS_Emission_matrix_out);
  
  parameter word_num_bit = 8;
  parameter POS_num_bit = 4;
  parameter POS_num = 11;
  parameter word_num = 16;
  parameter p_size = 32;
  parameter max_word = 95;
  
  input [word_num_bit - 1:0] word_Emission_matrix;
  input [POS_num_bit - 1:0] POS_Emission_matrix_in;
  output reg [p_size - 1:0] emiss_p;
  output reg [POS_num_bit - 1:0] POS_Emission_matrix_out; 

  reg [p_size - 1:0] emiss_mx[POS_num - 1:0][max_word - 1:0];
  
  initial begin
    $readmemh("emiss_hex.txt", emiss_mx);
  end
  
  always @(word_Emission_matrix or POS_Emission_matrix_in) begin
    emiss_p <= emiss_mx[POS_Emission_matrix_in][word_Emission_matrix];
    POS_Emission_matrix_out <= POS_Emission_matrix_in;
  end
endmodule





