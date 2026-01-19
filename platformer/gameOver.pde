Button respawn = new Button("YES :)", 600, 500, 400, 200, black, 255);

void gameOver() {
  background(bg);
  textAlign(CENTER);
  text("WOU DIED", 600, 275);
  text("Respawn at last checkpoint?", 600, 375);
  respawn.show();

  if (respawn.clicked) {
    mode = GAME;
    player.setPosition(pSpawnX, pSpawnY);
    player.lives = 5;
    soul = 0;
    player.setVelocity(0, 0);
  }
  imageMode(CORNER);
}

void gameOverMousePresed() {
}
