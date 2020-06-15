/*
 *  led_bank.c
 *
 *  Created on: 18 March 2018
 *  Author: nt161
 */

#include "led_bank.h"

// initialising the pca9532 LEDs
void led_bank_init (void)
{
	PINSEL_CFG_Type PinCfg;

	/* Initialize I2C2 pin connect */
	PinCfg.Funcnum = 2;
	PinCfg.Pinnum = 10;
	PinCfg.Portnum = 0;
	PINSEL_ConfigPin(&PinCfg);
	PinCfg.Pinnum = 11;
	PINSEL_ConfigPin(&PinCfg);

	// Initialize I2C peripheral
	I2C_Init(LPC_I2C2, 100000);

	/* Enable I2C1 operation */
	I2C_Cmd(LPC_I2C2, ENABLE);

	pca9532_init();
}

// displays the channel value as a scaled value on the 16 pca9532 LEDs
// using bit shifting and masking
void led_display_adc_general(uint32_t value)
{
	uint16_t display_value = 0xFFFF >> (uint32_t) ((float) value / (float) 0x0FFF * 16);
	pca9532_setLeds(~display_value, display_value);
}

// this function is called from the main and is used to display the value of ADC channel 0
// on the pca9532 LEDs
void led_display_adc_0_average (void)
{
	led_display_adc_general(average_adc_0);
}
