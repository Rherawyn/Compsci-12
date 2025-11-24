boolean addcircle = false;
int cooldown = 0;
float type = 1;
float size;

void game() {
  //println("x: " + mouseX + " y: " + mouseY);\

  background(background);

  if (grav == true) {
    world.setGravity(0, 900);
  } else {
    world.setGravity(0, 0);
  }

  //ball generatiom
  if (type >= 0 && type < 4) size = 50;
  else if (type >= 4 && type < 7) size = 62.5;
  else if (type == 7) size = 78.125;

  cooldown ++;
  if (addcircle == true && cooldown > 25) {
    circles.add(new Circle(size));
    addcircle = false;
    cooldown = 0;
    type = (int) random(8);
  }

  //indicator
  rectMode(CORNER);
  fill(white);
  stroke(white);
  strokeWeight(1);
  rect(650, 100, 125, 25);
  rect(750, 0, 25, 100);
  rectMode(CENTER);
  colors();
  stroke(0);
  circle(700, 50, size);

  //ball physics
  for (int i = 0; i < circles.size(); i++) {
    Circle c = circles.get(i);
    //if (c.lives == 0) circles.remove(i);
    c.show();
    if (c.collide())
      break;
  }

  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw

  gravity.show();
  generation.show();

  if (gravity.clicked) {
    grav = !grav;
  }

  if (generation.clicked) {
    gen = !gen;
  }
}

//===========================================================================================

void makeBlob2() {
  FBlob blob2 = new FBlob();

  //set visuals
  blob2.setAsCircle(random(0, 625), -5, 90);
  blob2.setStroke(0);
  blob2.setStrokeWeight(2);
  blob2.setFillColor(yellow);

  //set physical properties
  blob2.setDensity(0.2);
  blob2.setFriction(1);
  blob2.setRestitution(0.25);

  //add to the world
  world.add(blob2);
}

//===========================================================================================

void makeBlob3() {
  FBlob blob3 = new FBlob();

  //set visuals
  blob3.setAsCircle(random(0, 625), -5, 130);
  blob3.setStroke(0);
  blob3.setStrokeWeight(2);
  blob3.setFillColor(yellow);

  //set physical properties
  blob3.setDensity(0.2);
  blob3.setFriction(1);
  blob3.setRestitution(0.25);

  //add to the world
  world.add(blob3);
}

//===========================================================================================

void makeBlob4() {
  FBlob blob4 = new FBlob();

  //set visuals
  blob4.setAsCircle(random(0, 625), -5, 180);
  blob4.setStroke(0);
  blob4.setStrokeWeight(2);
  blob4.setFillColor(yellow);

  //set physical properties
  blob4.setDensity(0.2);
  blob4.setFriction(1);
  blob4.setRestitution(0.25);

  //add to the world
  world.add(blob4);
}

void gameMousePresed() {
  if (mouseX > 10 && mouseX < 615) {
    addcircle = true;
  }
}

void colors() {
  if (size == 50) {
    fill(#FF3434);
  } else if (size == 62.5) {
    fill(#FF3B05);
  } else if (size == 78.125) {
    fill(#C643FF);
  } 
}
