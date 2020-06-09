// The hidden jellyfish by Junior Garcia
// This program displays a shy jellyfish that doesnt like being flashed light
// Modified from Dan Shiffman's Example on his Learning Processing Book
// Example 15-9: Adjusting image brightness based on pixel location (Flashlight effect)

//IMage Variables
PImage img;
PImage eyes;
void setup() {
  size(500, 500);
  //Load the image and the
  img = loadImage( "jellyfish.jpg" );
  eyes = loadImage("eyes.png");

  //resize the image so that it is the size of the canvas
  img.resize(width,height);
}



void draw() {
  background(img);
  //Darkness and Flashlight effect
  loadPixels();
  img.loadPixels();

  // We must also call loadPixels() on the PImage since we are going to read its pixels.  img.loadPixels(); 
  for (int x = 0; x < img.width; x++ ) {
    for (int y = 0; y < img.height; y++ ) {

      // Calculate the 1D pixel location
      int loc = x + y*img.width;

      // Get the R,G,B values from image
      float r = red  (img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue (img.pixels[loc]);

      // Calculate an amount to change brightness
      // based on proximity to the mouse
      float distance = dist(x, y, mouseX, mouseY);

      // The closer the pixel is to the mouse, the lower the value of "distance" 
      // We want closer pixels to be brighter, however, so we invert the value using map()
      // Pixels with a distance of 50 (or greater) have a brightness of 0.0 (or negative which is equivalent to 0 here)
      // Pixels with a distance of 0 have a brightness of 1.0.
      float adjustBrightness = map(distance, 0, 100, 8, 0);
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

      // Constrain RGB to between 0-255
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }

  updatePixels();

  //Change the face of the jellyfish depending on the position of the mouse
  //This could be done with the distance function
  if((mouseX >= 140 && mouseX <= 210) && (mouseY>=130 && mouseY <= 200)){
    sad_smile();
    
    
  }
  else{
    
    happy_smile();
  }
  

}


//Happy smile function that draws the face when hapy
void happy_smile(){
  noFill();
  strokeWeight(5);
  //arc is oriented upwards so that the face is happy
  arc(190, 150, 50, 50, 0, PI);
  image(eyes,175,120, 30,30);
  

}
//Sad smile function that draws the face when sad
void sad_smile(){
  noFill();
  strokeWeight(5);
  //arc is oriented downwards so that the face is sad
  arc(190, 180, 50, 50, PI, 2* PI);
  image(eyes,175,120, 30,30);

}
