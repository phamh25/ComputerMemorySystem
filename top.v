`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2024 06:25:05 AM
// Design Name: 
// Module Name: mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    // inputs
    input clk,
    input we,
    input reset,
    input [7:0] address,
    input [7:0] data_in,
    input [7:0] port_in_00,
    input [7:0] port_in_01,
    
    // outputs
    output [7:0] data_out,
    output [7:0] port_out_00,
    output [7:0] port_out_01
    );
    
    // wires
    wire [7:0] rom_data_out;
    wire [7:0] ram_data_out;
    
    // nstantiate modules
    rom_128x8 U1(clk, address, rom_data_out);
    ram_96x8 U2(clk, we, address, data_in, ram_data_out);
    mux U3(address, rom_data_out, ram_data_out, port_in_00, port_in_01, data_out);
    outputs U4(clk, we, reset, address, data_in, port_out_00, port_out_01);
endmodule