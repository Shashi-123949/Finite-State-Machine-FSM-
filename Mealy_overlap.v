//1011-mealy overlapping
module fsm(clk,rst,din,valid,seq_det);

parameter A=4'b0001; 
parameter B=4'b0010; 
parameter C=4'b0100; 
parameter D=4'b1000;

input clk,rst,din,valid;
output reg seq_det;

reg [3:0]state,next_state;

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
				    if(din)begin
					  next_state=B;
					  seq_det=0;
					end
					   else begin
					      next_state=A;
						  seq_det=0;
					   end
				 end 
		      B:begin
			     if(din)begin
				    next_state=B;
					seq_det=0;
				 end
				     else begin
					  next_state=C;
					  seq_det=0;
					 end 
			  end
			 C:begin
			    if(din)begin
				   next_state=D;
				   seq_det=0;
				end
				    else begin
					  next_state=A;
					  seq_det=0;
					end
			 end
			 D:begin
			     if(din)begin
				    next_state=B;
					seq_det=1;
				 end
				    else begin
					   next_state=C;
					   seq_det=0;
					end
			 end
			   endcase
		   end
	   end 
end

always@(next_state)state=next_state;
endmodule

