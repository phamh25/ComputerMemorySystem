`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2024 06:23:37 AM
// Design Name: 
// Module Name: rom_128x8
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


module rom_128x8(
    // inputs
    input clk,
    input [7:0] address,
    
    // outputs
    output reg [7:0] rom_data_out
    );
    
    reg [7:0] rom [0:127]; // array for ROM
    reg en; 
    
    // store the program starting at address 0
    initial begin
        rom[0] = 8'h86;     
        rom[1] = 8'hAA;       
        rom[2] = 8'h96;       
        rom[3] = 8'hE0;       
        rom[4] = 8'h20;    
        rom[5] = 8'h00;       
    end

    // checks address
    always @(*) begin
        if ((address >= 0) && (address <= 127)) begin
            en = 1'b1; 
        end else begin
            en = 1'b0; 
        end
    end

    // for enable, read
    always @(posedge clk) begin
        if (en) begin
            rom_data_out <= rom[address]; 
        end
    end
endmodule
