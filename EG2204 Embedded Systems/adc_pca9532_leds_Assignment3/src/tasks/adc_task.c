#include "adc_task.h"

//initialising the external variable to 0
uint32_t reading_pot = 0;

//function which initialises the analogue to digital converter
void adc_init (void)
{
	PINSEL_CFG_Type PinCfg;

	// Configuring pin 23 on port 0 - the trimming pot is connected to this.
	// The trimming pot is connected to GPIO_11, and GPIO_11 is P0.23 and also AD0.0
	// (Channel 0 of the ADC).
	PinCfg.Funcnum = 1;
	PinCfg.OpenDrain = 0;
	PinCfg.Pinmode = 0;
	PinCfg.Pinnum = 23;
	PinCfg.Portnum = 0;
	PINSEL_ConfigPin(&PinCfg);

	// Configure ADC: 0.2 MHz
	ADC_Init(LPC_ADC, 200000);
	// Disable interrupt
	ADC_IntConfig(LPC_ADC,ADC_CHANNEL_0,DISABLE);
	// Enable ADC
	ADC_ChannelCmd(LPC_ADC,ADC_CHANNEL_0,ENABLE);
}

//function which reads the value of potentiometer
uint32_t adc_read(void)
{
	ADC_StartCmd(LPC_ADC,ADC_START_NOW);
	// The line below sits in an infinite while loop until data collection
	// is complete.
	while (!(ADC_ChannelGetStatus(LPC_ADC,ADC_CHANNEL_0,ADC_DATA_DONE)));
	return ADC_ChannelGetData(LPC_ADC,ADC_CHANNEL_0);
}

/*function which reads value of the potentiometer and saves it in a variable.
 * setting up an external variable which is assigned the function adc_read*/
void adc_update()
{
	reading_pot = adc_read();
}
