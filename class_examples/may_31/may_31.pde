int foo = 0;

void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  fill(255,0,0);
  rect(foo, 50, 40, 40);
  fill(0,255,0);
  ellipse(foo, 200, 40, 40); 
  foo = foo + 1;
}
