################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/tasks/subdir.mk
-include src/system/subdir.mk
-include src/scheduler/subdir.mk
-include src/main/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: scheduler_assignment2.axf

# Tool invocations
scheduler_assignment2.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MCU Linker'
	arm-none-eabi-gcc -nostdlib -L"C:\Users\NTarannum\Documents\LPCXpresso_8.2.2_650\workspace\EG2204_Assignment2_Final\Lib_CMSISv1p30_LPC17xx\Debug" -L"C:\Users\NTarannum\Documents\LPCXpresso_8.2.2_650\workspace\EG2204_Assignment2_Final\Lib_EaBaseBoard\Debug" -L"C:\Users\NTarannum\Documents\LPCXpresso_8.2.2_650\workspace\EG2204_Assignment2_Final\Lib_MCU\Debug" -Xlinker --gc-sections -Xlinker -Map=scheduler_assignment2.map -mcpu=cortex-m3 -mthumb -T "scheduler_assignment2_Debug.ld" -o "scheduler_assignment2.axf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(C_DEPS) scheduler_assignment2.axf
	-@echo ' '

post-build:
	-@echo 'Performing post-build steps'
	-arm-none-eabi-size scheduler_assignment2.axf; # arm-none-eabi-objdump -h -S scheduler_assignment2.axf >scheduler_assignment2.lss
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
