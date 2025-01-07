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


module outputs(
    // inputs
    input clk,
    input we,
    input reset,
    input [7:0] address,
    input [7:0] data_in,
    
    // outputs
    output reg [7:0] port_out_00,
    output reg [7:0] port_out_01
    );
    
    // for port output
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            port_out_00 <= 8'h00;              // reset 00 to 0
            port_out_01 <= 8'h00;              // reset 01 to 0
        end 
        else if (we) begin
            case (address)
                8'hE0: port_out_00 <= data_in; // write to 00
                8'hE1: port_out_01 <= data_in; // write to 01
            endcase
        end
    end
endmodule
