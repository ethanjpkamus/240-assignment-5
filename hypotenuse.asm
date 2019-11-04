global hypotenuse

extern printf
extern scanf

segment .data
	welcome db "Welcome to the Hypotenuse calculator",10,0

segment .bss
;empty

segment.text

hypotenuse:


	push       rbp
	mov	    rbp, rsp

	push       rbx
	push       rcx
	push       rdx
	push       rsi
	push       rdi
	push       r8
	push       r9
	push       r10
	push       r11
	push       r12
	push       r13
	push       r14
	push       r15

;===== welcome statements =====================================================


;===== return everything to main.cpp ==========================================

	pop 	    r15
	pop	    r14
	pop        r13
	pop        r12
	pop        r11
	pop        r10
	pop        r9
	pop        r8
	pop        rdi
	pop        rsi
	pop        rdx
	pop        rcx
	pop        rbx
	pop        rbp

	ret
