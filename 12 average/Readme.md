題目: 取平均


![image](https://github.com/user-attachments/assets/c8b3de55-55ea-4f0e-a16a-54986b7a1a67)


想法:
1. 由於start trigger後並不是馬上敲data進來，故需要一根data_valid
2. 應用一個counter不斷+1直到data_num: if counter==data_num -> 表數字都吃進來了 -> data_valid放下
3. 算平均，但這邊沒寫說可以用多久時間來算平均，所以我是下個clock就當作算完則將done拉起來，並將平均out出去
