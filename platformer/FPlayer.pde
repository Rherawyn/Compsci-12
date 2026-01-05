class FPlayer extends FGameObject {
  FBox feet;
  FCircle attack;
  int lives = 1;
  float AtPX;
  float AtPY;
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

    attack = new FCircle(60);
    attack.setRotatable(false);
    attack.setSensor(true);
    attack.setName("fattack");
    world.add(attack);
  }

  void feet() {
    feet.setPosition(getX(), getY()+30);
    feet.setVelocity(this.getVelocityX(), this.getVelocityY());
  }

  void attack() {
    attack.setPosition(this.getX() + AtPX, this.getY() + AtPY);
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

    if (akey) {
      AtPX = -70;
      AtPY = 0;
    } else if (dkey) {
      AtPX = 70;
      AtPY = 0;
    }
    if (wkey) {
      AtPY = -70;
      AtPX = 0;
    } else if (skey) {
      AtPY = 70;
      AtPX = 0;
    }

    attack.setPosition(0, 0);
    attack.setVelocity(this.getVelocityX(), this.getVelocityY()-18.3);

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
