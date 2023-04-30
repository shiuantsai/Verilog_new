module FA(A, B, Cin, S, Cout);
input A,B, Cin;
output Cout, S;

assign Cout = (A&B) | (A&Cin) | (B&Cin);
assign S = A ^ B ^ Cin;

endmodule
