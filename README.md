Single-Cycle RISC-V Processor simulator with instructions ADD, ADDI, SUB, LW, SW, SLT, and JAL implemented.
For simulating instructions, use https://luplab.gitlab.io/rvcodecjs/ to decode instructions and write into testbench
Used iverilog and GTKwave to simulate testbench

To run: 
1. iverilog -g2012 -I include -s Core_tb -o core_tb ./include/core_pkg.sv ./testbench/core_tb.sv Core.sv Fetch.sv Decode.sv ALU.sv DRAM.sv DFlipFlop.sv Register_File.sv LSU.sv
2. vvp core_tb
3. gtkwave
4. In GTKWave, open new tab and select Core_Simulation.vcd to view simulation
   
