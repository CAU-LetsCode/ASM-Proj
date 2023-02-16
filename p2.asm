BITS 32

SECTION .data	;Data segment
	progMsg DB 'The Multiplying Program',0xa ;Explain a program 
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
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, progMsg
	mov edx, lenProgMsg
	int 80h
	;for a first digit number
	;User prompt
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h
	;Read and store the user input
	mov eax, 3 ;SYS_READ
	mov ebx, 0 ;STDIN
	mov ecx, num1
	mov edx, 2
	int 80h
	;for the second digit number
	;User prompt
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h
	;Read and store the user input
	mov eax, 3 ;SYS_READ
	mov ebx, 0 ;STDIN
	mov ecx, num2
	mov edx, 2
	int 80h

    mov ax,0    ;zero out ax.

	;convert a string to a number
	;the first number
	mov al, [num1]
	sub al, '0' 

    mov ah, [num2]
    sub ah, '0'

    ;multiplication
    imul ah

	add al, '0' ;convert the answer from a number to a string
	mov [answer], al

	;Output the message
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, answerMsg
	mov edx, lenAnswerMsg
	int 80h
	;Output the number entered
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, answer
	mov edx, 5
	int 80h
    ;Output the message
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, newLineMsg
	mov edx, lenNewLineMsg
	int 80h

	;Exit code
	mov eax, 1 ;SYS_EXIT
	mov ebx, 0
	int 80h
