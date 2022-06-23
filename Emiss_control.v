module Emiss_control(clk, reset_Emiss_control, increment_enable_Emiss_control, POS_Emiss_control_out);
  
  input clk;
  input reset_Emiss_control;
  input increment_enable_Emiss_control;
  output  [3:0] POS_Emiss_control_out;
  
reg [3:0] emiss;
assign POS_Emiss_control_out = emiss;

initial begin
  emiss <= 4'd0;
end

always @(posedge clk or negedge reset_Emiss_control) begin
    if(!reset_Emiss_control)
        emiss = 4'd0;
    else begin
        if(increment_enable_Emiss_control)
           emiss <= (emiss == 4'd10) ? 4'd0 : emiss + 1;
    end
end
endmodule
