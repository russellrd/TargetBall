ArrayList<PVector> positions;
int[] highScores;
Target target;
Player player;
Stage screen;

void setup() {
  size(1600, 600);
  positions = loadCSV();
  highScores = loadHighScores();
  target = new Target(int(width*0.85), height/2, 400);
  PVector pos = positions.get(int(random(positions.size())));
  player = new Player(int(pos.x), int(pos.y));
  screen = Stage.TITLE;
}

void draw() {
  switch(screen) {
    case TITLE:
      screen = screen.values()[screen.ordinal()+1];
      break;
    case GAME:
      target.display();
      player.display();
      break;
    case SCOREBOARD:
      break;
    default:
      println("Error: Screen does not exist!");
  }
  
}
