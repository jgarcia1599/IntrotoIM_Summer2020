
//I am referencing the windowWidth and windowHeight to facilitate the placement of the different shapes
int windowWidth = 700;
int windowHeight = 700;
int skycolor = color(143, 255, 253);


int offset = 150;//This offset variable was to move everything down in the canvas

void setup() {
  size(700, 700);
  background(skycolor);
}

void draw() {
  
  // This is the body
  fill(0);
  noStroke();
  triangle(
    
    windowWidth/2,
    windowHeight/2+offset,
    
    0,
    windowHeight+offset,
    
    windowWidth,
    windowHeight+offset
 
  );
  
  // This is the afro
  // Modified from: https://stackoverflow.com/questions/27903333/how-can-i-use-a-for-loop-to-create-circles-in-a-circle-in-processing
  float incrementalAngle = 0.0;
  int circlesNumber = 20;
  int bigCircleNumber = 150;

  for(int i = 0; i < circlesNumber; i++){
    fill(0);
    ellipse(bigCircleNumber * cos(incrementalAngle) + height/2, 
            bigCircleNumber * sin(incrementalAngle) + width/2-200+offset, 
            circlesNumber+220, circlesNumber+220);
    incrementalAngle += TWO_PI / circlesNumber;  
  } 
  
  //This is the head
  fill(148, 69, 0);
  noStroke();
  ellipse(windowWidth/2,windowHeight/3+40+offset,400,400);
  
  //This is the left eye
  fill(255);
  noStroke();
  ellipse(windowWidth/2 -80,-30+windowHeight/3+40+offset,50,50);

  fill(0);
  noStroke();
  ellipse(windowWidth/2 -80,-30+windowHeight/3+40+offset,10,10);
  
  //Left Eyebrow
  fill(0);
  noStroke();
  rect(windowWidth/2 -105,-30+windowHeight/3+40+offset -30,50,15);
  

  

  //This is the right eye
  fill(255);
  noStroke();
  ellipse(windowWidth-(windowWidth/2 -80),-30+windowHeight/3+40+offset,50,50);

  fill(0);
  noStroke();
  ellipse(windowWidth-(windowWidth/2 -80),-30+windowHeight/3+40+offset,10,10);
  
  
  //Right Eyebrow
  fill(0);
  noStroke();
  rect(windowWidth-(windowWidth/2 -55),-30+windowHeight/3+40+offset -30,50,15);
  
  //My smile
  noFill();
  stroke(0);
  arc(windowWidth/2, windowHeight*3/4, 100, 100, 0, PI);
  



  
  
}
