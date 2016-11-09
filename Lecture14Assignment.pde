/* Hello dear peerreviewer, I hope you enjoy my angry birds startup. 
 I took the assignment quite literal :) 
 I couldn't figure out how to make the bird fly faster when the string is pulled
 further. If you have any idea, please let me know!
 Made by Kevin
 */
Mover m;
PVector centre;
PImage catapult;
PImage bg;


import processing.sound.*;
SoundFile slingStr;

void setup() {
  size (640, 360);
  m = new Mover();
  catapult = loadImage("angry-birds-catapult.png");
  bg = loadImage("AngrybirdsBG.jpg");
  slingStr = new SoundFile(this, "Slingshotsound.mp3");
}


void draw() {

  imageMode(CENTER);
  image(bg, width/2, height/2, width, height);
  image(catapult, width/2, height/2+90, 50, height/2+20);
  // adding gravity to my sketch
  PVector gravity = new PVector(0, 0.05);
  m.applyForce(gravity);
  m.display();
  // making the ball appear on the cursor when clicked
  if ( mousePressed ) {
    

    m.loc.x = mouseX;
    m.loc.y = mouseY;
    m.vel.mult(0);
    strokeWeight(7);
    line(width/2-20, height/2+15, mouseX, mouseY);
    line(width/2+20, height/2+25, mouseX, mouseY);
    //ellipse(width/2,height/2,10,10);
  }
  

  m.update();
  m.edges();
}
void mouseReleased() {
  centre = new PVector(width/2, height/2);
  m.vel.mult(0);
  m.acc = centre.sub(m.loc);
  m.acc.setMag(15);
  m.display();
  m.update();
  slingStr.stop();
}