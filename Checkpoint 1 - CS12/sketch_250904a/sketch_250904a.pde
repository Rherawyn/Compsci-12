//Compsci 12 - Checkpoint 1
//Gabriel Altshuler

float s = 0;
float sky = 127.5;

int c = 0;
int n = 0;

int R = int(random(3, 7));
int r = int(random(3, 5));

float[] Cpositionx;
float[] Cpositiony;

float[] rockpositionx;
float[] rockpositiony;
float[] rockpositionz1;
float[] rockpositionz2;

float[][] cpositionx;
float[][] cpositiony;
float[][] cpositionz1;
float[][] cpositionz2;
float[][] ccolour;

void setup() {

  size(1200, 1000);

  Cpositionx = new float[R];
  Cpositiony = new float[R];

  rockpositionx = new float [50];
  rockpositiony = new float [50];
  rockpositionz1 = new float [50];
  rockpositionz2 = new float [50];

  cpositionx = new float [R][r];
  cpositiony = new float [R][r];
  cpositionz1 = new float [R][r];
  cpositionz2 = new float [R][r];
  ccolour = new float [R][r];

  //clouds positions
  for (int i = 0; i < R; i++) {
    Cpositionx[i] = int(random(0, 1200));
    Cpositiony[i] = int(random(0, 600));
  }

  //rucok number
  for (int i = 0; i < 50; i++) {
    rockpositionx[i] =(random(525, 675));
    rockpositiony[i] =(random(660, 1000));
    rockpositionz1[i] =(random(10, 15));
    rockpositionz2[i] =(random(5, 10));
  }

  //cloud structure
  for (int m = 0; m < r; m++) {
    for (int i = 0; i < R; i++) {
      cpositionx[i][c] =(random(-50, 50));
      cpositiony[i][c] =(random(-50, 50));
      cpositionz1[i][c] =(random(70, 100));
      cpositionz2[i][c] =(random(50, 70));
      ccolour[i][c] = (random(150, 255));
    }
    if (c < r) {
      c++;
    } else {
      c = 0;
    }
  }
}

void draw() {

  s = s + 0.5;
  if (s >= 360) {
    s = 0;
  }

  if (s < 90) {
    sky = sky - 1.416666;
  } else if (s < 270) {
    sky = sky + 1.416666;
  } else {
    sky = sky - 1.416666;
  }

  noStroke();

  //sky
  noStroke();
  fill(#66D2F7);
  rect(0, 0, 1200, 1000);
  fill(24, 7, 62, sky);
  rect(0, 0, 1200, 1000);

  //sun
  sun(600, 1100, s);

  //moon
  moon(600, 1100, s);

  //clouds
  for (int i = 0; i < R; i++) {
    cloud(Cpositionx[i], Cpositiony[i]);
  }

  //environment
  fill(#28743F);
  ellipse(200, 700, 700, 350);
  ellipse(800, 650, 1000, 350);
  fill(#28B955);
  rect(-10, 800, 1220, 200);
  ellipse(600, 825, 1400, 350);

  //flag
  fill(#76422A);
  rect(650, 50, 10, 100);
  fill(255, 0, 0);
  rect(660, 55, 50, 40);
  // main house
  strokeWeight(5);
  stroke(0);
  fill(#A09590);
  rect(500, 250, 200, 400);
  rect(480, 150, 240, 100);
  //door
  noStroke();
  fill(#76422A);
  rect(575, 578, 50, 70);
  circle(600, 578, 50);
  fill(0);
  circle(615, 600, 10);
  //windows
  fill(0);
  rect(575, 380, 50, 70);
  circle(600, 380, 50);

  //rocks
  for (int i = 0; i < 50; i++) {
    fill(#A09590);
    ellipse(rockpositionx[i], rockpositiony[i], rockpositionz1[i], rockpositionz2[i]);
  }
}

void cloud(float x, float y) {
  pushMatrix();
  translate(x, y);
  for (int i = 0; i < r; i++) {
    fill(255, 255, 255, ccolour[n][i]);
    ellipse(cpositionx[n][i], cpositiony[n][i], cpositionz1[n][i], cpositionz2[n][i]);
  }
  if (n < R-1) {
    n++;
  } else {
    n = 0;
  }
  popMatrix();
}

void sun(int x, int y, float r) {
  pushMatrix();
  translate(x, y);
  rotate(radians(r));
  fill(250, 218, 58);
  circle(-1000, 0, 100);
  popMatrix();
}

void moon(int x, int y, float r) {
  pushMatrix();
  translate(x, y);
  rotate(radians(r));
  fill(230, 230, 230);
  circle(1000, 0, 100);
  popMatrix();
}
