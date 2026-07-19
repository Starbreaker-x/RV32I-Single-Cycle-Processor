module IM( input logic [31:0] A, output logic [31:0] RD);


//Chose to do by byte addressing 
logic [7:0] mem [0:1023];
 

//initializing our program
initial begin 
    $readmemh("IM_TestBench.hex",mem);
end

//Little Endian for RISC-V
assign RD = {mem[A + 3], mem[A + 2], mem[A + 1], mem[A]};


endmodule