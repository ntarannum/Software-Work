/*
 *  rgb_led.c
 *
 *  Created on: 20 March 2018
 *  Author: nt161
 */

#include "rgb_led.h"

// initialising the RGB led
// and setting it to display green initially when the task is scheduled
void rgb_led_init(void)
{
	rgb_init();
	rgb_setLeds(RGB_GREEN);
}


// this function checks whether the rate of change of a channel is greater than 0.01 volts
// and if it is then RGB led is set to turn red
// if however the rate of a channel is less than -0.01 volts then the RGB led is set to turn blue
// and in all other cases the RGB led is set to green
void rgb_update (void)
{
	if(adc0_change_rate > 0.01 || adc1_change_rate > 0.01 || adc2_change_rate > 0.01)
	{
		rgb_setLeds(RGB_RED);
	}
	else if(adc0_change_rate < -0.01 || adc1_change_rate < -0.01 || adc2_change_rate < -0.01)
	{
		rgb_setLeds(RGB_BLUE);
	}
	else
	{
		rgb_setLeds(RGB_GREEN);
	}


}
