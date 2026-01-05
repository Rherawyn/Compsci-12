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
    if (dist(player.getX(), player.getY(), this.getX(), this.getY()) < 300) {
      //setPosition(this.getX()-(this.getX()-player.getX() / abs(this.getX()-player.getX()) * 5), this.getY()-(this.getY()-player.getY() / abs(this.getY()-player.getY()) * 5));
      vx = ((player.getX() - this.getX()));
      vy = ((player.getY() - this.getY()));
    } else {
      vx = 0;
      vy = -18.3;
    }
    setVelocity(vx, vy);

    ArrayList<FContact> contacts = this.getContacts();
    for (int j = 0; j < contacts.size(); j++) {
      FContact c = contacts.get(j);
      if (c.contains("fattack")) {
        this.lives--;
      }
    }

    if (lives < 0) {
      world.remove(this);
    }
  }
}
