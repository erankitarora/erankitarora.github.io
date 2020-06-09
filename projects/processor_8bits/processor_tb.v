`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: Self
// Engineer: Ankit Arora
//
// Create Date:   00:01:33 09/27/2013
// Design Name:   processor
// Module Name:   C:/Xilinx/projects/processor/processor_tb.v
// Project Name:  processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module processor_tb();

	// Inputs
	reg [2:0] control_mem;
	reg enable;
	reg clk;
	reg reset_b;
	reg [7:0] data_in;
	reg [2:0] control_out;

	// Outputs
	wire [7:0] data_out;
	wire memory_assign;
	wire [2:0] error;

	// Instantiate the Unit Under Test (UUT)
	processor process_1 (
		.control_mem(control_mem), 
		.enable(enable), 
		.clk(clk), 
		.reset_b(reset_b), 
		.data_in(data_in), 
		.data_out(data_out), 
		.memory_assign(memory_assign), 
		.error(error), 
		.control_out(control_out)
	);
	
	always begin
	#5 clk = ~clk;
	end
	
	initial begin
		// Wait 40 ns for global reset to finish
		clk = 1;
		reset_b = 1;
		#40;
		reset_b = 0;
		#40;
		reset_b = 1;
		enable = 0;
	
		// Initialize Inputs
		data_in = 8'h01;
		control_mem = 3'b000;
		#15;
		control_mem = 3'b001;
		data_in = 8'h02;
		#20;
		control_mem = 3'b010;
		data_in = 8'h03;
		#20;
		control_mem = 3'b011;
		data_in = 8'h04;
		#10;
		data_in = 8'h05;
		#10;
		control_mem = 3'b100;
		data_in = 8'h04;
		#10;
		data_in = 8'h08;
		#10;
		data_in = 8'h0c;
		#10;
		data_in = 8'h0d;
		#10;
		control_mem = 3'b101;
		
		//connect data_out to a.
		#20;
		control_out = 3'b000;
		
		//enable the processor.
		#20;
		enable = 1;	
		
	end
      
endmodule

