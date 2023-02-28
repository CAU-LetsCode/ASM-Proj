BITS 32

SECTION .data	;Data segment
	progMsg DB 'The Reversing Program',0xa ;Explain a program 
	lenProgMsg EQU $-progMsg	;The length of the program message
	userMsg DB 'Please enter a character string: ' ;Ask the user to enter a number
	lenUserMsg EQU $-userMsg
	answerMsg DB 'The answer is: ' ;Show the answer
	lenAnswerMsg EQU $-answerMsg
    newLineMsg DB '',0xa
    lenNewLineMsg EQU $-newLineMsg

section .bss
    inputString resb 256         ; reserve space for the input string
    reversedString resb 256      ; reserve space for the reversed string

section .text
    global _start

_start:
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
    ; read the input string from stdin
    mov eax, 3               ; syscall number for read
    mov ebx, 0               ; file descriptor for stdin
    mov ecx, inputString     ; address of the input buffer
    mov edx, 256             ; size of the input buffer
    int 0x80                 ; call the kernel
    
    ; calculate the length of the string
    mov ecx, 0         ; initialize counter
loop:
    cmp byte [inputString + ecx], 0   ; check if we've reached the end of the string
    je reverse                   ; if so, jump to the reverse code
    inc ecx                        ; otherwise, increment the counter
    jmp loop                      ; and loop again

reverse:
    ; reverse the string
    mov esi, inputString    ; point esi to the start of the input string
    mov edi, reversedString ; point edi to the start of the reversed string
    dec ecx                ; decrement the counter to get the length of the string
reverse_loop:
    cmp ecx, 0             ; check if we've reached the beginning of the string
    jl print              ; if so, jump to the print code
    mov al, [esi + ecx]    ; load a byte from the input string
    mov [edi], al          ; store the byte in the reversed string
    inc edi                ; increment the destination pointer
    dec ecx                ; decrement the counter
    jmp reverse_loop      ; and loop again

print:
    ; print the reversed string using the syscalls write and exit
	mov eax, 4 ;SYS_WRITE
	mov ebx, 1 ;STDOUT
	mov ecx, answerMsg
	mov edx, lenAnswerMsg
	int 80h
	; Output the message
	mov eax, 4             ; syscall number for write
    mov ebx, 1             ; file descriptor for stdout
    mov ecx, reversedString; address of the reversed string to print
    mov edx, 256           ; length of the string
    int 0x80               ; call the kernel
    
	;Exit code
	mov eax, 1 ;SYS_EXIT
	mov ebx, 0
	int 80h