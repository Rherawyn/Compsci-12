float linex;
float liney;
float liner;

void pattern1() {
  fill(50, 50, 50);
  rect(0, 0, 1200, 1000);

  liney--;
  
  if ( linex > 100 ) {
    liner--;
  } else if ( linex < -100 ) {
    linex++;
  }
  
  if ( linex < 0 ) {
    liner++;
  } else if ( linex > 0 ) {
    liner--;
  }
  
  if (liner >= 360) {
    liner = 0;
  }

  for (int i = 0; i <100; i++) {
    line (linex, liney, liner);
  }

  //buttons
  triangle(1150, 600, 1100, 550, 1100, 650);
}

void line(float x, float y, float r) {
  pushMatrix();
  translate(x, y);
  rotate(radians(r));
  line(-100, 0, 100, 0);
  popMatrix();
}
