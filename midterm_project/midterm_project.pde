//Eating Shake Shack Game
//A game by Junior Garcia
//This game challenges user to eat as much shake shack as they can using their mouth
//Utilizes advanced programming concepts and libraries like OpenCV, Object Oriented Programming, Game State Management and , Increasing Game Difficulty
//I like Shake Shack and Programming, so why not combine both?


//Importing necessary dependencies
import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import processing.sound.*;


//OpenCV utilty variables
Capture video;
OpenCV opencv;
Player main_player;
//Scale factor that helps with transformations that need to occur to resize the video feed
int scale_factor = 2;

// string array that contains the different possible images that will displayed in the food object instances
String [] images = {"burguer.png","drink.png","fries.png"};
//eating sound for additional interaction
SoundFile eating_sound;



//Modifuy game conditions
int lives = 10;
int score = 0;
String difficulty = "Level: easy";
// to determine how often you want to create neww food objects 
int modulus_creator = 300;
// different ldifficulty treshold that increase the games difficult with the passage of time
int easy_level_treshold = 2500;
int medium_level_treshold = 5000;
//state variable that dictates the game's state [instructions, play, loose]
String state = "instructions";

//Array list that coontains all the food items that will 'fall from the sky'
ArrayList <Food> food_items = new ArrayList <Food>();
Food sample;

// additionak utility variables for menu screen and loose screen
PImage instructions,sad_emoji;
float button_x;
float button_y;
float button_w;
float button_h;

void setup() {
  
  size(640, 480);
  // instantaite a food object and added to the food_items array
  sample = new Food(images[(int) random(0,2.99)],random(100,width-100),-4,100,100,scale_factor,1);
  food_items.add( sample);
  //create the player instance
  main_player = new Player("face_open.png");
  //load eating sound file
  eating_sound = new SoundFile(this, "eat.mp3");
  
 //Open CV setup
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();
  // load necessary images for menu and loose displays
  instructions = loadImage("shake.png");
  sad_emoji = loadImage("sad.png");
  instructions.resize(width,height);
  button_x = width/2 - 75;
  button_y = height-90;
  button_w = 130;
  button_h = 80;
 
}

void draw() {
  // print frame count and lives for debugging purposes
  //println(frameCount);
  //println(lives);
  
  //change the state to loose when the user runs out of lives
  if (lives ==0){
    state = "loose";
  
  }
  //Instructions Page Code
  if (state == "instructions"){
     background(instructions);
     fill(94, 255, 99);
     rect(button_x,button_y,button_w,button_h);
     fill(0);
     textSize(32);
     text("Start", button_x + 27 ,button_y+50); 
     if(mousePressed){
      if(mouseX>button_x && mouseX <button_x+button_w && mouseY>button_y && mouseY <button_y+button_h){
       println("The mouse is pressed and over the button");
       fill(0);
       rect(button_x,button_y,button_w,button_h);
       // Activate playing state on mouse click
       state = "play";
      }
     }
  
  
  }
  else if(state == "play"){
    
    // The following if statements determine the difficulty of the game based on time. I used framecount as it proved to be easier to deal with. The more time it passes, 
    // the more and faster food objects will fall from the sky, making the game progressively more difficult.
    //Easy Level
    if (frameCount % 300 ==0 && frameCount<=easy_level_treshold) {
      //println("New easy burguer");
      sample = new Food(images[(int) random(0,2.99)],random(100,width-100),-4,100,100,scale_factor,1);
      food_items.add( sample);
      //println(food_items.size());
    
    }
    
    //Medium Level
     if (frameCount % 300 ==0 && frameCount>easy_level_treshold && frameCount <= medium_level_treshold ) {
      //println("New medium burguer");
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
        //println("New hard burguer");
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
    
  
    
    //scale the video feed 
    scale(scale_factor);
    opencv.loadImage(video);
    
    //display the image feed to the user
    image(video, 0, 0);
    
    Rectangle[] faces = opencv.detect();
    //println(faces.length);
    for (int i = 0; i < faces.length; i++) {
      //draw the user's face based on the facee detected by OpenCv
      main_player.draw(faces[i].x, faces[i].y, faces[i].width, faces[i].height,scale_factor);
    }
    
    for(int x = 0;x<food_items.size(); x++){
      Food current = food_items.get(x);
      current.draw();
      //Check if the current food  item has been eated by the user
      boolean is_eated = main_player.check_if_eat(current);
      if (is_eated){
        // remove tghe food item from the array if it has
        food_items.remove(x);
        // play eating sound
        eating_sound.play();
        // increase the user's score
        score+=1;
      
      }
    }
    //display the user's score
     textSize(30);
     fill(0,255,0);
     text(score, 280, 40); 
     
     //display the game's difficult, which will change based on increasing frame count 
     textSize(10);
     fill(0);
     text(difficulty, 6, 25);
     
     // check if any food items have left the canvas, hence decreasing the number of lives the user has left
     for(int g = 0;g<food_items.size(); g++){
       food_items.get(g).check_if_reduce_lives();
     }
  
  }
  else if(state == "loose"){
    // display the loose display to the user
   background(255);
   image(sad_emoji,width/2-100,height/2-100,200,200);
   fill(94, 255, 99);
   rect(button_x,button_y,button_w,button_h);
   fill(0);
   textSize(32);
   text("Restart", button_x + 14 ,button_y+50); 
   // On mouse hover and on mouse click
   if(mousePressed){
    if(mouseX>button_x && mouseX <button_x+button_w && mouseY>button_y && mouseY <button_y+button_h){
     //change the color of the rectangle to simulate mouse pressed action
     fill(0);
     rect(button_x,button_y,button_w,button_h);
     
     //Restart game's setting  variables so as to restart the entire game if the user wants to
     food_items = new ArrayList <Food>();
     sample = new Food(images[(int) random(0,2.99)],random(100,width-100),-4,100,100,scale_factor,1);
     food_items.add( sample);
     lives = 10;
     state = "instructions";
     difficulty = "Level: easy";
     score = 0;
     frameCount = 0;
     
    }
   }
 
  }
   
}

// Utility function required by open cv and processing's video library
void captureEvent(Capture c) {
  c.read();
}
