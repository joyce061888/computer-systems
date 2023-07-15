	.file	"practice.c"
	.text
.Ltext0:
	.globl	string_length_a
	.type	string_length_a, @function
string_length_a:
.LFB19:
	.file 1 "practice.c"
	.loc 1 23 0
	.cfi_startproc
.LVL0:
	.loc 1 26 0
	cmpb	$0, (%rdi)
	je	.L4
	.loc 1 24 0
	movl	$0, %eax
.LVL1:
.L3:
	.loc 1 27 0
	addl	$1, %eax
.LVL2:
	.loc 1 26 0
	movslq	%eax, %rdx
	cmpb	$0, (%rdi,%rdx)
	jne	.L3
	rep ret
.LVL3:
.L4:
	.loc 1 24 0
	movl	$0, %eax
	.loc 1 30 0
	ret
	.cfi_endproc
.LFE19:
	.size	string_length_a, .-string_length_a
	.globl	string_length_p
	.type	string_length_p, @function
string_length_p:
.LFB20:
	.loc 1 41 0
	.cfi_startproc
.LVL4:
	.loc 1 45 0
	cmpb	$0, (%rdi)
	je	.L8
	movq	%rdi, %rax
.LVL5:
.L7:
	.loc 1 46 0
	addq	$1, %rax
.LVL6:
	.loc 1 45 0
	cmpb	$0, (%rax)
	jne	.L7
	jmp	.L6
.LVL7:
.L8:
	movq	%rdi, %rax
.LVL8:
.L6:
	.loc 1 48 0
	subq	%rdi, %rax
.LVL9:
	.loc 1 49 0
	ret
	.cfi_endproc
.LFE20:
	.size	string_length_p, .-string_length_p
	.globl	contains_char_a
	.type	contains_char_a, @function
contains_char_a:
.LFB21:
	.loc 1 62 0
	.cfi_startproc
.LVL10:
	movl	%esi, %ecx
.LVL11:
	.loc 1 64 0
	movzbl	(%rdi), %eax
	testb	%al, %al
	je	.L13
	.loc 1 65 0
	cmpb	%sil, %al
	je	.L14
	.loc 1 63 0
	movl	$0, %eax
	jmp	.L11
.LVL12:
.L12:
	.loc 1 65 0
	cmpb	%cl, %dl
	je	.L15
.LVL13:
.L11:
	.loc 1 68 0
	addl	$1, %eax
.LVL14:
	.loc 1 64 0
	movslq	%eax, %rdx
	movzbl	(%rdi,%rdx), %edx
	testb	%dl, %dl
	jne	.L12
	.loc 1 70 0
	movl	$0, %eax
.LVL15:
	ret
.LVL16:
.L13:
	movl	$0, %eax
	ret
.L14:
	.loc 1 66 0
	movl	$1, %eax
	ret
.LVL17:
.L15:
	movl	$1, %eax
.LVL18:
	.loc 1 71 0
	ret
	.cfi_endproc
.LFE21:
	.size	contains_char_a, .-contains_char_a
	.globl	contains_char_p
	.type	contains_char_p, @function
contains_char_p:
.LFB22:
	.loc 1 83 0
	.cfi_startproc
.LVL19:
	movl	%esi, %edx
	.loc 1 84 0
	movzbl	(%rdi), %eax
	testb	%al, %al
	je	.L20
	.loc 1 85 0
	cmpb	%sil, %al
	jne	.L18
	jmp	.L21
.L19:
	cmpb	%dl, %al
	.p2align 4,,6
	je	.L22
.LVL20:
.L18:
	.loc 1 88 0
	addq	$1, %rdi
.LVL21:
	.loc 1 84 0
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L19
	.loc 1 90 0
	movl	$0, %eax
	ret
.L20:
	movl	$0, %eax
	ret
.L21:
	.loc 1 86 0
	movl	$1, %eax
	ret
.L22:
	movl	$1, %eax
	.loc 1 91 0
	ret
	.cfi_endproc
.LFE22:
	.size	contains_char_p, .-contains_char_p
	.globl	contains_string
	.type	contains_string, @function
contains_string:
.LFB24:
	.loc 1 124 0
	.cfi_startproc
.LVL22:
	.loc 1 126 0
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE24:
	.size	contains_string, .-contains_string
	.globl	substring
	.type	substring, @function
substring:
.LFB23:
	.loc 1 109 0
	.cfi_startproc
.LVL23:
	.loc 1 111 0
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE23:
	.size	substring, .-substring
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"PASS"
.LC1:
	.string	"FAIL"
.LC2:
	.string	"Testing %s\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[%s]  %s(\"%s\") = %d; expected %d\n"
	.section	.rodata.str1.1
.LC4:
	.string	"Of %4d tests of %s\n"
.LC5:
	.string	"   %4d PASS\n"
.LC6:
	.string	"   %4d FAIL\n\n"
	.text
	.globl	test_string_length
	.type	test_string_length, @function
test_string_length:
.LFB25:
	.loc 1 151 0
	.cfi_startproc
.LVL24:
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdi, 8(%rsp)
	movq	%rsi, %r15
	.loc 1 152 0
	movq	%rdi, %rsi
.LVL25:
	movl	$.LC2, %edi
.LVL26:
	movl	$0, %eax
	call	printf
.LVL27:
	movl	$test_strings, %ebp
	.loc 1 153 0
	movl	$0, %ebx
.LVL28:
.L29:
.LBB2:
.LBB3:
	.loc 1 156 0
	leal	1(%rbx), %r14d
.LVL29:
	.loc 1 157 0
	movq	0(%rbp), %r12
	movq	%r12, %rdi
	movl	$0, %eax
	movq	$-1, %rcx
	repnz scasb
	notq	%rcx
	leaq	-1(%rcx), %r13
	movl	%r13d, 4(%rsp)
.LVL30:
	.loc 1 158 0
	movq	%r12, %rdi
	call	*%r15
.LVL31:
	.loc 1 159 0
	cmpl	%r13d, %eax
	sete	%dl
	movzbl	%dl, %ecx
	addl	%ecx, %ebx
.LVL32:
	.loc 1 160 0
	cmpl	%r14d, %ebx
	je	.L26
	.loc 1 161 0
	testb	%dl, %dl
	movl	$.LC0, %edx
	movl	$.LC1, %esi
	cmovne	%rdx, %rsi
	movl	4(%rsp), %r9d
	movl	%eax, %r8d
	movq	%r12, %rcx
	movq	8(%rsp), %rdx
	movl	$.LC3, %edi
	movl	$0, %eax
.LVL33:
	call	printf
.LVL34:
	.loc 1 164 0
	jmp	.L28
.LVL35:
.L26:
	addq	$8, %rbp
.LBE3:
	.loc 1 155 0
	cmpq	$test_strings+128, %rbp
	jne	.L29
.LBB4:
	.loc 1 159 0
	movl	%ebx, %r14d
.LVL36:
.L28:
.LBE4:
.LBE2:
	.loc 1 167 0
	movq	8(%rsp), %rdx
	movl	%r14d, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
.LVL37:
	.loc 1 168 0
	movl	%ebx, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
.LVL38:
	.loc 1 169 0
	subl	%ebx, %r14d
.LVL39:
	movl	%r14d, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
.LVL40:
	.loc 1 171 0
	movl	%r14d, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL41:
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL42:
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL43:
	ret
	.cfi_endproc
.LFE25:
	.size	test_string_length, .-test_string_length
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"[%s]  %s(\"%s\", '%c') = %d; expected %d\n"
	.text
	.globl	test_contains_char
	.type	test_contains_char, @function
test_contains_char:
.LFB26:
	.loc 1 174 0
	.cfi_startproc
.LVL44:
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	.loc 1 175 0
	movq	%rdi, %rsi
.LVL45:
	movl	$.LC2, %edi
.LVL46:
	movl	$0, %eax
	call	printf
.LVL47:
	movl	$test_strings, %r15d
	.loc 1 176 0
	movl	$0, %ebp
.LVL48:
.L39:
.LBB5:
.LBB6:
	.loc 1 180 0
	movb	$0, 33(%rsp)
.LVL49:
	movl	$97, %ebx
.LVL50:
.L38:
.LBB7:
.LBB8:
	.loc 1 182 0
	leal	1(%rbp), %r14d
.LVL51:
	movb	%bl, 32(%rsp)
	.loc 1 184 0
	movq	(%r15), %r12
	leaq	32(%rsp), %rsi
	movq	%r12, %rdi
	call	strstr
.LVL52:
	testq	%rax, %rax
	setne	%r13b
	movzbl	%r13b, %r13d
.LVL53:
	.loc 1 185 0
	movl	%ebx, 12(%rsp)
	movl	%ebx, %esi
	movq	%r12, %rdi
	movq	16(%rsp), %rax
	call	*%rax
.LVL54:
	.loc 1 186 0
	cmpl	%r13d, %eax
	sete	%dl
	movzbl	%dl, %ecx
	addl	%ecx, %ebp
.LVL55:
	.loc 1 187 0
	cmpl	%r14d, %ebp
	je	.L34
	.loc 1 188 0
	testb	%dl, %dl
	movl	$.LC0, %edx
	movl	$.LC1, %esi
	cmovne	%rdx, %rsi
	movl	%r13d, (%rsp)
	movl	%eax, %r9d
	movl	12(%rsp), %r8d
	movq	%r12, %rcx
	movq	24(%rsp), %rdx
	movl	$.LC7, %edi
	movl	$0, %eax
.LVL56:
	call	printf
.LVL57:
	jmp	.L36
.LVL58:
.L34:
	addl	$1, %ebx
.LVL59:
.LBE8:
	.loc 1 181 0
	cmpl	$123, %ebx
	jne	.L38
	.p2align 4,,5
	jmp	.L37
.L41:
.LBB9:
	.loc 1 186 0
	movl	%ebp, %r14d
	.p2align 4,,2
	jmp	.L36
.L37:
	addq	$8, %r15
.LBE9:
.LBE7:
.LBE6:
	.loc 1 178 0
	cmpq	$test_strings+128, %r15
	jne	.L39
	jmp	.L41
.LVL60:
.L36:
.LBE5:
	.loc 1 196 0
	movq	24(%rsp), %rdx
	movl	%r14d, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
.LVL61:
	.loc 1 197 0
	movl	%ebp, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
.LVL62:
	.loc 1 198 0
	subl	%ebp, %r14d
.LVL63:
	movl	%r14d, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
.LVL64:
	.loc 1 200 0
	movl	%r14d, %eax
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL65:
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL66:
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	test_contains_char, .-test_contains_char
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"[%s]  %s(\"%s\", \"%s\") = %d; expected %d\n"
	.text
	.globl	test_contains_string
	.type	test_contains_string, @function
test_contains_string:
.LFB27:
	.loc 1 203 0
	.cfi_startproc
.LVL67:
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	.loc 1 204 0
	movq	%rdi, %rsi
.LVL68:
	movl	$.LC2, %edi
.LVL69:
	movl	$0, %eax
	call	printf
.LVL70:
	movq	$test_strings, 8(%rsp)
	.loc 1 205 0
	movl	$0, %ebx
	jmp	.L45
.LVL71:
.L51:
.LBB10:
.LBB11:
.LBB12:
	.loc 1 209 0
	leal	1(%rbx), %r15d
.LVL72:
	.loc 1 210 0
	movq	0(%rbp), %r13
	movq	8(%rsp), %rax
	movq	(%rax), %r12
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	strstr
.LVL73:
	testq	%rax, %rax
	setne	%r14b
	movzbl	%r14b, %r14d
.LVL74:
	.loc 1 211 0
	movq	%r13, %rsi
	movq	%r12, %rdi
	movq	16(%rsp), %rax
	call	*%rax
.LVL75:
	.loc 1 212 0
	cmpl	%r14d, %eax
	sete	%dl
	movzbl	%dl, %ecx
	addl	%ecx, %ebx
.LVL76:
	.loc 1 213 0
	cmpl	%r15d, %ebx
	je	.L46
	.loc 1 214 0
	testb	%dl, %dl
	movl	$.LC0, %edx
	movl	$.LC1, %esi
	cmovne	%rdx, %rsi
	movl	%r14d, (%rsp)
	movl	%eax, %r9d
	movq	%r13, %r8
	movq	%r12, %rcx
	movq	24(%rsp), %rdx
	movl	$.LC8, %edi
	movl	$0, %eax
.LVL77:
	call	printf
.LVL78:
	jmp	.L48
.LVL79:
.L46:
	addq	$8, %rbp
.LBE12:
	.loc 1 208 0
	cmpq	$test_strings+128, %rbp
	jne	.L51
	jmp	.L54
.LVL80:
.L45:
.LBE11:
.LBE10:
	.loc 1 203 0 discriminator 1
	movl	$test_strings, %ebp
	jmp	.L51
.LVL81:
.L54:
	addq	$8, 8(%rsp)
.LBB15:
	.loc 1 207 0
	cmpq	$test_strings+128, 8(%rsp)
	jne	.L45
.LBB14:
.LBB13:
	.loc 1 212 0
	movl	%ebx, %r15d
.LVL82:
.L48:
.LBE13:
.LBE14:
.LBE15:
	.loc 1 222 0
	movq	24(%rsp), %rdx
	movl	%r15d, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
.LVL83:
	.loc 1 223 0
	movl	%ebx, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
.LVL84:
	.loc 1 224 0
	subl	%ebx, %r15d
.LVL85:
	movl	%r15d, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
.LVL86:
	.loc 1 226 0
	movl	%r15d, %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL87:
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL88:
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE27:
	.size	test_contains_string, .-test_contains_string
	.section	.rodata.str1.1
.LC9:
	.string	"substring"
.LC10:
	.string	"compaction"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"[FAIL]  substring(\"%s\", %2d, %2d) = NULL; expected a string\n"
	.text
	.globl	test_substring
	.type	test_substring, @function
test_substring:
.LFB28:
	.loc 1 229 0
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 230 0
	movl	$.LC9, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
.LVL89:
.LBB22:
.LBB23:
.LBB24:
	.loc 1 240 0
	movl	$0, %ecx
	movl	$0, %edx
	movl	$.LC10, %esi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
.LVL90:
.LBE24:
.LBE23:
.LBE22:
	.loc 1 270 0
	movl	$.LC9, %edx
	movl	$1, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
.LVL91:
	.loc 1 271 0
	movl	$0, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
.LVL92:
	.loc 1 272 0
	movl	$1, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
.LVL93:
	.loc 1 274 0
	movl	$1, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE28:
	.size	test_substring, .-test_substring
	.section	.rodata.str1.1
.LC12:
	.string	"string_length_a"
.LC13:
	.string	"string_length_p"
.LC14:
	.string	"contains_char_a"
.LC15:
	.string	"contains_char_p"
.LC16:
	.string	"contains_string"
	.text
	.globl	main
	.type	main, @function
main:
.LFB29:
	.loc 1 279 0
	.cfi_startproc
.LVL94:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.LVL95:
	.loc 1 282 0
	movl	$string_length_a, %esi
.LVL96:
	movl	$.LC12, %edi
.LVL97:
	call	test_string_length
.LVL98:
	movl	%eax, %ebx
.LVL99:
	.loc 1 283 0
	movl	$string_length_p, %esi
	movl	$.LC13, %edi
	call	test_string_length
.LVL100:
	addl	%eax, %ebx
.LVL101:
	.loc 1 286 0
	movl	$contains_char_a, %esi
	movl	$.LC14, %edi
	call	test_contains_char
.LVL102:
	addl	%eax, %ebx
.LVL103:
	.loc 1 287 0
	movl	$contains_char_p, %esi
	movl	$.LC15, %edi
	call	test_contains_char
.LVL104:
	addl	%eax, %ebx
.LVL105:
	.loc 1 290 0
	movl	$0, %eax
	call	test_substring
.LVL106:
	addl	%eax, %ebx
.LVL107:
	.loc 1 293 0
	movl	$contains_string, %esi
	movl	$.LC16, %edi
	call	test_contains_string
.LVL108:
	addl	%ebx, %eax
.LVL109:
	.loc 1 296 0
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE29:
	.size	main, .-main
	.section	.rodata.str1.1
.LC17:
	.string	"act"
.LC18:
	.string	"actual"
.LC19:
	.string	"face"
.LC20:
	.string	"face the action"
.LC21:
	.string	"face the faction"
.LC22:
	.string	"factual"
.LC23:
	.string	"facet"
.LC24:
	.string	"facetious"
.LC25:
	.string	"face facet"
.LC26:
	.string	"face facts facetiously"
.LC27:
	.string	"effacing"
.LC28:
	.string	"efface"
.LC29:
	.string	"aaabb"
.LC30:
	.string	"aabb"
.LC31:
	.string	""
	.section	.rodata
	.align 32
	.type	test_strings, @object
	.size	test_strings, 128
test_strings:
	.quad	.LC17
	.quad	.LC10
	.quad	.LC18
	.quad	.LC19
	.quad	.LC20
	.quad	.LC21
	.quad	.LC22
	.quad	.LC23
	.quad	.LC24
	.quad	.LC25
	.quad	.LC26
	.quad	.LC27
	.quad	.LC28
	.quad	.LC29
	.quad	.LC30
	.quad	.LC31
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xcf8
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF73
	.byte	0x1
	.long	.LASF74
	.long	.LASF75
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF8
	.byte	0x2
	.byte	0xd4
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF1
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x8c
	.long	0x46
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x8d
	.long	0x46
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x7
	.long	.LASF42
	.byte	0xd8
	.byte	0x4
	.byte	0xf6
	.long	0x224
	.uleb128 0x8
	.long	.LASF13
	.byte	0x4
	.byte	0xf7
	.long	0x3f
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x4
	.byte	0xfc
	.long	0x96
	.byte	0x8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x4
	.byte	0xfd
	.long	0x96
	.byte	0x10
	.uleb128 0x8
	.long	.LASF16
	.byte	0x4
	.byte	0xfe
	.long	0x96
	.byte	0x18
	.uleb128 0x8
	.long	.LASF17
	.byte	0x4
	.byte	0xff
	.long	0x96
	.byte	0x20
	.uleb128 0x9
	.long	.LASF18
	.byte	0x4
	.value	0x100
	.long	0x96
	.byte	0x28
	.uleb128 0x9
	.long	.LASF19
	.byte	0x4
	.value	0x101
	.long	0x96
	.byte	0x30
	.uleb128 0x9
	.long	.LASF20
	.byte	0x4
	.value	0x102
	.long	0x96
	.byte	0x38
	.uleb128 0x9
	.long	.LASF21
	.byte	0x4
	.value	0x103
	.long	0x96
	.byte	0x40
	.uleb128 0x9
	.long	.LASF22
	.byte	0x4
	.value	0x105
	.long	0x96
	.byte	0x48
	.uleb128 0x9
	.long	.LASF23
	.byte	0x4
	.value	0x106
	.long	0x96
	.byte	0x50
	.uleb128 0x9
	.long	.LASF24
	.byte	0x4
	.value	0x107
	.long	0x96
	.byte	0x58
	.uleb128 0x9
	.long	.LASF25
	.byte	0x4
	.value	0x109
	.long	0x25c
	.byte	0x60
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.value	0x10b
	.long	0x262
	.byte	0x68
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.value	0x10d
	.long	0x3f
	.byte	0x70
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.value	0x111
	.long	0x3f
	.byte	0x74
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.value	0x113
	.long	0x77
	.byte	0x78
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.value	0x117
	.long	0x5b
	.byte	0x80
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.value	0x118
	.long	0x69
	.byte	0x82
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.value	0x119
	.long	0x268
	.byte	0x83
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.value	0x11d
	.long	0x278
	.byte	0x88
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.value	0x126
	.long	0x82
	.byte	0x90
	.uleb128 0x9
	.long	.LASF35
	.byte	0x4
	.value	0x12f
	.long	0x94
	.byte	0x98
	.uleb128 0x9
	.long	.LASF36
	.byte	0x4
	.value	0x130
	.long	0x94
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x4
	.value	0x131
	.long	0x94
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x4
	.value	0x132
	.long	0x94
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x4
	.value	0x133
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF40
	.byte	0x4
	.value	0x135
	.long	0x3f
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x4
	.value	0x137
	.long	0x27e
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF76
	.byte	0x4
	.byte	0x9b
	.uleb128 0x7
	.long	.LASF43
	.byte	0x18
	.byte	0x4
	.byte	0xa1
	.long	0x25c
	.uleb128 0x8
	.long	.LASF44
	.byte	0x4
	.byte	0xa2
	.long	0x25c
	.byte	0
	.uleb128 0x8
	.long	.LASF45
	.byte	0x4
	.byte	0xa3
	.long	0x262
	.byte	0x8
	.uleb128 0x8
	.long	.LASF46
	.byte	0x4
	.byte	0xa7
	.long	0x3f
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22b
	.uleb128 0x6
	.byte	0x8
	.long	0xa3
	.uleb128 0xb
	.long	0x9c
	.long	0x278
	.uleb128 0xc
	.long	0x8d
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x224
	.uleb128 0xb
	.long	0x9c
	.long	0x28e
	.uleb128 0xc
	.long	0x8d
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x294
	.uleb128 0xd
	.long	0x9c
	.uleb128 0xe
	.long	.LASF47
	.byte	0x1
	.byte	0x17
	.long	0x3f
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x2d7
	.uleb128 0xf
	.string	"str"
	.byte	0x1
	.byte	0x17
	.long	0x96
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x10
	.long	.LASF49
	.byte	0x1
	.byte	0x18
	.long	0x3f
	.long	.LLST0
	.byte	0
	.uleb128 0xe
	.long	.LASF48
	.byte	0x1
	.byte	0x29
	.long	0x3f
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x315
	.uleb128 0x11
	.string	"str"
	.byte	0x1
	.byte	0x29
	.long	0x96
	.long	.LLST1
	.uleb128 0x12
	.long	.LASF50
	.byte	0x1
	.byte	0x2b
	.long	0x96
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0xe
	.long	.LASF51
	.byte	0x1
	.byte	0x3e
	.long	0x3f
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x360
	.uleb128 0x13
	.long	.LASF52
	.byte	0x1
	.byte	0x3e
	.long	0x96
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x14
	.long	.LASF53
	.byte	0x1
	.byte	0x3e
	.long	0x9c
	.long	.LLST2
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x3f
	.long	0x3f
	.long	.LLST3
	.byte	0
	.uleb128 0xe
	.long	.LASF54
	.byte	0x1
	.byte	0x53
	.long	0x3f
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x3a0
	.uleb128 0x14
	.long	.LASF52
	.byte	0x1
	.byte	0x53
	.long	0x96
	.long	.LLST4
	.uleb128 0x14
	.long	.LASF53
	.byte	0x1
	.byte	0x53
	.long	0x9c
	.long	.LLST5
	.byte	0
	.uleb128 0xe
	.long	.LASF55
	.byte	0x1
	.byte	0x7c
	.long	0x3f
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x3dc
	.uleb128 0x13
	.long	.LASF52
	.byte	0x1
	.byte	0x7c
	.long	0x96
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x13
	.long	.LASF53
	.byte	0x1
	.byte	0x7c
	.long	0x96
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x16
	.long	.LASF71
	.byte	0x1
	.byte	0x6d
	.long	0x96
	.byte	0x1
	.long	0x40e
	.uleb128 0x17
	.long	.LASF52
	.byte	0x1
	.byte	0x6d
	.long	0x96
	.uleb128 0x17
	.long	.LASF56
	.byte	0x1
	.byte	0x6d
	.long	0x3f
	.uleb128 0x18
	.string	"end"
	.byte	0x1
	.byte	0x6d
	.long	0x3f
	.byte	0
	.uleb128 0x19
	.long	0x3dc
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x43f
	.uleb128 0x1a
	.long	0x3ec
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1a
	.long	0x3f7
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1a
	.long	0x402
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0xe
	.long	.LASF57
	.byte	0x1
	.byte	0x97
	.long	0x3f
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x5c1
	.uleb128 0x14
	.long	.LASF58
	.byte	0x1
	.byte	0x97
	.long	0x96
	.long	.LLST6
	.uleb128 0x11
	.string	"fp"
	.byte	0x1
	.byte	0x97
	.long	0x5d0
	.long	.LLST7
	.uleb128 0x10
	.long	.LASF59
	.byte	0x1
	.byte	0x99
	.long	0x3f
	.long	.LLST8
	.uleb128 0x10
	.long	.LASF60
	.byte	0x1
	.byte	0x9a
	.long	0x3f
	.long	.LLST9
	.uleb128 0x1b
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x526
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x9b
	.long	0x3f
	.long	.LLST10
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0
	.uleb128 0x15
	.string	"len"
	.byte	0x1
	.byte	0x9d
	.long	0x3f
	.long	.LLST11
	.uleb128 0x15
	.string	"s"
	.byte	0x1
	.byte	0x9e
	.long	0x3f
	.long	.LLST12
	.uleb128 0x1d
	.quad	.LVL31
	.long	0x4f2
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL34
	.long	0xccd
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x5
	.byte	0x91
	.sleb128 -76
	.byte	0x94
	.byte	0x4
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.quad	.LVL27
	.long	0xccd
	.long	0x54d
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0
	.uleb128 0x20
	.quad	.LVL37
	.long	0xccd
	.long	0x57a
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0
	.uleb128 0x20
	.quad	.LVL38
	.long	0xccd
	.long	0x59f
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL40
	.long	0xccd
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	0x3f
	.long	0x5d0
	.uleb128 0x22
	.long	0x96
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x5c1
	.uleb128 0xe
	.long	.LASF61
	.byte	0x1
	.byte	0xae
	.long	0x3f
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x7c9
	.uleb128 0x14
	.long	.LASF58
	.byte	0x1
	.byte	0xae
	.long	0x96
	.long	.LLST13
	.uleb128 0x11
	.string	"fp"
	.byte	0x1
	.byte	0xae
	.long	0x7dd
	.long	.LLST14
	.uleb128 0x10
	.long	.LASF59
	.byte	0x1
	.byte	0xb0
	.long	0x3f
	.long	.LLST15
	.uleb128 0x10
	.long	.LASF60
	.byte	0x1
	.byte	0xb1
	.long	0x3f
	.long	.LLST16
	.uleb128 0x1b
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.long	0x72e
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0xb2
	.long	0x3f
	.long	.LLST17
	.uleb128 0x23
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x12
	.long	.LASF53
	.byte	0x1
	.byte	0xb3
	.long	0x7e3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x23
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x15
	.string	"c"
	.byte	0x1
	.byte	0xb5
	.long	0x9c
	.long	.LLST18
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x30
	.uleb128 0x10
	.long	.LASF62
	.byte	0x1
	.byte	0xb8
	.long	0x3f
	.long	.LLST19
	.uleb128 0x15
	.string	"s"
	.byte	0x1
	.byte	0xb9
	.long	0x3f
	.long	.LLST20
	.uleb128 0x20
	.quad	.LVL52
	.long	0xce4
	.long	0x6d2
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x24
	.quad	.LVL54
	.uleb128 0x4
	.byte	0x91
	.sleb128 -96
	.byte	0x6
	.long	0x6f1
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL57
	.long	0xccd
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x91
	.sleb128 -88
	.byte	0x6
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x5
	.byte	0x91
	.sleb128 -100
	.byte	0x94
	.byte	0x4
	.uleb128 0x1e
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.quad	.LVL47
	.long	0xccd
	.long	0x755
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x91
	.sleb128 -88
	.byte	0x6
	.byte	0
	.uleb128 0x20
	.quad	.LVL61
	.long	0xccd
	.long	0x782
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x91
	.sleb128 -88
	.byte	0x6
	.byte	0
	.uleb128 0x20
	.quad	.LVL62
	.long	0xccd
	.long	0x7a7
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL64
	.long	0xccd
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	0x3f
	.long	0x7dd
	.uleb128 0x22
	.long	0x96
	.uleb128 0x22
	.long	0x9c
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x7c9
	.uleb128 0xb
	.long	0x9c
	.long	0x7f3
	.uleb128 0xc
	.long	0x8d
	.byte	0x1
	.byte	0
	.uleb128 0xe
	.long	.LASF63
	.byte	0x1
	.byte	0xcb
	.long	0x3f
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x9a9
	.uleb128 0x14
	.long	.LASF58
	.byte	0x1
	.byte	0xcb
	.long	0x96
	.long	.LLST21
	.uleb128 0x11
	.string	"fp"
	.byte	0x1
	.byte	0xcb
	.long	0x9bd
	.long	.LLST22
	.uleb128 0x10
	.long	.LASF59
	.byte	0x1
	.byte	0xcd
	.long	0x3f
	.long	.LLST23
	.uleb128 0x10
	.long	.LASF60
	.byte	0x1
	.byte	0xce
	.long	0x3f
	.long	.LLST24
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x60
	.long	0x90e
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0xcf
	.long	0x3f
	.long	.LLST25
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x90
	.uleb128 0x15
	.string	"j"
	.byte	0x1
	.byte	0xd0
	.long	0x3f
	.long	.LLST26
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0xc0
	.uleb128 0x10
	.long	.LASF62
	.byte	0x1
	.byte	0xd2
	.long	0x3f
	.long	.LLST27
	.uleb128 0x15
	.string	"s"
	.byte	0x1
	.byte	0xd3
	.long	0x3f
	.long	.LLST28
	.uleb128 0x20
	.quad	.LVL73
	.long	0xce4
	.long	0x8b6
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x24
	.quad	.LVL75
	.uleb128 0x4
	.byte	0x91
	.sleb128 -80
	.byte	0x6
	.long	0x8d5
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL78
	.long	0xccd
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1e
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.quad	.LVL70
	.long	0xccd
	.long	0x935
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0
	.uleb128 0x20
	.quad	.LVL83
	.long	0xccd
	.long	0x962
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0
	.uleb128 0x20
	.quad	.LVL84
	.long	0xccd
	.long	0x987
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL86
	.long	0xccd
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	0x3f
	.long	0x9bd
	.uleb128 0x22
	.long	0x96
	.uleb128 0x22
	.long	0x96
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9a9
	.uleb128 0x26
	.long	.LASF77
	.byte	0x1
	.byte	0xe5
	.long	0x3f
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0xb4f
	.uleb128 0x27
	.long	.LASF59
	.byte	0x1
	.byte	0xe7
	.long	0x3f
	.byte	0
	.uleb128 0x27
	.long	.LASF60
	.byte	0x1
	.byte	0xe8
	.long	0x3f
	.byte	0x1
	.uleb128 0x28
	.string	"str"
	.byte	0x1
	.byte	0xe9
	.long	0x96
	.uleb128 0xa
	.byte	0x3
	.quad	.LC10
	.byte	0x9f
	.uleb128 0x29
	.string	"len"
	.byte	0x1
	.byte	0xea
	.long	0x3f
	.byte	0xa
	.uleb128 0x1b
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.long	0xaad
	.uleb128 0x27
	.long	.LASF56
	.byte	0x1
	.byte	0xeb
	.long	0x3f
	.byte	0
	.uleb128 0x23
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.uleb128 0x29
	.string	"end"
	.byte	0x1
	.byte	0xec
	.long	0x3f
	.byte	0
	.uleb128 0x23
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.uleb128 0x2a
	.long	.LASF78
	.byte	0x1
	.byte	0xee
	.long	0x96
	.uleb128 0x1f
	.quad	.LVL90
	.long	0xccd
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC10
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.quad	.LVL89
	.long	0xccd
	.long	0xad9
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.byte	0
	.uleb128 0x20
	.quad	.LVL91
	.long	0xccd
	.long	0xb0a
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.byte	0
	.uleb128 0x20
	.quad	.LVL92
	.long	0xccd
	.long	0xb2e
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1f
	.quad	.LVL93
	.long	0xccd
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	.LASF64
	.byte	0x1
	.value	0x117
	.long	0x3f
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0xc87
	.uleb128 0x2c
	.long	.LASF65
	.byte	0x1
	.value	0x117
	.long	0x3f
	.long	.LLST29
	.uleb128 0x2c
	.long	.LASF66
	.byte	0x1
	.value	0x117
	.long	0xc87
	.long	.LLST30
	.uleb128 0x2d
	.long	.LASF67
	.byte	0x1
	.value	0x118
	.long	0x3f
	.long	.LLST31
	.uleb128 0x20
	.quad	.LVL98
	.long	0x43f
	.long	0xbcd
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC12
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	string_length_a
	.byte	0
	.uleb128 0x20
	.quad	.LVL100
	.long	0x43f
	.long	0xbf9
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC13
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	string_length_p
	.byte	0
	.uleb128 0x20
	.quad	.LVL102
	.long	0x5d6
	.long	0xc25
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC14
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	contains_char_a
	.byte	0
	.uleb128 0x20
	.quad	.LVL104
	.long	0x5d6
	.long	0xc51
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC15
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	contains_char_p
	.byte	0
	.uleb128 0x2e
	.quad	.LVL106
	.long	0x9c3
	.uleb128 0x1f
	.quad	.LVL108
	.long	0x7f3
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC16
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	contains_string
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x96
	.uleb128 0xb
	.long	0x96
	.long	0xc9d
	.uleb128 0xc
	.long	0x8d
	.byte	0xf
	.byte	0
	.uleb128 0x12
	.long	.LASF68
	.byte	0x1
	.byte	0x83
	.long	0xcb2
	.uleb128 0x9
	.byte	0x3
	.quad	test_strings
	.uleb128 0xd
	.long	0xc8d
	.uleb128 0x2f
	.long	.LASF69
	.byte	0x5
	.byte	0xa8
	.long	0x262
	.uleb128 0x2f
	.long	.LASF70
	.byte	0x5
	.byte	0xa9
	.long	0x262
	.uleb128 0x30
	.long	.LASF72
	.byte	0x5
	.value	0x16a
	.long	0x3f
	.long	0xce4
	.uleb128 0x22
	.long	0x28e
	.uleb128 0x31
	.byte	0
	.uleb128 0x32
	.long	.LASF79
	.byte	0x6
	.value	0x152
	.long	0x96
	.uleb128 0x22
	.long	0x28e
	.uleb128 0x22
	.long	0x28e
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2113
	.uleb128 0x18
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL1-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL3-.Ltext0
	.quad	.LFE19-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL4-.Ltext0
	.quad	.LVL5-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL5-.Ltext0
	.quad	.LVL7-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL7-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL8-.Ltext0
	.quad	.LVL9-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL10-.Ltext0
	.quad	.LVL13-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL13-.Ltext0
	.quad	.LFE21-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL12-.Ltext0
	.quad	.LVL15-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL16-.Ltext0
	.quad	.LVL17-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL17-.Ltext0
	.quad	.LVL18-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL19-.Ltext0
	.quad	.LVL21-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL21-.Ltext0
	.quad	.LFE22-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL19-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL20-.Ltext0
	.quad	.LFE22-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL24-.Ltext0
	.quad	.LVL26-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL26-.Ltext0
	.quad	.LVL27-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL27-1-.Ltext0
	.quad	.LFE25-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL24-.Ltext0
	.quad	.LVL25-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL25-.Ltext0
	.quad	.LVL43-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL43-.Ltext0
	.quad	.LFE25-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL27-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL28-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL27-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL28-.Ltext0
	.quad	.LVL29-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL29-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL35-.Ltext0
	.quad	.LVL36-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL36-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL27-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL30-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL42-.Ltext0
	.quad	.LFE25-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -76
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL31-.Ltext0
	.quad	.LVL33-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL33-.Ltext0
	.quad	.LVL34-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL35-.Ltext0
	.quad	.LVL36-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL44-.Ltext0
	.quad	.LVL46-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL46-.Ltext0
	.quad	.LVL47-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL47-1-.Ltext0
	.quad	.LFE26-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL44-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL45-.Ltext0
	.quad	.LFE26-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -96
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL47-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL48-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL47-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL48-.Ltext0
	.quad	.LVL51-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL51-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL58-.Ltext0
	.quad	.LVL60-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL60-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL47-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL49-.Ltext0
	.quad	.LVL50-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x61
	.byte	0x9f
	.quad	.LVL50-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL58-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL53-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL54-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL56-.Ltext0
	.quad	.LVL57-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL58-.Ltext0
	.quad	.LVL60-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL67-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL69-.Ltext0
	.quad	.LVL70-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL70-1-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL67-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL68-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL70-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL71-.Ltext0
	.quad	.LVL87-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL70-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL71-.Ltext0
	.quad	.LVL72-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL72-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL79-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL82-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL70-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL80-.Ltext0
	.quad	.LVL81-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL74-.Ltext0
	.quad	.LVL80-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL81-.Ltext0
	.quad	.LVL88-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL75-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL77-.Ltext0
	.quad	.LVL78-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL79-.Ltext0
	.quad	.LVL80-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL81-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL94-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL97-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL94-.Ltext0
	.quad	.LVL96-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL96-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL95-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL99-.Ltext0
	.quad	.LVL100-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL100-1-.Ltext0
	.quad	.LVL108-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL108-.Ltext0
	.quad	.LVL109-.Ltext0
	.value	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL109-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB3-.Ltext0
	.quad	.LBE3-.Ltext0
	.quad	.LBB4-.Ltext0
	.quad	.LBE4-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB8-.Ltext0
	.quad	.LBE8-.Ltext0
	.quad	.LBB9-.Ltext0
	.quad	.LBE9-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB10-.Ltext0
	.quad	.LBE10-.Ltext0
	.quad	.LBB15-.Ltext0
	.quad	.LBE15-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB11-.Ltext0
	.quad	.LBE11-.Ltext0
	.quad	.LBB14-.Ltext0
	.quad	.LBE14-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB12-.Ltext0
	.quad	.LBE12-.Ltext0
	.quad	.LBB13-.Ltext0
	.quad	.LBE13-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF21:
	.string	"_IO_buf_end"
.LASF78:
	.string	"result"
.LASF29:
	.string	"_old_offset"
.LASF74:
	.string	"practice.c"
.LASF24:
	.string	"_IO_save_end"
.LASF50:
	.string	"temp"
.LASF7:
	.string	"short int"
.LASF8:
	.string	"size_t"
.LASF77:
	.string	"test_substring"
.LASF11:
	.string	"sizetype"
.LASF34:
	.string	"_offset"
.LASF18:
	.string	"_IO_write_ptr"
.LASF13:
	.string	"_flags"
.LASF62:
	.string	"contains"
.LASF20:
	.string	"_IO_buf_base"
.LASF25:
	.string	"_markers"
.LASF15:
	.string	"_IO_read_end"
.LASF49:
	.string	"index"
.LASF73:
	.string	"GNU C 4.8.5 20150623 (Red Hat 4.8.5-44) -m64 -mtune=generic -march=x86-64 -g -O -std=c99"
.LASF53:
	.string	"needle"
.LASF2:
	.string	"long long int"
.LASF67:
	.string	"fail"
.LASF33:
	.string	"_lock"
.LASF1:
	.string	"long int"
.LASF71:
	.string	"substring"
.LASF30:
	.string	"_cur_column"
.LASF75:
	.string	"/students/dc103/cs240-repos/cmemory"
.LASF46:
	.string	"_pos"
.LASF66:
	.string	"argv"
.LASF45:
	.string	"_sbuf"
.LASF42:
	.string	"_IO_FILE"
.LASF51:
	.string	"contains_char_a"
.LASF3:
	.string	"unsigned char"
.LASF65:
	.string	"argc"
.LASF6:
	.string	"signed char"
.LASF48:
	.string	"string_length_p"
.LASF54:
	.string	"contains_char_p"
.LASF55:
	.string	"contains_string"
.LASF5:
	.string	"unsigned int"
.LASF43:
	.string	"_IO_marker"
.LASF32:
	.string	"_shortbuf"
.LASF68:
	.string	"test_strings"
.LASF17:
	.string	"_IO_write_base"
.LASF41:
	.string	"_unused2"
.LASF58:
	.string	"fname"
.LASF14:
	.string	"_IO_read_ptr"
.LASF56:
	.string	"start"
.LASF4:
	.string	"short unsigned int"
.LASF59:
	.string	"pass"
.LASF12:
	.string	"char"
.LASF64:
	.string	"main"
.LASF44:
	.string	"_next"
.LASF35:
	.string	"__pad1"
.LASF36:
	.string	"__pad2"
.LASF37:
	.string	"__pad3"
.LASF38:
	.string	"__pad4"
.LASF39:
	.string	"__pad5"
.LASF52:
	.string	"haystack"
.LASF0:
	.string	"long unsigned int"
.LASF19:
	.string	"_IO_write_end"
.LASF10:
	.string	"__off64_t"
.LASF9:
	.string	"__off_t"
.LASF26:
	.string	"_chain"
.LASF23:
	.string	"_IO_backup_base"
.LASF69:
	.string	"stdin"
.LASF28:
	.string	"_flags2"
.LASF40:
	.string	"_mode"
.LASF16:
	.string	"_IO_read_base"
.LASF79:
	.string	"strstr"
.LASF57:
	.string	"test_string_length"
.LASF31:
	.string	"_vtable_offset"
.LASF60:
	.string	"total"
.LASF63:
	.string	"test_contains_string"
.LASF22:
	.string	"_IO_save_base"
.LASF72:
	.string	"printf"
.LASF27:
	.string	"_fileno"
.LASF47:
	.string	"string_length_a"
.LASF61:
	.string	"test_contains_char"
.LASF70:
	.string	"stdout"
.LASF76:
	.string	"_IO_lock_t"
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
