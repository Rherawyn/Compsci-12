class FPlayer extends FGameObject {
  FBox f;
  FBox feet;
  int lives = 1;
  FPlayer() {
    super();
    setPosition(pSpawnX, pSpawnY);
    setRotatable(false);
    setFillColor(red);
    feet = new FBox(40, 10);
    feet.setRotatable(false);
    setName("fplayer");
    feet.setSensor(true);
    world.add(feet);
  }

  void feet() {
    feet.setPosition(getX(), getY()+30);
    feet.setVelocity(this.getVelocityX(), this.getVelocityY());
  }

  void act() {
    setRestitution(0);
    //player movement
    float vy = player.getVelocityY();
    float vx = 200;
    if (akey) vx = -200;
    if (dkey) vx = 200;
    if (!akey && !dkey) vx = 0;
    feet();
    setVelocity(vx, vy);
    ArrayList<FContact> contacts = feet.getContacts();
    if (wkey && contacts.size() > 1|| spacekey && contacts.size() > 1) {
      wkey = false;
      setVelocity(getVelocityX(), -650);
    }

    if (collisions("spike", "flenemy")) {
      player.setPosition(pSpawnX, pSpawnY);
    }

    if (lives < 0) {
      world.remove(this);
    }
  }
}
