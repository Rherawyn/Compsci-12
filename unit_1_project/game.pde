int vy, ay;

ball a;

void game() {
  background(255);
  
  player(100,100);

  a.display();
  a.drop();
}

void player (float x, float  y) {
  pushMatrix();
  translate(x,y);
  stroke(5);
  fill(#1EE32C);
  ellipse(0,0,80,70);
  fill(255);
  ellipse(0,-35, 50,25);
  fill(0);
  ellipse(-10,-35,10,5);
  ellipse(10,-35,10,5);
  popMatrix();
}

void gameMouseReleased() {
}

void gamekeyPressed() {
}
