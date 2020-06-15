#include "rotary_update.h"

//initialising the state of the rotary encoder to stationary
uint8_t state = ROTARY_WAIT;

//function initialising the rotary encoder
void RotaryEncoder_Init(void)
{
	rotary_init();
}

//function which controls the rotary encoder
void RotaryEncoder_Update(void)
{
	/*setting up a variable which is assigned the function rotary_read
	this function returns the status of the rotary encoder, i.e. if the rotary encoder*/
	state = rotary_read();

	//if the rotary encoder is not stationary
	if (state != ROTARY_WAIT)
	{

		/*if the rotary encoder is being turned clockwise and the speed at which the
		digit is changing is less than 1.5 seconds
		then the variable update_frequency is incremented*/
		if ((state == ROTARY_RIGHT) && (update_frequency < 15))
		{
			update_frequency++;
		}

		/*if the rotary encoder is being turned anti-clockwise and the speed at which the
		digit is changing is greater than 0.5 seconds
		then the variable update_frequency is decremented*/
		if ((state == ROTARY_LEFT) && (update_frequency > 5))
		{
			update_frequency--;
		}

	}

}
