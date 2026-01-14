class FSpike extends FGameObject {

  FSpike(float x, float y) {
    super();
    setPosition(x, y);
    setName("spike");
    setRestitution(0);
    setFriction(4);
    setStatic(true);
  }

  void act() {
    animate();
    knockback();
  }
  
  void animate() {
    if (mFrame >= spike.length) mFrame = 0;
    if (frameCount % 15 == 0) {
      attachImage(spike[mFrame]);
      mFrame++;
    }
  }
}
