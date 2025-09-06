`include "moore_nonoverlap.v"

module tb;

reg clk,rst,din,valid;
wire seq_det;
integer seed,count;

moore_overlap dut(.*);

always #5 clk=~clk;
initial begin
  clk=0;
  count=0;
  rst=1;
  rst_logic();
  repeat (2)@(posedge clk);
  rst=0;
  valid=1;
  seed=25631;
  #4;
  repeat(200)begin
  din=$random(seed);
  #5;
  end
  #1;
  rst_logic();
  #6;
  $display("seq_det=%0d",count);
  $finish;
  
end

task rst_logic();
begin
  valid=0;
  din=0;
end
endtask
always@(posedge seq_det)count=count+1;
endmodule

