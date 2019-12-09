global hypotenuse

extern printf
extern scanf

segment .data
	welcome db "Welcome to the Hypotenuse calculator",10,0
	inputprompt db "Enter the two sides of the triangle seperated by a space. Press enter when finished",10,0
	validateinput db "The lengths of the two sides are %lf and %lf",10,0
	showarea db "The area of the triangle is %lf",10,0
	showhypotenuse db "The hypotenuse has a length of %lf",10,0
	closing db "The module will now return the hypotenuse to the driver",10,0
	stringformat db "%s"
	twofloat db "%lf %lf"

segment .bss
;empty

segment .text

hypotenuse:


	push	rbp
	mov	rbp, rsp

	push	rbx
	push   rcx
	push   rdx
	push   rsi
	push   rdi
	push   r8
	push   r9
	push   r10
	push   r11
	push   r12
	push   r13
	push   r14
	push   r15

;===== print welcome statements ================================================

	mov qword rax, 0
	mov	rdi, stringformat
	mov	rsi, welcome
	call	printf

;===== prompt user to input two numbers =======================================

	mov qword rax, 0
	mov	rdi, stringformat
	mov	rsi, inputprompt
	call	printf

;===== receive user input =====================================================

	;push	qword 99		;places on the boundary
	push	qword 0
	push	qword 0
	mov 	rax, 0
	mov	rdi, twofloat
	mov	rsi, rsp		;rsi points to the first qword on the stack
	mov	rdx, rsp
	add	rdx, 8			;rdx points to the second qword on the stack
	call	scanf

	movsd	xmm12, [rsp]
	movsd	xmm13, [rsp+8]
	pop	rax
	pop	rax
	pop	rax

;===== validate user input ====================================================

	mov	rax, 2			;indicates two floats are involved
	mov	rdi, validateinput	;"The sides are..."
	movsd	xmm0, xmm12		;do this becuase printf interacts with the "lowest" xmm registers first
	movsd	xmm1, xmm13
	call	printf

;===== do math ================================================================

	mulsd	xmm12, xmm12		;a^2
	mulsd	xmm13, xmm13		;b^2

	addsd	xmm12, xmm13		;a^2 + b^2 / store in xmm12

	sqrtsd	xmm11, xmm12		;squareroot of a^2+b^2 / store in xmm11

;===== print out the results ==================================================

	mov	rax, 1
	mov	rdi, showhypotenuse
	movsd	xmm0, xmm11
	call	printf

;===== return everything to main.cpp ==========================================

	pop	r15
	pop	r14
	pop    r13
	pop    r12
	pop    r11
	pop    r10
	pop    r9
	pop    r8
	pop    rdi
	pop    rsi
	pop    rdx
	pop    rcx
	pop    rbx
	pop    rbp

	ret
