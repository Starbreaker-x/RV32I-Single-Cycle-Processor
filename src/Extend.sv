module Extend( input logic [31:0] Instr, input logic [2:0] ImmSrc, output logic [31:0] ImmExt);

/*  ImmSrc: 000 , Type I , 12 bit signed immediate
    
    ImmSrc: 010 , Type S , 12 bit signed immediate

    ImmSrc: 010 , Type B , 13 bit signed immediate
    
    ImmSrc: 011 , Type J , 21 bit signed immediate

    ImmSrc: 100 , Type U , 20 bit signed immediate
                                                     */


     always_comb begin


        case(ImmSrc) 

        3'b000:  ImmExt = {{20{Instr[31]}},Instr[31:20]}; // I Type
        3'b001:  ImmExt = {{20{Instr[31]}},Instr[31:25],Instr[11:7]}; // S Type
        3'b010:  ImmExt = {{20{Instr[31]}},Instr[7],Instr[30:25],Instr[11:8],1'b0};//B Type
        3'b011:  ImmExt = { {12{Instr[31]}} , Instr[19:12] , Instr[20] , Instr[30:21] , 1'b0]};//J Type
        3'b100:  ImmExt = { Instr[31:12] , 11'b0 };//U Type
        default:ImmExt = 32'bx;// undefined output

        
        endcase


     end

endmodule