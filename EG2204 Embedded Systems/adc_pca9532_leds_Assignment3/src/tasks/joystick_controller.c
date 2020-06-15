#include "joystick_controller.h"

/*initialising the external variable (mode) to 0.
 * So none of the RGB LEDs will be on when the program is run until the joystick is moved
 * in any of the three directions*/
uint8_t mode = 0;

//function initialising the joystick
void joystick_controller_init(void)
{
	joystick_init();
}

//function which controls the RGB LEDs and changes the mode of the joystick depending on its direction
void joystick_controller_update(void)
{
	/*setting up a variable which is assigned the function joystick_read
	 * this function returns the status of the joystick, i.e. the position of the joystick*/
	uint8_t joystick_status = joystick_read();

	/*if the joystick is moved to the left
	 * then the RED led is switched on
	 * and the mode of the joystick is set to 1*/
	if (joystick_status & JOYSTICK_LEFT)
	{
		rgb_setLeds(RGB_RED);
		mode = 1;
	}

	/*if the joystick is moved to the right
	 * then the BLUE led is switched on,
	 * all the LEDs are turned off i.e. clearing the LEDs
	 * and the mode of the joystick is set to 2*/
	if (joystick_status & JOYSTICK_RIGHT)
	{
		rgb_setLeds(RGB_BLUE);
		pca9532_setLeds(0x0000, 0xFFFF);
		mode = 2;
	}

	/*if the joystick is moved upwards
	 * then the GREEN led is switched on
	 * all the LEDs are turned off i.e. clearing the LEDs
	 * and the mode of the joystick is set to 3*/
	if (joystick_status & JOYSTICK_UP)
	{
		rgb_setLeds(RGB_GREEN);
		pca9532_setLeds(0x0000, 0xFFFF);
		mode = 3;

	}
}
