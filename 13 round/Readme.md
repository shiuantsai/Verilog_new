題目參考文章: 
https://blog.csdn.net/yan1111112/article/details/118498533

要不要進位 要由兩個條件判斷，第一:是否為正數，第二:被截斷數字的情況
若為正數則進位，若為負數則看被截斷的位數 (被截斷之最高位數需為1 且 其他截斷位須包含1)

舉例:
假設有9bit 且為正數，則看要被截掉的數字是MSB[2:0] -> 記為9Q6
assign carry_bit = a[8] ? ( a[2] & ( |a[1:0] ) ) : a[2];
assign a_round = {a[8], a[8:3]} + carry_bit;

