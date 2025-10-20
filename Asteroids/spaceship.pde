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
      if (vel.x > 10) vel.setMag(10);
      if (vel.y > 10) vel.setMag(10);
    } else if (shipType == 1) ship2();
    //movement2
    loc.add(vel);
    if (upKey) vel.add(dir.x/2, dir.y/2);
    if (downKey) vel.sub(dir.x/2, dir.y/2);
    if (leftKey) {
      sLeft = dir.copy();
      sLeft.rotate(radians(-90));
      vel.add(sLeft.x/2, sLeft.y/2);
    }
    if (rightKey) {
      sRight = dir.copy();
      sRight.rotate(radians(90));
      vel.add(sRight.x/2, sRight.y/2);
    }
    if (turnRightKey) dir.rotate(radians(3));
    if (turnLeftKey) dir.rotate(-radians(3));
    //deceleration2
    if (!upKey && !downKey && !leftKey && !rightKey) vel.x *= 0.97;
    vel.y *= 0.97;
    //boundaries2
    if (loc.x > 1035) loc.x = -30;
    if (loc.x < -35) loc.x = 1030;
    if (loc.y > 935) loc.y = -30;
    if (loc.y < -35) loc.y = 930;
    //speed cap2
    if (vel.x > 13) vel.setMag(13);
    if (vel.y > 13) vel.setMag(13);
    else if (shipType == 2) ship3();
    //movement3
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
    //deceleration3
    if (!upKey && !downKey && !leftKey && !rightKey) vel.x *= 0.96;
    vel.y *= 0.96;
    //boundaries3
    if (loc.x > 1030) loc.x = -25;
    if (loc.x < -30) loc.x = 1025;
    if (loc.y > 930) loc.y = -25;
    if (loc.y < -30) loc.y = 925;
    //speed cap3
    if (vel.x > 10) vel.setMag(10);
    if (vel.y > 10) vel.setMag(10);
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
}
