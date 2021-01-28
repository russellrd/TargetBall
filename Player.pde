class Player {
  private PVector playerPos;
  private PVector playerVel;
  private PVector playerAcc;
  
  public Player(int x, int y) {
    playerPos = new PVector(x, y);
    playerVel = new PVector(0, 0);
  } 
  
  public void display() {
    push();
    fill(0);
    ellipse(playerPos.x,playerPos.y,40,40);
    textAlign(CENTER);
    textSize(20);
    text("(" + int(playerPos.x) + ", " + int(playerPos.y) + ")", playerPos.x, playerPos.y-40);
    pop();
  }
  
  public void update() {
  
  }
}
