class Mover {
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  PImage bird;

  Mover() {
    loc = new PVector(width/4, height);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = 0.4; //it says mass but....the way I use it in my code its more like "friction" or "drag"
  }

  // adding newton's law to the sketch

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  // newton's second law
  void applyForce ( PVector f) {
    PVector force = PVector.div(f, mass);
    acc.add(force);
  }

  void display() {
    imageMode(CENTER);
    if ( loc.x > width/2 ) {
      bird = loadImage("Angry_Bird_red2.png");
    } else { 
      bird = loadImage("Angry_Bird_red.png");
    }

    image(bird, loc.x, loc.y, 50, 50);
    stroke(0);
    strokeWeight(2);
    fill(120);
    //ellipse(loc.x, loc.y, 30, 30);
  }
  void edges () {
    if ( loc.x > width-25) {
      loc.x=width-25;
      vel.x *= -1;
      vel.x *= mass;
    }
    if ( loc.x < 25 ) {
      loc.x = 25;
      vel.x *=-1;
      vel.x *= mass;
    }
    if ( loc.y > height-30) {
      loc.y = height-30;
      vel.y *= -1;
      vel.y *= mass;
      vel.x *= mass;
    }
    if ( loc.y < 30) {
      loc.y = 30;
      vel.y *= -1;
    }
  }
}