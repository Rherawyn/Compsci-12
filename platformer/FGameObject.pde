class FGameObject extends FBox {

  FGameObject() {
    super(gridSize, gridSize);
  }
  
  void act() {
    
  }
  
  boolean collisions(String n, String g) {
    ArrayList<FContact> contacts = player.getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact c = contacts.get(i);
      if (c.contains(n) || c.contains(g)) {
        return true;
      }
    }
    return false;
  }
}
