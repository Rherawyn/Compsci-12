class Circle extends FCircle {

  int lives = 1;
  float type, x, y;
  int nspawn;

  Circle(float _type) {
    super(50);
    type = _type;
    setSize(type);
    setPosition(mouseX, 0);
    //set visuals
    setFillColor(yellow);

    //set physical properties
    setDensity(0.2);
    setFriction(1);
    setRestitution(0.25);
    world.add(this);
  }

  Circle(float _type, float _x, float _y) {
    super(50);
    type = _type;
    x = _x;
    y = _y;
    setSize(type);
    setPosition(x, y);
    //set visuals
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

    for (int i = 0; i < circles.size(); i++) {
      if (this.isTouchingBody(circles.get(i))) {
        world.remove(circles.get(i));
        world.remove(this);
        nspawn++;
        if(nspawn >0) {
        circles.add(new Circle((50), this.getX(), this.getY()));
        nspawn = 0;
        }
      }
    }
  }
}
