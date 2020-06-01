
float speed = 5;
float x;
float y = 0;
int xPosition = 0;
int yPosition = 0;
float gravity = .1;
float bouncing_speed = 0;
float bouncing_x = 320;
float bouncing_y = 0;


void setup(){
  

  size(500, 500);
  x = width/2;
  //frameRate(5);
  
}


void draw(){
  
  if(mousePressed == true){
    background(0);
  }
  else{
      background(230,190,89);
  }
  
  fill(200,80,70);

  rect(mouseX,mouseY,40,40);
  ellipse(xPosition,yPosition,50,50);
  xPosition+=1;
  yPosition+=2;

  ellipse(x, y, 20, 20);

  y+=speed;

  if (y>=height || y<=0 ) {
    speed = -speed;
  }
  
  ellipse(bouncing_x, bouncing_y, 20, 20);

  bouncing_y+=bouncing_speed;

  bouncing_speed+=gravity;

  if (y>=height) {
    bouncing_speed = 0.95 * bouncing_speed; // this slows the acceleration
    bouncing_speed = -bouncing_speed; // this reverses
  }

}
