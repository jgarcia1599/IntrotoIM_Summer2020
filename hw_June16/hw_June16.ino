/*
 Dancing Lights 
 By Junior Garcia 

 This program uses a light sensor and a button to explore the possibilites of I/O relationships. The user
 must click on the buttom to start the light sequence of the LEDS, and usng a flashlight, illuminate the light sensor to make the lights
 dance faster.

 
*/

const int buttonPin = 2;     // the number of the pushbutton pin
const int ledPin_1 =  9;  
const int ledPin_2 = 10;
const int lightsensor = A0;



// variables will change:
int buttonState = 0;  
int lightsensor_value = 0;

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  //initalize led pins as outputs
  pinMode(ledPin_1, OUTPUT);
  pinMode(ledPin_2, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  //Read potentiometer value
  lightsensor_value = analogRead(lightsensor);

  // read the state of the pushbutton value:
  buttonState = digitalRead(buttonPin);
  // check if the pushbutton is pressed. If it is, the buttonState is HIGH:
  if (buttonState == HIGH) {
      //check if light sensor receives bright light
      if(lightsensor_value>950){
        
          digitalWrite(ledPin_1, HIGH);   // turn the LED on (HIGH is the voltage level)
          digitalWrite(ledPin_2, LOW);
          delay(100);                       // wait for a alittle time
          digitalWrite(ledPin_1, LOW);    // turn the LED off by making the voltage LOW
          digitalWrite(ledPin_2, HIGH); 
          delay(100); 
        
        } else{
         
          digitalWrite(ledPin_1, HIGH);   // turn the LED on (HIGH is the voltage level)
          digitalWrite(ledPin_2, HIGH);
          delay(1000);                       // wait for a longer time
          digitalWrite(ledPin_1, LOW);    // turn the LED off by making the voltage LOW
          digitalWrite(ledPin_2, LOW); 
          delay(1000);      
        }
  }
    


}
