MEMORY
{
	SYSTEM_RAM (rwx) : ORIGIN = 0x40008000, LENGTH = 1023M
}

PROVIDE(sys_stack_base = ORIGIN(SYSTEM_RAM) + LENGTH(SYSTEM_RAM));
ENTRY(__start);

SECTIONS
{
	.text : {
		__vectors_start = .;
		*(.int_vector)	
		__vectors_end = .;
		*(.boot)
		*(.text*)
		. = ALIGN(4);
		*(.rodata*)	
		. = ALIGN(4);
		user_start = .;
		*(.user)
		. = ALIGN(4);
		user_end = .;
		. = ALIGN(4);
		_etext = .;
	} > SYSTEM_RAM
	

	.data : {
		_data = .;
		*(.data*)
		. = ALIGN(4);
		_edata = .;
	} > SYSTEM_RAM

	.bss : {
		_bss = .;
		*(.bss*)
		*(COMMON)
		. = ALIGN(4);
		_ebss = .;
	} > SYSTEM_RAM

}
