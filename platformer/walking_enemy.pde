class FWenemy extends FGameObject {
  FBox bonk;
  float vy = 0;
  float vx = 100;

  FWenemy(int x, int y) {
    super();
    lives = 2;
    setPosition(x, y);
    setRotatable(false);
    setFillColor(red);
    setName("wenemy");

    bonk = new FBox(10, 40);
    bonk.setRotatable(false);
    bonk.setSensor(true);
    bonk.setFill(255);
    bonk.setNoStroke();
    world.add(bonk);
  }

  void bonk() {
    bonk.setPosition(this.getX()+(30 * (vx/Math.abs(vx))), getY());
    bonk.setVelocity(this.getVelocityX(), this.getVelocityY());
  }

  void act() {
    setRestitution(0);
    bonk();

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
    
    setVelocity(vx, vy);

    ArrayList<FContact> contacts = bonk.getContacts();
      for (int i = 0; i < contacts.size(); i++) {
        FContact c = contacts.get(i);
        if (c.contains("block")) {
          vx = vx * -1;
        }
      }
      
    println(contacts.size());

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
      world.remove(bonk);
    }
  }
}
