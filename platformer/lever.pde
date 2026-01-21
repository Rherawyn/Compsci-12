class FLever extends FGameObject {
  ArrayList gates;

  FLever(float x, float y, ArrayList a) {
    super();
    gates = a;
    setPosition(x, y);
    setName("lever");
    setSensor(true);
    setStatic(true);
  }


  void act() {
    if (activated) {
      attachImage(lever[0]);
    } else {
      attachImage(lever[1]);
    }

    if (this.isTouching("fattack") && !activated) {
      setActivated();
      for (int i = 0; i < gates.size(); i++) {
        if (gates.get(i).contains("gate")) {
          gates.get(i).setActivated();
        }
      }
    }
  }
}
