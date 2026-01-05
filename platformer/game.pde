void game() {
  background(deepblue);
  drawWorld();
  actWorld();
  player.act();
}

void gameMousePresed() {
  player.attack();
}
