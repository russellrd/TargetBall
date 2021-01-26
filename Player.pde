class Player {
  private PVector playerPos;
  
  public Player(int x, int y) {
    playerPos = new PVector(x, y);
  } 
  
  public void display() {
    push();
    fill(0);
    ellipse(playerPos.x,playerPos.y,40,40);
    textAlign(CENTER);
    textSize(20);
    text("x: " + int(playerPos.x) + ", y: " + int(playerPos.y), playerPos.x, playerPos.y-40);
    pop();
  }
  
  public void update() {
  
  }
}
