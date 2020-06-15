#include "disp7seg_update.h"

//initialising the display digit to 0
static uint8_t digit = '0';

//initialising the external variable which retains the frequency at which the digit changes
uint8_t update_frequency = 10;

//function initialising the seven segment display
void SevenSeg_Init(void)
{
	led7seg_init();
	//clearing the seven segment display
	led7seg_setChar(' ', FALSE);
}

//function which controls the seven segment display
void SevenSeg_Update (void)
{
	/*setting up a delay to ensure that the digit changes at the correct frequency, corresponding
	to the external variable update_frequency*/
	static int delay = 0 ;

	//if the display digit is greater than 9 then the number on display starts to count from 0 again
	if(digit > '9')
	{
		digit = '0';
	}
	/*if the delay is greater than or equal to the frequency, then the digit is incremented
	and the delay is reset to 0*/
	else if (delay >= update_frequency)
	{
		digit++;
		delay = 0;
	}
	//if neither of the above conditions are satisfied then the delay is incremented
	else
		delay++;

	//setting the digit to be displayed on the seven segment display
	led7seg_setChar(digit, FALSE);
}

