class Blob extends FBlob {

  Blob() {
    //set visuals
    setAsCircle(400, -5, 40);
    setStroke(0);
    setStrokeWeight(2);
    setFillColor(yellow);

    //set physical properties
    setDensity(0.2);
    setFriction(1);
    setRestitution(0.25);
  }
  
  void show() {
    //set visuals
    setAsCircle(400, -5, 40);
    setStroke(0);
    setStrokeWeight(2);
    setFillColor(yellow);

    //set physical properties
    setDensity(0.2);
    setFriction(1);
    setRestitution(0.25);
  }
}
