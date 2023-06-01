#database -open waves -into waves2.shm -default -incfiles 1 -incsize 4 
#database -open waves -into waves3.shm -default 
database -open waves -into tim.shm -default 
#probe -create -shm tb_dut1.inst_1 -depth all -all  
#tim_db = testbench name, frequency_divider = inst of tim_db
probe -create -shm tim_tb.my_fsm -depth all 
#stop -create -condition {[value %d tb_dut1.inst_1.count] = 13} -name breakpoint1 -execute {database -disable waves} -continue 
#stop -create -condition {[value %d tb_dut1.inst_1.count] = 15} -name breakpoint2 -execute {database -enable waves} -continue 
#stop -create -condition {[value %d tb_dut1.inst_1.count] = 3} -name breakpoint1 -execute {database -disable waves} -continue 
#stop -create -condition {[value %d tb_dut1.inst_1.count] = 5} -name breakpoint2 -execute {database -enable waves} -continue 
run
