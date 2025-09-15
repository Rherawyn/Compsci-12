
float linex = 0;
float liney = 0;
float linea = 2;
float la;

void pattern1() {
  fill(50, 50, 50);
  //rect(0, 0, 1200, 1000);

  liney = liney - 1.5;

  if ( linex >= 200) {
    la = 0.01;
  } else if (linex < 200) {
    la = -0.01;
  }

  linea =  linea - la;

  linex = linex + linea;

  lines(600, 1000);

  rotate(radians(90));
  lines(499.5,0);

  rotate(radians(180));
  lines(-500,1200);

  rotate(radians(270));
  lines(-600, 0);

  //buttons
  rotate(radians(0));
  triangle(1150, 600, 1100, 550, 1100, 650);
}

void lines (float x, float y) {
  pushMatrix();
  translate(x, y);
  line(linex-500, liney, linex+500, liney);
  popMatrix();
}
