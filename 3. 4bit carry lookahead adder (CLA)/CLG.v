module CLG(Cin, P, G, c0, c1, c2, Cout);
input Cin;
input [3:0] P,G;
output c0, c1, c2, Cout;

assign c0 = G[0] | (P[0]&Cin);
assign c1 = G[1] | (P[1]&G[0]) | (P[1]&P[0]&Cin);
assign c2 = G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&Cin);
assign Cout = G[3] | (P[3] & G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&Cin);
endmodule

