/* Getting statrted on the ALU*/

module ALU(input logic [31:0] A , B, input logic  [3:0] ALU_Control ,
   output logic [31:0] Result, output logic Zero );


   always_comb begin
    

    case(ALU_Control)

    /*ADD*/  4'b0000: Result = A + B;
    /*SUB*/  4'b0001: Result = A - B;

    /*AND*/  4'b0010: Result = A & B;
    /*OR*/   4'b0011: Result = A | B;
    /*XOR*/  4'b0100: Result = A ^ B;

    /*SLT*/  4'b0101: Result = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0;
    /*SLTU*/ 4'b0110: Result = (A < B) ? 32'd1 : 32'd0;

    /*SLL*/  4'b0111: Result = A << B[4:0];
    /*SRL*/  4'b1000: Result = A >> B[4:0];
    /*SRA*/  4'b1001: Result = $signed(A) >>> B[4:0];
    
    
     endcase
     Zero = (Result == 32'd0);
 
     end
endmodule  