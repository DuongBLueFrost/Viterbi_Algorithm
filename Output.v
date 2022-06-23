module Output(Q, increment_enable_Emission_control, 
              increment_enable_Words_control, increment_enable_Transition_control,
              S_key_0, S_key_1, S_POS_HMM_0, S_POS_HMM_1, S_POS_HMM_2, 
              S_posibility_0, S_posibility_1, RW_HMM_matrix, change_enable, choose_output, 
              RW_Pre_addr_encode, RW_Pre_Posibility, reset_Transition_control, reset_Emission_control,
              RW_Max_posibility, RW_Stack_POS, reset_Stack_POS);
              
    parameter size = 4;
  
  input [size-1:0] Q;
  output increment_enable_Words_control, increment_enable_Transition_control, increment_enable_Emission_control, 
         S_key_0, S_key_1, S_POS_HMM_0, S_POS_HMM_1, S_POS_HMM_2, 
         S_posibility_0, S_posibility_1, RW_HMM_matrix, change_enable, choose_output, 
         reset_Transition_control, reset_Emission_control,
         RW_Pre_addr_encode, RW_Pre_Posibility,
         RW_Max_posibility, RW_Stack_POS, reset_Stack_POS;
         
  assign increment_enable_Words_control = ~Q[3] & ~Q[2] & Q[1] & Q[0];
  assign increment_enable_Transition_control = ~Q[3] & Q[2] & ~Q[1] & ~Q[0];
  assign increment_enable_Emission_control = ~Q[3] & ~Q[2] & ~Q[1] & Q[0];
  assign S_key_0 = (~Q[3] & Q[2] & Q[1]) | ~(~Q[3] | Q[2] | Q[1] | Q[0]);
  assign S_key_1 = (~Q[3] & ~Q[1]) & (Q[0] | Q[2]) | (~Q[3] & ~Q[2] & Q[1] & ~Q[0]); 
  assign S_POS_HMM_0 = (~Q[3] & Q[2] & ~Q[1]) | (~Q[3] & ~Q[1] & Q[0]);
  assign S_POS_HMM_1 =  ~(~Q[3] | Q[2] | Q[1] | Q[0]);
  assign S_POS_HMM_2 =  ~Q[3] & Q[2] & Q[1] & Q[0] ;
  assign S_posibility_0 = ~Q[3] & Q[2] & ~Q[1] ;
  assign S_posibility_1 = ~Q[3] & ~Q[2] & ~Q[1] & Q[0];
  assign RW_HMM_matrix = S_POS_HMM_0;
  assign change_enable = ~Q[3] & Q[2] & ~Q[1] & Q[0];
  assign choose_output =  ~Q[3] & Q[1] & ~Q[0];
  assign RW_Pre_addr_encode =  (~Q[3] & Q[2] & Q[1] & Q[0]) | ~(~Q[3] | Q[2] | Q[1] | Q[0]);
  assign RW_Pre_Posibility  =  ~(Q[3] | Q[2] | ~Q[1] | Q[0]);
  assign RW_Max_posibility = ~Q[3]  & Q[2] & Q[1] & ~Q[0];
  assign RW_Stack_POS = ~(~Q[3] | Q[2] | Q[1] | Q[0]) | (~Q[3] & Q[2] & Q[1] & Q[0]);
  assign reset_Stack_POS = (~Q[3] & Q[2] & Q[1] & Q[0]) | (Q[3] & ~Q[2] & ~Q[1]);
  assign reset_Transition_control = (Q == 0 || Q == 3) ? 0:1;
  assign reset_Emission_control = reset_Transition_control;
endmodule
