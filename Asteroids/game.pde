int aspawn = 500;
int initial = 0;
void game() {

  background(0);

  if (initial == 0) {
    objects.add (new Asteroid());
    objects.add (new Asteroid());
    objects.add (new Asteroid());
    objects.add (new Asteroid());
    initial++;
  }

  aspawn--;

  for (int i = 0; i < objects.size(); i++) {
    GameObject obj = objects.get(i);
    obj.show();
    obj.act();
    if (obj.lives == 0) objects.remove(i);
  }

  if (aspawn <= 0) {
    objects.add (new Asteroid());
    aspawn = 200;
  }

  if (showship.lives == 0) {
    mode = GAMEOVER;
  }
}

void gameMousePresed() {
}
