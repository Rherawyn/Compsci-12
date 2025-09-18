class ball {
  float x, y, xv, yv, ya;
  color colour;

  ball() {
    x = 600;
    y = 500;
    ya = 0.15;
    xv = -2;
    yv = -10;
    
    strokeWeight(2);
    colour = color(random(255), random(255), random(255));
  }

  void drop() {

    yv = yv + ya;

    y = y + yv;
    
    x = x + xv;
    
    if(x > 1175 || x < 25) {
     xv = -1 * xv; 
    }
    
    if(y >= 885) {
     yv = -10; 
    }

  }


  void display() {
    fill(colour);
    circle(x, y, 50);
  }
}
