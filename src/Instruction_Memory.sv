module IM( input [31:0] logic A, output [31:0] logic RD);


//Chose to do by byte addressing 
logic [7:0] mem [0:1023];


//initializing our program
initial begin 
    $readmemh("IM_TestBench.hex",mem);
end

//Little Endian for RISC-V
assign = {mem[A + 3], mem[A + 2], mem[A + 1], mem[A]};


endmodule