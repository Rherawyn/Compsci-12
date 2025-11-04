void colour() {

  if (colourSelect.clicked) c++;

  if (c == 1) {
    colour = WHITE;
  } else if (c == 2) {
    colour = RED;
  } else if (c == 3) {
    colour = GREEN;
  } else if (c == 4) {
    colour = BLUE;
  } else if (c == 5) {
    colour = ORANGE;
  } else if (c == 6) {
    colour = PURPLE;
  }

  if (c > 6) {
    c = 1;
  }
}
