; Naomi Macias Honti		a01282098
; 14 de marzo 2017
; Cuenta la cantidad de numeros pares y muestra el numero mas grande del arreglo (iNumbers).

;Stack Segment block -do not change it-
thestack segment para stack 'stack'
	dw 32 dup(?)
thestack ends

;Block for data
data segment para 'data'

iNumbers db 1,2,5,4,5,6,7,2,1
cMsg db 'El numero mas grande:  . Cantidad de pares:  . El numero mas grande par:  .$'

data ends

; Block for code
; This is the MAIN function
code segment para 'code'
principal proc far
		; first block of code (initialization)
		assume ds:data, cs:code, ss:thestack
		push ds
		mov ax,0
		push ax
		mov ax,data
		mov ds,ax
		
		; my code starts here
		
		;	ch = numero mas grande	bh = numero comparado	bl = contador de pares	dl = numero mas grande par
		mov ch, iNumbers[si]
		mov bh, iNumbers[si]
		mov dl, 0d
		inc si
		mov bl, 0d
		mov dh, 2d

		; Guarda el mas grande
		next2:
		mov ch, bh
		mov ax, 0
		mov al, ch
		div dh
		cmp ah, 0
		jne next5
		mov dl, ch
		next5:

		next:
		; Contador de pares
		mov ax, 0
		mov al,bh
		div dh
		cmp ah, 0
		jne next4
		add bl,1d
		next4:

		; Checa que sea mayor
		mov bh, iNumbers[si]
		inc si
		cmp si,9
		jg next3
		cmp ch,bh
		jl next2
		jge next

		next3:
		add ch, 30h
		add bl, 30h
		add dl, 30h
		mov cMsg+22, ch
		mov cMsg+44, bl
		mov cMsg+73, dl
		lea dx, cMsg
		call cout

		;The End
		ret

principal endp

; Function that displays a string pointed by DX
; The string must end with the character '$'
cout proc near
		mov ah,9
		int 21h
		ret
cout endp

code ends
	end principal
