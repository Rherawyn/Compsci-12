class Particles extends GameObject {
  int o = 100;
  
  Particles(float x, float y) {
    super(x, y, random(-1, 1), random(-1, 1));
    lives = 1;
    d = 15;
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
