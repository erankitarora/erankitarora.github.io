`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Self
// Engineer: Ankit Arora
// 
// Create Date:    19:40:25 09/25/2013 
// Design Name: 
// Module Name:    processor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module processor(control_mem, enable, clk, reset_b, data_in, data_out, memory_assign , error , control_out);

input control_mem;
input control_out;
input clk;
input reset_b;
input data_in;
input enable;
output data_out;
output memory_assign;
output error;

// In - Out signals
wire [2:0] control_mem; //assign data to the memory elements externally.(give value 3'b101 to 3'b111 for not assigning anything)
wire [2:0] control_out;
wire clk;
wire reset_b;
wire enable; //to enable the processor
wire [7:0] data_in;
reg [7:0] data_out;
reg memory_assign;
reg [2:0] error; //counting errors, though not expected.

//internal components
reg [7:0] control; //8-bit instruction register.
reg [7:0] program_mem [7:0]; //8-byte ROM (instruction memory).
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] memory [1:0]; //2 byte data memory (RAM).
reg [2:0] count; //program counter.
reg [2:0] count_assign; //counter to assign data to the ROM.
reg count_mem; //counter to assign data to the RAM.

//various 2-bit registers to decode the control word (Control Unit).
reg [1:0] opcode;
reg [1:0] operand_1;
reg [1:0] operand_2;
reg mem_0;
reg mem_1;

always @(posedge clk)
	begin
	//resetting of the processor.
	if (reset_b == 0)
		begin
		count <= 3'b000;
		count_assign <= 3'b000;
		count_mem <= 1'b0;
		memory_assign<=0;
		error <= 3'b000;
		end
		
	else
	begin
	//assigning data to the RAM and the internal registers.
		case (control_mem)
			3'b000:
				begin
					a<=data_in;
					memory_assign<=1;
				end
			3'b001:
				begin
					b<=data_in;
					memory_assign<=1;
				end
			3'b010:
				begin
					c<=data_in;
					memory_assign<=1;
				end
			3'b011:
				begin
					memory[count_mem]<=data_in;
					if (count_mem < 1'b1)
						begin
						count_mem <= count_mem + 1'b1;
						end
					memory_assign<=1;
				end
			3'b100:
				begin
					program_mem[count_assign]<=data_in;
					if (count_assign < 3'b111)
						begin
						count_assign <= count_assign + 3'b001;
						end
					memory_assign<=1;
				end
			default:memory_assign<=0;  //No memory is being assigned.
		endcase
		
	//receiving data on the data_out port 
		case (control_out)
			3'b000:
				begin
					data_out<=a;
				end
			3'b001:
				begin
					data_out<=b;
				end
			3'b010:
				begin
					data_out<=c;
				end
			default:data_out<=8'h00;
		endcase
	
//block to assign data to the instruction register and execute the instructions.
		if (enable == 1)
			begin
				control <= program_mem[count];
				if (count < count_assign)
					begin
					count <= count + 3'b001;
					end
			end

//decoding of control word in the instruction register (1st part of control unit).
		opcode <= control[7:6];
		operand_1 <= control[5:4];
      operand_2 <= control[3:2];
		mem_0 <= control[1];
		mem_1 <= control[0];
	
//2nd part of control unit
	if (enable == 1)
		begin
		case (opcode)
			2'b00:   //add reg/mem,reg/mem
				begin
					case (operand_1)
						2'b00:
							begin
								case (operand_2)
									2'b00:
										begin
											a <= a + a;
										end
									2'b01:
										begin
											a <= a + b;
										end
									2'b10:
										begin
											a <= a + c;
										end
									2'b11:
										begin
											case (mem_1)
												1'b0: //memory R0.
													begin
														a <= a + memory[0];
													end
												1'b1: //memory R1.
													begin
														a <= a + memory[1];
													end
											endcase	//end of case for memory.
										end
								endcase	//end of case for operand_2.
							end
						2'b01:
							begin
								case (operand_2)
									2'b00:
										begin
											a <= b + a;
										end
									2'b01:
										begin
											a <= b + b;
										end
									2'b10:
										begin
											a <= b + c;
										end
									2'b11:
										begin
											case (mem_1)
												1'b0:
													begin
														a <= b + memory[0];
													end
												1'b1:
													begin
														a <= b + memory[1];
													end
											endcase	//end of case for memory.
										end
								endcase //end of case for operand_2.
							end
						2'b10:
							begin
								case (operand_2)
									2'b00:
										begin
											a <= c + a;
										end
									2'b01:
										begin
											a <= c + b;
										end
									2'b10:
										begin
											a <= c + c;
										end
									2'b11:
										begin
											case (mem_1)
												1'b0:
													begin
														a <= c + memory[0];
													end
												1'b1:
													begin
														a <= c + memory[1];
													end
											endcase	//end of case for memory.
										end
								endcase //end of case for operand_2.
							end
						2'b11:
							begin
								case (operand_2)
									2'b00:
										begin
											case (mem_0)
												1'b0:
													begin
														a <= memory[0] + a;
													end
												1'b1:
													begin
														a <= memory[1] + a;
													end
											endcase	//end of case for memory.
										end
									2'b01:
										begin
											case (mem_0)
												1'b0:
													begin
														a <= memory[0] + b;
													end
												1'b1:
													begin
														a <= memory[1] + b;
													end
											endcase	//end of case for memory.
										end
									2'b10:
										begin
											case (mem_0)
												1'b0:
													begin
														a <= memory[0] + c;
													end
												1'b1:
													begin
														a <= memory[1] + c;
													end
											endcase	//end of case for memory.
										end
									2'b11:
										begin
											case (mem_0)
												1'b0:
													begin
														case (mem_1)
															1'b0:
																begin
																	a <= memory[0] + memory[0];
																end
															1'b1:
																begin
																	a <= memory[0] + memory[1];
																end
														endcase	//end of case for memory (as operand 2).
													end
												1'b1:
													begin
														case (mem_1)
															1'b0:
																begin
																	a <= memory[0] + memory[1];
																end
															1'b1:
																begin
																	a <= memory[1] + memory[1];
																end
														endcase	//end of case for memory (as operand 2).
													end
											endcase	//end of case for memory as operand 1.
										end
								endcase //end of case for operand_2.
							end
					endcase	//end of case for operand_1.					
				end  //end of add.
			2'b01:   //mov reg,reg
				begin
					case (operand_1)
						2'b00:
							begin
								case (operand_2)
									2'b00:
										begin
											a <= a;
										end
									2'b01:
										begin
											a <= b;
										end
									2'b10:
										begin
											a <= c;
										end
									2'b11:
										begin
											error <= error + 3'b001; //error as opcode does'nt involve memory.
										end
								endcase //end of case for operand_2.
							end
						2'b01:
							begin
								case (operand_2)
									2'b00:
										begin
											b <= a;
										end
									2'b01:
										begin
											b <= b;
										end
									2'b10:
										begin
											b <= c;
										end
									2'b11:
										begin
											error <= error + 3'b001; //error as opcode does'nt involve memory.
										end
								endcase //end of case for operand_2.
							end
						2'b10:
							begin
								case (operand_2)
									2'b00:
										begin
											c <= a;
										end
									2'b01:
										begin
											c <= b;
										end
									2'b10:
										begin
											c <= c;
										end
									2'b11:
										begin
											error <= error + 3'b001; //error as opcode does'nt involve memory.
										end
								endcase //end of case for operand_2.
							end
						2'b11:
							begin
								error <= error + 3'b001;//error counter increased by 1, when opcode is 01 and any of the operand is memory.
								if (operand_2 == 2'b11)
									begin
										error <= error + 3'b001;//error counter increased by 1, when opcode is 01 and any of the operand is memory.
									end
							end
					endcase //end of case for operand_1.
				end //end of mov reg,reg
			2'b10:   //mov reg,mem
				begin
					case (operand_1)
						2'b00:
							begin
								case (operand_2)
									2'b00:
										begin
											error <= error + 3'b001;  //operand_2 cannot be a reg.
										end
									2'b01:
										begin
											error <= error + 3'b001;  //operand_2 cannot be a reg.
										end
									2'b10:
										begin
											error <= error + 3'b001;  //operand_2 cannot be a reg.
										end
									2'b11:
										begin
											case (mem_1)
												1'b0:
													begin
														a <= memory[0];
													end
												1'b1:
													begin
														a <= memory[1];
													end
											endcase	//end of case for memory_1 (as operand_2).
										end
								endcase //end of case for operand_2.
							end
						2'b01:
							begin
								case (operand_2)
									2'b00:
										begin
											error <= error + 3'b001;  //operand_2 cannot be a reg.
										end
									2'b01:
										begin
											error <= error + 3'b001;  //operand_2 cannot be a reg.
										end
									2'b10:
										begin
											error <= error + 3'b001;  //operand_2 cannot be a reg.
										end
									2'b11:
										begin
											case (mem_1)
												1'b0:
													begin
														b <= memory[0];
													end
												1'b1:
													begin
														b <= memory[1];
													end
											endcase	//end of case for memory_1 (as operand_2).
										end
								endcase //end of case for operand_2.
							end
						2'b10:
							begin
								case (operand_2)
									2'b00:
										begin
											error <= error + 3'b001;  //operand_2 cannot be a reg.
										end
									2'b01:
										begin
											error <= error + 3'b001;  //operand_2 cannot be a reg.
										end
									2'b10:
										begin
											error <= error + 3'b001;  //operand_2 cannot be a reg.
										end
									2'b11:
										begin
											case (mem_1)
												1'b0:
													begin
														c <= memory[0];
													end
												1'b1:
													begin
														c <= memory[1];
													end
											endcase	//end of case for memory_1 (as operand_2).
										end
								endcase //end of case for operand_2.
							end
						2'b11:
							begin
								case (operand_2)
									2'b00:
										begin
											error <= error + 3'b001;  //operand_1 cannot be a mem.
										end
									2'b01:
										begin
											error <= error + 3'b001;  //operand_1 cannot be a mem.
										end
									2'b10:
										begin
											error <= error + 3'b001;  //operand_1 cannot be a mem.
										end
									2'b11:
										begin
											error <= error + 3'b001;  //operand_1 cannot be a mem.
										end
								endcase //end of case for operand_2.
							end
					endcase //end of case for operand_1.
				end //end of mov reg,mem.
			2'b11:   //mov mem,reg
				begin
					case (operand_1)
						2'b00:
							begin
								error <= error + 3'b001;  //operand_1 cannot be a reg.
							end
						2'b01:
							begin
								error <= error + 3'b001;  //operand_1 cannot be a reg.
							end
						2'b10:
							begin
								error <= error + 3'b001;  //operand_1 cannot be a reg.
							end
						2'b11:
							begin
								case (operand_2)
									2'b00:
										begin
											case (mem_0)
												1'b0:
													begin
														memory[0] <= a;
													end
												1'b1:
													begin
														memory[1] <= a;
													end
											endcase	//end of case for memory_0 (as operand_1).
										end
									2'b01:
										begin
											case (mem_0)
												1'b0:
													begin
														memory[0] <= b;
													end
												1'b1:
													begin
														memory[1] <= b;
													end
											endcase	//end of case for memory_0 (as operand_1).
										end
									2'b10:
										begin
											case (mem_0)
												1'b0:
													begin
														memory[0] <= c;
													end
												1'b1:
													begin
														memory[1] <= c;
													end
											endcase	//end of case for memory_0 (as operand_1).
										end
									2'b11:
										begin
											error <= error + 3'b001;  //operand_2 cannot be a mem.
										end
								endcase //end of case for operand_2.
							end
					endcase //end of case for operand_1 select.
				end //end of mov mem,reg.
		endcase	//end of case for opcode select.
		end // end of if block for checking enable.
	end//end of else block.
	end //end of always block.
endmodule
