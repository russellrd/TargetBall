import java.util.Collections;
import processing.sound.*;
SoundFile file;

PImage Floor;
PImage Log;
PImage Wall;
PImage Window;
PImage Brick;
ArrayList<Data> coords;
int[] highScores;
PImage playerImg;
Target target;
Player player;
Stage screen;
Trig trig;

final float r = 20;
final int ROUNDS = 5;

void setup() {
  size(1600, 600);
  coords = loadCSV();
  playerImg = loadImage("smile.png");
  highScores = loadHighScores();
  Data object = coords.get(int(random(coords.size())));
  player = new Player(object.x1, object.y1);
  target = new Target(object.x2, object.y2);
  trig = new Trig();
  Floor = loadImage("floor.jpg");
  Log = loadImage("goodlog.jpg");
  Wall = loadImage("WALL (1).jpg");
  Window = loadImage("Window.jpg");
  Brick = loadImage("GreyBrick (1).jpg");
  screen = Stage.TITLE;
  getTrack();
}

void draw() {
  switch(screen) {
  case TITLE:
    push();

    background(0);
    
    if (keyCode == ENTER) {    // if enter is pressed game starts 
      screen = Stage.GAME;
    }

    wall();
    bricks();
    logs();              // made to look like a tavern 
    windows();
    floors();
   
    rectMode(CENTER);
    noStroke();
    fill(0, 150, 0);

    noStroke();
    fill(255, 50, 50);  
    ellipse(position.x, position.y - 10, 75, 75);     // draw ball
    updatePos();
    moveText();

    stroke(000000);
    fill(000000);
    rect(1400, 200, 300, 100);    //start button 

    //rect(1400, 400, 300, 100);    //instructions button

    fill(255);
    rect(1400, 200, 275, 75);  // inside of the start button 

    //rect(1400, 400, 275, 75);    // inside of the instructions buttton
   
    fill(000000);
    textSize(18);
    text("Press Enter To Play", 1300, 200);
    
    //text("Press C For The Controls", 1300, 400);
    pop();
    break;
  case GAME:
    // Game Code
    background(170);
    if(player.round <= ROUNDS) {
      trig.showTrig(player.playerPos, target.targetPos);
      trig.showDist(true, true, true, player.playerPos, target.targetPos);
      if(player.running) {
          if(target.getDist(player.playerAni.x, player.playerAni.y) > r) {
            if(player.playerPos.x < target.targetPos.x) {
              player.setVel(player.getAngle());
            } else {
              player.setVel(180-player.getAngle());
            }
          } else {
            player.round++;
            player.score++;
            reset();
          }
      }
    } else {
      addScore(player.score);
      saveHighScores(highScores);
      screen = Stage.SCOREBOARD;
    }
    target.display();
    player.update();
    player.display();
    // Change to next screen
    
    if (!target.hasPassed (player.playerAni.x, player.playerAni.y)){
      //println("out");
    }
    
    //println(player.playerAni.x+" "+ player.playerAni.y);
    
    break;
  case SCOREBOARD:
    push();
    background(0);
    fill(255);
    textAlign(CENTER);
    textSize(50);
    strokeWeight(10);
    stroke(255);
    strokeCap(SQUARE);
    text("Leaderboard", width/2, height*0.1);
    line(width/7, height*0.3, width-(width/7), height*0.3);
    line(width/7, height*0.5, width-(width/7), height*0.5);
    line(width/7, height*0.65, width-(width/7), height*0.65);
    for (int i = width/7, count = 0; i < 6*width/7; i+=width/7, count++) {
      if (count < 5) {
        text(count+1, (width/7/2)+i, height*0.25);
        text(highScores[count], (width/7/2)+i, height*0.425);
        text(count+6, (width/7/2)+i, height*0.6);
        text(highScores[count+5], (width/7/2)+i, height*0.775);
      }
      line(i, height*0.15, i, height*0.85);
    }
    noFill();
    rect(width/7, height*0.15, width-(2*width/7), height*0.7);
    pop();
    break;
  default:
    println("Error: Screen does not exist!");
  }
}

void keyPressed() {
  if (key == CODED && !player.running) {
    if (keyCode == UP) {
      player.incAngle();
    } else if (keyCode == DOWN) {
      player.decAngle();
    } 
  }
  if(key == ' ') {
    player.running = true;
  }
}

void reset() {
  player.playerVel.set(0,0);
  Data object = coords.get(int(random(coords.size())));
  player.reset(object.x1, object.y1);
  target.reset(object.x2, object.y2);
}

void addScore(int score) {
  ArrayList<Integer> high = new ArrayList<Integer>();
  for(int i = 0; i < highScores.length; i++) {
    high.add(highScores[i]);
  }
  high.add(score);
  Collections.sort(high);
  Collections.reverse(high);
  high.remove(high.size()-1);
  for(int i = 0; i < high.size(); i++) {
    highScores[i] = high.get(i);
  }
}
