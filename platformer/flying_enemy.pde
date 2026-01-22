class FFlenemy extends FGameObject {

  FFlenemy(int x, int y) {
    super();
    lives = 3;
    setPosition(x, y-gridSize);
    setRotatable(false);
    setFillColor(red);
    setName("flenemy");
  }

  void act() {
    setRestitution(0);
    float vy;
    float vx;

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

    if (dist(player.getX(), player.getY(), this.getX(), this.getY()) < 300) {
      //setPosition(this.getX()-(this.getX()-player.getX() / abs(this.getX()-player.getX()) * 5), this.getY()-(this.getY()-player.getY() / abs(this.getY()-player.getY()) * 5));
      vx = (player.getX() - this.getX());
      vy = (player.getY() - this.getY());
    } else {
      vx = 0;
      vy = -18.3;
    }
    setVelocity(vx, vy);

    knockback();

    if (this.isTouching("fattack")) {
      this.setVelocity((this.getX() - player.getX())*2, (this.getY() - player.getY())*2);
      if (player.attackCooldown > 14) {
        this.lives--;
        getSoul();
      }
    }

    if (lives <= 0) {
      world.remove(this);
    }
  }
}
