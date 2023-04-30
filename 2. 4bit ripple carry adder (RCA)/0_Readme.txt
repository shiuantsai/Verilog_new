1.structure說明
由4個FA組成

2. verilog說明
verilog1: RCA4，創4個FA串接在一起
verilog2: FA
verilog3: RCA4第二種寫法

3. testbench說明
tim_tb: 給值abCin，其中Cin為0，因為一開始必為0

4. waveform
- 可以看到 A跟B加起來等於S 值都是正確的。
- 也可以看到當A=h'1, B=h'8時，會進位三次。
- 也可以看到當A=h'1, B=h'F時，會有最高位溢位情況，所以Cout=0