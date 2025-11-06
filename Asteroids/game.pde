int aspawn = 500;
int uspawn = 400;
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
  uspawn--;

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
  
  if (uspawn <= 0) {
    objects.add (new UFO());
    uspawn = 400;
  }

  if (showship.lives == 0) {
    mode = GAMEOVER;
  }
}

void gameMousePresed() {
}
