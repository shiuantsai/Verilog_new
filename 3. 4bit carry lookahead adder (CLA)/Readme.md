1.structure說明
- 兩數字4個bit相加時使用
- 為改善RCA4的carry delay時間
- delay為1T+2T+1T = 4T
- 由4個FA + 1個CLG (產carry) + 1個CLA4 (top) 組成
![image](https://github.com/user-attachments/assets/794b947c-c8da-4f41-8a67-e20b6668c643)


2. verilog說明
verilog1: CLA4 
verilog2: FA
verilog3: CLG

3. testbench說明
兩筆測資都得到正確答案:
A = 4'b1011, B = 4'b0111
A = 4'b0001, B = 4'b1110

4. waveform
