module test_Controller();
  parameter size_state = 4;
  parameter size_key = 4;
  
  reg clk, reset, start,error, multiple_source, endline, stack_empty;
  reg [size_state-1:0] i;
  reg [size_key-1:0] key;
  wire [size_state-1:0] state;
  wire increment_enable_Words_control, increment_enable_Transition_control, increment_enable_Emission_control, 
         S_key_0, S_key_1, S_POS_HMM_0, S_POS_HMM_1, S_POS_HMM_2, RW_Key_reg, decrement_enable,
         S_posibility_0, S_posibility_1, RW_HMM_matrix, change_enable, choose_output, 
         RW_Pre_addr_encode, RW_Pre_Posibility, 
         RW_Max_posibility, RW_Stack_POS, reset_Stack_POS;
         
  
  initial begin
    clk = 0;
    reset = 0;
    start = 0;
    i = 0;
    multiple_source = 0;
    endline = 0;
    key = 0;
    stack_empty = 1;
    error = 0;
    
  end
  
  always begin
    #130 multiple_source = 1;
    #10 multiple_source = multiple_source & 0;
  end
  
  always begin    
    #100 error = ~error;
    #10 error = error & 0;
  end
  always begin 
    #140 endline = 1;
  end
  
  always begin
    #5 clk = ~clk;
  end
  
  always begin 
    #10 reset = 1;
  end
  
  always begin
    #15 start = 1;
    #10 start = start | 1;
  end
  
  always begin
    #10 i = i + 1;
  end
  
  Controller c1 (.clk(clk), .reset(reset), .start(start), .error(error), .i(i), .multiple_source(multiple_source), .endline(endline), .key(key), .stack_empty(stack_empty),
                  .state(state), .increment_enable_Words_control(increment_enable_Words_control), 
                  .increment_enable_Transition_control(increment_enable_Transition_control),
                  .increment_enable_Emission_control(increment_enable_Emission_control), 
                  .RW_Key_reg, .decrement_enable,
                  .S_key_0(S_key_0), .S_key_1(S_key_1), 
                  .S_POS_HMM_0(S_POS_HMM_0), .S_POS_HMM_1(S_POS_HMM_1), .S_POS_HMM_2(S_POS_HMM_2), 
                  .S_posibility_0(S_posibility_0), .S_posibility_1(S_posibility_1), 
                  .RW_HMM_matrix(RW_HMM_matrix), .change_enable(change_enable), .choose_output(choose_output), 
                  .RW_Pre_addr_encode(RW_Pre_addr_encode), .RW_Pre_Posibility(RW_Pre_Posibility), 
                  .RW_Max_posibility(RW_Max_posibility), .RW_Stack_POS(RW_Stack_POS), .reset_Stack_POS(reset_Stack_POS));
endmodule 
