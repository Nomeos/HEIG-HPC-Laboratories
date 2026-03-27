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
	movl	(%rdx), %eax
	movq	%rdx, %rcx
	testl	%esi, %esi
	jle	.L4
	movslq	%esi, %rsi
	leaq	(%rdi,%rsi,4), %rdx
	.p2align 4
	.p2align 4
	.p2align 3
.L5:
	addl	(%rdi), %eax
	addq	$4, %rdi
	cmpq	%rdx, %rdi
	jne	.L5
.L4:
	movl	%eax, (%rcx)
	ret
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
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Result: %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB14:
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
.LFE14:
	.size	main, .-main
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
