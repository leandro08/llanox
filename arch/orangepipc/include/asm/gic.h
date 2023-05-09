#include <inttypes.h>

#define __I  volatile
#define __O  volatile
#define __IO volatile
#define GIC_DIST_BASE 0x01C81000
#define GIC_CPU_BASE  0x01C82000

#define INT_TIMER0 50

typedef struct {
	__IO uint32_t CTLR;
	__I  uint32_t TYPER;
	__I  uint32_t IIDR;
	__I  uint32_t RESERVED0[29];
	__IO uint32_t IGROUPRn[16];
	__I  uint32_t RESERVED1[16];
	__IO uint32_t ISENABLERn[16];
	__I  uint32_t RESERVED2[16];
	__IO uint32_t ICENABLERn[16];
	__I  uint32_t RESERVED3[16];
	__IO uint32_t ISPENDRn[16];
	__I  uint32_t RESERVED4[16];
	__IO uint32_t ICPENDRn[16];
	__I  uint32_t RESERVED5[16];
	__IO uint32_t ISACTIVERn[16];
	__I  uint32_t RESERVED6[16];
	__IO uint32_t ICACTIVERn[16];
	__I  uint32_t RESERVED7[16];
	__IO uint32_t IPRIORITYRn[128];
	__I  uint32_t RESERVED8[128];
	__IO uint32_t ITARGETSRn[128];
	__I  uint32_t RESERVED9[128];
	__I  uint32_t ICFGR_SGI;	
	__I  uint32_t ICFGR_PPI;	
	__IO uint32_t ICFGR_SPI[30];
	__I  uint32_t RESERVED10[32];
	__I  uint32_t PPISR;
	__I  uint32_t SPISRn[15];
	__I  uint32_t RESERVED11[112];
	__O  uint32_t SGIR;
	__I  uint32_t RESERVED12[3];
	__IO uint32_t CPENDSGIRn[4];
	__IO uint32_t SPENDSGIRn[4];
	__I  uint32_t RESERVED13[40];
	__I  uint32_t PIDR4;
	__I  uint32_t PIDR5;
	__I  uint32_t PIDR6;
	__I  uint32_t PIDR7;
	__I  uint32_t PIDR0;
	__I  uint32_t PIDR1;
	__I  uint32_t PIDR2;
	__I  uint32_t PIDR3;
	__I  uint32_t CIDR0;
	__I  uint32_t CIDR1;
	__I  uint32_t CIDR2;
	__I  uint32_t CIDR3;	
} GICD_t;

typedef struct {
	__IO uint32_t CTLR;
	__IO uint32_t PMR;
	__IO uint32_t BPR;
	__I  uint32_t IAR;
	__O  uint32_t EOIR;
	__I  uint32_t RPR;
	__I  uint32_t HPPIR;
	__IO uint32_t ABPR;
	__I  uint32_t AIAR;
	__O  uint32_t AEOIR;
	__I  uint32_t AHPPIR;
	__I  uint32_t RESERVED0[41];
	__IO uint32_t APR0;
	__I  uint32_t RESERVED1[3];
	__IO uint32_t NSAPR0;
	__I  uint32_t RESERVED2[6];
	__I  uint32_t IIDR;
	__I  uint32_t RESERVED3[960];
	__O  uint32_t DEACTIR;
} GICC_t;

#define GICD ((GICD_t *) GIC_DIST_BASE)
#define GICC ((GICC_t *) GIC_CPU_BASE)

void init_gic(void);
