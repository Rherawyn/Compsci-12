void intro() {
  background(150);

  frame++;
  image(gif[frame], 600, 500, 1200, 1000);

  if (frame == numberOfFrames-1) {
    frame = 0;
  }

strokeWeight(5);
fill(200);
  rect(450, 400, 300, 200,5);
  
  fill(0);
  textAlign(CENTER,CENTER);
  textSize(100);
  text("START",600,500);
  text("POGGO PANICK",600,250);
  
}

void introMousePressed() {
}

void introMouseReleased() {
  if (mouseX > 450 && mouseX < 750 && mouseY > 400 && mouseY < 600) {
    mode = "game";
        music.stop();
  }
}
