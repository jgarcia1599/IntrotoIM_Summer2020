import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
Player main_player;
PImage face;

int scale_factor = 2;

int savedTime;

int lives = 10;

int score = 0;
String difficulty = "Level: easy";

String [] images = {"burguer.png","drink.png","fries.png"};

//Modifuy game conditions
int modulus_creator = 300;
int easy_level_treshold = 2000;
int medium_level_treshold = 4000;

String state = "play";

ArrayList <Food> food_items = new ArrayList <Food>();
Food sample;
void setup() {
  
  size(640, 480);
  sample = new Food(images[(int) random(0,2.99)],random(100,width-100),-4,100,100,scale_factor,1);
  food_items.add( sample);
  main_player = new Player("face_open.png");
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
  
  savedTime = millis();
}

void draw() {
  
  //println(frameCount);
  println(lives);
  
  
  if(state == "play"){
  
  
  
  
  }
  //Easy Level
  if (frameCount % 300 ==0 && frameCount<=easy_level_treshold) {
    println("New easy burguer");
    sample = new Food(images[(int) random(0,2.99)],random(100,width-100),-4,100,100,scale_factor,1);
    food_items.add( sample);
    println(food_items.size());
  
  }
  
  //Medium Level
  
   if (frameCount % 300 ==0 && frameCount>easy_level_treshold && frameCount <= medium_level_treshold ) {
    println("New medium burguer");
    difficulty = "Level: medium";
    int separator = 10;
    int velocity_increase = 1;
    for (int i =0; i< 3; i++){
      sample = new Food(images[(int) random(0,2.99)],random(100,width-100),random(-50,-separator),100,100,scale_factor,velocity_increase);
      food_items.add( sample);
      println(food_items.size());
      separator+=10;
      velocity_increase+=1;
    
    }
  
  }


  // Hard level
    if (frameCount % 300 ==0 && frameCount > medium_level_treshold) {
      println("New hard burguer");
      difficulty = "Level: hard";
      int separator = 10;
      int velocity_increase = 1;
      for (int i =0; i< 7; i++){
        sample = new Food(images[(int) random(0,2.99)],random(100,width-100),random(-50,-separator),100,100,scale_factor,velocity_increase);
        food_items.add( sample);
        println(food_items.size());
        separator+=10;
        velocity_increase+=2;
      
      }
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
    Food current = food_items.get(x);
    current.draw();
    boolean is_eated = main_player.check_if_eat(current);
    if (is_eated){
      food_items.remove(x);
      score+=1;
    
    }
  }
  
   textSize(30);
   fill(0,255,0);
   text(score, 280, 40); 
   
   textSize(10);
   fill(255,0,0);
   text(difficulty, 6, 25);
   
   for(int g = 0;g<food_items.size(); g++){
     food_items.get(g).check_if_reduce_lives();
   }
    
}

void captureEvent(Capture c) {
  c.read();
}
