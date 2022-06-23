module Multiple_source_check (pre_addr_Multiple_source_check_in, multiple_source);
  
    parameter word_num = 16;
    parameter word_num_bit = 4;
    parameter p_size = 32;
    parameter POS_num = 11;
    parameter POS_num_bit = 4;
  
  input [POS_num - 1:0] pre_addr_Multiple_source_check_in;
  output multiple_source;
  
  reg [POS_num_bit-1:0] x;
 
assign multiple_source = (x == 1 || x == 0) ? 0 : 1;

always @(*) begin
    x <= pre_addr_Multiple_source_check_in[0] + pre_addr_Multiple_source_check_in[1] + 
                      pre_addr_Multiple_source_check_in[2] + pre_addr_Multiple_source_check_in[3] + 
                      pre_addr_Multiple_source_check_in[4] + pre_addr_Multiple_source_check_in[5] + 
                      pre_addr_Multiple_source_check_in[6] + pre_addr_Multiple_source_check_in[7] + 
                      pre_addr_Multiple_source_check_in[8] + pre_addr_Multiple_source_check_in[9] +  
                      pre_addr_Multiple_source_check_in[10];
end
endmodule

