class Bullet {

  PVector loc;
  PVector vel;

  Bullet() {
    loc = new PVector(showship.loc.x, showship.loc.y);
    vel = showship.dir.copy();
    vel.setMag(10);
  }


  void show() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(2);
    circle(loc.x, loc.y, 5);
  }

  void act() {
    loc.add(vel);

    if (loc.x > width+10) loc.x = -5;
    if (loc.x < -10) loc.x = width+5;
    if (loc.y > height+10) loc.y = -5;
    if (loc.y < -10) loc.y = height+5;
  }
}
