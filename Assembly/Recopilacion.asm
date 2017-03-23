; Naomi Macias Honti	a01282098
; Enero-Marzo 2017
; Recopilacion de codigos.

;Stack Segment block -do not change it-
thestack segment para stack 'stack'
	dw 32 dup(?)
thestack ends

;Block for data
data segment para 'data'

; CODIGO 1.
iDataA db 1
cMsg1 db 'Positive Number$'
cMsg2 db 'Negative Number$'

; CODIGO 2.
iDataA dw 7
iDataB dw 27
cMsg3 db 'Equal$'
cMsg4 db 'Not equal$'

; CODIGO 3.
cData db ?,?,'$'

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
		
		; CODIGO 1. Decir si el numero (iDataA) es positivo o negativo
		cmp iDataA,0
		jl next
		lea dx, cMsg1
		call cout
		ret
		next:
		lea dx, cMsg2
		call cout

		; CODIGO 2. Decir si dos numeros (iDataA y iDataB) son iguales o diferentes
		move ax, iDataA
		cmp ax, iDataB
		jne next:
		lea dx, cMsg3
		call cout
		ret
		next:
		lea dx, cMsg4
		call cout

		; CODIGO 3. Muestra el numero (ax)
		mov ax, 28d
		mov bl, 10d
		div bl
		add al, 48d
		add ah, 48d
		mov cData, al
		mov cData+1,ah
		lea dx, cData
		call cout

		; CODIGO 4. Da el resultado de la sumatoria (BECA + 1234) y la resta (B0CA - CAFE)
		mov ax, 0BECA
		mov bx, 1234
		mov cx, 0B0CA
		mov dx, CAFE
		add ax, bx
		sub cx,dx

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
