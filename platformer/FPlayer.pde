class FPlayer extends FGameObject {
  FBox feet;
  FCircle attack;
  int lives = 1;
  int attackCooldown = 0;
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
    if (attackCooldown <= -15) {
      attack.setPosition(this.getX() + AtPX, this.getY() + AtPY);
      attackCooldown = 15;
    }
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

    //combat
    sword(player.getX(), player.getY());
    attackCooldown--;
    if (attackCooldown <= 0) {
      attack.setPosition(0, 0);
    }
    attack.setVelocity(this.getVelocityX(), this.getVelocityY()-18.3);

    setVelocity(vx, vy);
    ArrayList<FContact> contacts = feet.getContacts();
    if (spacekey && contacts.size() > 1) {
      wkey = false;
      setVelocity(getVelocityX(), -650);
    }

    if (collisions("spike" , "flenemy")) {
      player.setPosition(pSpawnX, pSpawnY);
    }

    if (lives < 0) {
      world.remove(this);
    }
  }

  void sword(float x, float y) {
    strokeWeight(5);
    stroke(255);
    pushMatrix();
    translate(x, y);
    bezier(-60, -65, -35, -190, 35, -190, 60, -65);
    bezier(-60, -65, -35, -130, 35, -130, 60, -65);
    popMatrix();
    stroke(0);
  }
}
