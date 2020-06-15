typedef enum {NORMAL, SHOCK, CPR} State;
const int redPin = 13;//the number of the RED LED pin
const int grnPin = 12;//number of the GREEN LED pin
const int cprPin   = 2;//pushbutton pin which starts SHOCK state and gives cpr
const int heartPin = 3;//pushbutton pin which starts CPR state
// include the library code:
#include <LiquidCrystal.h>

//initialize the library with the numbers of the interface pins
LiquidCrystal lcd(11, 10, 7, 6, 5, 4); 

int cprState = 0; //variable for reading pushbutton status
int heartState = 0; //variable for reading pushbutton status
long heartRate;
int speakerPin = 9; //variable setting up the buzzer

long interval = 30000; //interval at which to give CPR

void setup(){
  Serial.begin(9600);
  //initialize the LED pins as an output:
  pinMode(redPin, OUTPUT);
  pinMode(grnPin, OUTPUT);      
  //initialize the pushbutton pins as an input:
  pinMode(cprPin, INPUT);
  pinMode(heartPin, INPUT);
  //set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
  //initialise the random number generator:
  randomSeed(analogRead(A0)); 
  //initialise the buzzer as an output:
  pinMode(speakerPin, OUTPUT);
}

void loop(){
  static State current_state = NORMAL;//Initiates current state as NORMAL

  switch(current_state)
  {
    case NORMAL:
      heartState = digitalRead(heartPin);
      Serial.print("In NORMAL, heartState = ");
      Serial.println(heartState);
      if (heartState == HIGH)//checks if the heart is beating
      {
        digitalWrite(redPin, LOW);
        digitalWrite(grnPin, HIGH);
        lcd.setCursor(0,0);
        lcd.print("Heartrate Normal");
        // set the cursor to column 0, line 1
        // (note: line 1 is the second row, since counting begins with 0):
        lcd.setCursor(0, 1);
        long randomNumheartRate = random(-5, 6);
        heartRate = 80 + (randomNumheartRate + 2);//generates a random heart rate between 77 to 87
        lcd.print(heartRate);//heart rate is printed on the lcd
        lcd.print("bpm");
        delay(1000);
        break;
      }
      else //if heart has stopped, then goes into SHOCK mode
      {
        Serial.println("In NORMAL, going to SHOCK");
        current_state = SHOCK;
      }
      break;
    case SHOCK:
    {
      Serial.print("In SHOCK, heartState = ");
      Serial.println(heartState);
      
      digitalWrite(grnPin, LOW);
      digitalWrite(redPin, HIGH);
      lcd.setCursor(0,0);
      lcd.print("Heart Stopped!!!");
      lcd.setCursor(0,1);
      lcd.print("Stand Clear!");
      delay(2500);
      lcd.clear();
      for (int i=9; i>-1; i--)//counts down from 9 to 0 until 10 seconds pass
      {
        tone(9, 450, 100);
        delay(1000);
        lcd.setCursor(0,0);
        lcd.print("Get ready...");
        lcd.setCursor(0,1);
        lcd.print(i);//number of seconds left is printed on the lcd
        lcd.print(" seconds left");
      }
      tone(9, 625, 1000);//give an electric shock to the patient
      lcd.clear();
      lcd.setCursor(0,0);
      lcd.print("Electric shock!!");
      delay(1000);
     
      heartState = digitalRead(heartPin);
    
      if(heartState == LOW)//if this button is pressed then the system goes into CPR mode
      { 
        Serial.println("In SHOCK, going into CPR");
        current_state = CPR;
      }
      else //if button is not pressed then the heartbeat is normal and system goes to NORMAL mode
      {
        Serial.println("In SHOCK, going into NORMAL");
        current_state = NORMAL;
      }
      
    }
    break;
  
    case CPR:
    {      
      digitalWrite(grnPin, LOW);
      digitalWrite(redPin, LOW);
      lcd.clear();
      lcd.print("Start CPR...");
  
      long startTime = millis();//storing the time code reaches this line
  
      while((millis() - startTime) <= interval)//deducting the start time from the current time (represented by the millis() function) and if it is less than 30 seconds the code in the while loop is executed
      {
        static int lastPressed = millis();
        int timeDifference;
        
        if (digitalRead(cprPin) == 0)
        {
          timeDifference = millis() - lastPressed;
          lastPressed = millis();
          
          if ((timeDifference > 500) && (timeDifference < 1000))
          {
            // If it is more than a second (but less than 2 seconds) since the last time the button was pressed, light the green LED
            digitalWrite(grnPin, HIGH);
            lcd.clear();
            lcd.setCursor(0,0);
            lcd.print(timeDifference); //prints onto lcd the rate at which the button is being pressed
            lcd.print(" ms/press");
            lcd.setCursor(0,1);
            lcd.print("correct rate");
            tone(9, 625, 200);
            delay(200);
            digitalWrite(grnPin, LOW);
          }
          else
          {
            // Less than a second since the switch was last pressed or more than 2 seconds, light the red LED
            digitalWrite(redPin, HIGH);
            
            if(timeDifference < 500){ //if it has been less than a second since the button has been pressed the following code is executed
            lcd.clear();
            lcd.setCursor(0,0);
            lcd.print(timeDifference);//prints onto lcd the rate at which the button is being pressed
            lcd.print(" ms/press");
            lcd.setCursor(0,1);
            lcd.print("Too fast!");
            tone(9, 250, 200);//plays a tone for 200 milliseconds telling user that cpr is being done too fast as printed on the lcd in the previous line of code
            delay(200);
            digitalWrite(redPin, LOW);
            }
            if(timeDifference > 1000){ //if it has been more than 2 seconds since the button has been pressed the following code is executed
            lcd.clear();
            lcd.setCursor(0,0);
            lcd.print(timeDifference);//prints onto lcd the rate at which the button is being pressed
            lcd.print(" ms/press");
            lcd.setCursor(0,1);
            lcd.print("Too slow!");
            tone(9, 250, 200);//plays a tone for 200 milliseconds telling user that cpr is being done too slow as printed on the lcd in the previous line of code
            delay(200);
            digitalWrite(redPin, LOW);
            }
          }
        
          // Wait until the switch is released
          while (digitalRead(cprPin) == 0) /* do nothing */ ;
          // Small delay to debounce
          delay(100);
        }
      }
      lcd.clear();
      lcd.print("Continue CPR?");
      delay(3000);//gives the user some time to press the button to initiate SHOCK mode
      
      heartState = digitalRead(heartPin);
      
      if(heartState == LOW)
      {
       Serial.println("In CPR, going into SHOCK");
       current_state = SHOCK;
      }
      else //if button is not pressed then the system goes into NORMAL mode and the heart is beating again
      {
        Serial.println("In CPR, going into NORMAL");
        current_state = NORMAL;
      }
      
    }
    break;
 
  }
}
