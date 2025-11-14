//Gabriel Altshuler

import fisica.*;

Button gravity;
Button generation;

boolean mouseReleased;
boolean wasPressed;

int c1 = 200;
int c2 = 500;

boolean grav = true;
boolean gen = true;

//palette //<>//
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

//assets
PImage redBird;
PImage funifrog;

FPoly topPlatform;
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  size(800, 600);

  //buttons
  gravity = new Button("Gravity", 100, 100, 100, 75, blue, green);
  generation = new Button("Generate", 700, 100, 100, 75, red, green);

  //load resources
  redBird = loadImage("red-bird.png");
  funifrog = loadImage("funifrog.jpg");
  funifrog.resize(50,50);

  //initialise world
  makeWorld();

  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, 60);
  topPlatform.vertex(400, 240);
  topPlatform.vertex(400, 340);
  topPlatform.vertex(-100, 160);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(900, 400);
  bottomPlatform.vertex(750, 500);
  bottomPlatform.vertex(450, 500);
  bottomPlatform.vertex(300, 400);
  bottomPlatform.vertex(300, 500);
  bottomPlatform.vertex(450, 600);
  bottomPlatform.vertex(750, 600);
  bottomPlatform.vertex(900, 500);

  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void clouds(float x, float y) {
  pushMatrix();
  translate(x, y);
  noStroke();
  fill(255);
  ellipse(0, 0, 75, 50);
  ellipse(-35, 10, 50, 25);
  ellipse(40, -5, 40, 30);
  popMatrix();
}

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);

  if (grav == true) {
    world.setGravity(0, 900);
  } else {
    world.setGravity(0, 0);
  }

  if (frameCount % 50 == 0 && gen == true) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
  }

  //cloud 1
  c1+= 5;
  c2+= 5;

  clouds(c1, 200);
  if (c1 > 850) {
    c1 = -100;
  }

  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw

  //cloud 2
  clouds(c2, 500);
  if (c2 > 850) {
    c2 = -100;
  }

  click();
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

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(100, width-100), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(100, width-100), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(50, 50);
  box.setPosition(random(100, width-100), -5);

  //set visuals
  box.attachImage(funifrog);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(1);
  world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(100, width-100), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}
