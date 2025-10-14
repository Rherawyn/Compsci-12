class Mover {
  PVector loc;
  PVector vel;
  float d;
  boolean alive;

  Mover() {
    d = 100;
    loc = new PVector (random(0, width), random(0, height));
    vel = new PVector (random(-5, 5), random(-5, 5));
    vel.setMag(random(1, 3));
    vel.rotate(radians(random(0, 360)));
    alive = true;
  }

  Mover(float x, float y) {
    d = 100;
    loc = new PVector (x, y);
    vel = new PVector (random(-5, 5), random(-5, 5));
    vel.setMag(random(1, 3));
    vel.rotate(radians(random(0, 360)));
    alive = true;
  }

  void act() {
    move();
    bounceOffEdge();
    checkForDeletion();
  }

  void checkForDeletion() {
    if (dist(loc.x, loc.y, mouseX, mouseY) < d/2 && mousePressed) {
      alive = false;
    }
  }

  void move() {
    loc.add(vel);
  }

  void bounceOffEdge() {
    if (loc.x < 0 || loc.x > width) vel.x = -vel.x;
    if (loc.y < 0 || loc.y > height) vel.y = -vel.y;
  }

  void showBody() {
    noStroke();
    fill(255, 50);
    circle(loc.x, loc.y, d);
  }


  void showConnections() {
    for (int i = 0; i < movers.size(); i++) {
      Mover other = movers.get(i);
      float dist = dist(loc.x, loc.y, other.loc.x, other.loc.y);
      if (dist <= 200) {
        float a = map(dist, 0, 200, 255, 0);
        stroke(255, a);
        strokeWeight(1);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
  }
}
