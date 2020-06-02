
/*
 Step 2: Creating a class for a bouncing ball
 based on http://www.openprocessing.org/sketch/48960
 */

int XSPEED = 4;
int YSPEED = 7;
int CIRCLESIZE = 15;

// This is the definition of the MovingCircle class.
// Start with the name of the class:
class MovingCircle {

  // any variable declared here will be properties of
  // objects of this type
  float x, y, xSpeed, ySpeed;

  // Now the functions that are part of this class:

  // This special function declaration has the same name
  // as the class (MovingCircle) and it has no return type. This
  // is known as the constructor and it's run every time a new
  // object of this type is created.
  MovingCircle(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    xSpeed = XSPEED;
    ySpeed = YSPEED;
  }

  // Now come the functions (methods) of the class that
  // can be called. These functions describe what the
  // object can do:
  
  // The update() function adds the speed to the position, making
  // our circle move around:
  void update() {
    x += xSpeed;
    y += ySpeed;
  }

  // The checkCollisions() function checks to see if our circle has gone off
  // the edge of the screen, and if so reverses the speed and hence the direction:
  void checkCollisions() {
    float r = CIRCLESIZE/2;
    if ( (x<r) || (x>width-r)) {
      xSpeed = -xSpeed;
    }
    if ( (y<r) || (y>height-r)) {
      ySpeed = -ySpeed;
    }
  }

  // This function finally draws the circle
  void drawCircle() {
    fill(255);
    ellipse(x, y, CIRCLESIZE, CIRCLESIZE);
  }
} // End of the MovingCircle class

// Now that we have defined the class (the cookie cutter) 
// we can put it to use to make objects (the cookies):

// Make an object of type MovingCircle
// The two parameters are its initial position:
MovingCircle myCircle = new MovingCircle(25, 72);

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  // Always erase the screen first
  background(0);
  // update the position of the circle
  myCircle.update();
  // check for collisions with the walls
  myCircle.checkCollisions();
  // and finally draw the circle
  myCircle.drawCircle();
}
