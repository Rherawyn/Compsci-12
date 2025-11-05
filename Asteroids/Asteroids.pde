import java.util.ArrayList;

//Comp sci 12 asteroids project
// Gabriel Altshuler

//ship
SpaceShip showship;

//bullets
ArrayList<GameObject> objects;


Button gameStart;
Button shipSelect1;
Button shipSelect2;
Button shipSelect3;
Button colourSelect;
Button restart;

//colors
color colour = #FFFFFF;
color BLACK = #000000;
color WHITE = #FFFFFF;
color BLUE = #2134FA;
color RED = #FF1C46;
color GREEN = #0FF050;
color ORANGE = #F55F19;
color PURPLE = #AF1CFF;

//mode frameworks
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;
final int PAUSE = 3;
int mode;

int shipType = 0;

boolean mouseReleased;
boolean wasPressed;

boolean upKey, leftKey, rightKey, downKey, turnRightKey, turnLeftKey, shoot, telep;

void setup() {
  mode = INTRO;

  size(1000, 900);

  //buttons
  gameStart = new Button("START", 500, 450, 400, 200, BLACK, colour);
  shipSelect1 = new Button("", 350, 700, 100, 100, BLACK, colour);
  shipSelect2 = new Button("", 500, 700, 100, 100, BLACK, colour);
  shipSelect3 = new Button("", 650, 700, 100, 100, BLACK, colour);
  colourSelect = new Button("COLOUR", 100, 450, 100, 100, BLACK, colour);
  restart = new Button("RETRY?", 500, 600, 400, 200, BLACK, colour);

  //bullets
  objects = new ArrayList();

  //ship
  showship = new SpaceShip();
  objects.add(showship);
}

void draw() {
  click();

  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
