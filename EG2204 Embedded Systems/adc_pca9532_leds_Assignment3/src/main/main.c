#include "../scheduler/ttc_scheduler_o.h"
#include "../tasks/joystick_controller.h"
#include "../tasks/adc_task.h"
#include "../tasks/pca9532_leds.h"
#include "rgb.h"

int main (void)
{
	rgb_init(); //red, green and blue LEDs initialisation
	joystick_controller_init(); //joystick initialisation
	adc_init(); //analogue to digital converter initialisation
	pca9532_leds_init(); //pca9532 LEDs initialisation
	SCH_Init(); //scheduler initialisation

	SCH_Add_Task(joystick_controller_update, 0, 75); //updates every 75ms, starting from 0
	SCH_Add_Task(adc_update, 2, 20); //updates every 20ms, starting from 2
	SCH_Add_Task(pca9532_leds_update, 4, 20); //updates every 20ms, starting from 4

	SCH_Start(); //begins scheduler

	while(1)
	{
		SCH_Dispatch_Tasks();//begins tasks
	}

	return 0;

}

void check_failed(uint8_t *file, uint32_t line)
{
	/* User can add his own implementation to report the file name and line number,
	 ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

	/* Infinite loop */
	while(1);
}
