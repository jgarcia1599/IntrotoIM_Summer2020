import gab.opencv.*;
import processing.video.*;
import java.awt.*;

class Player{
  PImage image;
  float player_width,player_height,player_x,player_y;
  
  float center_x,center_y;
  //in case I need toadjust any calculations to the global scaling occuring in the draw loop
  int scale;
  
  Player(String received_image_path){
    image = loadImage(received_image_path);
    
  }
  
  void draw(float current_x,float current_y,float current_width,float current_height,int received_scale){
    scale = received_scale;
    player_width = current_width;
    player_x = current_x;
    player_y = current_y;
    player_width = current_width;
    player_height = current_height;
    
    image(image,player_x,player_y,player_width,player_height);  
    
    //Calculating the center of the image
    
    center_x = (player_x + player_width/2);
    center_y = (player_y + player_height/2);
  }
  
  boolean check_if_eat( Food received_food){
    strokeWeight(5);
    fill(0,0,255);
    ellipse(center_x,center_y,20,20);
    float check_distance = dist(center_x,center_y,received_food.food_x,received_food.food_y)/2;
    //line(center_x,center_y,received_food.center_x,received_food.center_y);
    //println(check_distance);
    //float cool_xrange = 1;
    //(center_x-cool_xrange<=received_food.center_x && received_food.center_x<=center_x + cool_xrange)
    if (check_distance<=15)
    {
         //println("Ok I ate it");
         received_food.eaten = true;
         return true;
    }
    else{
      return false;
    }
      
    
    
  
  
  }
  
  
  
  
  
}
