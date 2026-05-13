	.file	"proj3.c"
	.text
	.section	.rodata
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
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	leaq	-112(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L2
	movl	$.LC3, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L2:
	movq	-24(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	ftell
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek
	movl	$1, %esi
	movl	$16, %edi
	call	calloc
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L3
	movl	$.LC4, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L3:
	movl	$0, -4(%rbp)
	jmp	.L4
.L11:
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread
	movq	%rax, -48(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L5
.L6:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -8(%rbp)
.L5:
	movq	-48(%rbp), %rax
	cmpl	%eax, -8(%rbp)
	jl	.L6
	movl	$124, %edi
	call	putchar
	movl	$0, -12(%rbp)
	jmp	.L7
.L10:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$31, %al
	jg	.L8
	movl	$46, %edi
	call	putchar
	jmp	.L9
.L8:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	putchar
.L9:
	addl	$1, -12(%rbp)
.L7:
	movq	-48(%rbp), %rax
	cmpl	%eax, -12(%rbp)
	jl	.L10
	movl	$.LC7, %edi
	call	puts
	movq	-48(%rbp), %rax
	addl	%eax, -4(%rbp)
.L4:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L11
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
