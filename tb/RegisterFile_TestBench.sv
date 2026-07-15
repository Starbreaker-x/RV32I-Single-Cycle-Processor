//Test Cases
/*   input into the register and make sure you read the correct value (for both registers pointed at by A1 & A2)
     Write input into register and see if the register changes values on the rising clock edge
     Read previous value then write and see if the new value read is correct
     Make sure that writing only occurs on the rising edge of a clock, and when Write Enable is high( so 4 seperate cases fo this)
     Make sure that register x0 reads as 32'd0 and cannot be written to always

        
     */

module RF_tb();

logic [4:0] A1, A2, A3;
logic [31:0] WD3;
logic WE3, clk;
logic [31:0] RD1, RD2;


Reg_File dut(A1, A2, A3, WD3 , WE3 , clk , RD1 , RD2);

endmodule