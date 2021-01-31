ArrayList<Data> coords;
int[] highScores;
PImage playerImg;
Target target;
Player player;
Stage screen;
Trig trig;
int round = 1;

final float r = 20;

void setup() {
  size(1600, 600);
  coords = loadCSV();
  playerImg = loadImage("smile.png");
  highScores = loadHighScores();
  Data object = coords.get(int(random(coords.size())));
  player = new Player(object.x1, object.y1);
  target = new Target(object.x2, object.y2);
  trig = new Trig();
  screen = Stage.GAME;
}

void draw() {
  switch(screen) {
  case TITLE:
    // Change to next screen
    screen = Stage.GAME;
    break;
  case GAME:
    // Game Code
    background(170);
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
          player.playerVel.set(0,0);
        }
    }
    target.display();
    player.update();
    player.display();
    // Change to next screen
    //screen = Stage.SCOREBOARD;
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
  if (key == CODED) {
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
