class UFO extends GameObject {
  int sframes = 50;
  PVector dir;
  float spawn;

  UFO() {
    super(0, 0, 1, 1);

    spawn = (int)random(0, 4);
    if (spawn == 0) {
      loc.x = -25;
      loc.y = random(0, height);
    } else if (spawn == 1) {
      loc.x = width+25;
      loc.y = random(0, height);
    } else if (spawn == 2) {
      loc.x = random(0, width);
      loc.y = -25;
    } else if (spawn == 3) {
      loc.x = random(0, width);
      loc.y = height+25;
    }
    vel.setMag(random(1, 2));
    vel.rotate(random(TWO_PI));
    dir = new PVector(vel.x, vel.y);
    lives = 1;
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    stroke(colour);
    noFill();
    quad(-20, 20, -20, -20, 20, -15, 20, 15);
    line(20, 7, -10, 7);
    line(-10,7, -20, 20);
    line(20, -7, -10, -7);
    line(-10,-7, -20, -20);
    popMatrix();
  }

  void act() {
    loc.add(vel.x*1.5, vel.y*1.5);
    collisions();
    sframes--;
    if (sframes > 0) {
      wraparound(25);
    } else if (loc.x > width+25) {
      lives = 0;
    } else if (loc.x < -25) {
      lives = 0;
    } else if (loc.y > height+25) {
      lives = 0;
    } else if (loc.y < -25) {
      lives = 0;
    }
  }

  void collisions() {
    for (int i = 0; i < objects.size(); i++) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y)<20 + obj.d/2) {
          lives--;
          obj.lives = 0;
          showship.score++;
          vel.setMag(random(1, 2));
          vel.rotate(random(TWO_PI));
          for (int g  = 0; g < random(7, 10); g++) {
            objects.add (new Particles(loc.x, loc.y, random(-1,1), random(-1,1), 15));
          }
        }
      } else if (obj instanceof SpaceShip) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y)<40 && showship.ivframes <= 0) {
          lives--;
          obj.lives--;
          showship.ivframes = 200;
          showship.score++;
          vel.setMag(random(1, 2));
          vel.rotate(random(TWO_PI));
          for (int g  = 0; g < random(7, 10); g++) {
            objects.add (new Particles(loc.x, loc.y, random(-1,1), random(-1,1), 15));
          }
        }
      }
    }
  }
}
