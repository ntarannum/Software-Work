/*
 *  rgb_led.h
 *
 *  Created on: 20 March 2018
 *  Author: nt161
 */

#ifndef TASKS_RGB_LED_HEADER_
#define TASKS_RGB_LED_HEADER_

#include "lpc_types.h"
#include "rgb.h"
#include "../adc/adc.h"

// ------ Public function prototypes -------------------------------

void rgb_led_init(void);
void rgb_update(void);

#endif /* TASKS_RGB_LED_HEADER_ */
