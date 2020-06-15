#ifndef RGB_UPDATE_HEADER
#define RGB_UPDATE_HEADER

#include "lpc_types.h"
#include "rgb.h"

extern uint8_t red_DC;
extern uint8_t green_DC;
extern uint8_t blue_state;

void RGB_Init(void);
void Update_Red(void);
void Update_Green(void);
void Update_Blue(void);
void On_Colour(uint8_t colour);
void Off_Colour(uint8_t colour);

#endif
