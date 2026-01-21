class FPlayer extends FGameObject {
  FBox feet;
  FCircle attack;
  int lives = 5;
  int attackCooldown = 0;
  int kcooldown = 0;
  int healing;
  float AtPX;
  float AtPY;
  int sFrame;
  int pDirection;
  int sDirection;
  final int L = 0;
  final int R = 1;
  final int U = 2;
  final int D = 3;
  boolean knockback;

  FPlayer() {
    super();
    mFrame = 0;
    sFrame = 0;
    pDirection = R;
    setPosition(pSpawnX, pSpawnY);
    setRotatable(false);
    setFillColor(red);
    setName("fplayer");
    feet = new FBox(40, 10);
    feet.setRotatable(false);
    feet.setSensor(true);
    feet.setNoFill();
    feet.setNoStroke();
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
    sFrame = 0;
    if (attackCooldown <= -15) {
      attack.setPosition(this.getX() + AtPX, this.getY() + AtPY);
      attackCooldown = 15;
    }
  }

  void act() {
    setRestitution(0);
    //animation
    animate();
    ArrayList<FContact> Pcontacts = feet.getContacts();
    if (Pcontacts.size() < 1) {
      pAction = pJump;
      if (dkey) {
        pDirection = R;
      } else if (akey) {
        pDirection = L;
      }
    } else if (dkey) {
      pDirection = R;
      pAction = pRun;
    } else if (akey) {
      pAction = pRun;
      pDirection = L;
    } else {
      pAction = pIdle;
    }

    if (attackCooldown <=-12) {
      if (dkey) {
        sDirection = R;
      }
      if (akey) {
        sDirection = L;
      }
      if (wkey) {
        sDirection = U;
      }
      
      if (sDirection == D && Pcontacts.size() != 0) {
        if (pDirection == R) {
          sDirection = R;
        }
        if (pDirection == L) {
          sDirection = L;
        }
      }
      if (skey && Pcontacts.size() == 0) {
        sDirection = D;
      }
    }

    //healing
    if (soul >= 3 && lives < 5) {
      if (ekey) {
        akey = false;
        dkey = false;
        healing++;
        pAction = pHeal;
      } else {
        healing = 0;
      }
      if (healing >= 100) {
        healing = 0;
        soul -= 3;
        lives++;
      }
    } else {
      healing = 0;
    }

    //player movement
    float vy = player.getVelocityY();
    float vx = 200;
    if (akey) vx = -250;
    if (dkey) vx = 250;
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
    } else if (skey && Pcontacts.size() == 0) {
      AtPY = 70;
      AtPX = 0;
    } else if (Pcontacts.size() != 0) {
      if (pDirection == R) {
        AtPX = 70;
        AtPY = 0;
      } else if (pDirection == L) {
        AtPX = -70;
        AtPY = 0;
      }
    }

    //combat
    attackCooldown--;
    if (attackCooldown <= 0) {
      attack.setPosition(0, 0);
    }
    attack.setVelocity(this.getVelocityX(), this.getVelocityY()-18.3);

    kcooldown++;
    if (!knockback) {
      setVelocity(vx, vy);
      kcooldown = 0;
    }

    if (kcooldown > 5) {
      knockback = false;
    }

    ArrayList<FContact> fContacts = feet.getContacts();
    if (spacekey && fContacts.size() > 1) {
      setVelocity(getVelocityX(), -650);
    }


    if (lives <= 0) {
      mode = GAMEOVER;
    }
  }

  void animate() {
    //character
    if (mFrame >= pAction.length) mFrame = 0;
    if (frameCount % 7 == 0) {
      if (pDirection == R) attachImage(pAction[mFrame]);
      if (pDirection == L) attachImage(reverseImage(pAction[mFrame]));
      mFrame++;
    }
    //weapon
    if (sFrame >= sAttack.length) sFrame = 0;
    if (frameCount % 5 == 0) {
      if (sDirection == R) {
        attack.setRotation(radians(0));
        attack.attachImage(sAttack[sFrame]);
      }
      if (sDirection == L) {
        attack.setRotation(radians(0));
        attack.attachImage(reverseImage(sAttack[sFrame]));
      }
      if (sDirection == U) {
        attack.setRotation(radians(270));
        attack.attachImage(sAttack[sFrame]);
      }
      if (sDirection == D) {
        attack.setRotation(radians(90));
        attack.attachImage(sAttack[sFrame]);
      }
      sFrame++;
    }
  }
}
