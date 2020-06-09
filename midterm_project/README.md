# Eating Shake Shack 




# Issues

- Dealing with calculations applied before and after scaling
- Using the millis library to create new food items based on time. I decided to use frame count instead.
- separating the y space between the different food items appearing.
- Making the  player loose after 3 food items_ go out of range.

```java
  boolean check_if_loose(Food received_food){
      if (received_food.food_y>height && received_food.eaten == false){
        return true;  
      }
      else{
        return false;
      }
  
  }
```

- Restarting the game. I think a lot of memory is being wasted.