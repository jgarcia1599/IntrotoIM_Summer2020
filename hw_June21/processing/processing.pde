import processing.serial.*; //import the Serial library
Serial myPort;  //the Serial port object
 
 
String raw_value;// Obtain the raw value from arduino
char val;// color value afteer string processing

color bgColor = color( 0 ); // color of background
color penColor = color( 60, 120, 20 ); // color of our pen
color colorvariable = color(255); // initially, the color u draw on is white

boolean mouse_pressed = false; // global boolean to check if the mouse is pressed

void setup() {
  //  initialize your serial port and set the baud rate to 9600
  myPort = new Serial(this, Serial.list()[47], 9600);
  myPort.bufferUntil('\n'); 
  
   size( 800, 600 );
   background( bgColor ); // set the background color
  
  //Finding port name
  //String [] ports = Serial.list(); //change the 0 to a 1 or 2 etc. to match your port
  
  ////for loop to find the arduinos usb port name 
  //for (int i = 0;i<ports.length;i++){
  //  print(ports[i] + " : "+ i + "\n");  
  //}
}

void draw() {
  if ( myPort.available() > 0) {  // If data is available,
      raw_value = myPort.readStringUntil('\n');         // read it and store it in val
      //process the raw value to obtain the char we want (R,G,B, OR Y)
      raw_value = raw_value.substring( 0, raw_value.length()-2 );
      char [] val_array = raw_value.toCharArray();
      val = val_array[0];
      //print(val);
      //print("\n");
  }
  //CALL THE SET COLOR FUNCTION BASED ON THE VAL VALUE OBTAINED FROM ARDUINO
  setcolor();
  
  //DRAW ONLY IF THE MOUSE IS PRESSED
  if (mouse_pressed){
      noStroke();
      fill(colorvariable);
      ellipse(mouseX,mouseY,20,20);
  
  }


}

// RESTART THE SKETCH BY PRESSING THE ENTER KEY
void keyPressed() {
  if (keyCode == ENTER){
     background( bgColor );
  }
 
}

// CHANGE mouse_pressed valuee on presed and released
void mousePressed(){
  mouse_pressed = true;

}
void mouseReleased(){
  
  mouse_pressed = false;

}


//change color based on obtaine
void setcolor(){

 if (val == 'R'){
    colorvariable = color(255,0,0);

  }
  if (val =='G'){
    colorvariable = color(0,255,0);

  }
  if (val =='Y'){
    colorvariable = color(238, 255, 0);

  }
  if (val =='B'){
    colorvariable = color(0, 0, 255);

  }
}
