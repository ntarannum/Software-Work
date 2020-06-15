/*
 *  led_bank.h
 *
 *  Created on: 18 March 2018
 *  Author: nt161
 */

#ifndef TASKS_LED_BANK_HEADER_
#define TASKS_LED_BANK_HEADER_

#include "lpc17xx_pinsel.h"
#include "lpc17xx_i2c.h"
#include "pca9532.h"
#include "../adc/adc.h"

// ------ Public function prototypes -------------------------------

void led_bank_init(void);
void led_display_adc_general(uint32_t value);
void led_display_adc_0_average(void);

#endif /* TASKS_LED_BANK_HEADER_ */
