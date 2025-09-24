int vy, ay, tj, cooldown, fails, score, b;
int px = 600;
float py = 800;
float pyv;
float pya = 0.5;
float htime;
float hitx, hity;

boolean akey, dkey, skey, shift, sword;
boolean addball = true;

ArrayList<ball> ball = new ArrayList<ball>();

void game() {
  background(100);

  fill(125);
  noStroke();
  rect(0, 900, 1200, 100);
  stroke(0);

  //score
  textSize(100);
  textAlign(CENTER, CENTER);
  text(score, 100, 100);

  //fails
  textSize(500);
  textAlign(CENTER, CENTER);
  fill(220, 0, 0);
  if (fails>0) text("X", 300, 450);
  if (fails>1) text("X", 600, 450);
  if (fails>2) {
    text("X", 900, 450);
    mode = "u suck";
  }

  //player movement
  pyv = pyv + pya;

  if (shift == false) {
    if (akey) px = px - 8;
    if (dkey) px = px + 8;
  } else if (shift == true) {
    if (akey) px = px - 11;
    if (dkey) px = px + 11;
  }
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
  if (addball == true) {
    if (score % 3 == 0) {
      ball wee = new ball();
      ball.add(wee);
    }
    addball = false;
  }

  for (int i = 0; i < ball.size(); i++) {
    ball.get(i).display();
    ball.get(i).drop();
    if (ball.get(i).hits == 4) {
      ball.remove(i);
      explosion(ball.get(i).x, ball.get(i).y);
    } else if (ball.get(i).crash == 1 && ball.size() < 2) {
      fails = 3;
    } else if (ball.get(i).crash == 1) {
      ball.remove(i);
      explosion(600, 500);
      addball = true;
    }
  }

  //player
  hitx = px;
  hity = py - 90;

  player(px, py, 1.3);
  if (sword == true) {
    slash (px, py+10, 1.3);
    hitbox (hitx, hity);
  } else {
    slash (0, -1000, 1.3);
    hitbox (0, -1000);
  }

  if (sword == true) {
    cooldown++;
  }
  if (cooldown > 20) {
    sword = false;
    cooldown = 0;
  }
}

void player (float x, float  y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
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

void hitbox(float x, float y) {
  pushMatrix();
  translate(x, y);
  noStroke();
  circle(0, -20, 150);
  popMatrix();
}

void slash(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  noFill();
  stroke(255);
  for (int i = 0; i < 30; i++) {
    bezier(-60, -66, -35, -190 + (i*2), 35, -190 + (i*2), 60, -66);
  }
  strokeWeight(2);
  stroke(230);
  bezier(-60, -65, -35, -190, 35, -190, 60, -65);
  bezier(-60, -65, -35, -130, 35, -130, 60, -65);
  popMatrix();
}

void jump() {
  py = py - 1;
  pyv = -15;
  tj++;
}

void explosion(float x, float y) {
  pushMatrix();
  translate(x,y);
  for (int i = 0; i < numberOfFrames; i++) {
    image(gif[i], 0, 0, 150, 150);
  }
  popMatrix();
}

void gameMousePressed() {
  sword = true;
}

void gameMouseReleased() {
}

void gamekeyPressed() {
  if (key == 'a' || key == 'A') akey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == ' ') skey = true;
  if (keyCode == SHIFT) shift = true;
}

void gamekeyReleased() {
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == ' ') skey = false;
  if (keyCode == SHIFT) shift = false;
}
