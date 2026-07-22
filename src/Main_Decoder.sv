/* Only doing the basic instructions found in the table in the text book, I plan on introducing I type Immediate
and other types of instructions after everything else is implemented  */


    module Main_Decoder(input logic [6:0] Op,
    output logic RegWrite, ALUSrc, MemWrite, ResultSrc, Branch
    output logic [1:0] ImmSrc, ALUOp);



    case(Op)

     0000011: begin // lw

        RegWrite = 1'b1;

        ImmSrc = 2'b00; 

        ALUSrc = 1'b1; 

        MemWrite = 1'b0;

        ResultSrc = 1'b1;

        Branch = 1'b0;

        ALUOp = 2'b00; 

     end

     0100011: begin // sw
        RegWrite = 1'b0; 

        ImmSrc = 2'b01; 

        ALUSrc = 1'b1; 

        MemWrite = 1'b1; 

        ResultSrc = 1'bx; 

        Branch = 1'b0; 

        ALUOp = 2'b00; 


     end
     0110011: begin  //R-type
         
        RegWrite = 1'b1; 

        ImmSrc = 2'bxx; 

        ALUSrc = 1'b0; 

        MemWrite = 1'b0; 

        ResultSrc = 1'b0; 

        Branch = 1'b0; 

        ALUOp = 1'b10; 

     end

     1100011: begin //beq
          
        RegWrite = 1'b0; 

        ImmSrc = 2'b10; 

        ALUSrc = 1'b0; 

        MemWrite = 1'b0; 

        ResultSrc = 1'bx; 

        Branch = 1'b1; 

        ALUOp = 2'b01; 

     end 
     default: begin

        RegWrite = 1'bx; 

        ImmSrc = 2'bxx; 

        ALUSrc = 1'bx; 

        MemWrite = 1'bx; 

        ResultSrc = 1'bx; 

        Branch = 1'bx; 

        ALUOp = 2'bxx; 


     end


   endcase


endmodule