class FIndicator extends FGameObject {

  FIndicator(float x, float y) {
    super();
    setPosition(x, y);
    setName("indicator");
    setSensor(true);
    setStatic(true);
  }

  void act() {
    if (gateActivate) {
      attachImage(indicator[1]);
    } else {
      attachImage(indicator[0]);
    }
  }
}
