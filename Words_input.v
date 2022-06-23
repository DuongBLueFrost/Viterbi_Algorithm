module Words_input(word_Words_input_in, endline, word_Words_input_out, key_Words_input, error);
  
    parameter word_num = 95;//max_word
    parameter word_num_bit = 8;//max_word_bit
    parameter w_bit = 4; //index of word input
    parameter p_size = 32;
    parameter POS_num = 11;
    parameter POS_num_bit = 4;
  
  input [w_bit - 1:0] word_Words_input_in;
  output reg error;
  output reg endline;
  output reg [word_num_bit - 1:0] word_Words_input_out;
  output reg [w_bit - 1:0] key_Words_input;

  reg [word_num_bit - 1:0] word[word_num - 1:0];
  reg [word_num_bit - 1:0] x;
  integer i;
  
  initial begin
    $readmemb("sentences.txt", word);
    i = -1;
  end
  
  always @(word_Words_input_in) begin
    x = word[word_Words_input_in] - 95;
    if (word[word_Words_input_in] == 8'b11111111)
      endline = 1;
    else begin
      word_Words_input_out = word[word_Words_input_in];
      endline = 0;
      i = i + 1;
      key_Words_input = i;
    end
    if(x[word_num_bit - 1] || word[word_Words_input_in] == 8'hff)
        error = 0;
    else
        error = 1;
  end
endmodule
