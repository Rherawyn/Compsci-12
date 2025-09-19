//unit 1 project
//Gabriel Altshuler

String mode = "game";

void setup() {
  size (1200, 1000);

  a = new ball();
}

void draw() {
  if (mode == "intro") intro();
  else if (mode == "game") game();
  else if (mode == "usuck") usuck();
  else pause();
}
