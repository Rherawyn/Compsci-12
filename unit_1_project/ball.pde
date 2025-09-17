class ball {
  float x, y, xv, yv, ya;

  ball() {
    x = 600;
    y = 500;
    ya = 0.1;
    xv = -2;
    yv = -10;
    
    fill(random(255), random(255), random(255));
    stroke(5);
  }

  void drop() {

    yv = yv + ya;

    y = y + yv;
    
    x = x + xv;

  }


  void display() {
    circle(x, y, 50);
  }
}
