class Target {
  private PVector targetPos;
  private int radius;
  
  public Target(int x, int y, int r) {
    targetPos = new PVector(x, y);
    radius = r;
  }
  
  public void display() {
    push();
    noStroke();
    for(int i = radius; i > radius/6; i -= 2*radius/6) {
      fill(255,0,0);
      ellipse(targetPos.x, targetPos.y, i, i);
      fill(255);
      ellipse(targetPos.x, targetPos.y, i-(radius/6), i-(radius/6));
    }
    fill(0);
    textAlign(CENTER);
    textSize(30);
    text("(" + int(targetPos.x) + ", " + int(targetPos.y) + ")", targetPos.x-5, targetPos.y*0.2);
    pop();
  }
  
  public int getDist(int x, int y) {
    return int(dist(targetPos.x, targetPos.y, x, y));
  }
}
