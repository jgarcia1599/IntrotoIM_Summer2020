
#include "pitches.h"

//Define Buttons
const int buttonPin_red = 2;  
const int buttonPin_green = 3;
const int buttonPin_blue = 4;
const int buttonPin_yellow = 5;
const int mini_speaker = 9;
const int potpin = A0;  // analog pin used to connect the potentiometer

// variables that will change:
int buttonState_red = 0; 
int buttonState_green = 0; 
int buttonState_blue = 0; 
int buttonState_yellow = 0; 
int potpin_val;
int tone_duration;

void setup() {

  Serial.begin(9600);


  // initialize the pushbuttons pin as an input:
  pinMode(buttonPin_red, INPUT);
  pinMode(buttonPin_green, INPUT);
  pinMode(buttonPin_blue, INPUT);
  pinMode(buttonPin_yellow, INPUT);
}


void loop() {
  // obtain the analog value of the potentiometer and assign it to the tone_duration variable
  potpin_val = analogRead(potpin);
  tone_duration = map(potpin_val,100,1023,0,1000);
  Serial.print(tone_duration);
  Serial.print("\n");
  //obtain the state of each button
  buttonState_red = digitalRead(buttonPin_red);
  buttonState_green = digitalRead(buttonPin_green);
  buttonState_yellow = digitalRead(buttonPin_yellow);
  buttonState_blue = digitalRead(buttonPin_blue);

  // if any of the buttons are played, play the note with the tone_duration variable
  if (buttonState_blue){

      tone(mini_speaker,NOTE_C4,tone_duration);
    
    }
  if (buttonState_red){

      tone(mini_speaker,NOTE_D4,tone_duration);
    
    }
  if (buttonState_yellow){

      tone(mini_speaker,NOTE_E4,tone_duration);
    
    }
  if (buttonState_green){

      tone(mini_speaker,NOTE_F4,tone_duration);
    
    }


//  //Debug statement for checking buttons dont delete
//  Serial.print("RED: ");
//  Serial.print(buttonState_red);
//  Serial.print("\n");
//  Serial.print("GREEN: ");
//  Serial.print(buttonState_green);
//  Serial.print("\n"); 
//  Serial.print("YELLOW: ") ;
//  Serial.print(buttonState_yellow);
//  Serial.print("\n");
//  Serial.print("BLUE: ");
//  Serial.print(buttonState_blue);
//  Serial.print("\n");
//    


}
