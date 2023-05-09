#include <inttypes.h>

// copy functions 
void *memcpy( void *dst, const void *src, uint32_t size);
void *memmove(void *dst, const void *src, uint32_t size);
char *strcpy(char *dst, const char *src);
char *strncpy(char *dst, const char *src, uint32_t size);

// concatenation functions
char *strcat(char * dst, const char *src);
char *strncat(char *dst, const char *src, uint32_t size);

// comparison functions
int memcmp(const void *src1, const void *src2, uint32_t size);
int strcmp (const char *str1, const char *str2);
int strncmp (const char *str1, const char *str2, uint32_t size);

// searching functions
char *strchr(const char *str, int c);
char *strrchr(const char *str, int c);
char *strstr(const char *str1, const char *str2);

// others functions
void *memset(void *ptr, int value, uint32_t size);
char *strrev(char *buffer);
uint32_t strlen(const char *str);
void bzero(void *src, uint32_t size);
