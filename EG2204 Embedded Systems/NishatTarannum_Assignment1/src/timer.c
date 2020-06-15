#include "lpc17xx_timer.h"
#include "led7seg.h"
#include "rgb.h"

void timer0_init(void)
{
	//Power to timer 0 is enabled
	LPC_SC->PCONP |= 1 << 1;

	//the timer counter and prescale counter are reset
	LPC_TIM0->TCR = 2;

	//setting the prescale register to 1MHz frequency - the timer counter register increments
	// every time the timer reaches the value of 25.
	LPC_TIM0->PR  = 25 - 1;

	//setting match register:
	//An action takes place when the timer counter reaches the match register
	//value of 1000
	LPC_TIM0->MR0 = 1000 - 1;

	//setting match register:
	//An action takes place when the timer counter reaches the match register
	//value of 750
	LPC_TIM0->MR1 = 750 - 1;

	//setting actions for the timer:
	//the first condition generating an interrupt on match register zero, TIMER0_IRQHandler is called
	//then the timer counter is reset to zero
	//last condition generating an interrupt on match register one, TIMER0_IRQHandler is called
	LPC_TIM0->MCR |= (1<<0 | 1<<1 | 1<<3);

	// Enable interrupts.
	NVIC_EnableIRQ(TIMER0_IRQn);

	//the timer counter and prescale counter start to count upwards
	LPC_TIM0->TCR = 1;
}

void timer1_init(void)
{
	//Power to timer 1 is enabled
	LPC_SC->PCONP |= 1 << 2;

	//the timer counter and prescale counter are reset
	LPC_TIM1->TCR = 2;

	//setting the prescale register to 1KHz frequency - the timer counter register increments
	// every time the timer reaches the value of 25000.
	LPC_TIM1->PR  = 25000 - 1;

	//setting match register:
	//An action takes place when the timer counter reaches the match register
	//value of 1000
	LPC_TIM1->MR0 = 1000 - 1;

	//setting actions for the timer:
	//the first condition generating an interrupt on match register zero, TIMER1_IRQHandler is called
	//then the timer counter is reset to zero
	LPC_TIM1->MCR |= (1<<0 | 1<<1);

	// Enable interrupts.
	NVIC_EnableIRQ(TIMER1_IRQn);

	//the timer counter and prescale counter start to count upwards
	LPC_TIM1->TCR = 1;
}



void TIMER0_IRQHandler(void)
{
	// Store the current state of the timer interrupt register
	uint8_t ir = LPC_TIM0->IR;

	if (ir & (1<<0))  // Interrupt generated from MR0 (bit 0 set)
	{
		LPC_TIM0->IR |= (1<<0); // Clear the interrupt register (write 1 to bit 0)
		rgb_setLeds(0);//Turning the LED off

	}

	if (ir & (1<<1))  // Interrupt generated from MR1 (bit 1 set)
		{
			LPC_TIM0->IR |= (1<<1); // Clear the interrupt register (write 1 to bit 0)
			rgb_setLeds(4);//setting the LED colour to green
		}
}

void TIMER1_IRQHandler(void)
{
	// Store the current state of the timer interrupt register
	uint8_t ir = LPC_TIM1->IR;
	static char digit = '0'; //setting up the variable for the seven-segment LED display

	if (ir & (1<<0))  // Interrupt generated from MR0 (bit 0 set)
	{
		LPC_TIM1->IR |= (1<<0); // Clear the interrupt register (write 1 to bit 0)
		led7seg_setChar(digit, FALSE);//setting the seven-segment LED to display numbers
		if(digit == '9'){
			digit = '0'; //when the number reaches 9 then number starts to count from 0 again
		}
		else digit++; //increments the value for the variable
	}
}
