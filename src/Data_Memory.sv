module DM(input logic [31:0] A, WD, input logic clk, WE, output logic [31:0] RD);

/*  A: The address
    WD: Write Data
    clk: The clock
    WE: Write Enable
    RD: Output
    
    */

logic [7:0] mem [0:1024];

always_ff @( posedge clk) begin
     if(WE) begin
        mem[A] <= WD[7:0];
        mem[A + 1] <= WD[15:8];
        mem[A + 2] <= WD[23:16];
        mem[A + 3] <= WD[31:24];
     end
     

end



assign RD = {mem[A+3],mem[A+2],mem[A+1],mem[A]};





endmodule