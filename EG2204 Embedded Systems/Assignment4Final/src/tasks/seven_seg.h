/*
 *  seven_seg.h
 *
 *  Created on: 20 March 2018
 *  Author: nt161
 */

#ifndef TASKS_SEVEN_SEG_HEADER_
#define TASKS_SEVEN_SEG_HEADER_

#include "lpc17xx_pinsel.h"
#include "lpc17xx_gpio.h"
#include "lpc17xx_ssp.h"
#include "led7seg.h"
#include "../adc/adc.h"

// ------ Public function prototypes -------------------------------

void seven_seg_init(void);
void seven_seg_update(void);

#endif /* TASKS_SEVEN_SEG_HEADER_ */
