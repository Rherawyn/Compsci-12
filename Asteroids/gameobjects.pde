class GameObject {
  
  PVector loc;
  PVector vel;
  int lives;
  float d;
  
  GameObject(float lx, float ly, float px, float py) {
    loc = new PVector(lx, ly);
    vel = new PVector(px,py);
    lives = 3;
  }
  
  GameObject(PVector l, PVector v) {
    loc = l;
    vel = v;
    lives = 1;
  }
  
  void wraparound(int x1) {
    if (loc.x > width+x1) loc.x = -x1;
    if (loc.x < -x1) loc.x = width+x1;
    if (loc.y > height+x1) loc.y = -x1;
    if (loc.y < -x1) loc.y = height+x1;
  }
  
  void act() {
  }
  
  void show() {
  }
}
