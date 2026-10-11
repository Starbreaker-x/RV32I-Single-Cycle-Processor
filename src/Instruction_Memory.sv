module IM( input logic [31:0] A, output logic [31:0] RD);


//Chose to do by byte addressing 
logic [31:0] mem [0:255];

//initializing our program
initial begin 
    $readmemh("RV32I_Instructions_V2.hex",mem);
end

//Dividing the value provided by PC by 4 to get the correct value from instruction memory
assign RD = mem[A/4];


endmodule