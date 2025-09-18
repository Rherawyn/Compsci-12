int vy, ay, tj;
int px = 600;
float py = 800;
float pyv;
float pya = 0.4;
float htime;

boolean akey, dkey, skey, hitbox;

ball a;

void game() {
  background(100);

  fill(125);
  noStroke();
  rect(0, 900, 1200, 100);
  stroke(0);

  pyv = pyv + pya;

  //player movement
  if (akey) px = px - 7;
  if (dkey) px = px + 7;
  if (skey && py == 880) {
    if (tj < 10) {
      jump();
    }
  } else if (!skey) {
    tj = 0;
  }

  py = py + pyv;

  if (py > 880) {
    py = 880;
  }


  //balls for jugularling
  a.display();
  a.drop();

  //player
  player(px, py);
  if (hitbox == true) {
    slash (px, py);
  } else {
    slash (0, -100);
  }
}

void player (float x, float  y) {
  pushMatrix();
  translate(x, y);
  strokeWeight(2);
  fill(#606260);
  ellipse(0, 0, 80, 70);
  fill(#4D8637);
  pushMatrix();
  translate(25, -15);
  rotate(radians(30));
  ellipse(0, 0, 40, 30);
  popMatrix();
  pushMatrix();
  translate(-25, -15);
  rotate(radians(330));
  ellipse(0, 0, 40, 30);
  popMatrix();
  fill(255);
  ellipse(0, -35, 50, 25);
  fill(0);
  ellipse(-10, -35, 10, 5);
  ellipse(10, -35, 10, 5);
  popMatrix();
}

void slash(float x, float y) {
  pushMatrix();
  translate(x, y);
  noFill();
  stroke(255);
  for (int i = 0; i < 30; i++) {
    bezier(-55, -66, -35, -190 + (i*2), 35, -190 + (i*2), 55, -66);
  }
  strokeWeight(2);
  stroke(230);
  bezier(-55, -65, -35, -190, 35, -190, 55, -65);
  bezier(-55, -65, -35, -130, 35, -130, 55, -65);
  popMatrix();
}

void jump() {
  py = py - 1;
  pyv = -15;
  tj++;
}

void gameMousePressed() {
}

void gameMouseReleased() {
  for(int i = 0; i < 100; i++) {
  hitbox = true;
  }
  hitbox = false;
}

void gamekeyPressed() {
  if (key == 'a') akey = true;
  if (key == 'd') dkey = true;
  if (key == ' ') skey = true;
}

void gamekeyReleased() {
  if (key == 'a') akey = false;
  if (key == 'd') dkey = false;
  if (key == ' ') skey = false;
}
