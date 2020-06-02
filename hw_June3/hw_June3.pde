//Code inspired from https://processing.org/examples/bouncybubbles.html

//Number of hearts in canvas
int numHearts = 30;
float spring = 0.05;
Heart[] hearts = new Heart[numHearts];
PImage heart,sad,earth;
boolean all_hearts = false;
void setup() {

  //Load Images
  heart = loadImage("heart.png");
  sad = loadImage("sad.png");
  earth = loadImage("happy_earth.png");

  size(800, 700);
  //Fill array of type Heart with hearts
  for (int i = 0; i < numHearts; i++) {
    hearts[i] = new Heart(random(width), random(height), 50, i, hearts);
  }
}

void draw() {
  //Leaving trail code: if all objects are hearts, then stop drawing the backgroud again so as to leave atrail of hearts
  if(!all_hearts){
    background(255, 143, 143);
  }
  //Counter to check whether or not hearts have been collided
  int collided_hearts = 0;

  for (Heart heart : hearts) {
    heart.collide();
    heart.move();
    heart.display(); 
    if (heart.collision == true){
      collided_hearts++;
    }
    
  }

  //Seet boolean true when all hearts have collided
  if (collided_hearts == numHearts){
    println("all are hearts");
    all_hearts = true;
  }
  
}

class Heart {
  //This boolean tells the object whether to show a sad face or a heart
  boolean collision = false;
  float x, y;
  float diameter;
  float vx = 0.5;
  float vy = 0.5;
  int id;
  Heart[] others;
 
 //Heart Constructor
  Heart(float xin, float yin, float din, int idin, Heart[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  //Collide function copied from https://processing.org/examples/bouncybubbles.html
  void collide() {
    for (int i = id + 1; i < numHearts; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      //Collision
      if (distance < minDist) {
        //Set bolean to true when there is collision
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
    //check for right an left walls. If collision, flip velocity
    if (x>=width || x<0){
      vx = -vx;
    }
    //check for up and down  walls. If collision, flip velocity
     if (y>=height || y<=0){
      vy = -vy;
    } 
    x+=vx;
    y+=vy;
  }
  
  void display() {
    //Display either sad face or heart depending on collision variable
    if(collision){
      image(heart,x, y, diameter, diameter);
    }
    else{

      image(sad,x, y, diameter, diameter);
    }
    
  }
}
