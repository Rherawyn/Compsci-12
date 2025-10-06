//unit 2 checkpoint 2
//Gabriel Altshuler
Button myButton;
Button myButton2;

color violet = #5C2CFF;
color green = #687617;
color red = #EA3F1C;
color black = #0A0A0A;
color orange = #E56605;
color azure = #335986;

boolean mouseReleased;
boolean wasPressed;



void setup() {
  size(800, 800);
  PImage frog = loadImage("FROG.jpg");
  myButton = new Button("button", 400, 400, 200, 100, black, orange);
  myButton2 = new Button(frog, 150, 100, 200, 200, 200, 100, green, red);
  
}


void draw() {
  click();
  myButton.show();
  myButton2.show();
  
  if(myButton.clicked) {
   background(azure);
  }
}
