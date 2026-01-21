class FGameObject extends FBox {
  int mFrame;
  int lives;
  boolean activated = false;

  FGameObject() {
    super(gridSize, gridSize);
  }

  void act() {
  }

  void knockback() {
    if (this.isTouching("fplayer")) {
      player.setVelocity(0, player.getVelocityY());
      player.setVelocity((player.getX() - this.getX())*10, (player.getY() - this.getY())*10);
      if (!player.knockback) {
        player.lives--;
      }
      player.knockback=true;
    }
  }

  void getSoul() {
    if(soul < 9) {
      soul++;
    }
  }

  boolean isTouching(String n) {
    ArrayList<FContact> contacts = this.getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact c = contacts.get(i);
      if (c.contains(n)) {
        return true;
      }
    }
    return false;
  }

  boolean isTouching(String n, String g) {
    ArrayList<FContact> contacts = this.getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact c = contacts.get(i);
      if (c.contains(n) || c.contains(g)) {
        return true;
      }
    }
    return false;
  }
  
  void setActivated() {
    activated = true;
  }
}
