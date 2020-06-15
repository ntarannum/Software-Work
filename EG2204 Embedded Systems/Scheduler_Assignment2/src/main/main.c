
#include "../tasks/ssp_config.h"

#include "../scheduler/ttc_scheduler_o.h"
#include "../tasks/disp7seg_update.h"
#include "../tasks/rotary_Update.h"
#include "../tasks/rgb_update.h"
#include "../tasks/joystick_controller.h"


int main (void)
{
	com_Init();
	RGB_Init();
	Joystick_Init();
	SevenSeg_Init();
	RotaryEncoder_Init();
    SCH_Init();

    SCH_Add_Task(Joystick_Update, 0, 500);
    SCH_Add_Task(Update_Blue, 5, 5);
    SCH_Add_Task(Update_Red, 10, 5);
    SCH_Add_Task(Update_Green, 15, 5);
    SCH_Add_Task(RotaryEncoder_Update, 25, 100);
    SCH_Add_Task(SevenSeg_Update, 50, 100);

    SCH_Start();

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
