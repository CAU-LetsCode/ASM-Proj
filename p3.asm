BITS 32

SECTION .data	;Data segment
	progMsg DB 'The Dividing Program',0xa ;Explain a program 
	lenProgMsg EQU $-progMsg	;The length of the program message
	userMsg DB 'Please enter a single digit number: ' ;Ask the user to enter a number
	lenUserMsg EQU $-userMsg
	quotientMsg DB 'The quotient is: ' ;Show the quotient
	lenQuotientMsg EQU $-quotientMsg
    remainderMsg DB 0xa, 'The remainder is: ' ;Show the remainder
	lenRemainderMsg EQU $-remainderMsg
    newLineMsg DB '',0xa
    lenNewLineMsg EQU $-newLineMsg
SECTION .bss	;Uninitialized data
	num1 RESB 5
	num2 RESB 5
	quotient RESB 5
    remainder RESB 5

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

    mov ax, 0    ;zero out ax.
    mov bx, 0

	;convert a string to a number
	;the first number
	mov al, [num1]
	sub al, '0' 

    mov bl, [num2]
    sub bl, '0'

    ;division
    idiv bl

	add al, '0' ;convert the quotient from a number to a string
	mov [quotient], al
    add ah, '0' ;convert the remainder from a number to a string
    mov [remainder], ah

	;Output the queotient
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, quotientMsg
	mov edx, lenQuotientMsg
	int 80h
	;Output the queotient
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, quotient
	mov edx, 5
	int 80h
    ;Output the remainder
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, remainderMsg
	mov edx, lenRemainderMsg   
	int 80h
    ;Output the remainder
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, remainder
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
