ArrayList<PVector> positions;
int[] highScores;
Target target;
Player player;
Stage screen;
Physics physics;

void setup() {
  size(1600, 600);
  positions = loadCSV();
  highScores = loadHighScores();
  target = new Target(int(width*0.85), height/2, 400);
  PVector pos = positions.get(int(random(positions.size())));
  player = new Player(int(pos.x), int(pos.y));
  physics = new Physics(0,5);
  screen = Stage.PHYSICS;
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
    
  case PHYSICS:
    player.display();
    
    player.playerVel.set(physics.getAcceleration(player.playerVel, 0.5, 5));
    
    break;

  default:
    println("Error: Screen does not exist!");
  }
}
