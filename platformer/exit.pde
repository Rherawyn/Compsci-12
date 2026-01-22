class FExit extends FGameObject {

  FExit(float x, float y) {
    super();
    setPosition(x, y);
    setName("exit");
    setSensor(true);
    setStatic(true);
  }

  void act() {
    attachImage(exit);
    
    if (this.isTouching("fplayer")) {
      mode = FINISH;
    }
  }
}
