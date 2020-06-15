#include "joystick_controller.h"

//function initialising the joystick
void Joystick_Init(void)
{
	joystick_init();
}

//function which controls the joystick
void Joystick_Update(void)
{
	/*setting up a variable which is assigned the function joystick_read
	this function returns the status of the joystick, i.e. the position of the joystick*/
	uint8_t joy = joystick_read();

	//if the joystick is pressed in the centre
	if (joy & JOYSTICK_CENTER)
	{
		/*this line is included to ensure that when the joystick is pressed in the centre
		the turning on/off of the blue LED is visible
		otherwise the next few lines of code are executed continuously and very quickly when
		the joystick is pressed*/
		while(joystick_read() & JOYSTICK_CENTER);
		/*if the blue LED is OFF then the blue LED is turned ON
		however, if the blue LED is ON then it is turned OFF*/
		if(blue_state == 0)
		{
			blue_state = RGB_BLUE;
		}
		else
			blue_state = 0;
	}

	//if the joystick is pushed upwards
	if (joy & JOYSTICK_UP)
	{
		//and if the green LED duty cycle is greater than 0% then it is decremented by 10%
		if (green_DC > 0)
		{
			green_DC--;
		}

	}

	//if the joystick is pushed downwards
	if (joy & JOYSTICK_DOWN)
	{
		//and if the green LED duty cycle is less than 100% then it is incremented by 10%
		if (green_DC < 9)
		{
			green_DC++;
		}

	}

	//if the joystick is pushed left
	if (joy & JOYSTICK_LEFT)
	{
		//and if the red LED duty cycle is less than 100% then it is incremented by 10%
		if (red_DC < 9)
		{
			red_DC++;
		}

	}

	//if the joystick is pushed right
	if (joy & JOYSTICK_RIGHT)
	{
		//and if the red LED duty cycle is greater than 0% then it is decremented by 10%
		if (red_DC > 0)
		{
			red_DC--;
		}

	}

}
