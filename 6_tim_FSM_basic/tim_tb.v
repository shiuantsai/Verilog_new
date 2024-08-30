//`timescale 1ns/10ps
module tim_tb;
  reg wi, clk, reset;
  wire zo;
  fsm_basic my_fsm (.wi(wi), .clk(clk), .reset(reset), .zo(zo));

  initial begin
    clk= 1'b0;
    reset = 1'b0;
    wi = 1'b0;
    #20
    reset = 1'b1;
    #100
    wi = 0;
    #130
    wi = 1;
    #150
    wi = 0;
    #180
    $finish;
  end
  //50MHz clk
  always #10 clk = ~clk;
endmodule
