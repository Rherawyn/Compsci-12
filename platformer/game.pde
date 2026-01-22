int l;
int hx = 109;
int hy = 41;
int soul = 0;

void game() {
  background(bg);
  drawWorld();
  actWorld();
  player.act();
  
  //HUD
  image(vessel[soul], 25, 25);
  
  l = player.lives;
  for(int i = 0; i < 5; i++) {
   image(emask, hx+(i*(gridSize*0.75)), hy); 
  }
  
  for(int i = 0; i < l; i++) {
   image(mask, hx+(i*(gridSize*0.75)), hy); 
  }
}

void gameMousePresed() {
  player.attack();
}
