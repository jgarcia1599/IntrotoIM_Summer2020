/* 
 
 Change the color of the circle based on how far the mouse is from the center of the circle
 
 Based on Dan Shiffman's example 7.4 from Learning Processing
 http://learningprocessing.com/examples/chp07/example-07-04-returntype
 
 Modified 2 June 2020 MS - changed variable names
 */
float[] coswave; 
void setup() {
  size(480, 270);
  coswave = new float[width];
  for (int xPosition = 0; xPosition < width; xPosition++) {
    coswave[xPosition] = cos(radians(xPosition));
  }
  ellipseMode(CENTER); // probably the default anyway
  stroke(0);
}

void draw() {
  //noLoop -> run draw only once

  // Erase the last frame
  background(255);

  // Get the distance from the mouse to the circle center
  float distanceMouseToCircleCenter = distance(width/2, height/2, mouseX, mouseY);

  // Change the fill color according to that distance
  fill(distanceMouseToCircleCenter*3, distanceMouseToCircleCenter*2, distanceMouseToCircleCenter);
  // What happens if the value is greater than 255?

  // Finally, draw the circle
  ellipse(width/2, height/2, 100, 100);
  
  //Cosine wave code
  for (int xPosition = 0; xPosition < width; xPosition++) {
    float waveHeight = map(coswave[xPosition], -1, 1, 0, height);
    point(xPosition, waveHeight);
  }

}

// Calculate the distance between two points x1,y1 and x2,y2
float distance(float x1, float y1, float x2, float y2) {
  float dx = x1 - x2; // distance in the x axis
  float dy = y1 - y2; // distance in the y axis
  float d = sqrt(dx*dx + dy*dy); // The Pythagorean theorem
  return d; // this is where we return the answer to the calling function
}
