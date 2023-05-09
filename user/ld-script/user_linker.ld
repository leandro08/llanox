MEMORY
{
	USER_RAM   (rwx) : ORIGIN = 0x50008000, LENGTH = 768M
}

ENTRY(main)

SECTIONS
{
	.text : {
		_start_user = .;
		*(.text.main)
		*(.text*)
		. = ALIGN(4);
		*(.rodata*)	
		. = ALIGN(4);
		_user_etext = .;
	} > USER_RAM
	
	.data : { 
		_user_data = .;
		*(.data*)
		. = ALIGN(4);
		_user_edata = .;
	} > USER_RAM

	.bss : {
		__bss_start__ = .;
		*(.bss*)
		*(COMMON)
		. = ALIGN(4);
		__bss_end__ = .;
	} > USER_RAM

	. = ALIGN(4); 
	_end_user = .;
}

