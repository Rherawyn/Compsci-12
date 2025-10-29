class Asteroid  extends GameObject {
  PShape shape;

  Asteroid() {
    super(random(0, width), random(0, height), 1, 1);
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
          if(obj.lives <= 0) objects.remove(i);
        }
      }
    }
  }
}
