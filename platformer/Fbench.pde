class FBench extends FGameObject {
  boolean setSpawn = false;

  FBench(float x, float y) {
    super();
    setPosition(x, y);
    setWidth(gridSize*2);
    setName("bench");
    setSensor(true);
    setStatic(true);
  }


  void act() {
    if (setSpawn) {
      animate();
      pSpawnX = this.getX();
      pSpawnY = this.getY();
    } else {
      attachImage(bench[0]);
    }

    if (this.isTouching("fattack") && !setSpawn) {
      setSpawn = true;
    }
  }

  void animate() {
    if (mFrame >= bench.length) mFrame = 1;
    if (frameCount % 7 == 0) {
      attachImage(bench[mFrame]);
      mFrame++;
    }
  }
}
