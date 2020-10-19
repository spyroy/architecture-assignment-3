// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LISTENER)	
	@KBD
	D=M
	@LISTENER
	D;JEQ

	@SCREEN	
	D=A

	@addrres	
	M=D

(BLACK)
	@addrres	
	A=M
	M=-1

	@addrres	
	M=M+1

	@KBD	
	D=A
	@addrres
	D=D-M
	@BLACK
	D;JGT	

(L_BLACK)	
	@KBD
	D=M
	@L_BLACK
	D;JGT


	@SCREEN
	D=A
	@addrres
	M=D

(CLEAN)
	@addrres
	A=M
	M=0	

	@addrres	
	M=M+1

	@KBD	
	D=A
	@addrres
	D=D-M
	@CLEAN	
	D;JGT	
	@LISTENER
	0;JMP	