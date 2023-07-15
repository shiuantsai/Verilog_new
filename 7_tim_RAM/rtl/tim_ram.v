module tim( input clk,
    input E, // Enable port 
    input WE, // Write enable port
    input [3:0] Addr, // Address port 
    input [7:0] DI, // Data input port
    output reg [7:0] DO // Data output port
);

reg [7:0] data_mem [255:0];
// fpga4student.com: FPGA project, Verilog project, VHDL project
always @(posedge clk) 
begin
 if(E==1 && WE ==1) 
  data_mem[Addr] <= DI; 
end 

always @(posedge clk) 
begin
 if(E==1) 
  DO <= data_mem[Addr] ;
end 
endmodule