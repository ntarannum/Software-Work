/*------------------------------------------------------------------*-

  port.c (2014-09-17)

  ------------------------------------------------------------------

  Demonstration for time-trigger architecture on LPC1769.


  This code should purely be used in training and teaching purposes for
  for MSc Reliable Embedded Systems programme.

  This code is copyright (c) University of Leicester 2014.
-*------------------------------------------------------------------*/

#ifndef _PORT_H
#define _PORT_H 1

// Project header
#include "../main/main.h"

// Heartbeat LED: see heartbeat.c
// Connected to "LED2" on LPC1769 board
// Port 0, Pin 22
#define HEARTBEAT_LED_PORT (0)
#define HEARTBEAT_LED_PIN (0b10000000000000000000000)

// Counter reset input
// Connected to "SW3" on LPC1769 Baseboard
// Port 0, Pin 4
#define SW_RST_CNT_PORT (0)
#define SW_RST_CNT_PIN (0b10000)

// 7-segment display is controlled with "SPI" link
// Uses SSP1 plus a pin for chip select
#define SSP_CHANNEL LPC_SSP1

#define LED_DISPLAY_PORT_CS (2)
#define LED_DISPLAY_PIN_CS (0b100)

#endif

/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/
