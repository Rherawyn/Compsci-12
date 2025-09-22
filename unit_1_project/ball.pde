class ball {
  float x, y, xv, yv, ya;
  color colour;
  int start;
  boolean stupidity;

  ball() {
    start = round(random(2));
    if (start == 1) {
      x = 1150;
    } else {
      x = 50;
    }
    y = random(300,400);
    ya = 0.15;
    if (start == 1) {
      xv = -2;
    } else {
      xv = 2;
    }
    yv = random(-5,-8);;

    strokeWeight(2);
    colour = color(random(255), random(255), random(255));
  }

  void drop() {

    yv = yv + ya;

    y = y + yv;

    x = x + xv;

    if (x > width-25 || x < width-width+25) {
      xv = -1 * xv;
    }

    if (y >= height-115) {
      yv = -10;
      fails++;
    } else if (dist(x, y, hitx, hity) < 50 && sword == true) {
      yv = -10;
      if (stupidity == true) {
        score++;
        stupidity = false;
      }
      if (hitx - x > 0) {
        xv = -1 * abs(xv);
      } else if (hitx - x <= 0) {
        xv = abs(xv);
      }
    } else { stupidity = true; }
  }


  void display() {
    fill(colour);
    circle(x, y, 50);
  }
}
