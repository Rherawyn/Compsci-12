//unit 1 project
//Gabriel Altshuler
import processing.sound.*;

String mode = "intro";

PImage[] gif;
int numberOfFrames;
int frame;

SoundFile music;
SoundFile fail;

void setup() {
  size (1200, 1000);

  imageMode(CENTER);

  numberOfFrames = 17;
  gif = new PImage [numberOfFrames];

  for (int i = 0; i < numberOfFrames; i++) {
    gif[i] = loadImage("frame_" + i + "_delay-0.1s.gif");
  }

  music = new SoundFile(this, "MUSIC.mp3");
  fail = new SoundFile(this, "FAILURE.wav");

  music.play();
}

void draw() {
  if (mode == "intro") intro();
  else if (mode == "game") game();
  else if (mode == "u suck") usuck();
  else pause();
}
