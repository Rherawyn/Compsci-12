class Bullet extends GameObject {

  int timer;

  Bullet(boolean _tag) {
    super(showship.loc.copy(), showship.dir.copy());
    tag = _tag;
    vel.setMag(10);
    timer = 90;
    loc.add(vel.x*3, vel.y*3);
    d = 5;
  }

  Bullet(float x, boolean _tag) {
    super(showship.loc.copy(), showship.dir.copy());
    tag = _tag;
    vel.setMag(10);
    timer = 90;

    loc.add(vel.x*1.5, vel.y*1.5);
    loc.x += vel.y*x;
    loc.y -= vel.x*x;
    d = 5;
  }

  Bullet (float x, float y, boolean _tag) {
    super (ufo.loc.copy(), ufo.dir.copy());
    tag = _tag;
    loc.x = x;
    loc.y = y;
    vel.x = 1;
    vel.y = 0;
    vel.rotate(atan2(showship.loc.y-loc.y, showship.loc.x-loc.x));
    vel.setMag(10);
    //vel.add(showship.vel);
    vel.add(vel.x/15, vel.y/15);
    timer = 60;
    d = 5;
  }


  void show() {
    fill(BLACK);
    if (tag == true) {
      stroke(#FF0000);
    } else {
      stroke(colour);
    }
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
