void game() {
  background(0);
  
  showship.show();
  showship.act();
  
  for(int i = 0; i < gunfire.size(); i++) {
    Bullet currentBullet = gunfire.get(i); 
    currentBullet.show();
    currentBullet.act();
  }
}

void gameMousePresed() {
  
  
  
  
}
