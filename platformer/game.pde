int l;

void game() {
  background(bg);
  drawWorld();
  actWorld();
  player.act();
  
  l = player.lives;
  for(int i = 0; i < 5; i++) {
   image(emask, 25+(i*gridSize), 25); 
  }
  
  for(int i = 0; i < l; i++) {
   image(mask, 25+(i*gridSize), 25); 
  }
}

void gameMousePresed() {
  player.attack();
}
