//Food class
class Food{
  //Food's Class Variables
  PImage food_image;
  float food_x,food_y,food_width,food_height,center_x,center_y;
  float downward_velocity;
  boolean eaten = false;
  int scale;
  
  boolean reduce_lives_once = true;
  //Constructor Class
  Food(String received_image_path,float received_x, float received_y,float received_width,float received_height,int received_scale,int received_downward_velocity){
     food_image = loadImage(received_image_path);
     // I had to scale down the properties of thee food item so as to compensate for the scaling 
     // that occurs with the video image. This is to avoid doing unnecesary pushing and poping operations
     // as i was not that confident with that function and  was afraid it would slow down my program to much
     scale = received_scale;
     food_x = received_x/scale;
     food_y = received_y/scale;
     food_width = received_width/scale;
     food_height = received_height/scale;
     center_x = food_x+food_width/2;
     downward_velocity = received_downward_velocity;
     
     
  }
  //Draw fucntion
  void draw(){
    //Only display the image if it has noot been eaten. The eaten variable will be changed by the Player's check_if_eat function
    if(!eaten){
      food_y+=downward_velocity;
      center_y = food_y + food_height/2;
      image(food_image,food_x,food_y,food_width,food_height); 
    }
  }
  //reduce the user's live count if the food object has not been eaten and it goes beyond the canvas. I had to make sure this function only removes 
  //one life per foood object by using the reduced_lived_once variable as seen below
  void check_if_reduce_lives(){
    if(food_y>height && eaten == false && reduce_lives_once){    
      lives -=1;
      reduce_lives_once = false;
    }
  
  
  }
  
  


}
