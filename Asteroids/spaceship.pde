class SpaceShip {

  //instance variables
  PVector loc;
  PVector vel;
  PVector dir;
  int lives;


  //constructor
  SpaceShip() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    dir = new PVector(1, 0);
  }

  //behavior functions
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    if (shipType == 0) ship1();
    else if (shipType == 1) ship2();
    else if (shipType == 2) ship3();
    popMatrix();
  }

  void act() {
    move();
    shoot();
    collisions();
  }

  void move() {
  }

  void shoot() {
  }

  void collisions() {
  }

  void ship1() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(5);
    triangle(-20, -20, -20, 20, 20, 0);
  }
  
  void ship2() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(5);
    triangle(-35, -15, -35, 15, 35, 0);
  }
  
  void ship3() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(5);
    triangle(-15, -35, -15, 35, 15, 0);
  }
}
