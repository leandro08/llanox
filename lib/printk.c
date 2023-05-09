#include <inttypes.h>
#include <asm/serial.h>
#include <llanox/string.h>
#include <llanox/stdlib.h>
#include <stdarg.h>

static void set_zeros(int size_addr, int len, int *count)
{
	if (len < size_addr) {
		len = size_addr - len;
		while (len--) {
			uart0_send('0');
			(*count)++;
		}
	}
}

int printk(const char *format, ...)
{
	va_list args;
	va_start(args, format);
	int count = 0; 
	char buffer[35];
	char *aux_ptr;
	int size_buf;

	while (*format) {
		if (*format == '%') {
			aux_ptr = buffer;
			bzero(buffer, sizeof(buffer));
			switch (*++format) {
                 		case 'd':
					itoa(va_arg(args, int), buffer, 10);
					break;
				case 'c':
					buffer[0] = va_arg(args, int);
					break;
				case 'p': 
					uart0_send('0');
					uart0_send('x');
					itoa(va_arg(args, int), buffer, 16);
					size_buf = strlen(buffer);
					set_zeros(2 * sizeof(void *), size_buf, &count);
					break;
				case 'x':
					itoa(va_arg(args, int), buffer, 16); 
					break;
				case 's':
					aux_ptr = va_arg(args, char *);
					break;
			}
			format++;

			while (*aux_ptr) {
				uart0_send(*aux_ptr++);
				count++;
			}
			
		} else {
			uart0_send(*format++);
			count++;
		}
	}
	va_end(args);
	return count;
}
