module FA(A, B, Cin, G, P, S);
input A, B, Cin;
output S, P, G;

assign S = A ^ B ^ Cin;
assign P = A | B;
assign G = A & B;

endmodule

