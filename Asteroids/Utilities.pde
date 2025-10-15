void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}

void mouseReleased() {
 if(mode == INTRO) introMousePresed();
 else if (mode == GAME) gameMousePresed();
 else if (mode == PAUSE) pauseMousePresed();
 else if (mode == GAMEOVER) gameOverMousePresed();
}
