class Food{
  PImage food_image;
  float food_x,food_y,food_width,food_height,center_x,center_y;
  float downward_velocity;
  boolean eaten = false;
  int scale;
  
  boolean reduce_lives_once = true;
  Food(String received_image_path,float received_x, float received_y,float received_width,float received_height,int received_scale,int received_downward_velocity){
     food_image = loadImage(received_image_path);
     scale = received_scale;
     food_x = received_x/scale;
     food_y = received_y/scale;
     food_width = received_width/scale;
     food_height = received_height/scale;
     center_x = food_x+food_width/2;
     downward_velocity = received_downward_velocity;
     
     
  }
  void draw(){
    if(!eaten){
      food_y+=downward_velocity;
      center_y = food_y + food_height/2;
      image(food_image,food_x,food_y,food_width,food_height); 
    }
  }
  void check_if_reduce_lives(){
    if(food_y>height && eaten == false && reduce_lives_once){    
      lives -=1;
      reduce_lives_once = false;
    }
  
  
  }
  
  


}
