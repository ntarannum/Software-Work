/*
 * joystick_controller.h
 *
 *  Created on: 16 Feb 2018
 *  Author: nt161
 */

#ifndef JOYSTICK_CONTROLLER_HEADER
#define JOYSTICK_CONTROLLER_HEADER

#include "lpc_types.h"
#include "rgb.h"
#include "joystick.h"
#include "pca9532.h"

extern uint8_t mode;
void joystick_controller_init(void);
void joystick_controller_update(void);

#endif /* JOYSTICK_CONTROLLER_HEADER_ */
