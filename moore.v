//01101-->moore overlap
module fsm(clk,rst,din,valid,seq_det);

parameter A=6'b000001; 
parameter B=6'b000010; 
parameter C=6'b000100; 
parameter D=6'b001000;
parameter E=6'b010000;
parameter F=6'b100000;

input clk,rst,din,valid;
output reg seq_det;

reg [5:0]state,next_state;

always @(posedge clk or posedge rst)begin
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
					seq_det=0;
			   if(din)begin
			     next_state=F;
			   end
			      else begin
				   next_state=B;
				  end
			 
			 end
			 F:begin
					seq_det=1;
			   if(din)begin
			     next_state=D;
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


