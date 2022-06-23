module Transition_control(clk, reset_Transition_control, increment_enable_Transition_control, POS_Transition_control_out);
  
    parameter word_num = 16;
    parameter word_num_bit = 4;
    parameter p_size = 32;
    parameter POS_num = 11;
    parameter POS_num_bit = 4;
  
  input clk;
  input reset_Transition_control;
  input increment_enable_Transition_control;
  output  [POS_num_bit - 1:0] POS_Transition_control_out;

reg [POS_num_bit - 1:0] trans;
assign  POS_Transition_control_out = trans;

initial begin
  trans <= 0;
end

always @(posedge clk or reset_Transition_control) begin
  if(!reset_Transition_control)
      trans <= 0;
  else begin
      if(increment_enable_Transition_control)
          trans = (trans == 10) ? 0 : trans + 1;
  end 
end

endmodule


