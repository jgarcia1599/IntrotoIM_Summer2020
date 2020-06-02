

void setup(){
  size(400,400);
  background(0);



}
int x_movement = 0;
void draw(){
  //println(rand);
  for (int y_movement=0;y_movement<=height;y_movement=y_movement+50){
    noStroke();
    //TOP STRIP OF THE FLAG
    if (y_movement<height/3){
      fill(100,150,200);
    }
    else if(y_movement<(2*height/3)){ // MIDDLE STRIP OF THE FLAG
      fill(255);
    }
    else{
      // BOTTOM STRIP OF THE FLAG 
      fill(100,150,200);
    }
    ellipse(x_movement,y_movement,50,50);


    
    
  }
  
  
  x_movement+=50;
  
// Stars
  //CENTER STAR
  fill(100,150,200);
  ellipse(200,200,50,50);
  // TOP LEFT STAR
  fill(100,150,200);
  ellipse(100,150,50,50);

  // BOTTOM LEFT STAR
  fill(100,150,200);
  ellipse(100,250,50,50);
  
  //TOP RIGHT STAR
  fill(100,150,200);
  ellipse(300,150,50,50);

  //BOTTOM RIGHT START
  fill(100,150,200);
  ellipse(300,250,50,50);
  
}
