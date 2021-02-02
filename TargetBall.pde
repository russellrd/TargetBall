import java.util.Collections;
import processing.sound.*;

// Declare global vars
SoundFile file;
SoundFile nm;
PImage Floor;
PImage Log;
PImage Wall;
PImage Window;
PImage Brick;
ArrayList<Data> coords;
int[] highScores;
boolean[] Barr;
PImage playerImg;
Target target;
Player player;
Stage screen;
Trig trig;
int epilepsy = 1;

// Constants
final float r = 20;
final int ROUNDS = 5;

void setup() {
  size(1600, 600);
  
  // Load data from csv file
  coords = loadCSV();
  
  // Load highscores from text file
  highScores = loadHighScores();
  
  // Setup game objects
  Data object = coords.get(int(random(coords.size())));
  player = new Player(object.x1, object.y1);
  target = new Target(object.x2, object.y2);
  trig = new Trig();
  bar = new boolean[3];
  getRandom();
  
  // Load all images and sounds
  nm = new SoundFile(this, "nicemusic.mp3");
  nm.amp(0.1);
  playerImg = loadImage("smile.png");
  Floor = loadImage("floor.jpg");
  Log = loadImage("goodlog.jpg");
  Wall = loadImage("WALL (1).jpg");
  Window = loadImage("Window.jpg");
  Brick = loadImage("GreyBrick (1).jpg");
  getTrack();
  
  /// Load title screen
  screen = Stage.TITLE;
}

void draw() {
  switch(screen) {
    // Title screen
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
      playerImg.resize(75, 75);
      image(playerImg, position.x, position.y);
      updatePos();
      moveText();
      stroke(000000);
      fill(000000);
      rect(1400, 200, 300, 100); // start button 
      fill(255);
      rect(1400, 200, 275, 75);  // inside of the start button 
      fill(000000);
      textSize(18);
      text("Press Enter To Play", 1300, 200);
      pop();
      break;
      
    // Main game
    case GAME:
      if(epilepsy == 1){
        background(170);
      }
      if(epilepsy == -1){
        background(random(255),random(255),random(255));
      }
      file.stop();
      if (player.round <= ROUNDS) {
        trig.showTrig(player.playerPos, target.targetPos);
        trig.showDist(Barr[0], Bar[1], Barr[2], player.playerPos, target.targetPos);
        if (player.running) {
          if (target.getDist(player.playerAni.x, player.playerAni.y) > r) {
            if (player.playerPos.x < target.targetPos.x) {
              player.setVel(player.getAngle());
            } else {
              player.setVel(180-player.getAngle());
            }
          } else {
            player.round++;
            if(epilepsy == 1)
              player.score++;
            else
              player.score+=2;
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
  
      // Move to answer screen if player misses target
      if (target.hasPassed (player.playerAni.x, player.playerAni.y)) {
        screen = Stage.ANSWER;
      }
      break;
    // Answer Display
    case ANSWER:
      push();
      background(255, 0, 0);
      trig.getAns();
      if (keyPressed && key == ENTER) {
        player.round++;
        reset();
        screen = Stage.GAME;
      }
      pop();
      break;
    // Top 10 scoreboard
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
  // Increase/Decrease angle with up/down arrows
  if (key == CODED && !player.running) {
    if (keyCode == UP) {
      player.incAngle();
    } else if (keyCode == DOWN) {
      player.decAngle();
    }
  }
  // Start player movement when space is pressed
  if (key == ' ') {
    player.running = true;
  }
  // Turn on hard mode with the 'h' key
  if(key == 'H' || key == 'h'){
    if(epilepsy == 1)
      nm.loop();
    else
      nm.stop();
    epilepsy *= -1;
  }
}

// Reset all objects
void reset() {
  player.playerVel.set(0, 0);
  getRandom();
  Data object = coords.get(int(random(coords.size())));
  player.reset(object.x1, object.y1);
  target.reset(object.x2, object.y2);
}

// Add score to highscore array
void addScore(int score) {
  ArrayList<Integer> high = new ArrayList<Integer>();
  for (int i = 0; i < highScores.length; i++) {
    high.add(highScores[i]);
  }
  high.add(score);
  Collections.sort(high);
  Collections.reverse(high);
  high.remove(high.size()-1);
  for (int i = 0; i < high.size(); i++) {
    highScores[i] = high.get(i);
  }
}

// Get random 2 sides of triangle
void getRandom() {
  float r = random(0, 4);
  println(r);
  if (r>0 && r<1) {
    Barr[0] = true;
    Barr[1] = true;
    Barr[2] = false;
  } else if (r>1 && r<2) {
    Barr[0] = true;
    Barr[1] = false;
    Barr[2] = true;
  } else if (r>2 && r<4) {
    Barr[0] = false;
    Barr[1] = true;
    Barr[2] = true;
  }
}
