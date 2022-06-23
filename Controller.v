module Controller ( clk, reset, start, error, i, j, multiple_source, endline, key, stack_empty, state, 
                    increment_enable_Words_control, increment_enable_Transition_control,
                    increment_enable_Emission_control, RW_Key_reg, decrement_enable,
                    S_key_0, S_key_1, S_POS_HMM_0, S_POS_HMM_1, S_POS_HMM_2, 
                    S_posibility_0, S_posibility_1, RW_HMM_matrix, change_enable, choose_output, 
                    RW_Pre_Posibility, reset_Transition_control, reset_Emission_control,
                    RW_Max_posibility, RW_Stack_POS, reset_Stack_POS); 

    parameter size_Q = 4;
    parameter size_key = 4;
  
  input clk, reset, start, error, multiple_source, endline, stack_empty;
  input [size_Q-1:0] i, j;
  input [size_key-1:0] key;
  output increment_enable_Words_control, increment_enable_Transition_control, increment_enable_Emission_control, 
         S_key_0, S_key_1, S_POS_HMM_0, S_POS_HMM_1, S_POS_HMM_2, RW_Key_reg, decrement_enable,
         S_posibility_0, S_posibility_1, RW_HMM_matrix, change_enable, choose_output, 
         RW_Pre_Posibility, reset_Transition_control, reset_Emission_control,
         RW_Max_posibility, RW_Stack_POS, reset_Stack_POS;
  output [size_Q-1:0] state;
 
reg [size_Q - 1:0] Q ;

  assign state = Q;
  assign increment_enable_Words_control = ~Q[3] & ~Q[2] & Q[1] & Q[0];
  assign increment_enable_Transition_control = ~Q[3] & Q[2] & ~Q[1] & ~Q[0];
  assign increment_enable_Emission_control = ~Q[3] & ~Q[2] & ~Q[1] & Q[0];
  assign S_key_0 = (~Q[3] & Q[2] & Q[1]) | ~(~Q[3] | Q[2] | Q[1] | Q[0]);
  assign S_key_1 = (~Q[3] & ~Q[1]) & (Q[0] | Q[2]) | (~Q[3] & ~Q[2] & Q[1] & ~Q[0]); 
  assign S_POS_HMM_0 = (~Q[3] & Q[2] & ~Q[1]) | (~Q[3] & ~Q[1] & Q[0]);
  assign S_POS_HMM_1 =  ~(~Q[3] | Q[2] | Q[1] | Q[0]);
  assign S_POS_HMM_2 =  ~Q[3] & Q[2] & Q[1] & Q[0] ;
  assign S_posibility_0 = ~Q[3] & Q[2] & ~Q[1] & ~Q[0];
  assign S_posibility_1 = ~Q[3] & ~Q[2] & ~Q[1] & Q[0];
  assign RW_HMM_matrix = (~Q[3] & ~Q[1] & Q[0]) | (~Q[3] & Q[2] & ~Q[1]);
  assign change_enable = ~Q[3] & Q[2] & ~Q[1] & Q[0];
  assign choose_output =  ~Q[3] & Q[1] & ~Q[0];
  assign RW_Pre_Posibility  =  ~(Q[3] | Q[2] | ~Q[1] | Q[0]);
  assign RW_Max_posibility = ~Q[3]  & Q[2] & Q[1] & ~Q[0];
  assign RW_Stack_POS = ~(~Q[3] | Q[2] | Q[1] | Q[0]) | (~Q[3] & Q[2] & Q[1] & Q[0]);
  assign reset_Stack_POS = (~Q[3] & Q[2] & Q[1] & Q[0]) | (Q[3] & ~Q[2] & ~Q[1]);
  assign reset_Transition_control = (Q == 0 || Q == 3) ? 0:1;
  assign reset_Emission_control = reset_Transition_control;
  assign RW_Key_reg = (~Q[3] & ~Q[2] & Q[0]) | (~Q[3] & Q[1] & ~Q[0]) | (~Q[3] & Q[2] & ~Q[1]);
  assign decrement_enable = (Q[3] & ~Q[2] & ~Q[1] & ~Q[0]) | ((~Q[3] & Q[2] & Q[1] & Q[0]));
  
initial begin
    Q <= 0;
end
         
always @(posedge clk or negedge reset) begin
    if(!reset) 
        Q <= 0;
    else begin
        case(Q)
          4'd0: begin
           if (start)
              Q <= 1;
           end
          4'd1: begin
            if (error)
              Q <= 0;
            else begin
            if (i == 10)
              Q <= 2;
            end         
          end 
      
          4'd2: begin
            Q <= 3;
            end
             
          4'd3: begin
            if (error)
              Q <= 0;
            else begin
                Q <= 4;
            end
          end
      
          4'd4: begin
            if (error)
              Q <= 0;
            else begin
              if (!multiple_source && !endline && i != 10 )
                Q <= Q;
              else begin
                if (multiple_source)
                  Q <= 5;
                else 
                  if (endline)
                    Q <= 6;
                  else
                    if (i == 10 && j == 10)
                      Q <= 2;
              end  
            end        
          end 
      
          4'd5: begin
            if (i != 4'd10)
              Q <= 4'd4;
            else
              Q <= 4'd2;
          end
      
          4'd6: begin
            Q <= 4'd7;
          end
      
          4'd7: begin
            Q <= 4'd8;
          end
      
          4'd8: begin
            if (key != 0)
              Q <= Q;
            else
              Q <= 4'd9;
          end
      
          4'd9: begin
            if (!stack_empty)
              Q <= Q;
            else
              Q <= 4'd0;
          end
        endcase
    end
end

endmodule
