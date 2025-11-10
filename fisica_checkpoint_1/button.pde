class Button {

  //instance variables
  int x, y, w, h, pw, ph;
  boolean clicked;
  String text = "";
  color highlight, normal;
  PImage image;


  Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    norm = normal;
    clicked = false;
  }
  
  Button(PImage i, int _pw, int _ph, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    pw = _pw;
    ph = _ph;
    highlight = high;
    norm = normal;
    clicked = false;
    image = i;
  }

  //behavior functions
  boolean touchingMouse() {
    return (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2);
  }

  void show() {
    drawRect();
    drawLabel();
    checkForClick();
    if (image != null) drawImage();
  }

  void drawRect() {
    rectMode(CENTER);
    if (touchingMouse()) {
      fill(highlight);
      stroke(normal);
    } else {
      fill(normal);
      stroke(highlight);
    }
    strokeWeight(5);
    rect(x, y, w, h, x/100);
  }

  void drawLabel() {
    textAlign(CENTER, CENTER);
    if (touchingMouse()) {
      fill(normal);
    } else {
      fill(highlight);
    }
    textSize(w/4);
    text(text, x, y);
  }
  
  void drawImage() {
    imageMode(CENTER);
    image(image, x, y, pw, ph);
  }

  void checkForClick() {
    if (mouseReleased && touchingMouse()) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
}
