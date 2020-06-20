//Define Buttons
const int buttonPin_red = 2;  
const int buttonPin_green = 3;
const int buttonPin_blue = 4;
const int buttonPin_yellow = 5;

// variables that will change:
int buttonState_red = 0; 
int buttonState_green = 0; 
int buttonState_blue = 0; 
int buttonState_yellow = 0; 



char val; // Data received from the serial port
int ledPin = 13; // Set the pin to digital I/O 13
boolean ledState = LOW; //to toggle our LED

void setup() 
{
  // initialize the pushbuttons pin as an input:
  pinMode(buttonPin_red, INPUT);
  pinMode(buttonPin_green, INPUT);
  pinMode(buttonPin_blue, INPUT);
  pinMode(buttonPin_yellow, INPUT);
 
//initialize serial communications at a 9600 baud rate
  Serial.begin(9600);

}

void loop()
{

    //obtain the state of each button
  buttonState_red = digitalRead(buttonPin_red);
  buttonState_green = digitalRead(buttonPin_green);
  buttonState_yellow = digitalRead(buttonPin_yellow);
  buttonState_blue = digitalRead(buttonPin_blue);

  if (buttonState_blue){

      Serial.println("RED");
      delay(500);
    
    }
  if (buttonState_red){

      Serial.println("BLUE");
      delay(500);
    
    }
  if (buttonState_yellow){

      Serial.println("YELLOW");
      delay(500);
    
    }
  if (buttonState_green){

      Serial.println("GREEN");
      delay(500);
    
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
}
