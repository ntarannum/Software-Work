#include "rgb_update.h"

//variable which corresponds to the state of the LED i.e. the current colour
static uint8_t state = 0x00;

//initialising the external variable of the red duty cycle
uint8_t red_DC = 5;

//initialising the external variable of the green duty cycle
uint8_t green_DC = 5;

//initialising the variable which corresponds to the state of the blue LED
uint8_t blue_state = 0;


//initialising the RGB LED and turning it off
void RGB_Init(void)
{
	rgb_init();
	rgb_setLeds(state);
}

//function which turns on the LED corresponding to the colour inserted in the parameters
void On_Colour (uint8_t colour)
{
	state |= colour;
	rgb_setLeds(state);
}

//function which turns off the LED corresponding to the colour inserted in the parameters
void Off_Colour (uint8_t colour)
{
	state &= ~colour;
	rgb_setLeds(state);
}

//function which controls the RED LED according to its duty cycle
void Update_Red(void)
{
	/*setting up a counter to ensure that the red LED turns on/off according to its duty cycle
	this works like a delay*/
	static uint8_t red_counter = 0;

	/*if the counter is equal to 0 and the duty cycle is not equal to 0%
	the the RED LED is turned on*/
	if((red_counter == 0) && (red_DC != 0))
	{
		On_Colour(RGB_RED);
	}

	/*if the counter is equal to the duty cycle and the duty cycle is not equal to 100%
	the the RED LED is turned off*/
	if((red_counter == red_DC) && (red_DC != 10))
	{
		Off_Colour(RGB_RED);
	}

	//the counter is incremented
	red_counter++;

	//if the counter is equal to 10 then the counter is reset to 0
	if(red_counter == 10)
	{
		red_counter = 0;
	}
}

//function which controls the GREEN LED according to its duty cycle
void Update_Green(void)
{
	/*setting up a counter to ensure that the green LED turns on/off according to its duty cycle
	this works like a delay*/
	static uint8_t green_counter = 0;

	/*if the counter is equal to 0 and the duty cycle is not equal to 0%
	the the GREEN LED is turned on*/
	if((green_counter == 0) && (green_DC != 0))
	{
		On_Colour(RGB_GREEN);
	}

	/*if the counter is equal to the duty cycle and the duty cycle is not equal to 100%
	the the GREEN LED is turned off*/
	if((green_counter == green_DC) && (green_DC != 10))
	{
		Off_Colour(RGB_GREEN);
	}

	//the counter is incremented
	green_counter++;

	//if the counter is equal to 10 then the counter is reset to 0
	if(green_counter == 10)
	{
		green_counter = 0;
	}
}


//function which controls the BLUE LED
void Update_Blue(void)
{
	/*if the state of the blue LED is 0 then the LED is switched off
	else it is switch on*/
	if(blue_state == 0){
		Off_Colour(RGB_BLUE);
	}
	else
		On_Colour(RGB_BLUE);
}


