// A code to learn processing transformations
// By Junior Garcia

void setup(){
  size(800, 600);
  background(255, 232, 102);
  //Create uppe rline of houses
  for (int i = 10; i < width; i = i + 50)
  {
    house(i, 20);
  }
  //Create lower line of houses
  for (int i = 10; i < width; i = i + 50)
  {
    house(i, height-100);
  }

}
//Initial position and rotatuon
int x_position = 0;
int rotation = 0;
void draw(){
  //rotate thee house and leave a trail
  pushMatrix();
  translate(x_position,20);
  rotate(radians(rotation));
  house(x_position, 40);
  popMatrix();
  //increase rotation and x position counters
  x_position+=20;
  rotation+=5;
  
  




}

//house code through transformations obtained from: https://processing.org/tutorials/transform2d/
void house(int x, int y)
{
  pushMatrix();
  translate(x, y);
  fill(255, 193, 69);
  triangle(15, 0, 0, 15, 30, 15);
  fill(255, 237, 148);
  rect(0, 15, 30, 30);
  fill(255, 148, 148);
  rect(12, 30, 10, 15);
  noFill();
  popMatrix();
}
