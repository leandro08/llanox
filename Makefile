ARMGNU = arm-none-eabi
MKIMAGE = mkimage
SYS_FLAGS = -fPIC -Wall -O2 -I "./include" -I "./arch/orangepipc/include" -Wl,-T,"arch/orangepipc/ld-script/linker.ld" -mcpu=cortex-a7 -mfpu=vfp -nostdlib -nostartfiles -ffreestanding

USER_FLAGS = -ffunction-sections -fPIC -Wall -O2 -I "./user/include" -Wl,-T,"user/ld-script/user_linker.ld" -mcpu=cortex-a7 -mfpu=vfp

all : clean image

clean :
	rm -f ./build/*.bin
	rm -f ./build/*.elf
	rm -f ./build/uImage

image :
	$(ARMGNU)-gcc $(USER_FLAGS) $(shell find ./user/ -name "*.c") -o ./build/user.elf
	$(ARMGNU)-objcopy ./build/user.elf -O binary ./build/user.bin
	$(ARMGNU)-objdump -dS ./build/user.elf > ./build/asm_user.S
	$(ARMGNU)-gcc $(SYS_FLAGS) $(shell find -name "*.c" -not -path "./user/*") $(shell find ./arch/ -name "*.S") -o ./build/llanox.elf
	$(ARMGNU)-objcopy ./build/llanox.elf -O binary ./build/llanox.bin
	$(ARMGNU)-objdump -DdSh ./build/llanox.elf > ./build/asm.S
	$(MKIMAGE) -A arm -O linux -n llanox -T kernel -C none -a 0x40008000 -e 0x40008000 -d ./build/llanox.bin ./build/uImage
