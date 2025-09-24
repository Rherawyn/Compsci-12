//unit 1 project
//Gabriel Altshuler

String mode = "game";

PImage[] gif;
int numberOfFrames;

void setup() {
  size (1200, 1000);
  
  numberOfFrames = 17;
  gif = new PImage [numberOfFrames];
  
  for(int i = 0; i < numberOfFrames; i++) {
  gif[i] = loadImage("frame_" + i + "_delay-0.1s.gif");
  }
}

void draw() {
  if (mode == "intro") intro();
  else if (mode == "game") game();
  else if (mode == "u suck") usuck();
  else pause();
}
