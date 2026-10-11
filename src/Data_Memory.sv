module DM(input logic [31:0] A, WD, input logic clk, WE, input logic [6:0] Op, input logic [2:0] funct3, output logic [31:0] RD);

/*  A: The address
    WD: Write Data
    clk: The clock
    WE: Write Enable
    RD: Output
    
    */

logic [7:0] mem [0:1023];
logic [31:0] mem2 [0:255];

always_ff @( posedge clk) begin
     if(WE) begin
        if( Op == 7'd35) begin
           
            case(funct3)

            3'b010: begin //sw

                mem[A] <= WD[7:0];
                mem[A + 1] <= WD[15:8];
                mem[A + 2] <= WD[23:16];
                mem[A + 3] <= WD[31:24];

                //new logic
                mem2 <= WD;

            end

            3'b001: begin //sh
             
                mem[A] <= WD[7:0];
                mem[A + 1] <= WD[15:8];

                //new logic
                mem2 < WD[15:0];

            end

            3'b000: mem[A] <= WD[7:0]; //sb
            //new logic
            mem2 <= WD[7:0];


        endcase

        end
        else begin
        mem[A] <= WD[7:0];
        mem[A + 1] <= WD[15:8];
        mem[A + 2] <= WD[23:16];
        mem[A + 3] <= WD[31:24];

        //new logic 
        mem2 <= WD;

        end

     end
     

end



assign RD = {mem[A+3],mem[A+2],mem[A+1],mem[A]};





endmodule