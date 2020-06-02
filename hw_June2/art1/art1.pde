

void setup(){
  size(800,800);
  background(230,245,100);



}
int x_movement = 0;
void draw(){
  //for loops which creates random color ellipses along the y axis
  for (int y_movement=0;y_movement<=height;y_movement++){
    noStroke();
    fill(random(0,255),random(0,255),random(0,255)); 
    ellipse(x_movement,y_movement,50,50);
     
    
  }
  // variable that moves said ellipses from left to right along the x-axis
  x_movement+=1;

  
}
