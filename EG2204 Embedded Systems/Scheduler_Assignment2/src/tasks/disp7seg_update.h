#ifndef DISP7SEG_HEADER
#define DISP7SEG_HEADER

#include "lpc_types.h"
#include "led7seg.h"

extern uint8_t update_frequency; //this value should be changing from 5 to 15

void SevenSeg_Init(void);
void SevenSeg_Update(void);

#endif
