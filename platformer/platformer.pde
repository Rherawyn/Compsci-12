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
int gridSize = 48;
float zoom = 1;
boolean spacekey, upkey, downkey, rightkey, leftkey, wkey, akey, skey, dkey, qkey, ekey;
FPlayer player;

FWorld world;

void setup() {
  size(1200, 800);
  Fisica.init(this);
  
  map = loadImage("spawnroom.png");
  loadWorld(map);
  loadPlayer();
}

void loadWorld(PImage img) {
  world = new FWorld(-10000, -10000, 10000, 10000);
  world.setGravity(0, 1100);
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      if (c == black) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setRestitution(0);
        b.setFriction(4);
        b.setStatic(true);
        world.add(b);
      }
    }
  }
}

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX() * zoom + width/2, -player.getY() * zoom + height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}

void draw() {
  background(deepblue);
  drawWorld();
  player.act();
}
