//Code inspired from https://processing.org/examples/bouncybubbles.html

int numBalls = 30;
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];
PImage heart,sad,earth;
boolean all_hearts = false;
void setup() {
  heart = loadImage("heart.png");
  sad = loadImage("sad.png");
  earth = loadImage("happy_earth.png");
  size(800, 700);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), 50, i, balls);
  }
  noStroke();
  fill(255, 204);
}

void draw() {
  if(!all_hearts){
    background(255, 143, 143);
  }
  
  int hearts = 0;

  for (Ball ball : balls) {
    ball.collide();
    ball.move();
    ball.display(); 
    if (ball.collision == true){
      hearts++;
    }
    
  }
  if (hearts == numBalls){
    println("all are hearts");
    all_hearts = true;
  }
  //if(all_hearts){
  //  image(earth,width/2,height/2,400,300);
    
  //}
  
}

class Ball {
  
  boolean collision = false;
  float x, y;
  float diameter;
  float vx = 0.5;
  float vy = 0.5;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) {
        //Checking for tru collision between two sad faces

        collision = true;
        others[i].collision = true;
          

        
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring *1/4;
        float ay = (targetY - others[i].y) * spring * 1/4;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
        
      }
    }   
  }
  
  void move() {
    if (x>=width || x<0){
      vx = -vx;
    }
     if (y>=height || y<=0){
      vy = -vy;
    } 
    x+=vx;
    y+=vy;
  }
  
  void display() {
    if(collision){
      image(heart,x, y, diameter, diameter);
    }
    else{

      image(sad,x, y, diameter, diameter);
    }
    
  }
}
