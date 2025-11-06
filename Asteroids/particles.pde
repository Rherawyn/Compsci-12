class Particles extends GameObject {
  int o = 100;
  
  Particles(float x, float y, float vx, float vy, int _d) {
    super(x, y, vx, vy);
    lives = 1;
    d = _d;
  }

  void show() {
    fill(colour,o);
    stroke(colour,o);
    strokeWeight(3);
    circle(loc.x, loc.y, d);
    o--;
    
    loc.add(vel);
    
    if(o <= 0) {
      lives = 0;
    }
  }
}
