const int flash_led = 10;
int state = HIGH;

void setup() {
  pinMode(flash_led, OUTPUT);
  digitalWrite(flash_led, HIGH);

  cli(); 
  TCCR1A = 0;     // Clear timer control register
  TCCR1B = 0;     // Clear timer control register
  TCNT1  = 0;     // Timer counter set to zero
  OCR1A  = 15624; // Compare match register
  TCCR1B |= (1 << WGM12);  // Reset timer counter on interrupt
  /*
   * Prescaler settings for timer 1 
   * are controlled by CS10 to CS12:
   * CS12 CS11 CS10
   * 0    0    0    = timer stopped
   * 0    0    1    = prescaler    1 (no prescaler)
   * 0    1    0    = prescaler    8
   * 0    1    1    = prescaler   64
   * 1    0    0    = prescaler  256
   * 1    0    1    = prescaler 1024
   * (110 and 111 used for external clock source)
   * 
   * Interrupt frequency will be CS/(PR * (CMR+1))
   * where 
   * CS = Arduino Clock Speed (16 MHz usually)
   * PR = Prescaler (see above)
   * CMR = Compare Match Register
   * 
   * See https://www.instructables.com/id/Arduino-Timer-Interrupts/
   */
  TCCR1B |= (1 << CS12) | (1 << CS10);
  TIMSK1 |= (1 << OCIE1A);  // Enable timer compare interrupt
  sei();                    // Enable all interrupts
}

void loop() 
{
  // Nothing
}

ISR(TIMER1_COMPA_vect) 
{
  digitalWrite(flash_led, state);
  
  state = (state == HIGH) ? LOW : HIGH;
}


