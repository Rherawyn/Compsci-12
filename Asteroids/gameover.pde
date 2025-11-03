void gameOver() {
  background(0);
  textAlign(CENTER, CENTER);
  fill(255);
  text("DIED", 500, 200);
  text("SCORE: " + showship.score, 500, 400);

  restart.show();

  if (restart.clicked) {
    for (int i = 0; i < objects.size(); i++) {
      objects.remove(i);
    }
    
    showship = new SpaceShip();
    objects.add(showship);
    objects.add (new Asteroid());
    objects.add (new Asteroid());
    objects.add (new Asteroid());
    objects.add (new Asteroid());

    mode = GAME;
  }
}

void gameOverMousePresed() {

  if (restart.clicked) mode = GAME;
}
