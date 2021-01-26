class Target {
  private PVector targetPos;
  
  public Target(int x, int y) {
    targetPos = new PVector(x, y);
  }
  
  public void display() {
    push();
    noStroke();
    fill(255,0,0);
    ellipse(targetPos.x, targetPos.y, 150, 150);
    fill(255);
    ellipse(targetPos.x, targetPos.y, 125, 125);
    fill(255,0,0);
    ellipse(targetPos.x, targetPos.y, 100, 100);
    fill(255);
    ellipse(targetPos.x, targetPos.y, 75, 75);
    fill(255,0,0);
    ellipse(targetPos.x, targetPos.y, 50, 50);
    fill(255);
    ellipse(targetPos.x, targetPos.y, 25, 25);
    pop();
  }
  
  public int getDist(int x, int y) {
    return int(dist(targetPos.x, targetPos.y, x, y));
  }
}
