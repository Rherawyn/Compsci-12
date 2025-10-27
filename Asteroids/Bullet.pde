class Bullet extends GameObject {

  int timer;

  Bullet() {
    super(showship.loc.copy(), showship.dir.copy());
    vel.setMag(10);
    timer = 90;
    loc.add(vel.x*3, vel.y*3);
  }
  
  Bullet(float x) {
    super(showship.loc.copy(), showship.dir.copy());
    vel.setMag(10);
    timer = 90;

    loc.add(vel.x*1.5, vel.y*1.5);
    loc.x += vel.y*x;
    loc.y -= vel.x*x;
  }


  void show() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(2);
    if (shipType == 2) {
      circle(loc.x, loc.y, 5);
    } else {
      circle(loc.x, loc.y, 5);
    }
  }

  void act() {
    loc.add(vel);
    timer--;
    if (timer == 0) lives = 0;

    wraparound(10, -5, -10, 5);
  }
}
