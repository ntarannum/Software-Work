/*
 * adc_task.h
 *
 *  Created on: 15 Feb 2018
 *  Author: nt161
 */

#ifndef ADC_TASK_HEADER
#define ADC_TASK_HEADER

#include "lpc17xx_adc.h"
#include "lpc17xx_pinsel.h"
#include <LPC17xx.h>

extern uint32_t reading_pot;
void adc_init(void);
uint32_t adc_read(void);
void adc_update(void);

#endif /* ADC_TASK_HEADER */
