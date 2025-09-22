boolean ihateyou = false;

void usuck() {
  if (ihateyou == false) {
    fill(50, 120);
    rect(0, 0, 1200, 1000);
    ihateyou = true;
  }
  
  rect(500,700,200,75);
  
  textSize(200);
  text("GAME OVER",600,175);
}

void usuckMousePressed() {
}

void usuckMouseReleased() {
  if (mouseX > 500 && mouseX < 700 && mouseY > 700 && mouseY < 775) {
   mode = "game"; 
  }
}
