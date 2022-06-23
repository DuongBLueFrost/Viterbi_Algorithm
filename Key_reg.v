module Key_reg(clk, reset, RW_Key_reg, key_Key_reg, decrement_enable, key_o);
 
    parameter word_num = 16;
    parameter word_num_bit = 4;
    parameter p_size = 32;
    parameter POS_num = 11;
    parameter POS_num_bit = 4;
 
  input clk, reset;
  input RW_Key_reg;
  input [word_num_bit - 1:0] key_Key_reg;
  input decrement_enable;
  output reg [word_num_bit - 1:0] key_o;

  always @(posedge clk or negedge reset) begin
		  if(!reset)
				key_o <= 0;
		  else begin
				if(RW_Key_reg) 
					key_o <= key_Key_reg;
				else
					if(decrement_enable) 
						key_o <= key_o - 1;
        end
	end
endmodule
