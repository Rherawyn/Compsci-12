class Blob extends FBlob {
  
float x, y, type;

  Blob(float _x, float _y, float _type) {
    x = _x;
    y = _y;
    type = _type;
    //set visuals
    setAsCircle(x, y, 40 * type);
    setFillColor(yellow);

    //set physical properties
    setDensity(0.2);
    setFriction(1);
    setRestitution(0.25);
    world.add(this);
  }

  void show() {
    ArrayList<FContact> contacts = this.getContacts();
    
    println(contacts.size());
    
    //for (int i = 0; i < blobs.size(); i++) {
    //  if (this.isTouchingBody(blobs.get(i)) ) {
    //   println("collide"); 
    //  }
    //}
  }
}
