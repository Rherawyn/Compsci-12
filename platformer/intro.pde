Button start = new Button("START", 600, 550, 400, 200, black, 255);

void intro() {
  background(bg);
  imageMode(CENTER);
  image(logo,600,250);
  start.show();
  
  if(start.clicked) mode = GAME;
  imageMode(CORNER);
}

void introMousePresed() {
  
}
