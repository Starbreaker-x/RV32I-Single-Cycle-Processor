/* Only doing the basic instructions found in the table in the text book, I plan on introducing I type Immediate
and other types of instructions after everything else is implemented  */


    module Main_Decoder(input logic [6:0] Op,
    output logic RegWrite, ALUSrc, MemWrite, ResultSrc, Branch,
    output logic [2:0] ImmSrc, ALUOp);


always_comb begin
    case(Op)

     7'b0000011: begin // lw

        RegWrite = 1'b1;

        ImmSrc = 3'b000; 

        ALUSrc = 1'b1; 

        MemWrite = 1'b0;

        ResultSrc = 1'b1;

        Branch = 1'b0;

        ALUOp = 2'b00; 

     end

     7'b0100011: begin // sw
        RegWrite = 1'b0; 

        ImmSrc = 3'b001; 

        ALUSrc = 1'b1; 

        MemWrite = 1'b1; 

        ResultSrc = 1'bx; 

        Branch = 1'b0; 

        ALUOp = 2'b00; 


     end
     7'b0110011: begin  //R-type
         
        RegWrite = 1'b1; 

        ImmSrc = 3'bxxx; 

        ALUSrc = 1'b0; 

        MemWrite = 1'b0; 

        ResultSrc = 1'b0; 

        Branch = 1'b0; 

        ALUOp = 2'b10; 

     end

     7'b1100011: begin //beq
          
        RegWrite = 1'b0; 

        ImmSrc = 3'b010; 

        ALUSrc = 1'b0; 

        MemWrite = 1'b0; 

        ResultSrc = 1'bx; 

        Branch = 1'b1; 

        ALUOp = 2'b01; 

     end 
     default: begin

        RegWrite = 1'bx; 

        ImmSrc = 3'bxxx; 

        ALUSrc = 1'bx; 

        MemWrite = 1'bx; 

        ResultSrc = 1'bx; 

        Branch = 1'bx; 

        ALUOp = 2'bxx; 


     end


   endcase
   end


endmodule