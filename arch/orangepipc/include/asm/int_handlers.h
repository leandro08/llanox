#define SAVE_REGS \
	__asm volatile ("stmfd sp!, {r0-r12, lr}")

#define RESTORE_REGS \
	__asm volatile ("ldmfd sp!, {r0-r12, lr}")

#define REG_0  0x00
#define REG_1  0x04
#define REG_2  0x08
#define REG_3  0x0C
#define REG_4  0x10
#define REG_5  0x14
#define REG_6  0x18
#define REG_7  0x1C
#define REG_8  0x20
#define REG_9  0x24
#define REG_10 0x28
#define REG_11 0x2C
#define REG_12 0x30
#define REG_14 0x34

