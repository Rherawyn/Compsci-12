class GameObject {
  
  PVector loc;
  PVector vel;
  int lives;
  
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
  
  GameObject(int x1,int x2,int x3,int x4,int y1,int y2,int y3,int y4) {
    if (loc.x > width+x1) loc.x = x2;
    if (loc.x < x3) loc.x = width+x4;
    if (loc.y > height+y1) loc.y = y2;
    if (loc.y < y3) loc.y = height+y4;
  }
  
  void act() {
  }
  
  void show() {
  }
}
