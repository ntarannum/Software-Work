//  Variables
int PulseSensorPurplePin = 0;        // Pulse Sensor PURPLE WIRE connected to ANALOG PIN 0

int Signal;                // holds the incoming raw data. Signal value can range from 0-1024

// The SetUp Function:
void setup() 
{
  Serial.begin(115200);         // Set's up Serial Communication at certain speed.

  cli();//stop interrupts
  
  //set timer1 interrupt at 100Hz
  TCCR1A = 0;// set entire TCCR2A register to 0
  TCCR1B = 0;// same for TCCR2B
  TCNT1  = 0;//initialize counter value to 0
  // set compare match register for 100Hz increments
  OCR1A = 2499;// = (16*10^6) / (100*64) - 1 (must be <65536)
  // turn on CTC mode
  TCCR1B |= (1 << WGM12);
  // Set CS01 and CS00 bits for 64 prescaler
  TCCR1B |= (1 << CS11) | (1 << CS10);   
  // enable timer compare interrupt
  TIMSK1 |= (1 << OCIE0A);
  
  sei();
}

// The Main Loop Function
void loop() 
{
//Do nothing!
}

ISR(TIMER1_COMPA_vect) 
{
  Signal = analogRead(PulseSensorPurplePin);  // Read the PulseSensor's value.
                                              // Assign this value to the "Signal" variable.
  Serial.println(Signal);                    // Send the Signal value to Serial Plotter.
}
