//Platformer project
//Gabriel Altshuler

import fisica.*;

//colors
color black = #000000;
color green = color(34, 117, 76);
color lgreen = color(181, 230, 29);
color blue = color(153, 217, 234);
color yellow = color(255, 242, 0);
//color player = color ();
color brown = color(185, 122, 87);
color deepblue = color(5, 209, 177);
color pink = color(255, 174, 201);
color red = color(255, 0, 0);

PImage map;
int x = 0;
int y = 0;
int gridsize = 48;

FWorld world;

void setup() {
  size(1200, 800);

  Fisica.init(this);
  world = new FWorld();

  map = loadImage("spawnroom.png");

  //load the world
  while (y < map.height) { // keep going until we get to the end o the map image

    color c = map.get(x, y); // get a pixel's color from the map and process it

    if ( c == black) {
      FBox b = new FBox(gridsize, gridsize);
      b.setFillColor(black);
      b.setPosition(x*gridsize-24, y*gridsize-24);
      b.setStatic(true);
      world.add(b);
    }

    x++; // move down the row

    if (x == map.width) { // if we ge tto the end of the row then go back to the beginning and down to the next row
      x = 0;
      y++;
    }
  }
}

void draw() {
  background(deepblue);
  world.step();
  world.draw();
}
