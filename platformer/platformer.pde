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
int mode = 0;

//health
PImage mask;
PImage emask;
PImage[] vessel;

//world stuff
PImage bg;
PImage map;
PImage[] ground = new PImage[5];

int gridSize = 48;
float zoom = 1;
float pSpawnX, pSpawnY;

//intro
PImage logo;

//character animations
PImage[] pRun;
PImage[] pIdle;
PImage[] pJump;
PImage[] pAction;
PImage[] pHeal;

//NPC animations
PImage[] wenemy;

//weapon animation
PImage[] sAttack;

//terrain animation
PImage[] spike;
PImage[] bench;
PImage[] bwall;
PImage[] lever;
PImage[] indicator;
boolean gflipped = false;
PImage gate;

//controls
boolean mouseReleased, wasPressed;
boolean spacekey, upkey, downkey, rightkey, leftkey, wkey, akey, skey, dkey, qkey, ekey;

ArrayList<FGameObject> acts = new ArrayList<FGameObject>();
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

  mask = loadImage("mask.png");
  emask = loadImage("emask.png");
  map = loadImage("spawnroom.png");
  loadImages();
  loadWorld(map);
  loadPlayer();
}

void loadWorld(PImage img) {
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
        if (img.get(x, y-1) != black && img.get(x, y-1) != color(127, 127, 127) && img.get(x, y-1) != red && img.get(x, y-1) != color(0,0,255)) {
          b.attachImage(ground[x%4]);
        }
        b.setName("block");
        b.setFillColor(black);
        b.setRestitution(0);
        b.setFriction(4);
        b.setStatic(true);
        blocks.addBody(b);
        world.add(b);
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
        world.add(b);
      } else if (c == color(255, 127, 39)) {
        FFlenemy enemy = new FFlenemy(x*gridSize, y*gridSize);
        acts.add(enemy);
        world.add(enemy);
      } else if (c == color(255, 255, 0)) {
        FWenemy enemy = new FWenemy(x*gridSize, y*gridSize);
        acts.add(enemy);
        world.add(enemy);
      } else if (c == red) {
        FSpike spike = new FSpike(x*gridSize, y*gridSize);
        acts.add(spike);
        world.add(spike);
      } else if (c == color(0, 255, 0)) {
        FBench bench = new FBench(x*gridSize, y*gridSize);
        acts.add(bench);
        world.add(bench);
      } else if (c == color(0,0,255)) {
        FBwall bwall = new FBwall(x*gridSize, y*gridSize);
        acts.add(bwall);
        world.add(bwall);
      } else if (c == color(0,170,255)) {
        FGate gate = new FGate(x*gridSize, y*gridSize, gflipped);
        if(gflipped == false) gflipped = true; 
        acts.add(gate);
        world.add(gate);
      } else if (c == color(0,255,255)) {
        FLever lever = new FLever(x*gridSize, y*gridSize, acts);
        acts.add(lever);
        world.add(lever);
      }
    }
  }
  blocks.setStatic(true);
  //world.add(blocks);
}

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}

void actWorld() {
  for (int i = 0; i < acts.size(); i++) {
    FGameObject e = acts.get(i);
    e.act();
  }
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX() * zoom + width/2, -player.getY() * zoom + height/2);
  scale(zoom);
  for (int i = 0; i < bposx.size(); i++) {
    fill(black);
    stroke(black);
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
  //logo
  logo = loadImage("hklogo.png");
  
  //character animations
  pRun = new PImage[6];
  for (int i = 0; i < 6; i++) {
    pRun[i] = loadImage("pRun" + (i+1) + ".png");
  }

  pJump = new PImage[1];
  pJump[0] = loadImage("pJump.png"); 

  pIdle = new PImage[4];
  for (int i = 0; i < 4; i++) {
    pIdle[i] = loadImage("pIdle" + (i+1) + ".png");
  }

  pHeal = new PImage[10];
  for (int i = 0; i < 10; i++) {
    pHeal[i] = loadImage("pHeal" + (i+1) + ".png");
  }

  pAction = pIdle;

  sAttack = new PImage[6];
  for (int i = 0; i < 6; i++) {
    sAttack[i] = loadImage("sAttack" + (i+1) + ".png");
  }
  
  //NPC animations 
  wenemy = new PImage[6];
  for (int i = 0; i < 6; i++) {
    wenemy[i] = loadImage("wenemy" + (i+1) + ".png");
  }

  //terrain animations
  spike = new PImage[4];
  for (int i = 0; i < 4; i++) {
    spike[i] = loadImage("spike" + (i+1) + ".png");
  }

  bench = new PImage[10];
  for (int i = 0; i < 10; i++) {
    bench[i] = loadImage("bench" + (i) + ".png");
  }
  
  bwall = new PImage[4];
  for (int i = 0; i < 4; i++) {
    bwall[i] = loadImage("bwall" + (i+1) + ".png");
  }
  
  lever = new PImage[2];
  for (int i = 0; i < 2; i++) {
    lever[i] = loadImage("lever" + (i+1) + ".png");
  }
  
  indicator = new PImage[2];
  for (int i = 0; i < 2; i++) {
    indicator[i] = loadImage("switch" + (i+1) + ".png");
  }
  
  gate = loadImage("gate.png");

  //vessel
  vessel = new PImage[10];
  for (int i = 0; i < 10; i++) {
    vessel[i] = loadImage("vessel" + (i+1) + ".png");
  }
}
