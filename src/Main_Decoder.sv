
    module Main_Decoder(input logic [6:0] Op,
    output logic RegWrite, ALUSrc, MemWrite, output logic [2:0] ResultSrc, output logic Branch,
    output logic [2:0] ImmSrc, ALUOp);


always_comb begin
    case(Op)

     7'b0000011: begin // lw , lb , lh , lbu , lhu

        RegWrite = 1'b1;

        ImmSrc = 3'b000; 

        ALUSrc = 1'b1; 

        MemWrite = 1'b0;

        ResultSrc = 3'b001;

        Branch = 1'b0;

        ALUOp = 2'b00; 

     end

     7'b00010011: begin //  addi , slli , slti , sltiu , xori , srli , srai , ori , andi

        RegWrite = 1'b1;

        ImmSrc = 3'b000; 

        ALUSrc = 1'b1; 

        MemWrite = 1'b0;

        ResultSrc = 3'b000;

        Branch = 1'b0;

        ALUOp = 2'b10; 


     end

    7'b1100111: begin // jalr

     

    end


    7'b1101111: begin //jal



    end


    7'b0110111: begin //lui
 
        RegWrite = 1'b1;

        ImmSrc = 3'b100; 

        ALUSrc = 1'b1; 

        MemWrite = 1'b0;

        ResultSrc = 3'b011;

        Branch = 1'b0;

        ALUOp = 2'bxx; 

    end

    
    7'b0010111: begin //auipc

       RegWrite = 1'b1;

        ImmSrc = 3'b100; 

        ALUSrc = 1'b1; 

        MemWrite = 1'b0;

        ResultSrc = 3'b100;

        Branch = 1'b0;

        ALUOp = 2'bxx; 

    end




     7'b0100011: begin // sw , sb , sh
        RegWrite = 1'b0; 

        ImmSrc = 3'b001; 

        ALUSrc = 1'b1; 

        MemWrite = 1'b1; 

        ResultSrc = 3'bxxx; 

        Branch = 1'b0; 

        ALUOp = 2'b00; 


     end
     7'b0110011: begin  //R-type
         
        RegWrite = 1'b1; 

        ImmSrc = 3'bxxx; 

        ALUSrc = 1'b0; 

        MemWrite = 1'b0; 

        ResultSrc = 3'b000; 

        Branch = 1'b0; 

        ALUOp = 2'b10; 

     end

     7'b1100011: begin //beq, bne , blt , bge , bltu , bgeu
          
        RegWrite = 1'b0; 

        ImmSrc = 3'b010; 

        ALUSrc = 1'b0; 

        MemWrite = 1'b0; 

        ResultSrc = 3'bxxx; 

        Branch = 1'b1; 

        ALUOp = 2'b01; 

     end 
     default: begin

        RegWrite = 1'bx; 

        ImmSrc = 3'bxxx; 

        ALUSrc = 1'bx; 

        MemWrite = 1'bx; 

        ResultSrc = 3'bxxx; 

        Branch = 1'bx; 

        ALUOp = 2'bxx; 


     end


   endcase
   end


endmodule