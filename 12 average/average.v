module average (
  input clk,
  input rst_n,
  input start,
  input [7:0] data,
  input [9:0] data_num,
  output reg done,
  output reg [7:0] avg 
);

reg [9:0] count;
reg [17:0] sum;
reg calculating;

always@(posedge clk or negedge rst_n) begin
  if (!rst_n) begin 
    calculating <= 1'd1;
    count  <= 10'd0;
    sum    <= 24'd0;
    avg    <= 8'd0;
    done   <= 1'b0;
  end else if (start && !calculating) begin
    calculating <= 1'b1 ;
    count <=  10'd0;
    sum   <=  17'd0 ;
    done  <=  1'b0 ;
  end else if (calculating && count < data_num) begin
    sum <= sum + data;
    count <= count + 1'b1;
  end else if (calculating && count == data_num) begin
    avg  <= sum/count;
    done <= 1'b1;
    calculating <= 1'b0;
  end
  
end

endmodule
