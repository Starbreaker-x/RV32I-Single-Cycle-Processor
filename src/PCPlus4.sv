//Adder that calculates the next PC based off of the current PC address plus 4


module PCPlus4(input logic [31:0] PC, output logic [31:0] PCPlus4);

assign PCPlus4 = PC + 4;

endmodule