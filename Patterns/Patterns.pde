//checkpoint 1c
//Gabriel Altshuler

String mode = "pattern1";

void setup() {
  size (1200, 1000);
}

void draw() {
  if (mode == "pattern1") pattern1();
  else if (mode == "pattern2") pattern2();
  else if (mode == "pattern3") pattern3();
  else pause();
}

void mouseReleased() {
  if (mode == "pattern1") {

    if (mouseX > 1100 && mouseX < 1150 && mouseY > 550 && mouseY < 650) {
      mode = "pattern2";
    }
  } else if (mode == "pattern2") {
    if (mouseX > 50 && mouseX < 100 && mouseY > 550 && mouseY < 650) {
      mode = "pattern1";
    }
    if (mouseX > 1100 && mouseX < 1150 && mouseY > 550 && mouseY < 650) {
      mode = "pattern3";
    }
  } else if (mode == "pattern3") {
    if (mouseX > 50 && mouseX < 100 && mouseY > 550 && mouseY < 650) {
      mode = "pattern2";
    }
  }
}
