#include <llanox/string.h>
#include <inttypes.h>


char *itoa(int value, char *buffer, int base)
{

	char *ptr = buffer;

	if (base == 10 && value < 0) {
		*ptr++ = '-';
		value *= -1;
	}

	uint32_t div = value;
	uint32_t mod;

	if (!div)
		*buffer++ = 0x30;

	while (div) {
		mod = div % base;

		if (mod > 9)
			mod += 0x57;
		else 
			mod += 0x30;

		*buffer++ = mod;
		div /= base;
	}

	*buffer = 0;

	return strrev(ptr);
}
