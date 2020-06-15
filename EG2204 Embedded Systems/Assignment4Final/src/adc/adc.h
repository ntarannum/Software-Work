/*
 *  adc.h
 *
 *  Created on: 17 March 2018
 *  Author: nt161
 */

#ifndef ADC_HEADER_
#define ADC_HEADER_

#include "lpc17xx_adc.h"
#include "lpc17xx_pinsel.h"

#include <LPC17xx.h>

// ------ Public function prototypes -------------------------------

// constant for the size of the buffer
#define BUFFER_SIZE 10

// A struct to hold the buffer - the data and the "head" (next location to be written).
// sets the size of the buffer as well
typedef struct {
    uint32_t data[BUFFER_SIZE];
    uint32_t   head;
} RingBuffer;

extern RingBuffer buffer_adc_0, buffer_adc_1, buffer_adc_2;
extern float adc_0_value, adc_1_value, adc_2_value;
extern float average_adc_0, average_adc_1, average_adc_2;
extern float adc0_change_rate, adc1_change_rate, adc2_change_rate;

void initialise_buffer(RingBuffer* buf);
void add_to_buffer(RingBuffer* buf, float x);
uint32_t get_most_recent(RingBuffer* buf);
float get_average(RingBuffer buf);
void adc_initialise(void);
uint32_t adc_read_general(uint8_t channel);
void adc_0_update(void);
void adc_1_update(void);
void adc_2_update(void);

#endif /* ADC_HEADER_ */
