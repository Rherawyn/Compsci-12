
float linex2 = 600;
float liney2 = 1100;
float linea2 = 2;
float la2;


void pattern2() {
  fill(75, 75, 75);
  //rect(0, 0, 1200, 1000);

  liney2 = liney2 - 2;

  if ( linex2 >= 600) {
    la2 = 0.1;
  } else if (linex2 < 600) {
    la2 = -0.1;
  }

  linea2 =  linea2 - la2;

  linex2 = linex2 + linea2;

  lines2(0,0);

  //buttons
  rotate(radians(0));
  triangle(50, 600, 100, 550, 100, 650);
  triangle(1150, 600, 1100, 550, 1100, 650);
}

void lines2 (float x, float y) {
  pushMatrix();
  translate(x, y);
  line(linex2-500, liney2-(linea2*25), linex2+500, liney2+(linea2*25));
  popMatrix();
}
