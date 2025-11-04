int aspawn = 750;

void game() {
  
  background(0);
  
  aspawn--;

  for (int i = 0; i < objects.size(); i++) {
    GameObject obj = objects.get(i);
    obj.show();
    obj.act();
    if (obj.lives == 0) objects.remove(i);
  }

  if (aspawn <= 0) {
    objects.add (new Asteroid());
    aspawn = 400;
  }
  
  if (showship.lives == 0) {
    mode = GAMEOVER;
  }
}

void gameMousePresed() {
}
