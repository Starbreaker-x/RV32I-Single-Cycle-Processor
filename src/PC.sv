/* So I'm going to do the entire Program counter logic including the two adders
 for PCNext, PCPlus4 and PCTarget. I will also inlcude the mux to switch between the adders depending on the operation*/


 module PC(input logic [31:0] PCNext, input logic clk, output logic [31:0] PC);

    always_ff @(clk posedge){
       PC <= PCNext;
    }

 endmodule


