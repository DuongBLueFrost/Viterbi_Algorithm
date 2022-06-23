module Stack_POS (reset, CLK, RW_Stack_POS, POS_Stack, final_POS, stack_empty, addr, done);
  
    parameter word_num = 16;
    parameter word_num_bit = 4;
    parameter p_size = 32;
    parameter POS_num = 11;
    parameter POS_num_bit = 4;  
  
  parameter nbits = 4;
  parameter addr_bits = 6;
  
  input reset, CLK, RW_Stack_POS;
  input [POS_num_bit - 1 :0] POS_Stack;
  output [POS_num_bit - 1 :0] final_POS;
  output stack_empty, done;
  output [addr_bits-1:0] addr;

  wire full;
  wire [addr_bits-1:0] popaddr, pushaddr, addr;
  
  top_1 i1 (.clk(CLK), .d(~RW_Stack_POS), .set(reset), .enable(enTop), .q(popaddr));
  top i2 (.clk(CLK), .d(~RW_Stack_POS), .reset(reset), .enable(enTop), .q(pushaddr));
  mux_6b i3 (.s(RW_Stack_POS), .a(popaddr), .b(pushaddr), .q(addr));
  
  ram64x4 i4 (.rws(RW_Stack_POS), .cs(~full), .i(POS_Stack), .o(final_POS), .cr(addr));
  
  assign stack_empty = addr[5] & addr[4]  & addr[3]  &  addr[2] & addr[1] & addr[0] & ~RW_Stack_POS;
  assign done = ~addr[5] & ~addr[4]  & ~addr[3]  &  ~addr[2] & ~addr[1] & ~addr[0] & ~RW_Stack_POS;
  assign full =  addr[5] &  addr[4] & addr[3]  &  addr[2] & addr[1] & addr[0] & RW_Stack_POS; 
  assign enTop = (~full && ~stack_empty); 
endmodule




