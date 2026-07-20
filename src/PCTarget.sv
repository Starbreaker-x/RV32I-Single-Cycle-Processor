//Adder that claulates the next PC based off of the output of the extend module and the current PC

module PCTarget(input logic [31:0] PC, ImmExt, output logic [31:0] PCTarget);

assign PCTarget = PC + ImmExt;

endmodule