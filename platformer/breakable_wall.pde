class FBwall extends FGameObject {
  int durability = 0;

  FBwall(float x, float y) {
    super();
    setPosition(x, y);
    setName("bwall");
    setRestitution(0);
    setFriction(4);
    setStatic(true);
  }

  void act() {
    if (durability < 4) this.attachImage(bwall[durability]);

    if (this.isTouching("fattack")) {
      player.setVelocity(0, player.getVelocityY());
      if (Math.abs(player.getY() - this.getY()) > Math.abs(player.getX() - this.getX())) {
        if (this.getY() > player.getY()) {
          player.setVelocity(0, -400);
        } else  player.setVelocity(0, 100);
        if (player.attackCooldown > 14) {
          durability++;
        }
      } else {
        player.setVelocity((player.getX() - this.getX()) * 1.2, 0);
        if (player.attackCooldown > 14) {
          durability++;
        }
      }
      player.knockback=true;
      if (durability >= 4) world.remove(this);
    }
  }
}
