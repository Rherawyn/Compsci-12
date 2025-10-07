class Gif {

  //instance variables
  int x, y, w, h, f, s, currentFrame;
  boolean clicked;
  String prefix, sufix;
  PImage[] frame;


  Gif(String prefix, String sufix, int _x, int _y, int _f, int _s) {
    frame = new PImage[f];
    f = _f;
    s = _s;
    x = _x;
    y = _y;
    currentFrame = 0;
    
    for (int i = 0; i < f-1; i++) {
        frame[i] = loadImage(prefix + i + sufix);
      }
      
    w = frame[0].width;
    h = frame[0].height;
    currentFrame = 0;

  }

  Gif(String prefix, String sufix, int _x, int _y, int f, int s, int _w, int _h) {
    this(prefix,sufix,_x,_y,f,s);
    w = _w;
    h = _h; 

  }

  void show() {
    if(currentFrame == f) currentFrame = 0;
    image(frame[currentFrame], x, y, w, h);
    if(frameCount % s == 0) currentFrame++;
  }
}
