// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

@R2
M=0
@R0
D=M
@SUM
M=D
@i
M=1

(MULTLOOP)
	@i
	D=M
	@R1
	D=D-M
	@END
	D; JEQ

	@R0
	D=M
	@SUM
	M=M+D
	@R1
	M=M-1

	@MULTLOOP
	0;JMP

(END)
@SUM
D=M
@R2
M=D

(finish)
@finish
0;JMP