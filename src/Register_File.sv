module Reg_File(input logic [4:0] A1, A2, A3, 
input logic [31:0] WD3, 
input logic WE3, clk,
output logic [31:0] RD1, RD2);

/*  A1 and A2 are the registers we want to read from
   A3 is the register we want to write from
    WD3 is the data we want to write to A3
        WE3 is write enable and decides if we write to A3 on the posedge of the clk
            RD1 and RD2 are the data found at A1 and A2 respectivley    */



            logic [31:0] Registers [0:31];

            assign RD1 = (A1 == 5'd0) ?  32'd0 : Registers[A1];
            assign RD2 = (A2 == 5'd0) ?  32'd0 : Registers[A2];

            always_ff @ ( posedge clk ) begin

                if((A3 && WE3) != 5'd0)
                  Registers[A3] <= WD3;

            end

            

endmodule