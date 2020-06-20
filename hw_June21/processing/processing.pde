import processing.serial.*; //import the Serial library
 Serial myPort;  //the Serial port object
 String val;
// since we're doing serial handshaking, 
// we need to check if we've heard from the microcontroller
boolean firstContact = false;

color bgColor = color( 0 ); // color of background
color penColor = color( 60, 120, 20 ); // color of our pen
color colorvariable = color(255);

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
      val = myPort.readStringUntil('\n');         // read it and store it in val
      
      //char [] val_array = val.toCharArray();
      //println(val_array);
      val = val.substring( 0, val.length()-2 );
      //char [] val_array = val.toCharArray();
      //println(val_array);
      print(val);
      print("\n");
  }
  setcolor();
  noStroke();
  fill(colorvariable);
  ellipse(mouseX,mouseY,20,20);

}

void keyPressed() {
  background( bgColor );
}

void setcolor(){
  
  //print(val);
 if (val == "RED"){
    colorvariable = color(255,0,0);

  }
  if (val =="GREEN"){
    colorvariable = color(0,255,0);

  }
  if (val =="YELLOW"){
    colorvariable = color(238, 255, 0);

  }
  if (val =="BLUE"){
    colorvariable = color(0, 0, 255);

  }




}
