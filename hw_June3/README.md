# Together we are better

 An OOP digital art piece by Junior Garcia

<img src="heart.gif">

## Description
This digital art piece uses OOP concepts in order to create a de-stablizing system of sad faces and hearts. The canvas starts with only sad faces that become hearts after they start colliding with each other. After all faces in the canvas become hearts, the hearts start leaving a trail of hearts along their way, speaking to the exponential effect of love and care. The sad faces in the canvas  speak to the striking effect of isolation, how being alone can cause one to be sad and depressed. A feeling that can be stopped when a person seeks help from another person, a phenomena that's represented in this piece through collisions. I was inspired to create this piece as a result of being distanced from my loved ones during this pandemic. Everyone at the moment is going through a hard time, whether it is a global pandemic, standing up against injustices, or just general day to day problems. As a result, I wanted to create a piece that tells the message that human to human collaboration can create beautiful things. 
  
This is how the canvas looks like after some time.

<img alt="Final Result" src="final.jpg">

 
## Process and Difficulties

I created a Heart class that resembles the examples  we did in class. It takes in the position and the diameter as paremeters and then the  Class methods determine the movement, collision, and display of the object. The movement is basically determined by an increase in velocity after every frame through a velocity counter for both x and y. Whenever one of the walls of the canvas is hit, the velocity is flipped so as to make the heart flip direction. The collision function, which I adpated from examples I found online, basically calculates the euclidean distance between the object and the rest of the objects in the Hearts array and checks whether or not they've collided. During collision, I set a boolean variable to true which basically tells me which display I need (after collision, I must display a heart). The heart trail is done by using another boolen variable that is turned true when all sad faces in the scene have turned to hearts. After that happens, then the background stops to being redrawn every frame.

In terms of improvements, I think I would have brushed up on my math skills in order to create a more realistic display after all collisions have been detected. Something I would liked to do was to do an animation at the end where the hearts move one after the other in the shape of a heart. However, that would have gotten very compplicated very fast and I didnt have time to do the research for such implementation. 