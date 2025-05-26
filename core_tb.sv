//***********************************************************
// ECE 3058 Architecture Concurrency and Energy in Computation
//  Engineer:   Antariksh Krishnan
//  Module:     core_tb
//  Functionality: This is the testbed for the Single-Cycle RISCV processor
//
//***********************************************************
`timescale 1ns / 1ns
module Core_tb;
// Clock and Reset signals to simulate as input into core
	logic clk = 1;
	logic mem_enable;
	logic reset;

	// local variables to display for testbench
	logic[6:0] cycle_count;
	
	integer i;
	initial
	begin
		cycle_count = 0;

		// do the simulation
		$dumpfile("Core_Simulation.vcd");

		// dump all the signals into the vcd waveforem file
		$dumpvars(0, Core_tb);

		reset = 1'b1;
		mem_enable = 1'b1;

		// Set the Test instructions and preset MEM and Regfile here if desired
		// Some sample test instructions to get you started 
		#1
    // NOP since the first instruction is skipped 
    core_proc.MainMemory.data_RAM[0] = 8'h00;
    core_proc.MainMemory.data_RAM[1] = 8'h00;
    core_proc.MainMemory.data_RAM[2] = 8'h00;
    core_proc.MainMemory.data_RAM[3] = 8'h00;

    //0x00430313 - addi x6, x6, 4
    core_proc.MainMemory.data_RAM[4] = 8'h00;
    core_proc.MainMemory.data_RAM[5] = 8'h43;
    core_proc.MainMemory.data_RAM[6] = 8'h03;
    core_proc.MainMemory.data_RAM[7] = 8'h13;
		
    //0x006303b3 - add x7, x6, x6
    core_proc.MainMemory.data_RAM[8] = 8'h00;
    core_proc.MainMemory.data_RAM[9] = 8'h63;
    core_proc.MainMemory.data_RAM[10] = 8'h03;
    core_proc.MainMemory.data_RAM[11] = 8'hb3;
		
    // 0xff9ff2ef jal x5, -8
    core_proc.MainMemory.data_RAM[12] = 8'hff;
    core_proc.MainMemory.data_RAM[13] = 8'h9f;
    core_proc.MainMemory.data_RAM[14] = 8'hf2;
    core_proc.MainMemory.data_RAM[15] = 8'hef;
	
		#5 reset = 1'b0;

		#50 $finish;
	end

	always
		#1 clk <= clk + 1;

	always @(posedge clk) begin
		if (~reset)
			cycle_count <= cycle_count + 1;
	end

	Core core_proc(
		// Inputs
		.clock(clk),
		.reset(reset),
		.mem_en(mem_enable)
	);

endmodule
