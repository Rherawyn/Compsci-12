void game() {
  background(bg);
  drawWorld();
  actWorld();
  player.act();
}

void gameMousePresed() {
  player.attack();
}
