void keyPressed() {
  if (key == 'a' || key == 'a') leftKey = true;
  if (key == 's' || keyCode == DOWN || key == 's') downKey = true;
  if (key == 'd' || key == 'd') rightKey = true;
  if (key == 'w' || keyCode == UP || key == 'W') upKey = true;
  if (keyCode == RIGHT) turnRightKey = true;
  if (keyCode == LEFT) turnLeftKey = true;
}

void keyReleased() {
  if (key == 'a' || keyCode == LEFT || key == 'a') leftKey = false;
  if (key == 's' || keyCode == DOWN || key == 's') downKey = false;
  if (key == 'd' || keyCode == RIGHT || key == 'd') rightKey = false;
  if (key == 'w' || keyCode == UP || key == 'W') upKey = false;
  if (keyCode == RIGHT) turnRightKey = false;
  if (keyCode == LEFT) turnLeftKey = false;
}
