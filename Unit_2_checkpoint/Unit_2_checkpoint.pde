//unit 2 checkpoint
//Gabriel Altshuler

mover [] myMovers;
int n = 20;

void setup() {
  size (600, 600);
  myMovers = new mover [n];
  for (int i = 0; i < n; i++) {
    myMovers[i] = new mover();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < n; i++) {
    myMovers[i].act();
    myMovers[i].display();
  }
}
