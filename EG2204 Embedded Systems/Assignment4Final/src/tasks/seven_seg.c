/*
 *  seven_seg.c
 *
 *  Created on: 20 March 2018
 *  Author: nt161
 */

#include "seven_seg.h"

// setting up a counter (which is used as a delay) to ensure the
// channel number is displayed for a second on the LED
int counter = 0;

// initialising the seven segment LED display
void seven_seg_init(void)
{
	PINSEL_CFG_Type PinCfg;
	SSP_CFG_Type SSP_ConfigStruct;

	/*
	 * Initialize SPI pin connect
	 * P0.7 - SCK;
	 * P0.8 - MISO
	 * P0.9 - MOSI
	 * P2.2 - SSEL - used as GPIO
	 */
	PinCfg.Funcnum = 2;
	PinCfg.OpenDrain = 0;
	PinCfg.Pinmode = 0;
	PinCfg.Portnum = 0;
	PinCfg.Pinnum = 7;
	PINSEL_ConfigPin(&PinCfg);
	PinCfg.Pinnum = 8;
	PINSEL_ConfigPin(&PinCfg);
	PinCfg.Pinnum = 9;
	PINSEL_ConfigPin(&PinCfg);
	PinCfg.Funcnum = 0;
	PinCfg.Portnum = 2;
	PinCfg.Pinnum = 2;
	PINSEL_ConfigPin(&PinCfg);

	SSP_ConfigStructInit(&SSP_ConfigStruct);

	// Initialize SSP peripheral with parameter given in structure above
	SSP_Init(LPC_SSP1, &SSP_ConfigStruct);

	// Enable SSP peripheral
	SSP_Cmd(LPC_SSP1, ENABLE);

	led7seg_init();
}

// if the counter is less than 10
// and if the rate of change of an ADC channel is less than -0.01 or greater than 0.01
// then the channel number is displayed on the seven segment LED
// and the counter is increased
// else the seven segment display is cleared and the counter is reset
void seven_seg_update(void)
{
	if(counter < 10){
		if(adc0_change_rate < -0.01 || adc0_change_rate > 0.01)
		{

			led7seg_setChar('0', FALSE);

		}
		else if(adc1_change_rate < -0.01 || adc1_change_rate > 0.01)
		{

			led7seg_setChar('1', FALSE);

		}
		else if(adc2_change_rate < -0.01|| adc2_change_rate > 0.01)
		{

			led7seg_setChar('2', FALSE);
		}
		counter++;
	}
	else
	{
		led7seg_setChar(' ', FALSE);
		counter = 0;

	}
}

