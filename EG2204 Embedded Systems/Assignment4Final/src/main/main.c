#include "../main/main.h"
#include "../scheduler/ttc_scheduler_o.h"
#include "../adc/adc.h"
#include "../tasks/led_bank.h"
#include "../tasks/rgb_led.h"
#include "../tasks/seven_seg.h"
#include "../tasks/serial_output.h"


int main (void)
{
	// initialising all the various hardware
	adc_initialise();
	serial_output_init();
	rgb_led_init();
	seven_seg_init();
	led_bank_init();
    SCH_Init();

    SCH_Start();

    SCH_Add_Task(rgb_update, 0, 100); // updates the RGB LED based on the rate of change of a channel
    SCH_Add_Task(adc_0_update, 1, 100); // updates information regarding ADC channel 0
    SCH_Add_Task(adc_1_update, 2, 100); // updates information regarding ADC channel 1
    SCH_Add_Task(adc_2_update, 3, 100); // updates information regarding ADC channel 2
    SCH_Add_Task(serial_output_update, 7, 100); //updates the serial terminal output
    SCH_Add_Task(seven_seg_update, 5, 100); // updates the seven segment display
    SCH_Add_Task(led_display_adc_0_average, 11, 100); // updates pca9532 LEDs according to ADC channel 0

    while(1)
    {
    	SCH_Dispatch_Tasks();
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
