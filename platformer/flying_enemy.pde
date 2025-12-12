class FFlenemy extends FBox {
  FBox f;
  int lives = 1;
  FFlenemy() {
    super(gridSize, gridSize);
    for (int i : eSpawnX) {
      setPosition(eSpawnX.get(i), eSpawnY.get(i));
    }
    setRotatable(false);
    setFillColor(red);
  }

  void act() {
    setRestitution(0);
    float vy = this.getVelocityY();
    float vx = 200;
    if (dist(player.getX(), player.getY(), this.getX(), this.getY()) < 500) {
      //setPosition(this.getX()-(this.getX()-player.getX() / abs(this.getX()-player.getX()) * 5), this.getY()-(this.getY()-player.getY() / abs(this.getY()-player.getY()) * 5));
      vx = this.getX()-(this.getX()-player.getX() / abs(this.getX()-player.getX()) * 5);
      vy = this.getY()-(this.getY()-player.getY() / abs(this.getY()-player.getY()) * 5);
    } else {
      vx = 0;
      vy = 0;
    }
    setVelocity(vx, vy);
    ArrayList<FContact> contacts = f.getContacts();
    if (wkey && contacts.size() > 1|| spacekey && contacts.size() > 1) {
      wkey = false;
      setVelocity(getVelocityX(), -650);
    }

    death();

    if (lives < 0) {
      world.remove(this);
    }
  }

  void death() {
    ArrayList<FContact> contacts = this.getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact c = contacts.get(i);
      if (c.contains("spike")) {
        lives--;
      }
    }
  }
}
