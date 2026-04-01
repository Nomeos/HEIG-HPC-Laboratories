	.file	"main.c"
	.text
	.p2align 4
	.globl	update
	.type	update, @function
update:
.LFB11:
	.cfi_startproc
	vmovq	(%rdi), %xmm0
	vmovq	.LC0(%rip), %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, (%rdi)
	ret
	.cfi_endproc
.LFE11:
	.size	update, .-update
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Before update: x = %d, y = %d\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"After update: x = %d, y = %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$2, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rdi
	call	printf@PLT
	movl	$3, %edx
	movl	$2, %esi
	leaq	.LC2(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1
	.long	1
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
