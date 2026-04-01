	.file	"main.c"
	.text
	.p2align 4
	.globl	compute2
	.type	compute2, @function
compute2:
.LFB11:
	.cfi_startproc
	imull	%edi, %edi
	leal	(%rdi,%rdi,2), %eax
	ret
	.cfi_endproc
.LFE11:
	.size	compute2, .-compute2
	.p2align 4
	.globl	sum
	.type	sum, @function
sum:
.LFB12:
	.cfi_startproc
	movq	%rdx, %rcx
	movd	(%rdx), %xmm1
	testl	%esi, %esi
	jle	.L4
	leal	-1(%rsi), %eax
	cmpl	$2, %eax
	jbe	.L9
	movl	%esi, %edx
	movq	%rdi, %rax
	pxor	%xmm0, %xmm0
	shrl	$2, %edx
	salq	$4, %rdx
	addq	%rdi, %rdx
	.p2align 5
	.p2align 4
	.p2align 3
.L6:
	movdqu	(%rax), %xmm3
	addq	$16, %rax
	paddd	%xmm3, %xmm0
	cmpq	%rax, %rdx
	jne	.L6
	movdqa	%xmm0, %xmm2
	movl	%esi, %eax
	psrldq	$8, %xmm2
	andl	$-4, %eax
	paddd	%xmm2, %xmm0
	movdqa	%xmm0, %xmm2
	psrldq	$4, %xmm2
	paddd	%xmm2, %xmm0
	paddd	%xmm0, %xmm1
	testb	$3, %sil
	je	.L4
.L5:
	movslq	%eax, %rdx
	leal	1(%rax), %r8d
	movd	(%rdi,%rdx,4), %xmm0
	paddd	%xmm0, %xmm1
	cmpl	%r8d, %esi
	jle	.L4
	addl	$2, %eax
	movd	4(%rdi,%rdx,4), %xmm0
	paddd	%xmm0, %xmm1
	cmpl	%eax, %esi
	jle	.L4
	movd	8(%rdi,%rdx,4), %xmm0
	paddd	%xmm0, %xmm1
.L4:
	movd	%xmm1, (%rcx)
	ret
.L9:
	xorl	%eax, %eax
	jmp	.L5
	.cfi_endproc
.LFE12:
	.size	sum, .-sum
	.p2align 4
	.globl	foo
	.type	foo, @function
foo:
.LFB13:
	.cfi_startproc
	movslq	%esi, %rsi
	movl	(%rdi,%rsi,4), %edx
	leal	2(%rdx,%rdx), %edx
	movl	%edx, (%rdi,%rsi,4)
	ret
	.cfi_endproc
.LFE13:
	.size	foo, .-foo
	.p2align 4
	.globl	contains_zero
	.type	contains_zero, @function
contains_zero:
.LFB14:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L15
	movslq	%esi, %rsi
	leaq	(%rdi,%rsi,4), %rax
	jmp	.L14
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L18:
	addq	$4, %rdi
	cmpq	%rdi, %rax
	je	.L15
.L14:
	movl	(%rdi), %edx
	testl	%edx, %edx
	jne	.L18
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE14:
	.size	contains_zero, .-contains_zero
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Result: %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB15:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$15, %esi
	leaq	.LC0(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
