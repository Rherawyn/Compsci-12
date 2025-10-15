void intro() {
  gameStart.show();
  shipSelect1.show();
  shipSelect2.show();
  shipSelect3.show();
  
  if (gameStart.clicked) mode = GAME;
  if (shipSelect1.clicked) shipType = 0;
  if (shipSelect2.clicked) shipType = 1;
  if (shipSelect3.clicked) shipType = 2;
  
  
  
}

void introMousePresed() {
  
  if (gameStart.clicked) mode = GAME;
}
