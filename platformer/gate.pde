class FGate extends FGameObject {
  boolean flipped;

  FGate(float x, float y, boolean f) {
    super();
    flipped = f;
    setPosition(x, y+gridSize);
    setHeight(gridSize*3);
    setName("gate");
    setStatic(true);
  }


  void act() {
    if (flipped) attachImage(reverseImage(gate));
    else attachImage(gate);

    if (gateActivate) {
      world.remove(this);
    }
  }
}
