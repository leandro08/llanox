#include <llanox/string.h>
#include <inttypes.h>


// copy functions

#ifndef ARCH_MEMCPY

void *memcpy( void *dst, const void *src, uint32_t size)
{
	uint8_t *tmp_dst = dst;
	const uint8_t *tmp_src = src;

	while (size--)
		*tmp_dst++ = *tmp_src++;

	return dst;
}

#endif


#ifndef ARCH_MEMMOVE

void *memmove(void *dst, const void *src, uint32_t size)
{
	const uint8_t *tmp_src = src;
	uint8_t *tmp_dst = dst;
	uint8_t buffer[size];
	uint32_t i;

	for (i = 0; i < size; i++) 
		buffer[i] = tmp_src[i]; 

	for (i = 0; i < size; i++) 
		*tmp_dst++ = buffer[i];

	return dst;
}

#endif

#ifndef ARCH_STRCPY

char *strcpy(char *dst, const char *src)
{
	char *tmp_dst = dst;

	while (*src != 0) 
		*tmp_dst++ = *src++;
		
	*tmp_dst = 0;
	return dst;
}

#endif

#ifndef ARCH_STRNCPY

char *strncpy(char *dst, const char *src, uint32_t size)
{
	char *tmp_dst = dst;
	
	while (size && *src != 0) {
		*tmp_dst++ = *src++;
		size--;
	}

	if (*src)
		return dst;
	
	while (size--) 
		*tmp_dst++ = 0;
	
	return dst;
}

#endif


// concatenation functions

#ifndef ARCH_STRCAT

char *strcat(char *dst, const char *src)
{
	char *tmp_dst = dst;
	
	while (*tmp_dst++ != 0)

	while (*src != 0)
		*tmp_dst++ = *src++;

	*tmp_dst = 0;
	return dst;	
}

#endif

#ifndef ARCH_STRNCAT

char *strncat(char *dst, const char *src, uint32_t size)
{
	char *tmp_dst = dst;
	
	while (size && *src != 0) {
		*tmp_dst++ = *src++;
		size--;
	}

	*tmp_dst = 0;
	return dst;
}

#endif


// comparison functions

#ifndef ARCH_MEMCMP

int memcmp(const void *src1, const void *src2, uint32_t size)
{
	const uint8_t *byte1 = src1;
	const uint8_t *byte2 = src2;

	while (size--) {
		if (*byte1 != *byte2) {
			if (*byte1 < *byte2) {
				return -1;
			} else {
				return 1;
			}
		}
		byte1++;
		byte2++;
	}

	return 0;
}

#endif

#ifndef ARCH_STRCMP

int strcmp (const char *str1, const char *str2)
{
	while (*str1 == *str2) {
		str1++;
		str2++;
	}

	if (*str1 == 0 && *str2 != 0)
		return -1;
	else if (*str1 != 0 && *str2 == 0)
		return 1;
	else 
		return 0;
}

#endif

#ifndef ARCH_STRNCMP

int strncmp (const char *str1, const char *str2, uint32_t size)
{
	while (size && *str1 == *str2) {
		str1++;
		str2++;
		size--;
	}

	if (*str1 == 0 && *str2 != 0)
		return -1;
	else if (*str1 != 0 && *str2 == 0)
		return 1;
	else 
		return 0;
}

#endif


// searching functions

#ifndef ARCH_STRCHR

char *strchr(const char *str, int c)
{
	char chr = c;
	const char *ptr = 0;
	
	while (*str != chr && *str)
		str++;
	
	if (*str == chr) 
		ptr = str;

	return (char *)ptr;
}

#endif

#ifndef ARCH_STRRCHR

char *strrchr(const char *str, int c)
{
	char chr = c;
	const char *ptr = 0;

	while (*str != 0) {
		if (*str == chr)
			ptr = str;
		str++;
	}

	return (char *)ptr;
}

#endif

#ifndef ARCH_STRSTR

char *strstr(const char *str1, const char* str2)
{
	uint32_t len = strlen(str2);
	const uint8_t *tmp_str2 = (const uint8_t *)str2;
	const uint8_t *ptr_result = 0;
	int i;
	uint8_t found = 0;
	
	while (*str1 != 0 && found == 0) {
		if (*str1 == *str2) {
			ptr_result = (const uint8_t *)str1;
			str1++;
			tmp_str2++;

			for (i = 0; i < len; i++, str1++, tmp_str2++) {
				if (*str1 != *tmp_str2) {
					found = 0;
					break;
				} else {
					found = 1;
				}		
			}
		}
		str1++;
	}

	return (char *)ptr_result;
}

#endif


// others functions

#ifndef ARCH_MEMSET

void *memset(void *ptr, int value, uint32_t size)
{
	uint8_t v = value;
	uint8_t *tmp_ptr = ptr;

	while (size--)
		*tmp_ptr++ = v;

	return ptr;
}

#endif

#ifndef ARCH_STRLEN

uint32_t strlen(const char *str)
{
	uint32_t count = 0;
	
	while (*str++ != 0)
		count++;

	return count;
}

#endif

#ifndef ARCH_STRREV

char *strrev(char *buffer)
{
	char *ptr = buffer;
	char *i = buffer;
	uint32_t value;

	while (*buffer) 
		buffer++;

	buffer--;

	while (i != buffer) {
		value = *i;
		if (buffer - i <= 1) {
			*i = *buffer;
			*buffer = value;
			break;
		} else {
			*i++ = *buffer;
			*buffer-- = value;
		}
	}

	return ptr;	
}

#endif

#ifndef ARCH_BZERO

void bzero(void *src, uint32_t size)
{
	uint8_t *tmp_src = src;
		
	while (size--)
		*tmp_src++ = 0;
}

#endif
