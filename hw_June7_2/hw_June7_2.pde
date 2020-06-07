

void setup(){
  size(800, 600);
  background(255, 232, 102);
  for (int i = 10; i < width; i = i + 50)
  {
    house(i, 20);
  }
  for (int i = 10; i < width; i = i + 50)
  {
    house(i, height-100);
  }

}

int x_position = 0;
int rotation = 0;
void draw(){
  pushMatrix();
  translate(x_position,20);
  rotate(radians(rotation));
  house(x_position, 40);
  popMatrix();
  x_position+=20;
  rotation+=5;
  
  




}

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
