# ARt: An  Augmented Reality Tool for fun, artistic creations
## Technologies:
- HTML
- CSS
- JavaScript
    - Node.js
    - P5.js
    - Posenet
- Arduino

## Concept 
I want to make a tool that will help artists from all over the world collaborate by painting on a p5.js canvas.   
This project will allow users to do the following:  

- Several users can paint in one  room session
- Users will use their brush to paint on the computer screen 
    - Brush options:
        - Mouse
        - Left hand
        - Right hand
        - Head
- Whoever created the room will end the session, and the artistic result will be a jpeg file.

## Technical difficulties
The most difficult thing I foresee from making this project is being able to download the result as a jpeg file. I have experience using posenet, node.js, and p5 before and I did the following tutorial from Dan Shiffman :
https://www.youtube.com/watch?v=bjULmG8fqc8 where he basically created a collaborative canvas by using a mouseclick event as the brush. I got really excited by this tutorial and I want to extend it by adding additional choices for the brush (human poses enabled by PoseNET or an arduino controller ) and rendering the canvas result on a downloadable jpeg file.  I also want to extend the node backend by adding rooms so that people can create a room, invite their friends to collaborate with them, and make art pieces exclusive to the people in the room only. These extensions are non trivial and will require me to read up on Node.js a bit more, something I am looking forward to as I am learning Node on the side at the moment. 

## Splasher 
The splasher will be made using Arduino. It will consist of 4 switch buttons. Whenever a user has a splasher available, they will be able to add paint splash effects that are randomly splattered in the sketch. The schematics of the splasher can be found on the following <a href="https://github.com/jgarcia1599/IntrotoIM_Summer2020/tree/master/hw_June21">repo</a>, where I did a quick protoype of using arduino and processiing together for a single-user sketch. 
