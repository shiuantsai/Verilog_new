#此題最後是希望將相同if條件者，不管PPA(power)直接將FF用相同CG給merge起來。
#範例如下
module force_merge (
  input clk,
  input rst,
  input valid,
  input last,
  output out[7:0],
);

always@(posedge clk or negedge rst) begin
  if (~rst) begin
    out[8:0] < 8'd0
  end
  else begin
     if (valid)
       out[3] <= in[3]
       out[0] <= in[0]
     else begin
        if( last)
          out [3] <= out[3]
          out [0] <= out[0]
        else
          out [3] <= out [3]
          out [0] <= out [3]
  end
end
endmodule

#轉成psuedo code可發現，out[3]跟out[0]若不用相同的CG所gating所得到的power比較好
#原因是out[3]在valid=0時DFF's clk都不需要trigger.
#out[3] chanaged condition -> valid==1
#out[0] chanaged condition -> valid==1 || (valid==0 && last ==0)

#那我們是不是可以改成相同if條件，不管PPA(power)直接將FF用相同CG給merge起來。
#RD最後給了hidden attribute: lp_clock_gating_force_sena (setting before syn_gen)
#解法如下
if (valid==1 || (valid==0 && last==0)) begin
  out [3] <= valid? in[3] : out[3]
  out [0] <= valid? in[0] : out[3]
end
else begin
  out[3] <= out[3]
  out[0] <= out[0]
end
