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

// Put your code here.
// While any key is pressed make screen black
// As soon as key is released make it white
// 1 row = 16 X 32 = 512 pixel - total 16 rows
//Each row in the physical screen,starting at the screen’s top left corner, is represented in the RAM by 32 consecu-tive 16-bit words

@8192
D=A
@max
M=D

(LOOP)
  @0
  D=A
  @i
  M=D

(SCREENLOOP)
  @i
  M=M+1
  //Reset iteration if needed
  D=M
  @max
  D=M-D
  @LOOP
  D;JEQ

  @KBD
  D=M
  @DARK
  D;JNE //Draw Black Pixels If A key Was Pressed
  @LIGHT
  D;JEQ


(DARK)
  @i
  D=M
  @SCREEN
  A=A+D
  M=-1
  @SCREENLOOP
  0;JMP

(LIGHT)
  @i
  D=M  //current pointer to i
  @SCREEN
  A=A+D
  M=0
  @SCREENLOOP
  0;JMP
