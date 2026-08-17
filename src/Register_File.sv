module Reg_File(input logic [4:0] A1, A2, A3, 
input logic [31:0] WD3, 
input logic WE3, clk,
input logic [6:0] Op,
input logic [2:0] funct3,
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

                if((A3 && WE3) != 5'd0) begin
                
                    if(Op == 7'd3) begin
                     
                        case( funct3 )


                            3'b000: Registers[A3] <= { {24{WD3[7]}} , WD3[7:0] }; // lb

                            3'b001: Registers[A3] <= { {16{WD3[15]}} , WD3[15:0] }; // lh

                            3'b010: Registers[A3] <= WD3; // lw

                            3'b100: Registers[A3] <= { {24{1'b0}} , WD3[7:0] }; // lbu

                            3'b101: Registers[A3] <= { {16{1'b0}} , WD3[15:0] }; // lhu


                        endcase

                    
                    end
                    else
                    Registers[A3] <= WD3;

                end

            end

            

endmodule