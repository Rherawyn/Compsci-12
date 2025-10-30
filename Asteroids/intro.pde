void intro() {
  background(0);
  
  //Title
  textAlign(CENTER,CENTER);
  textSize(150);
  fill(WHITE);
  text("ASTEROIDS", 500, 200);
  
  //buttoms
  gameStart.show();
  shipSelect1.show();
  shipSelect2.show();
  shipSelect3.show();
  
  //icons
  pushMatrix();
  translate(350,700);
  showship.ship1();
  popMatrix();
  
  pushMatrix();
  translate(500,700);
  showship.ship2();
  popMatrix();
  
  pushMatrix();
  translate(655,700);
  showship.ship3();
  popMatrix();
  
  if (gameStart.clicked) mode = GAME;
  if (shipSelect1.clicked) shipType = 0;
  if (shipSelect2.clicked) shipType = 1;
  if (shipSelect3.clicked) shipType = 2;
  
  
  
}

void introMousePresed() {
  
  if (gameStart.clicked) mode = GAME;
}
