class Target {
  private PVector targetPos;
  
  public Target(float x, float y) {
    targetPos = new PVector(x, y);
  }
  
  public void display() {
    push();
    fill(0);
    noStroke();
    for(int i = int(r); i > int(r/6); i -= int(2*r/6)) {
      fill(255,0,0);
      ellipse(targetPos.x, targetPos.y, i, i);
      fill(255);
      ellipse(targetPos.x, targetPos.y, i-(r/6), i-(r/6));
    }
    textAlign(CENTER);
    textSize(20);
    text("(" + int(targetPos.x) + ", " + int(targetPos.y) + ")", targetPos.x, targetPos.y-30);
    pop();
  }
  
  public int getDist(int x, int y) {
    return int(dist(targetPos.x, targetPos.y, x, y));
  }
}
