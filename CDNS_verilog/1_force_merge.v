#此題最後是希望將相同if條件者，不管PPA(power)直接將FF用相同CG給merge起來。
  #範例如下 (簡易版)
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



#範例如下 (詳細版)
module cg_insert (
  input clk, 
  input rst_b,
  input in1, 
  input in2,
  input [15:0] data_final,
  output reg [15:0] out
);
always@(posedge clk or negedge rst_b) begin
  if (~rst_b) begin
    out[15:0] <= {16{1'b0}};
  end
  else begin
    if (in1 || (in1==0 && in2==0)) begin
      out[0] <= (in1)?   {data_final[0]}  : {{out[3]}};
      out[1] <= (in1)?   {data_final[1]}  : {{out[3]}};
      out[2] <= (in1)?   {data_final[2]}  : {{out[3]}};
      out[3] <= (in1)?   {data_final[3]}  : {{out[3]}};
      out[4] <= (in1)?   {data_final[4]}  : {{out[7]}};
      out[5] <= (in1)?   {data_final[5]}  : {{out[7]}};
      out[6] <= (in1)?   {data_final[6]}  : {{out[7]}};
      out[7] <= (in1)?   {data_final[7]}  : {{out[7]}};
      out[8] <= (in1)?   {data_final[8]}  : {{out[11]}};
      out[9] <= (in1)?   {data_final[9]}  : {{out[11]}};
      out[10] <= (in1)? {data_final[10]}  : {{out[11]}};
      out[11] <= (in1)? {data_final[11]}  : {{out[11]}};
      out[12] <= (in1)? {data_final[12]}  : {{out[15]}};
      out[13] <= (in1)? {data_final[13]}  : {{out[15]}};
      out[14] <= (in1)? {data_final[14]}  : {{out[15]}};
      out[15] <= (in1)? {data_final[15]}  : {{out[15]}};
    end 
   end
end
endmodule
