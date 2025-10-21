void keyPressed() {
  if (key == 'a' || key == 'A') leftKey = true;
  if (key == 's' || keyCode == DOWN || key == 'S') downKey = true;
  if (key == 'd' || key == 'D') rightKey = true;
  if (key == 'w' || keyCode == UP || key == 'W') upKey = true;
  if (keyCode == RIGHT) turnRightKey = true;
  if (keyCode == LEFT) turnLeftKey = true;
}

void keyReleased() {
  if (key == 'a' || key == 'A') leftKey = false;
  if (key == 's' || keyCode == DOWN || key == 'S') downKey = false;
  if (key == 'd' || key == 'D') rightKey = false;
  if (key == 'w' || keyCode == UP || key == 'W') upKey = false;
  if (keyCode == RIGHT) turnRightKey = false;
  if (keyCode == LEFT) turnLeftKey = false;
}
