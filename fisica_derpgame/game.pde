boolean addblob = true;
int booldown = 0;

void game() {
  println("x: " + mouseX + " y: " + mouseY);
  background(background);

  if (grav == true) {
    world.setGravity(0, 900);
  } else {
    world.setGravity(0, 0);
  }

  booldown ++;
  if (addblob == true && booldown > 25) {
    objects.add(new Blob());
    addblob = false;
    booldown = 0;
  }

  for (int i = 0; i < objects.size(); i++) {
    GameObject obj = objects.get(i);
    obj.show();
    obj.act();
    if (obj.lives == 0) objects.remove(i);
  }

  //cloud 1
  c1+= 5;
  c2+= 5;

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
  if (mouseX > 0 && mouseX < 625) {
    addblob = true;
  }
}
