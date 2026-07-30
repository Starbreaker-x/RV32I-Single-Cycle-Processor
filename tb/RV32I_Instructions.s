# 4 at address 0
lw x1, 0(x0);
#15 at address 4
lw x2, 4(x0);
#8 at address 8
lw x3, 8(x0);
#2 at address 12
lw x4, 12(x0);
# 4,026,531,840 at address 16
lw x5, 16(x0);
# 7 at address 20
lw x6, 20(x0);

#R type instructions

#ADD
add x7, x1, x2;
#SUB
sub x8, x2, x1;
#AND
and x9, x2, x6;
#OR
or x10, x1, x4;
#XOR
xor x11, x2, x6;
#SLT
slt x12, x5, x4;
slt x13, x4, x5;
#SLTU
sltu x14, x5, x4;
sltu x15, x4, x5;
#SLL
sll x16, x1, x4;
#SRL

#sign extension
srl x17, x5, x4;
#regular
srl x18, x3, x4;

#SRA

#sign extension
sra x19, x5, x4;

#regular
sra x20, x3, x4;

#end of R type instructions

#sw S Type

sw x16, 24(x0);

#beq

#not equal: if they were there would be an infinite loop
beq x1, x2, -4;

#eqal so we branch, target is 8 so we skip over an instruction
beq x1, x1, 8;

add x21, x6, x4;

sub x21, x6, x4;


