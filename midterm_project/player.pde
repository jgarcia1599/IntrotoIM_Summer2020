
class Player{
  PImage image;
  float player_width,player_height,player_x,player_y;
  
  float center_x,center_y;
  int scale;
  
  //Player's constructor function
  Player(String received_image_path){
    image = loadImage(received_image_path);
    
    
  }
  
  //Player's draw function
  void draw(float current_x,float current_y,float current_width,float current_height,int received_scale){
    scale = received_scale;
    player_width = current_width;
    player_x = current_x;
    player_y = current_y;
    player_width = current_width;
    player_height = current_height;
    
    image(image,player_x,player_y,player_width,player_height);  
    
    //Calculating the center of the image for collision detection between the player and the food items
    
    center_x = (player_x + player_width/2);
    center_y = (player_y + player_height/2);
  }
  // Function that checks whether or not a food item has been eaten by the player using the distance function
  boolean check_if_eat( Food received_food){
    float check_distance = dist(center_x,center_y,received_food.food_x,received_food.food_y)/2;
    // an arbitrary, naive distance diameter that came from experimentation. Ther is definetly a way to improve this
    if (check_distance<=15){
         received_food.eaten = true;
         return true;
    }
    else{
      return false;
    }
  }
  
  
  
  
  
}
