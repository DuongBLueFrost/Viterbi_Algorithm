module Pre_addr_encode (clk, pre_addr_Pre_addr_encode_in,
reset, pre_addr_Pre_addr_encode_out);

      parameter word_num = 16;
      parameter word_num_bit = 4;
      parameter p_size = 32;
      parameter POS_num = 11;
      parameter POS_num_bit = 4;
      
      input [POS_num - 1:0] pre_addr_Pre_addr_encode_in;
      input clk, reset;
      output reg [POS_num_bit - 1:0] pre_addr_Pre_addr_encode_out;
      
      integer i;
  initial begin
      pre_addr_Pre_addr_encode_out <= 0;
  end
  always @(reset) begin 
      if(!reset) begin
          pre_addr_Pre_addr_encode_out <= 0;
      end
  end
  
  always @(posedge clk) begin
      for(i = 0; i < POS_num; i = i + 1) begin
          if(pre_addr_Pre_addr_encode_in[i])
              pre_addr_Pre_addr_encode_out <= i;
      end
  end
    
endmodule


