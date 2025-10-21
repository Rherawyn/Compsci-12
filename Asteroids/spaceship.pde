class SpaceShip {

  //instance variables
  PVector loc;
  PVector vel;
  PVector dir;
  PVector sLeft;
  PVector sRight;
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
    rotate(dir.heading());
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

  void shoot() {
  }

  void collisions() {
  }

  void ship1() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(5);
    quad(-15, 20, -15, -20, 5, -10, 5, 10);
    rect(0, 0, 35, 6);
    triangle(-20, -20, -20, 20, 20, 0);
    line(-20, 0, 0, 0);
    line(0, 0, 5, -5);
    line(0, 0, 5, 5);
  }

  void ship2() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(5);
    rect(0, 0, 50, 6);
    quad(-35, 0, -20, -15, 20, 0, -20, 15);
    triangle(-35, -15, -35, 15, 35, 0);
    line(-35, 5, 7, 5);
    line(-35, -5, 7, -5);
    line(0, 0, 7, 5);
    line(0, 0, 7, -5);
  }

  void ship3() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(5);
    rect(-5, -20, 25, 6);
    rect(-5, 20, 25, 6);
    triangle(-15, -35, -15, 35, 15, 0);
    line(5, 0, 10, -5);
    line(5, 0, 10, 5);
    line(-15, 0, 5, 0);
    line(-5, -10, 0, -15);
    line(-5, 10, 0, 15);
    line(-5, 10, -15, 10);
    line(-5, -10, -15, -10);
  }

  void move() {
    if (shipType == 0) {
      //movement1
      loc.add(vel);
      if (upKey) vel.add(dir.x/3, dir.y/3);
      if (downKey) vel.sub(dir.x/3, dir.y/3);
      if (leftKey) {
        sLeft = dir.copy();
        sLeft.rotate(radians(-90));
        vel.add(sLeft.x/3, sLeft.y/3);
      }
      if (rightKey) {
        sRight = dir.copy();
        sRight.rotate(radians(90));
        vel.add(sRight.x/3, sRight.y/3);
      }
      if (turnRightKey) dir.rotate(radians(3));
      if (turnLeftKey) dir.rotate(-radians(3));
      //deceleration1
      if (!upKey && !downKey && !leftKey && !rightKey) vel.x *= 0.96;
      vel.y *= 0.96;
      //boundaries1
      if (loc.x > 1030) loc.x = -25;
      if (loc.x < -30) loc.x = 1025;
      if (loc.y > 930) loc.y = -25;
      if (loc.y < -30) loc.y = 925;
      //speed cap1
      if (vel.x > 9) vel.setMag(9);
      if (vel.y > 9) vel.setMag(9);
      if (vel.x < -9) vel.setMag(9);
      if (vel.y < -9) vel.setMag(9);
    } else if (shipType == 1) {
      //movement2
      loc.add(vel);
      if (upKey) vel.add(dir.x/3, dir.y/3);
      if (downKey) vel.sub(dir.x/3, dir.y/3);
      if (turnRightKey) dir.rotate(radians(3));
      if (turnLeftKey) dir.rotate(-radians(3));
      //deceleration2
      if (!upKey && !downKey && !leftKey && !rightKey) vel.x *= 0.96;
      vel.y *= 0.96;
      //boundaries2
      if (loc.x > 1030) loc.x = -25;
      if (loc.x < -30) loc.x = 1025;
      if (loc.y > 930) loc.y = -25;
      if (loc.y < -30) loc.y = 925;
      //speed cap2
      if (vel.x > 15) vel.setMag(15);
      if (vel.y > 15) vel.setMag(15);
      if (vel.x < -15) vel.setMag(15);
      if (vel.y < -15) vel.setMag(15);
    } else if (shipType == 2) {
      //movement3
      loc.add(vel);
      if (upKey) vel.add(0, -0.2);
      if (downKey) vel.add(0, 0.2);
      if (leftKey) vel.add(-0.2, 0);
      if (rightKey) vel.add(0.2, 0);
      if (turnRightKey) dir.rotate(radians(3));
      if (turnLeftKey) dir.rotate(-radians(3));
      //deceleration3
      if (!upKey && !downKey && !leftKey && !rightKey) vel.x *= 0.96;
      vel.y *= 0.96;
      //boundaries3
      if (loc.x > 1030) loc.x = -25;
      if (loc.x < -30) loc.x = 1025;
      if (loc.y > 930) loc.y = -25;
      if (loc.y < -30) loc.y = 925;
      //speed cap3
      if (vel.x > 6) vel.setMag(6);
      if (vel.y > 6) vel.setMag(6);
      if (vel.x < -6) vel.setMag(6);
      if (vel.y < -6) vel.setMag(6);
    }
  }
}
