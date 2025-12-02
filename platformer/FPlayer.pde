class FPlayer extends FBox {
  FBox f;
  FPlayer() {
    super(gridSize, gridSize);
    setPosition(1632, 239);
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
    setRotation(0);
    setRestitution(0);
    //player movement
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (akey) setVelocity(-250, vy);
    if (dkey) setVelocity(250, vy);
    ArrayList<FContact> contacts = f.getContacts();
    if (wkey && contacts.size() > 1|| spacekey && contacts.size() > 1) {
      wkey = false;
      setVelocity(getVelocityX(), -650);
    }
    //feet movement
    f.setPosition(getX(), getY()+30);
  }
}
