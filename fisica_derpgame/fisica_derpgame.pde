//Gabriel Altshuler //<>//

import fisica.*;

Button gravity;
Button generation;

ArrayList <GameObject> objects;

boolean mouseReleased;
boolean wasPressed;

int c1 = 200;
int c2 = 500;

boolean grav = true;
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
  mode = GAME;
  
  //make window
  size(1000, 800);

  //buttons
  gravity = new Button("Gravity", 100, 100, 100, 75, blue, green);
  generation = new Button("Generate", 700, 100, 100, 75, red, green);

  //initialise world
  makeWorld();

  //objetcs
  objects = new ArrayList();

  //add terrain to world
  makeBorder();
  makeBucket();
  makeFunnelLeft();
  makeFunnelRight();
}

//===========================================================================================

void draw() {
  click();

  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
