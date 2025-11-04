void keyPressed() {
  if (key == 'a' || key == 'A') leftKey = true;
  if (key == 's' || key == 'S') downKey = true;
  if (key == 'd' || key == 'D') rightKey = true;
  if (key == 'w' || key == 'W') upKey = true;
  if (key == 'f' || key == 'F') telep = true;
  if (keyCode == RIGHT) turnRightKey = true;
  if (keyCode == LEFT) turnLeftKey = true;
  if (keyCode == UP) shoot = true;
}

void keyReleased() {
  if (key == 'a' || key == 'A') leftKey = false;
  if (key == 's' || key == 'S') downKey = false;
  if (key == 'd' || key == 'D') rightKey = false;
  if (key == 'w' || key == 'W') upKey = false;
  if (key == 'f' || key == 'F') telep = false;
  if (keyCode == RIGHT) turnRightKey = false;
  if (keyCode == LEFT) turnLeftKey = false;
  if (keyCode == UP) shoot = false;
}
