class FLever extends FGameObject {
  boolean activated = false;

  FLever(float x, float y) {
    super();
    setPosition(x, y);
    setName("lever");
    setSensor(true);
    setStatic(true);
  }


  void act() {
    if (activated) {
      attachImage(lever[1]);
    } else {
      attachImage(lever[0]);
    }

    if (this.isTouching("fattack")) {
      activated = true;
      gateActivate = true;
      
    }
  }
}
