#include <inttypes.h>
#include <llanox/process.h>

typedef struct {

} pthread_attr_t;

typedef struct {

} pthread_mutexattr_t;

typedef struct {
	uint32_t tid;
	pcb_t *queue;
} pthread_mutex_t;

int pthread_create(pthread_t *, const pthread_attr_t *, void *(*) (void *), void *);
int pthread_join(pthread_t, void **);
void pthread_exit(void *);
pthread_t pthread_self(void);
int pthread_mutex_init(pthread_mutex_t *, const pthread_mutexattr_t *);
int pthread_mutex_lock(pthread_mutex_t *);
int pthread_mutex_unlock(pthread_mutex_t *);
int pthread_mutex_trylock(pthread_mutex_t *);
