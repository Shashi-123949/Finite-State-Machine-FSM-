`include "Mealy_overlap.v"
module tb;

reg clk,rst,din,valid;
wire seq_det;
integer seed,count;

fsm dut(clk,rst,din,valid,seq_det);

always #5 clk=~clk;
initial begin
  clk=0;
  count=0;
  rst=1;
  rst_logic();
  repeat(2)@(posedge clk);
  rst=0;
  valid=1;
  seed=12345;
  repeat(250)begin
  din=$random(seed);
  #5;
  end
  #6;
  rst_logic();
  #4;
  $display("seq_det=%0d",count);
  #15;
  $finish;
end

task rst_logic();
begin
  din=0;
  valid=0;
end
endtask
always@(posedge seq_det)count=count+1;

endmodule


