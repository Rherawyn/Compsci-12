//unit 1 project
//Gabriel Altshuler

String mode = "intro";

void setup() {
  size (1200, 1000);
}

void draw() {
  if (mode == "intro") intro();
  else if (mode == "game") game();
  else if (mode == "usuck") usuck();
  else pause();
}
