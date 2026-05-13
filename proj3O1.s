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
	.text
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leaq	32(%rsp), %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$.LC2, %esi
	leaq	32(%rsp), %rdi
	call	fopen
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L21
	movl	$2, %edx
	movl	$0, %esi
	movq	8(%rsp), %r14
	movq	%r14, %rdi
	call	fseek
	movq	%r14, %rdi
	call	ftell
	movq	%rax, %rbx
	movl	%eax, 20(%rsp)
	movl	$0, %edx
	movl	$0, %esi
	movq	%r14, %rdi
	call	fseek
	movl	$1, %esi
	movl	$16, %edi
	call	calloc
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L3
	movl	$0, %r14d
	leaq	1(%rax), %rax
	movq	%rax, 24(%rsp)
	testl	%ebx, %ebx
	jg	.L4
.L5:
	movq	%r15, %rdi
	call	free
	movq	8(%rsp), %rdi
	call	fclose
	movl	$0, %eax
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
.L21:
	.cfi_restore_state
	movl	$.LC3, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L3:
	movl	$.LC4, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L9:
	movsbl	%dil, %edi
	call	putchar
.L10:
	addq	$1, %rbx
	cmpq	%r12, %rbx
	je	.L12
.L11:
	movzbl	(%rbx), %edi
	cmpb	$31, %dil
	jg	.L9
	movl	$46, %edi
	call	putchar
	jmp	.L10
.L6:
	movl	$124, %edi
	call	putchar
.L12:
	movl	$.LC7, %edi
	call	puts
	addl	%r13d, %r14d
	cmpl	%r14d, 20(%rsp)
	jle	.L5
.L4:
	movl	%r14d, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movq	8(%rsp), %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	fread
	movq	%rax, %r13
	testl	%eax, %eax
	jle	.L6
	movq	%r15, %rbx
	leal	-1(%rax), %r12d
	addq	24(%rsp), %r12
	movq	%r15, %rbp
.L7:
	movzbl	0(%rbp), %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	addq	$1, %rbp
	cmpq	%r12, %rbp
	jne	.L7
	movl	$124, %edi
	call	putchar
	jmp	.L11
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
	
