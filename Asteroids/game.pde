void game() {
  background(0);
  
  for(int i = 0; i < objects.size(); i++) {
    GameObject obj = objects.get(i); 
    obj.show();
    obj.act();
    if (obj.lives == 0) objects.remove(i);
  }
}

void gameMousePresed() {
  
  
  
  
}
