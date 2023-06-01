module fsm_traffic_light(clk, reset, lightA, lightB);
input clk, reset;
output lightA, lightB;
reg [3:0] c_cnt, n_cnt;
reg [2:0] lightA, lightB;
reg [1:0] cs, ns;

//stage reg
always@(posedge clk, negedge reset)
  if (~reset) begin
    c_cnt <= 4'b1;
    cs    <= 2'b0;
  end

  else begin
    c_cnt <= n_cnt;
    cs    <= ns;
  end

//next state CL
always@(*) 
  case(cs)
  2'b00:
  begin
    n_cnt <= (c_cnt<4'd8)? c_cnt + 4'd1 : 4'd1;
    ns    <= (c_cnt<4'd8)? 2'b00 : 2'b01;
  end
  2'b01:
  begin
    n_cnt <= (c_cnt<4'd3)? c_cnt + 4'd1 : 4'd1;
    ns    <= (c_cnt<4'd3)? 2'b01 : 2'b10;
  end
  2'b10:
  begin
    n_cnt <= (c_cnt<4'd10)? c_cnt + 4'd1 : 4'd1;
    ns    <= (c_cnt<4'd10)? 2'b10 : 2'b11;
  end
  2'b11:
  begin
    n_cnt <= (c_cnt<4'd3)? c_cnt + 4'd1 : 4'd1;
    ns    <= (c_cnt<4'd3)? 2'b11 : 2'b00;
  end
endcase

//output logic
always@(*) 
  case(cs)
  2'b00:
  begin
    lightA =  3'b001;
    lightB =  3'b100;
  end
  2'b01:
  begin
    lightA =  3'b010;
    lightB =  3'b100;
  end
  2'b10:
  begin
    lightA =  3'b100;
    lightB =  3'b001;
  end
  2'b11:
  begin
    lightA =  3'b100;
    lightB =  3'b010;
  end
endcase
endmodule
