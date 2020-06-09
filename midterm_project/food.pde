class Food{
  PImage food_image;
  float food_x,food_y,food_width,food_height,center_x,center_y;
  float downward_velocity = 1;
  int scale;
  Food(String received_image_path,float received_x, float received_y,float received_width,float received_height,int received_scale){
     food_image = loadImage(received_image_path);
     scale = received_scale;
     food_x = received_x/scale;
     food_y = received_y/scale;
     food_width = received_width/scale;
     food_height = received_height/scale;
     center_x = food_x+food_width/2;
     
     
  }
  void draw(){
    food_y+=downward_velocity;
    center_y = food_y + food_height/2;
    image(food_image,food_x,food_y,food_width,food_height);
  }
  
  


}
