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
color background = #17063E;
color white = color(255);
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

//assets
PImage redBird;

FPoly border;
FPoly bucket;
FPoly funnelLeft;
FPoly funnelRight;

//fisica
FWorld world;

void setup() {
  //make window
  size(1000, 800);

  //buttons
  gravity = new Button("Gravity", 100, 100, 100, 75, blue, green);
  generation = new Button("Generate", 700, 100, 100, 75, red, green);

  //load resources
  redBird = loadImage("red-bird.png");

  //initialise world
  makeWorld();

  //add terrain to world
  makeBorder();
  makeBucket();
  makeFunnelLeft();
  makeFunnelRight();
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================

void makeBorder() {
  border = new FPoly();
  border.setGrabbable(false);

  //plot the vertices of this platform
  border.vertex(625, 0);
  border.vertex(625, height);
  border.vertex(650, height);
  border.vertex(650, 0);

  // define properties
  border.setStatic(true);
  border.setNoStroke();
  border.setFillColor(white);
  border.setFriction(0.1);

  //put it in the world
  world.add(border);
}

//===========================================================================================

void makeBucket() {
  bucket = new FPoly();
  bucket.setGrabbable(false);

  //plot the vertices of this platform
  bucket.vertex(475, 325);
  bucket.vertex(475, 525);
  bucket.vertex(150, 525);
  bucket.vertex(150, 325);
  bucket.vertex(125, 325);
  bucket.vertex(125, 550);
  bucket.vertex(500, 550);
  bucket.vertex(500, 325);

  // define properties
  bucket.setStatic(true);
  bucket.setNoStroke();
  bucket.setFillColor(white);
  bucket.setFriction(0);

  //put it in the world
  world.add(bucket);
}

void makeFunnelLeft() {
  funnelLeft = new FPoly();
  funnelLeft.setGrabbable(false);

  //plot the vertices of this platform
  funnelLeft.vertex(0, 675);
  funnelLeft.vertex(300, 700);
  funnelLeft.vertex(300, height);
  funnelLeft.vertex(275, height);
  funnelLeft.vertex(275, 723);
  funnelLeft.vertex(0, 700);

  // define properties
  funnelLeft.setStatic(true);
  funnelLeft.setNoStroke();
  funnelLeft.setFillColor(white);
  funnelLeft.setFriction(0);

  //put it in the world
  world.add(funnelLeft);
}

void makeFunnelRight() {
  funnelRight = new FPoly();
  funnelRight.setGrabbable(false);

  //plot the vertices of this platform
  funnelRight.vertex(625, 675);
  funnelRight.vertex(320, 700);
  funnelRight.vertex(320, height);
  funnelRight.vertex(345, height);
  funnelRight.vertex(345, 723);
  funnelRight.vertex(625, 700);

  // define properties
  funnelRight.setStatic(true);
  funnelRight.setNoStroke();
  funnelRight.setFillColor(white);
  funnelRight.setFriction(0);

  //put it in the world
  world.add(funnelRight);
}


//===========================================================================================

//void clouds(float x, float y) {
//  pushMatrix();
//  translate(x, y);
//  noStroke();
//  fill(255);
//  ellipse(0, 0, 75, 50);
//  ellipse(-35, 10, 50, 25);
//  ellipse(40, -5, 40, 30);
//  popMatrix();
//}

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(background);

  if (grav == true) {
    world.setGravity(0, 900);
  } else {
    world.setGravity(0, 0);
  }

  if (frameCount % 50 == 0 && gen == true) {  //Every 20 frames ...
    //makeCircle();
    makeBlob();
    //makeBox();
    //makeBird();
  }

  //cloud 1
  c1+= 5;
  c2+= 5;

  //clouds(c1, 200);
  //if (c1 > 850) {
  //  c1 = -100;
  //}

  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw

  ////cloud 2
  //clouds(c2, 500);
  //if (c2 > 850) {
  //  c2 = -100;
  //}

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
  blob.setAsCircle(random(0, 625), -5, 50);
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
  //box.setStroke(0);
  //box.setStrokeWeight(2);
  //box.setFillColor(green);

  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green);

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
