//`timescale 1ns/10ps
module tim_tb;
  reg [3:0] A, B;
  reg Cin;
  wire [3:0] S;
  wire Cout;
  integer count;

  RCA4_2 RCA4_inst (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

  initial begin
    A = 4'b0000;
    B = 4'b0000;
    Cin = 1'b0;
    for (count=0; count<=255; count = count+1) begin
      #5 {A,B} = count;
    end
    #1285
    $finish;
  end

endmodule
