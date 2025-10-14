//Mover Network - Compsci 12
//Gabriel Altshuler

ArrayList<Mover> movers;
int numberOfMovers = 40;

void setup() {
  size(800, 800);
  movers = new ArrayList(); //instantiate arraylist

  for (int i = 0; i < numberOfMovers; i++) {
    movers.add(new Mover());
  }
}

void draw() {
  background(105);
  for (int i = 0; i < movers.size(); i++) {
    Mover m = movers.get(i);
    m.act();
    m.showBody();
    m.showConnections();
    if (m.alive == false) {
      movers.remove(i);
    }
    if (movers.size() == 0) {
      for (int y = 0; y < numberOfMovers; y++) {
        movers.add(new Mover());
      }
    }
  }
}

void mouseReleased() {
}
