BITS 32

SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

SECTION .data	;Data segment
	progMsg DB 'The Swapping Program',0xa ;Explain a program 
	lenProgMsg EQU $-progMsg	;The length of the program message
	userMsg DB 'Please enter a two character string: ' ;Ask the user to enter a number
	lenUserMsg EQU $-userMsg
	answerMsg DB 'The answer is: ' ;Show the answer
	lenAnswerMsg EQU $-answerMsg
    newLineMsg DB '',0xa
    lenNewLineMsg EQU $-newLineMsg
SECTION .bss	;Uninitialized data
	two_char_string RESB 3     ;added an extra character to put a newline into when printing

SECTION .text	;Code Segment
	GLOBAL _start

_start:	;Program prompt
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, progMsg
	mov edx, lenProgMsg
	int 80h
	;User prompt
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h
	;Read and store the user input
	mov eax, 3 ;SYS_READ
	mov ebx, 0 ;STDIN
	mov ecx, two_char_string
	mov edx, 3
	int 80h

    mov al, [two_char_string] ;first character
    mov bl, [two_char_string + 1] ;second character

	mov [two_char_string + 1], al ;put first character at second character position
	mov [two_char_string], bl ;put second character at first character position


	;Output the message
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, answerMsg
	mov edx, lenAnswerMsg
	int 80h
	;Output the number entered
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, two_char_string
	mov edx, 3
	int 80h

	;Exit code
	mov eax, 1 ;SYS_EXIT
	mov ebx, 0
	int 80h
