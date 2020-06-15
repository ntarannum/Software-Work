#include "pca9532_leds.h"

//function initialising I2C and the pca9532 LEDs
void pca9532_leds_init()
{
	PINSEL_CFG_Type PinCfg;

	//Initialize I2C2 pin connect
	PinCfg.Funcnum = 2;
	PinCfg.Pinnum = 10;
	PinCfg.Portnum = 0;
	PINSEL_ConfigPin(&PinCfg);
	PinCfg.Pinnum = 11;
	PINSEL_ConfigPin(&PinCfg);

	//Initialize I2C peripheral
	I2C_Init(LPC_I2C2, 100000);

	//Enable I2C1 operation
	I2C_Cmd(LPC_I2C2, ENABLE);
	//initialise pca9532 LEDs
	pca9532_init();

}

//function controlling the pca9532 LEDs
void pca9532_leds_update()
{
	//a variable which stores the potentiometer reading as a floating point number
	float float_reading;
	//conversion of potentiometer reading to a floating point value between 0.0 and 1.0
	float_reading = reading_pot / 4095.0;

	//if the joystick is in mode 1
	if (mode == 1)
	{
		//declaring variables that correspond to the LEDs that will be switched on or off
		uint16_t on_leds;
		uint16_t off_leds;
		//variable that will store the potentiometer value as a number between 0 and 16
		uint16_t pot_led;

		/*converting the value of the floating point potentiometer reading
		 * into a value between 0 and 16 and assigning the value to a 16 bit integer*/
		pot_led = (uint16_t) (float_reading * 16);

		/*assigning a single LED to a variable using bit masking and bit shifting to extract the LED
		 * (from the 16) which corresponds to the voltage of the potentiometer*/
		on_leds = 0x0001 << (15 - pot_led) ;

		//assigning the rest of the LEDs to a variable
		off_leds = ~on_leds;

		//assigning which LEDs to turn off and which LED to turn on
		pca9532_setLeds(on_leds, off_leds);
	}

	//if the joystick is in mode 2
	if(mode == 2)
	{
		/*scaling the potentiometer reading to give a valid period with value between 0 - 255
		 * where 0 means 152 Hz and 255 means 0.59 Hz
		 * and assigning the value to a variable named period*/
		uint8_t period = (uint8_t) (float_reading * 255);
		//function which sets all the LEDs to blink
		pca9532_setBlink0Leds(0xFFFF);
		/*function which sets the LEDs to blink with a certain period
		 * which is equal to the value stored in the variable named "period"*/
		pca9532_setBlink0Period(period);
	}

	//if the joystick is in mode 3
	if (mode == 3)
	{
		/*scaling the potentiometer reading to give a valid duty cycle with values from 0 - 100 (a percentage)
		where where 25 means 25% duty cycle
		and assigning the value in a variable called duty*/
		uint8_t duty = (uint8_t) (float_reading * 100);
		//function which sets all the LEDs to blink
		pca9532_setBlink0Leds(0xFFFF);
		/*function which sets the LEDs to blink with a certain duty cycle
		 * which is equal to the value stored in the variable named "duty"*/
		pca9532_setBlink0Duty(duty);
	}

}
