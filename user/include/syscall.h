#define SYS_write 4

#define _syscall_return(type) \
	type ret; \
	__asm volatile ("mov %[result], r0" \
			: [result] "=r" (ret) \
			: \
			:); \
	return ret;


#define _syscall0(type, sys) \
	__asm volatile ("mov r7, %[input_i]" \
			: \
			: [input_i] "r" (sys) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type);


#define _syscall1(type, sys, arg0) \
	__asm volatile ("mov r0, %[input_i]" \
			: \
			: [input_i] "r" (arg0) \
			:); \
	__asm volatile ("mov r7, %[input_i]" \
			: \
			: [input_i] "r" (sys) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type);


#define _syscall2(type, sys, arg0, arg1) \
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
			: [input_i] "r" (sys) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type);


#define _syscall3(type, sys, arg0, arg1, arg2) \
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
			: [input_i] "r" (sys) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type);


#define _syscall4(type, sys, arg0, arg1, arg2, arg3) \
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
			: [input_i] "r" (sys) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type);


#define _syscall5(type, sys, arg0, arg1, arg2, arg3, arg4) \
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
			: [input_i] "r" (sys) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type);


#define _syscall6(type, sys, arg0, arg1, arg2, arg3, arg4, arg5) \
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
			: [input_i] "r" (sys) \
			:); \
	__asm volatile ("svc #0"); \
	_syscall_return(type);
