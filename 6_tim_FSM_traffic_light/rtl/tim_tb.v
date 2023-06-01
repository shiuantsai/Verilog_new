//`timescale 1ns/10ps
module tim_tb;
  reg clk, reset;
  wire lightA, lightB;
  fsm_traffic_light my_fsm (.clk(clk), .reset(reset), .lightA(lightA), .lightB(lightB));

  initial begin
    clk= 1'b0;
    reset = 1'b0;
    #20
    reset = 1'b1;
    #1000
    $finish;
  end
  //50MHz clk
  always #10 clk = ~clk;
endmodule
