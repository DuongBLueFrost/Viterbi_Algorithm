module Words_control(clk, reset_Words_control, increment_enable_Words_control, word_Words_control_out);
  
    parameter word_num = 16;
    parameter word_num_bit = 4;
    parameter p_size = 32;
    parameter POS_num = 11;
    parameter POS_num_bit = 4;
  
  input clk;
  input reset_Words_control;
  input increment_enable_Words_control;
  output reg  [word_num_bit - 1:0] word_Words_control_out;

reg [word_num_bit - 1:0] word;

initial begin
  word <= 8'd0;
end

always @(posedge clk or negedge reset_Words_control) begin
  case(reset_Words_control)
    1'b0: word <= 0;
    1'b1: begin
      if(increment_enable_Words_control == 1)
        word <= (word == 15) ? 0 : word + 1;
    end
  endcase
  word_Words_control_out <= word; 
end
endmodule

