class Circle extends FCircle {

  int lives = 1;
  float type, x, y;
  int nspawn;

  Circle(float _type) {
    super(_type);
    type = _type;
    setSize(type);
    setPosition(mouseX, 0);
    //set visuals
    colors();

    //set physical properties
    setDensity(0.1);
    setFriction(0.5);
    setRestitution(0.25);
    world.add(this);
  }

  Circle(float _type, float _x, float _y) {
    super(_type);
    type = _type;
    x = _x;
    y = _y;
    setSize(type);
    setPosition(x, y);
    //set visuals
    colors();

    //set physical properties
    setDensity(0.1);
    setFriction(0.5);
    setRestitution(0.25);
    world.add(this);
  }

  void show() {
   if(this.getX() + (type/2) > 625) {
     this.setPosition(625 - type/2, this.getY()); 
    } else if (this.getX() - (type/2) < 0) {
     this.setPosition(0 + type/2, this.getY()); 
    }
  }

  boolean collide() {
    ArrayList<FContact> contacts = this.getContacts();

    println(contacts.size());

    for (int i = 0; i < circles.size(); i++) {
      if (this.isTouchingBody(circles.get(i)) && this.type == circles.get(i).type & this.type < 465) {
        world.remove(circles.get(i));
        circles.remove(circles.get(i));
        world.remove(this);
        circles.remove(this);
        circles.add(new Circle((type*1.25), this.getX(), this.getY()-(type/2)));
        return true;
      }
    }
    return false;
  }

  void colors() {
    if (type == 50) {
      setFillColor(#FF3434);
    } else if (type == 62.5) {
      setFillColor(#FF3B05);
    } else if (type == 78.125) {
      setFillColor(#C643FF);
    } else if (type > 97 && type < 98) {
      setFillColor(#FFCA58);
    } else if (type > 122 && type < 123) {
      setFillColor(#FF761A);
    } else if (type > 152 && type < 153) {
      setFillColor(#FF0000);
    } else if (type > 190 && type < 191) {
      setFillColor(#F9FF58);
    } else if (type > 238 && type < 239) {
      setFillColor(#FCD700);
    } else if (type > 298 && type < 299) {
      setFillColor(#FF8162);
    } else if (type > 372 && type < 373) {
      setFillColor(#C6FF71);
    } else if (type > 465 && type < 466) {
      setFillColor(#32D646);
    }
  }
}
