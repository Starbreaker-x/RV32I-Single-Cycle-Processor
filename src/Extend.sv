module Extend( input logic [31:0] Instr, input logic [1:0] ImmSrc, output logic [31:0] ImmExt);

/*  ImmSrc: 00 , Type I , 12 bit signed immediate
    
    ImmSrc: 01 , Type S , 12 bit signed immediate

    ImmSrc: 10 , Type B , 13 bit signed immediate */


     always_comb begin


        case(ImmSrc) 

        2'b00: assign ImmExt = {{20{Instr[31]}},Instr[31:20]}; // I Type
        2'b01: assign ImmExt = {{20{Instr[31]}},Instr[31:25],Instr[11:7]}; // S Type
        2'b10: assign ImmExt = {{20{Instr[31]}},Instr[7],Instr[30:25],Instr[11:8],1'b0};

        
        endcase


     end








endmodule