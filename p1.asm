BITS 32

SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

SECTION .data	;Data segment
	progMsg DB 'The Adding Program',0xa ;Explain a program 
	lenProgMsg EQU $-progMsg	;The length of the program message
	userMsg DB 'Please enter a single digit number: ' ;Ask the user to enter a number
	lenUserMsg EQU $-userMsg
	answerMsg DB 'The answer is: ' ;Show the answer
	lenAnswerMsg EQU $-answerMsg
    newLineMsg DB '',0xa
    lenNewLineMsg EQU $-newLineMsg
SECTION .bss	;Uninitialized data
	num1 RESB 5
	num2 RESB 5
	answer RESB 5

SECTION .text	;Code Segment
	GLOBAL _start

_start:	;Program prompt
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, progMsg
	mov edx, lenProgMsg
	int 80h
	;for a first digit number
	;User prompt
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h
	;Read and store the user input
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num1
	mov edx, 2
	int 80h
	;for the second digit number
	;User prompt
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h
	;Read and store the user input
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num2
	mov edx, 2
	int 80h

	;convert a string to a number
	;the first number 
	mov al, [num1]
	sub al, '0' 

	;the second number
	mov ah, [num2]
	sub ah, '0' 

	;addition
	add al, ah ;add the first number to the second number

	add al, '0' ;convert the answer from a number to a string
	mov [answer], al

	;Output the message
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, answerMsg
	mov edx, lenAnswerMsg
	int 80h
	;Output the number entered
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, answer
	mov edx, 5
	int 80h
	;Output the message
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, newLineMsg
	mov edx, lenNewLineMsg
	int 80h



	;Exit code
	mov eax, SYS_EXIT
	mov ebx, 0
	int 80h
