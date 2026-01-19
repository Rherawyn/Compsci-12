Button start = new Button("START", 600, 400, 400, 200, blue, 255);

void intro() {
  background(bg);
  start.show();
  
  if(start.clicked) mode = GAME;
}

void introMousePresed() {
  
}
