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
  border.vertex(650, -100);
  border.vertex(650, height+25);
  border.vertex(-25, height+25);
  border.vertex(-25, -100);
  border.vertex(0, -100);
  border.vertex(0, height);
  border.vertex(625, height);
  border.vertex(625, -100);
  

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
