#define __NR_write 4

#define _syscall_return(type) \
	type ret; \
	__asm volatile ("mov %[result], r0" \
			: [result] "=r" (ret) \
			: \
			:); \
	return ret;

#define _syscall0(type, name) \
type name(void) \
{ \
	__asm volatile ("mov r7, %[input_i]" \
			: \
			: [input_i] "r" (__NR_##name) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type); \
}

#define _syscall1(type, name, type0, arg0) \
type name(type0 arg0) \
{ \
	__asm volatile ("mov r0, %[input_i]" \
			: \
			: [input_i] "r" (arg0) \
			:); \
	__asm volatile ("mov r7, %[input_i]" \
			: \
			: [input_i] "r" (__NR_##name) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type); \
}

#define _syscall2(type, name, type0, arg0, type1, arg1) \
type name(type0 arg0, type1 arg1) \
{ \
	__asm volatile ("mov r0, %[input_i]" \
			: \
			: [input_i] "r" (arg0) \
			:); \
	__asm volatile ("mov r1, %[input_i]" \
			: \
			: [input_i] "r" (arg1) \
			:); \
	__asm volatile ("mov r7, %[input_i]" \
			: \
			: [input_i] "r" (__NR_##name) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type); \
}

#define _syscall3(type, name, type0, arg0, type1, arg1, type2, arg2) \
type name(type0 arg0, type1 arg1, type2 arg2) \
{ \
	__asm volatile ("mov r0, %[input_i]" \
			: \
			: [input_i] "r" (arg0) \
			:); \
	__asm volatile ("mov r1, %[input_i]" \
			: \
			: [input_i] "r" (arg1) \
			:); \
	__asm volatile ("mov r2, %[input_i]" \
			: \
			: [input_i] "r" (arg2) \
			:); \
	__asm volatile ("mov r7, %[input_i]" \
			: \
			: [input_i] "r" (__NR_##name) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type); \
}

#define _syscall4(type, name, type0, arg0, type1, arg1, type2, arg2, type3, arg3) \
type name(type0 arg0, type1 arg1, type2 arg2, type3 arg3) \
{ \
	__asm volatile ("mov r0, %[input_i]" \
			: \
			: [input_i] "r" (arg0) \
			:); \
	__asm volatile ("mov r1, %[input_i]" \
			: \
			: [input_i] "r" (arg1) \
			:); \
	__asm volatile ("mov r2, %[input_i]" \
			: \
			: [input_i] "r" (arg2) \
			:); \
	__asm volatile ("mov r3, %[input_i]" \
			: \
			: [input_i] "r" (arg3) \
			:); \
	__asm volatile ("mov r7, %[input_i]" \
			: \
			: [input_i] "r" (__NR_##name) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type); \
}

#define _syscall5(type, name, type0, arg0, type1, arg1, type2, arg2, type3, arg3, type4, arg4) \
type name(type0 arg0, type1 arg1, type2 arg2, type3 arg3, type4 arg4) \
{ \
	__asm volatile ("mov r0, %[input_i]" \
			: \
			: [input_i] "r" (arg0) \
			:); \
	__asm volatile ("mov r1, %[input_i]" \
			: \
			: [input_i] "r" (arg1) \
			:); \
	__asm volatile ("mov r2, %[input_i]" \
			: \
			: [input_i] "r" (arg2) \
			:); \
	__asm volatile ("mov r3, %[input_i]" \
			: \
			: [input_i] "r" (arg3) \
			:); \
	__asm volatile ("mov r4, %[input_i]" \
			: \
			: [input_i] "r" (arg4) \
			:); \
	__asm volatile ("mov r7, %[input_i]" \
			: \
			: [input_i] "r" (__NR_##name) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type); \
}

#define _syscall6(type, name, type0, arg0, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5) \
type name(type0 arg0, type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5) \
{ \
	__asm volatile ("mov r0, %[input_i]" \
			: \
			: [input_i] "r" (arg0) \
			:); \
	__asm volatile ("mov r1, %[input_i]" \
			: \
			: [input_i] "r" (arg1) \
			:); \
	__asm volatile ("mov r2, %[input_i]" \
			: \
			: [input_i] "r" (arg2) \
			:); \
	__asm volatile ("mov r3, %[input_i]" \
			: \
			: [input_i] "r" (arg3) \
			:); \
	__asm volatile ("mov r4, %[input_i]" \
			: \
			: [input_i] "r" (arg4) \
			:); \
	__asm volatile ("mov r5, %[input_i]" \
			: \
			: [input_i] "r" (arg5) \
			:); \
	__asm volatile ("mov r7, %[input_i]" \
			: \
			: [input_i] "r" (__NR_##name) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type); \
}
