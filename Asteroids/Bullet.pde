class Bullet extends GameObject {

  int timer;

  Bullet() {
    super(showship.loc.copy(), showship.dir.copy());
    vel.setMag(10);
    timer = 90;
    loc.add(vel.x*3, vel.y*3);
    d = 5;
  }
  
  Bullet(float x) {
    super(showship.loc.copy(), showship.dir.copy());
    vel.setMag(10);
    timer = 90;

    loc.add(vel.x*1.5, vel.y*1.5);
    loc.x += vel.y*x;
    loc.y -= vel.x*x;
    d = 5;
  }


  void show() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(2);
    circle(loc.x, loc.y, d);
  }

  void act() {
    loc.add(vel);
    timer--;
    if (timer == 0) lives = 0;

    wraparound(5);
  }
}
