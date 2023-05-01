module CLA4(A, B, Cin, S, Cout);
input [3:0] A,B;
input Cin;
output [3:0] S;
output Cout;
wire [3:0] G,P;
//wire [3:0] c;
wire c0, c1, c2;

FA fa0 (.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .P(P[0]), .G(G[0]));
FA fa1 (.A(A[1]), .B(B[1]), .Cin(c0), .S(S[1]), .P(P[1]), .G(G[1]));
FA fa2 (.A(A[2]), .B(B[2]), .Cin(c1), .S(S[2]), .P(P[2]), .G(G[2]));
FA fa3 (.A(A[3]), .B(B[3]), .Cin(c2), .S(S[3]), .P(P[3]), .G(G[3]));

//CLG CLG4 (.Cin(Cin), .P(P), .G(G), .c0(c[0]), .c1(c[1]), .c2(c[2]), .Cout(Cout));
CLG CLG4 (.Cin(Cin), .P(P), .G(G), .c0(c0), .c1(c1), .c2(c2), .Cout(Cout));

endmodule
