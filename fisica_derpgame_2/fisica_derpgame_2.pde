//Gabriel Altshuler //<>//

import fisica.*;

Button reset;
Button start;

ArrayList <Circle> circles;

boolean mouseReleased;
boolean wasPressed;

int c1 = 200;
int c2 = 500;

boolean gen = true;

//palette
color background = #17063E;
color white = color(255);
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

//mode frameworks
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;
final int PAUSE = 3;
int mode;

//assets
PImage redBird;

FPoly border;
FPoly bucket;
FPoly funnelLeft;
FPoly funnelRight;

//fisica
FWorld world;

void setup() {
  mode = INTRO;
  
  //make window
  size(1000, 800);

  //buttons
  reset = new Button("RESET", 800, 700, 100, 75, red, white);
  start = new Button("START", 500, 400, 500, 200, red, white);

  //initialise world
  makeWorld();

  //objetcs
  circles = new ArrayList();

  //add terrain to world
  makeBorder();
  //makeFunnelLeft();
  //makeFunnelRight();
  //makeBucket();
}

//===========================================================================================

void draw() {
  click();

  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
