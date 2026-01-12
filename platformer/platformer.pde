//Platformer project
//Gabriel Altshuler

import fisica.*;

//colors
color black = #000000;
color green = color(34, 117, 76);
color lgreen = color(181, 230, 29);
color blue = color(5, 209, 177);
color yellow = color(255, 242, 0);
//color player = color ();
color brown = color(185, 122, 87);
color deepblue = color(33, 78, 165);
color pink = color(255, 174, 201);
color red = color(255, 0, 0);

//mode frameworks
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;
final int PAUSE = 3;
int mode = 1;

//world stuff
PImage bg;
PImage map;
PImage[] ground = new PImage[5];

int gridSize = 48;
float zoom = 1;
float pSpawnX, pSpawnY;

//character animations
PImage[] pRun;
PImage[] pIdle;
PImage[] pJump;
PImage[] pAction;

//weapon animation
PImage[] sAttack;
PImage[] sAction;

//controls
boolean mouseReleased, wasPressed;
boolean spacekey, upkey, downkey, rightkey, leftkey, wkey, akey, skey, dkey, qkey, ekey;

ArrayList<FGameObject> enemies = new ArrayList<FGameObject>();
FPlayer player;

FWorld world;
ArrayList<Integer> bposx = new ArrayList<Integer>();
ArrayList<Integer> bposy = new ArrayList<Integer>();

ArrayList<Integer> eSpawnX = new ArrayList<Integer>();
ArrayList<Integer> eSpawnY = new ArrayList<Integer>();

void setup() {
  size(1200, 800);
  bg = loadImage("background2.png");
  Fisica.init(this);
  rectMode(CENTER);

  for (int i = 1; i < ground.length; i++) {
    ground[i-1] = loadImage("ftile" + i + ".png");
  }

  map = loadImage("spawnroom.png");
  loadImages();
  loadWorld(map, ground);
  loadPlayer();
}

void loadWorld(PImage img, PImage[] imgs) {
  world = new FWorld(-10000, -10000, 10000, 10000);
  world.setGravity(0, 1100);

  FCompound blocks = new FCompound();

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      if (c == color(127, 127, 127)) {
        bposx.add(x*gridSize);
        bposy.add(y*gridSize);
      } else if (c == black) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("block");
        if (img.get(x, y-1) != black && img.get(x, y-1) != color(127, 127, 127) && img.get(x, y-1) != red) {
          b.attachImage(ground[x%4]);
        }
        b.setFillColor(black);
        b.setRestitution(0);
        b.setFriction(4);
        b.setStatic(true);
        blocks.addBody(b);
        //world.add(b);
      } else if (c == color(181, 230, 29)) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        pSpawnX = x*gridSize;
        pSpawnY = y*gridSize - gridSize - 1;
        b.setName("spawn");
        b.attachImage(ground[x%4]);
        b.setFillColor(black);
        b.setRestitution(0);
        b.setFriction(4);
        b.setStatic(true);
        blocks.addBody(b);
        //world.add(b);
      } else if (c == color(255, 127, 39)) {
        //eSpawnX.add(x*gridSize);
        //eSpawnY.add(y*gridSize);
        FFlenemy enemy = new FFlenemy(x*gridSize, y*gridSize);
        enemies.add(enemy);
        world.add(enemy);
        //world.add(b);
      } else if (c == red) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("spike");
        b.setRestitution(0);
        b.setFriction(4);
        b.setStatic(true);
        world.add(b);
      }
    }
  }
  blocks.setStatic(true);
  world.add(blocks);
}

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}

void actWorld() {
  for (int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX() * zoom + width/2, -player.getY() * zoom + height/2);
  scale(zoom);
  for (int i = 0; i < bposx.size(); i++) {
    fill(black);
    rect(bposx.get(i), bposy.get(i), gridSize, gridSize);
  }
  world.step();
  world.draw();
  popMatrix();
}

void draw() {

  click();

  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}

void loadImages() {
  pRun = new PImage[6];
  pRun[0] = loadImage("pRun1.png");
  pRun[1] = loadImage("pRun2.png");
  pRun[2] = loadImage("pRun3.png");
  pRun[3] = loadImage("pRun4.png");
  pRun[4] = loadImage("pRun5.png");
  pRun[5] = loadImage("pRun6.png");

  pJump = new PImage[1];
  pJump[0] = loadImage("pJump.png");

  pIdle = new PImage[4];
  pIdle[0] = loadImage("pIdle1.png");
  pIdle[1] = loadImage("pIdle2.png");
  pIdle[2] = loadImage("pIdle3.png");
  pIdle[3] = loadImage("pIdle4.png");
  
  pAction = pIdle;
  
  sAttack = new PImage[6];
  sAttack[0] = loadImage("sAttack1.png");
  sAttack[1] = loadImage("sAttack2.png");
  sAttack[2] = loadImage("sAttack3.png");
  sAttack[3] = loadImage("sAttack4.png");
  sAttack[4] = loadImage("sAttack5.png");
  sAttack[5] = loadImage("sAttack6.png");
  
  sAction = sAttack;
}
