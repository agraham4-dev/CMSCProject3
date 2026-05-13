	.file	"proj3.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Insert filename:"
.LC1:
	.string	"%49s"
.LC2:
	.string	"r"
.LC3:
	.string	"Failed to open file."
.LC4:
	.string	"Failed to allocate data."
.LC5:
	.string	"%08x "
.LC6:
	.string	"%02x "
.LC7:
	.string	"|"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC0, %edi
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	call	printf
	leaq	32(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	$.LC2, %esi
	leaq	32(%rsp), %rdi
	call	fopen
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L22
	movq	%rax, %r14
	movl	$2, %edx
	xorl	%esi, %esi
	movq	%rax, %rdi
	call	fseek
	movq	%r14, %rdi
	call	ftell
	movq	%r14, %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	%eax, 20(%rsp)
	movq	%rax, %rbx
	call	fseek
	movl	$1, %esi
	movl	$16, %edi
	call	calloc
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L3
	leaq	1(%rax), %rax
	xorl	%r13d, %r13d
	movq	%rax, 24(%rsp)
	testl	%ebx, %ebx
	jle	.L5
	.p2align 4,,10
	.p2align 3
.L4:
	movl	%r13d, %esi
	movl	$.LC5, %edi
	xorl	%eax, %eax
	call	printf
	movq	8(%rsp), %rcx
	movl	$16, %edx
	movq	%r14, %rdi
	movl	$1, %esi
	call	fread
	movq	%rax, %r12
	testl	%eax, %eax
	jle	.L6
	leal	-1(%rax), %ebp
	movq	%r14, %rbx
	addq	24(%rsp), %rbp
	movq	%r14, %r15
	.p2align 4,,10
	.p2align 3
.L7:
	movzbl	(%r15), %esi
	movl	$.LC6, %edi
	xorl	%eax, %eax
	addq	$1, %r15
	call	printf
	cmpq	%rbp, %r15
	jne	.L7
	movl	$124, %edi
	call	putchar
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L23:
	movl	$46, %edi
	addq	$1, %rbx
	call	putchar
	cmpq	%rbp, %rbx
	je	.L12
.L11:
	movsbl	(%rbx), %edi
	cmpb	$31, %dil
	jle	.L23
	call	putchar
	addq	$1, %rbx
	cmpq	%rbp, %rbx
	jne	.L11
.L12:
	movl	$.LC7, %edi
	addl	%r12d, %r13d
	call	puts
	cmpl	%r13d, 20(%rsp)
	jg	.L4
.L5:
	movq	%r14, %rdi
	call	free
	movq	8(%rsp), %rdi
	call	fclose
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
	movl	$124, %edi
	call	putchar
	jmp	.L12
.L22:
	movl	$.LC3, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L3:
	movl	$.LC4, %edi
	call	puts
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits

