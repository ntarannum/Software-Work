#ifndef SSPCONFIG_HEADER
#define SSPCONFIG_HEADER

#include "lpc17xx_pinsel.h"
#include "lpc17xx_gpio.h"
#include "lpc17xx_ssp.h"

PINSEL_CFG_Type PinCfg;
SSP_CFG_Type SSP_ConfigStruct;

void com_Init(void);
#endif
