; Naomi Macias Honti		a01282098
; 14 de marzo 2017
; Tabla de multiplicacion de un numero del 0 al 9.

;Stack Segment block -do not change it-
thestack segment para stack 'stack'
	dw 32 dup(?)
thestack ends

;Block for data
data segment para 'data'
cMsg db '  x    =   $'
iNumber db 5d
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
		

		; No cambiar bl= primer numero	cl=renglon	ch= segundo numero
		mov bl,iNumber
		mov cl,5
		mov ch,1d
		add bl,30h

		; loop st
		next:

		; Posicionar
		mov ah,2
		mov dh, cl
		mov dl, 30
		mov bh,0
		int 10h

		; Primer numero
		mov cMsg,bl

		; Segndo numero
		cmp ch,10d
		jl next2

		; Si es 10
		mov ch,31h
		mov cMsg+4,ch
		mov ch,0d

		; Menor a 10
		next2:
		add ch,30h
		mov cMsg+5,ch
		sub ch,30h

		; Checar si es el 10 para regresarlo
		cmp ch,0
		je next3
		next4:

		; Sacar la respuesta
		mov ah,0d
		mov al,ch

		sub bl,30h
		mul bl
		add bl,30h

		; Mandar la respuesta
		mov bh,10d
		div bh

		; Checar que ah no sea 0.
		cmp ah,0
		jne next5

		add al,48d
		mov cMsg+9,al

		next5:
		add ah,48d
		mov cMsg+10,ah

		; Mandar string
		lea dx, cMsg
		call cout

		; Contadores
		add cl,1
		add ch,1

		; loop end
		cmp cl,14
		jle next
		
		;The End
		ret

		; Regresar a 10
		next3:
		mov ch,10d
		cmp ch,10d
		je next4


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
