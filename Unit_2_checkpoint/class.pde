class mover {
  float x, y, r;
  int craycray, crayR, crayB, crayG;

  mover() {
    x = 300;
    y = 300;
    r = 100;
    craycray = int(random(4));
    crayR = int(random(255));
    crayB = int(random(255));
    crayG = int(random(255));
  }

  void display() {
    strokeWeight(5);
    stroke(0);
    if (craycray == 0) {
      fill(random(255), random(255), random(255));
    } else if (craycray == 1) {
      fill(255, 255, 255);
    } else if (craycray == 2) {
      fill(crayR,crayB,crayG);
    } else if (craycray == 3) {
     r = random(50,100);
    }
    circle(x, y, r);
  }

  void act() {
    x = x + random(-5, 5);
    y = y + random(-5, 5);
  }
}
