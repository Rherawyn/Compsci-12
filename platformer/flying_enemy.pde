class FFlenemy extends FGameObject {
  int lives = 1;
  
  FFlenemy(int x, int y) {
    super();
    setPosition(x, y-gridSize);
    setRotatable(false);
    setFillColor(red);
    setName("flenemy");
  }

  void act() {
    setRestitution(0);
    float vy;
    float vx;
    if (dist(player.getX(), player.getY(), this.getX(), this.getY()) < 5000) {
      //setPosition(this.getX()-(this.getX()-player.getX() / abs(this.getX()-player.getX()) * 5), this.getY()-(this.getY()-player.getY() / abs(this.getY()-player.getY()) * 5));
      //vx = this.getX()-(this.getX()-player.getX() / abs(this.getX()-player.getX()) * 5);
      //vy = this.getY()-(this.getY()-player.getY() / abs(this.getY()-player.getY()) * 5);
      vx = 0;
      vy = -1000000;
    } else {
      vx = 0;
      vy = 0;
    }
    println(dist(player.getX(), player.getY(), this.getX(), this.getY()));
    setVelocity(vx, this.getVelocityY() + vy);

    //collisions("fplayer","");

    if (lives < 0) {
      world.remove(this);
    }
  }
}
