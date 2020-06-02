

void setup(){
  size(400,400);
  background(252, 116, 116);



}
//x movement variable that dictates the movement along the x axis
int x_movement = 0;
void draw(){
  for (int y_movement=0;y_movement<=height;y_movement=y_movement+50){
    noStroke();
    //random color assignment of ellipses
    fill(random(0,255),random(0,25),random(0,255));  
    ellipse(x_movement,y_movement,50,50);  
  }
  
  
  x_movement+=50;
  //Notice how both the x movevent and the i variable (y displacement) are 50. 
  //T his was done so that the mosaic looks less cluttered unlike the first art piece. 
  




  
}
