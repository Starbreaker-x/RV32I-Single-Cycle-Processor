module DM(input logic [31:0] A, WD, input logic clk, WE, input logic [6:0] Op, input logic [2:0] funct3, output logic [31:0] RD);

/*  A: The address
    WD: Write Data
    clk: The clock
    WE: Write Enable
    RD: Output
    
    */

logic [31:0] mem [0:255];

always_ff @( posedge clk) begin
     if(WE) begin
        if( Op == 7'd35) begin
           
            case(funct3)

            3'b010: mem[A] <= WD; // sw

            3'b001: mem[A][15:0] <= WD[15:0]; //sh

            3'b000: mem[A][7:0] <= WD[7:0]; //sb


        endcase

        end
        else 
        mem[A] <= WD;

    

     end
     

end



assign RD = mem[A];





endmodule