//unit 2 checkpoint 3 - gif class
//gabriel altshuler
Gif frog, frog2, frog3, frog4;

void setup() {
 size(800,800); 
  
  frog = new Gif("frog/frame_","_delay-0.1s.gif",0,0,39,1,800,800);
  frog2 = new Gif("frog2/frame_","_delay-0.1s.gif",200,600,44,3);
  frog3 = new Gif("frog2/frame_","_delay-0.1s.gif",600,500,44,4);
  frog4 = new Gif("frog2/frame_","_delay-0.1s.gif",50,50,44,5);
}

void draw() {
  
  frog.show();
  frog2.show();
  frog3.show();
  frog4.show();
}
