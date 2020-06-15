//Arduino Ohm Meter with Push Button
//The resistance of the resistor that we are measuring is referred to as the unknown resistor.

int led = 5;//setting the pin that will be used for the LED.

void setup(){
    Serial.begin(9600); //Sets the data rate in bits per second.
    pinMode(led, OUTPUT); //Sets the digital pin 5 as output.
}

void loop(){
    float v_unknown = analogRead(A1);//when the push button is pressed the voltage across the unknown resistor is read and stored in the v_unknown variable. (The push button is merely a switch in my voltage divider circuit).
  
    float v_value = (v_unknown/1023.0) * 5.0; //equation to convert the voltage (from a value between 0 to 1023) across the unknown resistor into a voltage between 0 and 5 volts. The corresponding value is saved to the v_value variable.
    float current = (5-v_value)/10000; //equation to calculate the value of the current flowing through the circuit (in my circuit the resistor that will not be changed is the 10 kilo-ohm resistor hence the voltage has been divided by 10000), again the value is stored in the variable named current.
    float resistance = (v_value/current);//equation to calculate unknown resistance, and this value will be stored in the variable named resistance.
  
      //this part of the code will only be executed if the value of the voltage across the unknown resistor is greater than 0.05 volts.
      if (v_value > 0.05) //This has been done to ensure that values are not displayed if a small current flows through the circuit.                     
      { 
          Serial.println("Voltage across unknown resistor in Volts is: ");
          Serial.println(v_value); //displays the voltage across the unknown resistor on the serial monitor
          Serial.println("Resistance of unknown resistor in Ohms is: ");
          Serial.println(resistance); //displays the resistance of unknown resistor on the serial monitor
    
          for (int i=0; i<255; i++) //this for loop increments i from 1 to 255, in this loop this increases the brightness of the LED from 0 (minimum value) to 255 (maximum value) which is connected to pin 5 (which allows pulse width modulation).
            {                        
             analogWrite(led, i); //waits for 5 milliseconds when increasing the brightness, this enables the LED to gradually increase in brightness.
             delay(5);            
            }
      }
      else //if the value of the voltage across the unknown resistor is less than 0.05 volts then the LED will not turn on (value is set to LOW).
      { 
          digitalWrite(led, LOW);
      }
  
    delay(750);//waits for 0.75 seconds when displaying the voltage and resistance values on the serial monitor, this enables the user to read the values.
              //if there was no delay then the values of the resistor and voltage would rapidly be displayed on the screen, leading to difficulty in reading them.
}
