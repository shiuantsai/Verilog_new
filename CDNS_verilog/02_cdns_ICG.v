#此題是implement GS ICG RTL coding style. 其實概念就是寫出具有相同enable條件的FF，接著tool自己去insert ICG
#範例如下
module cdns_icg (
  input clk,
  input rst,
  input data [15:0],
  input a,
  input b,
  output out [15:0]
);
always @(posedge clk or negedge rst) begin
  if (!rst) begin
    out <= 15'd0;
  end 
  else if (a==b) 
    out <= data;
  else begin
    out <= out;
  end
end

#網路上常見ICG寫法
# always是low level-sensitive latch. 只有在低電平時才會抓enable value
# and是當clk and latch_q都高電平時才tribber gated_clk
module internet_icg (
  input clk,
  input enable,
  ouput gated_clk
);
reg latch_q;
always @(clk or enable) begin
  #latch
  if(!clk) begin
      latch_q = enable;
  end 
  assign gated_clk = latch_q & clk;
end
