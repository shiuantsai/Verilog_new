//`timescale 1ns/10ps
//CLA4_tb.cla4
module CLA4_tb;
  reg  [4:0] A,B;
  reg  Cin;
  wire [4:0] S;
  wire Cout;
  CLA4 cla4 (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

  initial begin
    A = 4'b0000;
    B = 4'b0000;
    Cin = 1'b0;
    #100
    A = 4'b1011;
    B = 4'b0111;
    #2000
    A = 4'b0001;
    B = 4'b1110;
    #5000
    $finish;
  end 
endmodule
