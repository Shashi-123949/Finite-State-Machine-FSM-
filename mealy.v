//01101 -->mealy overlap
module fsm(clk,rst,din,valid,seq_det);

parameter A=5'b00001; 
parameter B=5'b00010; 
parameter C=5'b00100; 
parameter D=5'b01000;
parameter E=5'b10000;

input clk,rst,din,valid;
output reg seq_det;

reg [4:0]state,next_state;

always @(posedge clk)begin
    if(rst)begin
      seq_det=0;
	  state=A;
	  next_state=A;
	end
       else begin
	       if(valid)begin
		       case(state)
			     A:begin
					  seq_det=0;
				    if(din)begin
					  next_state=A;
					end
					   else begin
					      next_state=B;
					   end
				 end 
		      B:begin
					seq_det=0;
			     if(din)begin
				    next_state=C;
				 end
				     else begin
					  next_state=B;
					 end 
			  end
			 C:begin
				   seq_det=0;
			    if(din)begin
				   next_state=D;
				end
				    else begin
					  next_state=B;
					end
			 end
			 D:begin
					seq_det=0;
			     if(din)begin
				    next_state=A;
				 end
				    else begin
					   next_state=E;
					end
			 end
			 E:begin
					seq_det=1;
			   if(din)begin
			     next_state=A;
			   end
			      else begin
				   next_state=B;
				  end
			 
			 end
			   endcase
		   end
	   end 
end

always@(next_state)state=next_state;
endmodule



