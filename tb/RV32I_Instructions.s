# 4 at reg x1
addi x1, x0, 4;
#15 at reg x2
addi x2, x0, 15;
#8 at  reg x3
addi x3, x0, 8;
#2 at reg x4
addi x4, x0, 2;
# 4,026,531,840 at reg x5
lui x5, 0xF0000;
ori x5, x5 , 0x000;
# 7 at reg x6
addi x6, x0, 7;

#R type instructions

#add
add x7, x1, x2;
#sub
sub x8, x2, x1;
#and
and x9, x2, x6;
#or
or x10, x1, x4;
#xor
xor x11, x2, x6;
#slt
slt x12, x5, x4;
slt x13, x4, x5;
#sltu
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

#Immediate instructions



#slti
slti x21, x4, -15;

slti x21, x4, 1;

#sltiu
sltiu x22, x4, -15;

sltiu x22, x4, 0;

#xori

#slli

#srli

#srai

#andi

#jalr


#end of Immediate instructions


#auipc


#jal

#S-type instructions







#end of S-type instructions


# Load instructions


#lb

#lh

#lbu

#lhu

#end of Load instructions


# B-type instructions

#beq



#beq


#bne


#bne


#blt


#blt


#bge


#bge


#bltu


#bltu


#bgeu


#bgeu


















# end of B-type instructions












#sw S Type

sw x16, 24(x0);

#beq

#not equal: if they were there would be an infinite loop
beq x1, x2, -4;

#eqal so we branch, target is 8 so we skip over an instruction
beq x1, x1, 8;

add x21, x6, x4;

sub x21, x6, x4;


