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


module ram_96x8(
    // inputs
    input clk,   
    input we,
    input [7:0] address,    
    input [7:0] data_in, 
    
    // output
    output reg [7:0] ram_data_out
    );
    
    reg [7:0] ram [128:223]; // array for RAM
    reg en;
    
    // if address is in range, enable
    always @(address) begin
        if ((address >= 128) && (address <= 223)) begin
            en = 1'b1; 
        end else begin
            en = 1'b0;
        end
    end

    // write or read functionality
    always @(posedge clk) begin
        if (we && en) begin
            ram[address] = data_in;      // write
        end else if (!we && en) begin
            ram_data_out = ram[address]; // read
        end
    end
endmodule