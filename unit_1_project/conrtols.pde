void mouseReleased() {
  if (mode == "game") gameMouseReleased();
  else if (mode == "intro") introMouseReleased();
  else if (mode == "options") usuckMouseReleased();
}

void keyPressed() {
 if (mode == "game") gamekeyPressed(); 
}
