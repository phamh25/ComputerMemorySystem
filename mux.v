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


module mux(
    // inputs
    input [7:0] address,
    input [7:0] rom_data_out,
    input [7:0] ram_data_out,
    input [7:0] port_in_00,
    input [7:0] port_in_01,
    
    // outputs
    output reg [7:0] data_out
    );
    
    // use the address to assign the data_out
    always @(*) begin
        if (address >= 0 && address <= 127) begin
            data_out <= rom_data_out;
        end else if (address >= 128 && address <= 223) begin
            data_out <= ram_data_out;
        end else if (address == 8'hF0) begin 
            data_out <= port_in_00;
        end else if (address == 8'hF1) begin
            data_out <= port_in_01;
        end
    end
endmodule
