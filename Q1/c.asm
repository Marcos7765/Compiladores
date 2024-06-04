	.file	"c.c"
	.text
	.p2align 4
	.globl	initMatriz
	.type	initMatriz, @function
initMatriz:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$370720, %edi
	call	malloc@PLT
	movl	$2147395600, %edi
	movq	%rax, %r12
	call	malloc@PLT
	movq	%r12, %rdx
	leaq	2147395600(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%rax, (%rdx)
	addq	$46340, %rax
	addq	$8, %rdx
	cmpq	%rcx, %rax
	jne	.L2
	movq	%r12, %rax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE16:
	.size	initMatriz, .-initMatriz
	.p2align 4
	.globl	limpaMatriz
	.type	limpaMatriz, @function
limpaMatriz:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	movq	(%rdi), %rdi
	call	free@PLT
	movq	%rbp, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE17:
	.size	limpaMatriz, .-limpaMatriz
	.p2align 4
	.globl	zeraMatriz
	.type	zeraMatriz, @function
zeraMatriz:
.LFB18:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rdi
	movl	$2147395600, %edx
	xorl	%esi, %esi
	jmp	memset@PLT
	.cfi_endproc
.LFE18:
	.size	zeraMatriz, .-zeraMatriz
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%eax, %eax
	call	initMatriz
	movl	$2147395600, %edx
	xorl	%esi, %esi
	movq	(%rax), %rdi
	movq	%rax, %rbp
	call	memset@PLT
	movq	%rbp, %rdi
	call	limpaMatriz
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE19:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
