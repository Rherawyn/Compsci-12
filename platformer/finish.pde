Button restart = new Button("YES :)", 600, 500, 400, 200, black, 255);

void finish() {
  background(bg);
  textAlign(CENTER);
  text("YOU DID IT!!!!", 600, 275);
  text("Restart?", 600, 375);
  restart.show();

  if (restart.clicked) {
    world.clear();
    acts.clear();
    gflipped = false;
    gateActivate = false;
    loadWorld(map);
    loadPlayer();
    
    mode = GAME;
    player.setPosition(pSpawnX, pSpawnY);
    player.lives = 5;
    soul = 0;
    player.setVelocity(0, 0);
  }
  imageMode(CORNER);
}

void finishMousePresed() {
}
