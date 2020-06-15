/*
 *  adc.c
 *
 *  Created on: 17 March 2018
 *  Author: nt161
 */

#include "adc.h"

// initialising the external variables
float adc_0_value = 0, adc_1_value = 0, adc_2_value = 0;
float adc0_change_rate = 0, adc1_change_rate = 0, adc2_change_rate = 0;
float average_adc_0 = 0, average_adc_1 = 0, average_adc_2 = 0;


// declaring 3 ring buffers for each adc channel
RingBuffer buffer_adc_0;
RingBuffer buffer_adc_1;
RingBuffer buffer_adc_2;


// initialises the buffer
// setting the head of the buffer
void initialise_buffer(RingBuffer* buf)
{
	int i;
	buf->head = 0;
	for (i=0; i<BUFFER_SIZE; i++) buf->data[i] = 0.0;
}

// a function that adds data to the buffer
// and sets the new head position
void add_to_buffer(RingBuffer* buf, float x)
{
	buf->data[buf->head] = x;
	buf->head = (buf->head + 1) % BUFFER_SIZE;
}

// a function that gets the most recent value that has been added to the buffer
uint32_t get_most_recent(RingBuffer* buf)
{
	if (buf->head == 0) return buf->data[BUFFER_SIZE - 1];
	return buf->data[buf->head - 1];
}

// Because this function doesn't change the struct, the parameter can be
// the struct itself, and we use the . notation to get at the head and data.
// this function gets the average of the values in the ring buffer
float get_average(RingBuffer buf)
{
	int i;
	float average = 0.0;
	for (i=0; i<BUFFER_SIZE; i++) average += buf.data[i];
	return (average / BUFFER_SIZE);
}

// initialising the adc channels and the ring buffers for each channel
void adc_initialise(void)
{
	LPC_SC->PCONP |= 1 << 12;
	LPC_PINCON->PINSEL1 = (LPC_PINCON->PINSEL1 & ~(0x3 << 14)) | (0x1 << 14);
	LPC_PINCON->PINSEL1 = (LPC_PINCON->PINSEL1 & ~(0x3 << 16)) | (0x1 << 16);
	LPC_PINCON->PINSEL1 = (LPC_PINCON->PINSEL1 & ~(0x3 << 18)) | (0x1 << 18);
	initialise_buffer(&buffer_adc_0);
	initialise_buffer(&buffer_adc_1);
	initialise_buffer(&buffer_adc_2);
}

// returns the value that is read from the adc channel
uint32_t adc_read_general(uint8_t channel)
{
	LPC_ADC->ADCR = (1 << channel) | (2 << 8) | (1 << 21) | (1 << 24);

	// Wait for result - use ADC Global Data Register
	while((LPC_ADC->ADGDR & (1 << 31)) == 0);

	// Capture complete... Now clear ADCR
	LPC_ADC->ADCR = 0;

	return (LPC_ADC->ADGDR >> 4) & 0xfff;
}

// function updates values related to adc channel 0
void adc_0_update(void)
{
	//reads the current value of adc channel 0
	//and stores the value in a variable
	adc_0_value = adc_read_general(0);
	//stores the rate of change of channel 0 (in volts)
	adc0_change_rate = ((adc_0_value - get_most_recent(&buffer_adc_0))/4095.0)*3.3;
	//stores the average value of the adc channel readings stored in the buffer
	average_adc_0 = get_average(buffer_adc_0);
	//adds the new read value to the buffer
	add_to_buffer(&buffer_adc_0, adc_0_value);
}

// function updates values related to adc channel 0
void adc_1_update(void)
{
	// reads the current value of adc channel 1
	// and stores the value in a variable
	adc_1_value = adc_read_general(1);
	// stores the rate of change of channel 1 (in volts)
	adc1_change_rate = ((adc_1_value - get_most_recent(&buffer_adc_1))/4095.0)*3.3;
	// stores the average value of the adc channel readings stored in the buffer
	average_adc_1 = get_average(buffer_adc_1);
	// adds the new read value to the buffer
	add_to_buffer(&buffer_adc_1, adc_1_value);
}

// function updates values related to adc channel 2
void adc_2_update(void)
{
	// reads the current value of adc channel 2
	// and stores the value in a variable
	adc_2_value = adc_read_general(2);
	// stores the rate of change of channel 2 (in volts)
	adc2_change_rate = ((adc_2_value - get_most_recent(&buffer_adc_2))/4095.0)*3.3;
	// stores the average value of the adc channel readings stored in the buffer
	average_adc_2 = get_average(buffer_adc_2);
	// adds the new read value to the buffer
	add_to_buffer(&buffer_adc_2, adc_2_value);
}




