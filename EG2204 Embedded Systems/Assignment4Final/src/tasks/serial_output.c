/*
 *  serial_output.c
 *
 *  Created on: 19 March 2018
 *  Author: nt161
 */

#include "serial_output.h"

// a character array which is used to display
// "strings" when using the sprintf function
// this is done because c does not have a string data type
char adc_string[100];

//initialises the serial output
void serial_output_init(){
	USB_init();
	VCOM_init();
	USBHwConnect(TRUE);
}

void serial_output_update(){

	// a variable which stores which "char" has been pressed on the keyboard
	char readIn = VCOM_getchar();

	// if the character '0' is pressed then the current value of the adc channel 0 is displayed
	// as well as the average value
	if (readIn == '0')
	{
		sprintf(adc_string, "ADC channel 0 Current Value: %f\n\r", adc_0_value);
		VCOM_putstring2(adc_string);
		sprintf(adc_string, "ADC channel 0 Average Value: %f\n\r", average_adc_0);
		VCOM_putstring2(adc_string);
	}

	// if the character '1' is pressed then the current value of the adc channel 1 is displayed
	// as well as the average value
	if (readIn == '1')
	{
		sprintf(adc_string, "ADC channel 1 Current Value: %f\n\r", adc_1_value);
		VCOM_putstring2(adc_string);
		sprintf(adc_string, "ADC channel 1 Average Value: %f\n\r", average_adc_1);
		VCOM_putstring2(adc_string);

	}

	// if the character '2' is pressed then the current value of adc channel 2 is displayed
	// as well as the average value
	if (readIn == '2')
	{
		sprintf(adc_string, "ADC channel 2 Current Value: %f\n\r", adc_2_value);
		VCOM_putstring2(adc_string);
		sprintf(adc_string, "ADC channel 2 Average Value %f\n\r", average_adc_2);
		VCOM_putstring2(adc_string);
	}

	// if the rate of change of a channel is greater than 0.01 or less than -0.01
	// then the value of the rate of change is displayed on the serial terminal
	if((adc0_change_rate > 0.01) || (adc0_change_rate < -0.01))
	{
		sprintf(adc_string, "ADC channel 0 Rate Of Change: %f\n\r", adc0_change_rate);
		VCOM_putstring2(adc_string);
	}
	else if ((adc1_change_rate > 0.01) || (adc1_change_rate < -0.01))
	{
		sprintf(adc_string, "ADC channel 1 Rate Of Change: %f\n\r", adc1_change_rate);
		VCOM_putstring2(adc_string);
	}
	else if((adc2_change_rate > 0.01) || (adc2_change_rate < -0.01))
	{
		sprintf(adc_string, "ADC channel 2 Rate Of Change: %f\n\r", adc2_change_rate);
		VCOM_putstring2(adc_string);
	}


}



