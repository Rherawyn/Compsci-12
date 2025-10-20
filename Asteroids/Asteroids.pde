//Comp sci 12 asteroids project
// Gabriel Altshuler

SpaceShip showship;

Button gameStart;
Button shipSelect1;
Button shipSelect2;
Button shipSelect3;

//colors
color BLACK = #000000;
color WHITE = #FFFFFF;

//mode frameworks
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;
final int PAUSE = 3;
int mode;

int shipType = 0;

boolean mouseReleased;
boolean wasPressed;

boolean upKey, leftKey, rightKey, downKey, turnRightKey, turnLeftKey;

void setup() {
  mode = INTRO;

  size(1000, 900);

  //buttons
  gameStart = new Button("START", 500, 450, 400, 200, BLACK, WHITE);
  shipSelect1 = new Button("1", 350, 700, 100, 100, BLACK, WHITE);
  shipSelect2 = new Button("2", 500, 700, 100, 100, BLACK, WHITE);
  shipSelect3 = new Button("3", 650, 700, 100, 100, BLACK, WHITE);
  
  //ship
  showship = new SpaceShip();
}

void draw() {
  click();

  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
