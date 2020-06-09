import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
Player main_player;
PImage face;

int scale_factor = 2;

int savedTime;


//Modifuy game conditions
int modulus_creator = 300;
int easy_level_treshold = 3000;
int medium_level_treshold = 6000;

ArrayList <Food> food_items = new ArrayList <Food>();
Food sample;
void setup() {
  
  size(640, 480);
  sample = new Food("burguer.png",random(width),-4,100,100,scale_factor,1);
  food_items.add( sample);
  main_player = new Player("face_open.png");
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
  
  savedTime = millis();
}

void draw() {
  
  println(frameCount);
  //Easy Level
  if (frameCount % 300 ==0 && frameCount<=easy_level_treshold) {
    println("New easy burguer");
    sample = new Food("burguer.png",random(width),-4,100,100,scale_factor,1);
    food_items.add( sample);
    println(food_items.size());
  
  }
  
  //Medium Level
  
   if (frameCount % 300 ==0 && frameCount>easy_level_treshold && frameCount <= medium_level_treshold ) {
    println("New medium burguer");
    sample = new Food("burguer.png",random(width),-4,100,100,scale_factor,2);
    food_items.add( sample);
    println(food_items.size());
  
  }

// Hard level

  if (frameCount % 300 ==0 && frameCount > medium_level_treshold) {
    println("New medium burguer");
    sample = new Food("burguer.png",random(width),-4,100,100,scale_factor,3);
    food_items.add( sample);
    println(food_items.size());
  }
  

  
  //println(frameCount);
  scale(scale_factor);
  opencv.loadImage(video);
  image(video, 0, 0);
  
  Rectangle[] faces = opencv.detect();
  //println(faces.length);
  for (int i = 0; i < faces.length; i++) {
    main_player.draw(faces[i].x, faces[i].y, faces[i].width, faces[i].height,scale_factor);
    main_player.check_if_eat(sample);
  }
  for(int x = 0;x<food_items.size(); x++){
    boolean is_eated = main_player.check_if_eat(food_items.get(x));
    if (is_eated){
      food_items.remove(x);
    
    } 
  }
  //println(food_items.size());
  sample.draw();
  
  
  
}

void captureEvent(Capture c) {
  c.read();
}
