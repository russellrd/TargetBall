class Target {
  private PVector targetPos;
  
  public Target(float x, float y) {
    targetPos = new PVector(x, y);
  }
  
  public void display() {
    push();
    fill(0);
    noStroke();
    ellipse(targetPos.x, targetPos.y, r, r);
    textAlign(CENTER);
    textSize(20);
    text("(" + int(targetPos.x) + ", " + int(targetPos.y) + ")", targetPos.x, targetPos.y-30);
    pop();
  }
  
  public int getDist(int x, int y) {
    return int(dist(targetPos.x, targetPos.y, x, y));
  }
}
