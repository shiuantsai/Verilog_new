// reference site: https://verilogcodes.blogspot.com/2017/11/verilog-code-for-carry-save-adder-with-testbench.html

module CSA
        (   input [3:0] x,y,z,
            output [4:0] s,
            output cout
            );
            
wire [3:0] c1,s1,c2;

fulladder fa_inst10(x[0],y[0],z[0],s1[0],c1[0]);
fulladder fa_inst11(x[1],y[1],z[1],s1[1],c1[1]);
fulladder fa_inst12(x[2],y[2],z[2],s1[2],c1[2]);
fulladder fa_inst13(x[3],y[3],z[3],s1[3],c1[3]); 

//c1需向左移一位，故c1[0]相當於跑去跟s1[1]相加
fulladder fa_inst20(s1[1],c1[0],1'b0,s[1],c2[1]);
fulladder fa_inst21(s1[2],c1[1],c2[1],s[2],c2[2]);
fulladder fa_inst22(s1[3],c1[2],c2[2],s[3],c2[3]);
fulladder fa_inst23(1'b0,c1[3],c2[3],s[4],cout); 

assign s[0] = s1[0];
endmodule
