/* Getting statrted on the ALU*/

module ALU(input logic [31:0] A , B, input logic ALU_Control [3:0],
   output logic [31:0] Result, output logic Zero );


   always_comb begin
    

    case(ALU_Control)

    /*ADD*/  4'b0000: Result = A + B;
    /*SUB*/  4'b0001: Result = A - B;

    /*AND*/  4'b0010: Result = A & B;
    /*OR*/   4'b0011: Result = A | B;
    /*XOR*/  4'b0100: Result = A ^ B;

    /*SLT*/  4'b0101: ($signed(A) < $signed(B));
    /*SLTU*/ 4'b0110: (A < B);

    /*SLL*/  4'b0111: A << B[4:0];
    /*SRL*/  4'b1000: A >> B[4:0];
    /*SRA*/  4'b1001: $signed(A) >>> B[4:0];

    endcase

    Zero = (Result == 32'd0)


   end

endmodule   