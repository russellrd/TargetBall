ArrayList<Data> coords;
int[] highScores;
Target target;
Player player;
Stage screen;
Physics physics;
int round = 0;

void setup() {
  size(1600, 600);
  coords = loadCSV();
  highScores = loadHighScores();
  target = new Target(int(width*0.85), height/2, 400);
  Data objects = coords.get(int(random(coords.size())));
  player = new Player(objects.x1, objects.y1);
  physics = new Physics();
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
    target.display();
    player.playerAcc = physics.getAcceleration(player.playerVel, 0.8, 50);
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

void mouseReleased() {
  player.launched = true;
  physics.setForce(player.force, player.angle);
}
