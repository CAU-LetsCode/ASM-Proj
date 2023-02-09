# ASM-Proj2

## CSC 3410 Assignment 2

### Introduction

You are going to write your first assembler programs by writing some simple code to use the ADD, MOV, SUB, IMUL, and IDIV instructions. 

## Build Setup

Each program below is to be written and tested on the virtual machine given in class. </br>

For example, to compile program 1, you will enter the following commands:  
```bash
# The Nasm assembler: compile using the nasm assembler
$ nasm -g -f elf -F dwarf -o p1.o p1.asm

# The ld linker: link using the ld linker
$ ld p1.o -m elf_i386 -o p1

# run the program
$ ./p1

```
