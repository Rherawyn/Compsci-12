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

    if (this.isTouching("fattack")) {
      player.setVelocity(0, player.getVelocityY());
      if (Math.abs(player.getY() - this.getY()) > Math.abs(player.getX() - this.getX())) {
        if (this.getY() > player.getY()) {
          player.setVelocity(0, -400);
        } else  player.setVelocity(0, 100);
      } else {
        player.setVelocity((player.getX() - this.getX()) * 2, 0);
      }
      player.knockback=true;
    }
  }

  void animate() {
    if (mFrame >= spike.length) mFrame = 0;
    if (frameCount % 15 == 0) {
      attachImage(spike[mFrame]);
      mFrame++;
    }
  }
}

//9. 4,5,7,8,9
//10. 6,7,9,11
//11 EVERYTHING
