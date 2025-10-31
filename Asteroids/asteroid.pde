class Asteroid  extends GameObject {
  PShape shape;
  float spawn;

  Asteroid() {
    super(0, 0, 1, 1);
    spawn = (int)random(0, 4);
    if (spawn == 0) {
      loc.x = -100;
      loc.y = random(0, height);
    } else if (spawn == 1) {
      loc.x = width+100;
      loc.y = random(0, height);
    } else if (spawn == 2) {
      loc.x = random(0, width);
      loc.y = -100;
    } else if (spawn == 3) {
      loc.x = random(0, width);
      loc.y = height+100;
    }
    vel.setMag(random(1, 2));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = 66*lives;
    shaped();
  }

  Asteroid(int l, float x, float y) {
    super(x, y, 1, 1);
    vel.setMag(random(1, 2));
    vel.rotate(random(TWO_PI));
    lives = l;
    d = 66*lives;
    shaped();
  }

  void show() {
    pushMatrix();
    translate(0, 0);
    shape(shape, loc.x, loc.y);
    popMatrix();
  }

  void act() {
    stroke(255);
    noFill();
    loc.add(vel);
    wraparound(40*lives);
    collisions();
  }

  void shaped() {
    int s = 33*lives;
    int s2 = 23*lives;
    int r = 5*lives;
    int r2 = 3*lives;
    noFill();
    stroke(255);
    strokeWeight(5);
    shape = createShape();
    shape.beginShape();
    shape.vertex(s+random(-r, r), 0+random(-r2, r2));
    shape.vertex(s2+random(-r, r), s2+random(-r, r));
    shape.vertex(0+random(-r2, r2), s+random(-r, r));
    shape.vertex(-s2+random(-r, r), s2+random(-r, r));
    shape.vertex(-s+random(-r, r), 0+random(-r2, r2));
    shape.vertex(-s2+random(-r, r), -s2+random(-r, r));
    shape.vertex(0+random(-r2, r2), -s+random(-r, r));
    shape.vertex(s2+random(-r, r), -s2+random(-r, r));
    shape.endShape(CLOSE);
  }

  void collisions() {
    for (int i = 0; i < objects.size(); i++) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y)<d/2 + obj.d/2) {
          lives--;
          obj.lives = 0;
          shaped();
          vel.setMag(random(1, 2));
          vel.rotate(random(TWO_PI));
          objects.add (new Asteroid(lives, loc.x, loc.y));
          if (obj.lives <= 0) objects.remove(i);
        }
      } else if (obj instanceof SpaceShip) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y)<d/2 + 20 && showship.ivframes <= 0) {
          lives--;
          obj.lives--;
          showship.ivframes = 200;
          shaped();
          vel.setMag(random(1, 2));
          vel.rotate(random(TWO_PI));
          objects.add (new Asteroid(lives, loc.x, loc.y));
          if (obj.lives <= 0) objects.remove(i);
        }
      }
    }
  }
}
