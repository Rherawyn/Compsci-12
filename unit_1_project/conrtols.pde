void mousePressed() {
  if (mode == "game") gameMousePressed();
  else if (mode == "intro") introMousePressed();
  else if (mode == "options") usuckMousePressed();
}

void mouseReleased() {
  if (mode == "game") gameMouseReleased();
  else if (mode == "intro") introMouseReleased();
  else if (mode == "options") usuckMouseReleased();
}

void keyPressed() {
 if (mode == "game") gamekeyPressed(); 
}

void keyReleased() {
 if (mode == "game") gamekeyReleased(); 
}
