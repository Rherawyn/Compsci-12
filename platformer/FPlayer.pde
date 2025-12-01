class FPlayer extends FBox {

  FPlayer() {
    super(gridSize, gridSize);
    setPosition(1632, 239);
    setFillColor(red);
  }

  void act() {
    setRotation(0);
    setRestitution(0);
    
    float vy = getVelocityY();
    if (akey) setVelocity(-250, vy);
    if (dkey) setVelocity(250, vy);
    //if (skey) {
    //  setVelocity(getVelocityX(), 200);
    //  skey = false;
    //}
    if (wkey) {
      wkey = false;
      setVelocity(getVelocityX(), -650);
    }
  }
}
