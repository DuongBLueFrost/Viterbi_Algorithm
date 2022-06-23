module NextState (start, error, i, multiple_source, endline, key, stack_empty, Q, QNext);
  
    parameter size_state = 4;
    parameter size_key = 8;
    
  input start, error, multiple_source, endline, stack_empty;
  input [size_state-1:0] Q, i;
  input [size_key-1:0] key;
  output reg [size_state-1:0] QNext;
  
  always @(*) begin
    case(Q)
      4'd0: begin
        if (start)
          QNext <= 4'd1;
        else
          QNext <= Q;
      end
      4'd1: begin 
        QNext <= 4'd2;
      end
      4'd2: begin
        if (error)
          QNext <= 0;
        else begin
          if (i == 4'd10)
           QNext <= 4'd3;
          else 
           QNext <= Q; 
        end         
      end 
      
      4'd3: begin
        QNext <= 4'd4;
      end
             
      4'd4: begin
        if (error)
          QNext <= 0;
        else
          QNext <= 4'd5;
      end
      
      4'd5: begin
        if (error)
          QNext <= 0;
        else begin
          if (!multiple_source && !endline && i != 4'd10)
            QNext <= Q;
          else begin
            if (multiple_source)
              QNext <= 4'd6;
            else if (endline)
              QNext <= 4'd7;
            else if (i == 4'd10)
              QNext <= 4'd3;
          end  
        end        
      end 
      
      4'd6: begin
        if (i != 4'd10)
          QNext <= 4'd5;
        else
          QNext <= 4'd3;
      end
      
      4'd7: begin
        QNext <= 4'd8;
      end
      
      4'd8: begin
        QNext <= 4'd9;
      end
      
      4'd9: begin
        if (key != 8'd0)
          QNext <= Q;
        else
          QNext <= 4'd10;
      end
      
      4'd10: begin
        if (!stack_empty)
          QNext <= Q;
        else
          QNext <= 4'd0;
      end
    endcase
  end
  
endmodule
