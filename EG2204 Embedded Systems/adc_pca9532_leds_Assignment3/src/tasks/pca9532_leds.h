/*
 * pca9532_leds.h
 *
 *  Created on: 17 Feb 2018
 *  Author: nt161
 */

#ifndef PCA9532_LEDS_HEADER
#define PCA9532_LEDS_HEADER

#include "lpc17xx_pinsel.h"
#include "lpc17xx_i2c.h"
#include "pca9532.h"
#include "adc_task.h"
#include "joystick_controller.h"

void pca9532_leds_init(void);
void pca9532_leds_update(void);

#endif /* PCA9532_LEDS_HEADER */
