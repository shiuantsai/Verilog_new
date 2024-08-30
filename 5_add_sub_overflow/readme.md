此篇會講到關於 4bit的加減法器與overflow

參考資料天璇: https://www.youtube.com/watch?v=IAkhdYtNjb0&list=PLkH9pBMaZuHQ0_P26d8ctZSd9trPajCmI&index=12

overflow時處理方式
若是+overflow -> 直接給result: 4'b0111
若是-overflow -> 直接給result: 4'b1000
else可直接拿sum.

參考資料: https://www.cnblogs.com/oomusou/archive/2009/10/31/verilog_signed_overflow.html
