class FPlayer extends FBox {
  FBox f;
  int lives = 1;
  FPlayer() {
    super(gridSize, gridSize);
    setPosition(pSpawnX, pSpawnY);
    setRotatable(false);
    setFillColor(red);
    feet();
  }

  void feet() {
    FBox feet = new FBox(25, 10);
    feet.setNoFill();
    feet.setNoStroke();
    feet.setPosition(getX(), getY()+30);
    feet.setSensor(true);
    f = feet;
    world.add(feet);
  }

  void act() {
    setRestitution(0);
    //player movement
    float vy = player.getVelocityY();
    float vx = 200;
    if (akey) vx = -200;
    if (dkey) vx = 200;
    if(!akey && !dkey) vx = 0;
    setVelocity(vx, vy);
    ArrayList<FContact> contacts = f.getContacts();
    if (wkey && contacts.size() > 1|| spacekey && contacts.size() > 1) {
      wkey = false;
      setVelocity(getVelocityX(), -650);
    }
    //feet movement
    f.setPosition(getX(), getY()+30);

    death();

    if (lives < 0) {
      world.remove(this);
    }
  }

  void death() {
    ArrayList<FContact> contacts = this.getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact c = contacts.get(i);
      if (c.contains("spike") || c.contains("flenemydd")) {
        this.setPosition(pSpawnX,pSpawnY);
      }
    }
  }
}
