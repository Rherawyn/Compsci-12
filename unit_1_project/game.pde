int vy, ay;

void game() {
  
}

void ball(int x, int y) {
 pushMatrix();
 translate(x,y);
 circle(0,0,100);
 popMatrix();
}
