class Bullet extends GameObject{

  int timer;
  
  Bullet() {
    super(showship.loc.copy(), showship.dir.copy());
    vel.setMag(10);
    timer = 90;
  }


  void show() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(2);
    circle(loc.x, loc.y, 5);
  }

  void act() {
    loc.add(vel);
    timer--;
    if(timer == 0) lives = 0;

    super(10, -5, -10, 5, 10, -5, -10, 5);
    //if (loc.x > width+10) loc.x = -5;
    //if (loc.x < -10) loc.x = width+5;
    //if (loc.y > height+10) loc.y = -5;
    //if (loc.y < -10) loc.y = height+5;
  }
}
