class Asteroid  extends GameObject {
  PShape shape;

  Asteroid() {
    super(random(width), random(height), 0, 0);
    lives = 3;
    shaped();
  }

  void show() {
    pushMatrix();
    translate(500,500);
    shape(shape, 0, 0);
    popMatrix();
  }

  void act() {
    stroke(255);
    noFill();
    circle(500,500,200);
  }

  void shaped() {
    noFill();
    stroke(255);
    strokeWeight(5);
    shape = createShape();
    shape.beginShape();
    shape.vertex(100,0);
    shape.vertex(70,70);
    shape.vertex(0,100);
    shape.vertex(-70,70);
    shape.vertex(-100,0);
    shape.vertex(-70,-70);
    shape.vertex(0,-100);
    shape.vertex(70,-70);
    shape.endShape(CLOSE);
  }
}
