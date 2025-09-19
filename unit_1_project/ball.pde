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
    
    if(x > width-25 || x < width-width+25) {
     xv = -1 * xv; 
    }
    
    if(y >= height-115) {
     yv = -10; 
     fails++;
    } else if (dist(x,y,hitx,hity) < 50 && sword == true) {
      yv = -10; 
      if (hitx - x > 0) {
        xv = -1 * abs(xv); 
      } else if (hitx - x <= 0) {
        xv = abs(xv);
      }
    }

  }


  void display() {
    fill(colour);
    circle(x, y, 50);
  }
}
