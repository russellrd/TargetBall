class Player {
  private PVector playerPos;
  private PVector playerVel;
  private PVector playerAcc;
  private float angle;

  public Player(float x, float y) {
    playerPos = new PVector(x, y);
    playerVel = new PVector(0, 0);
    playerAcc = new PVector(0, 0);
    angle = 45;
  } 

  public void display() {
    push();
    fill(0);
    ellipse(playerPos.x, playerPos.y, r, r);
    noFill();
    textAlign(CENTER);
    textSize(40);
    text("θ = " + angle, 100, 50);
    textSize(20);
    text("(" + int(playerPos.x) + ", " + int(playerPos.y) + ")", playerPos.x, playerPos.y-30);
    pop();
  }

  public void update() {
    playerPos.add(playerVel);
  }
  
  public void incAngle() {
    if(angle < 90)
      angle++;
  }
  
  public void decAngle() {
    if(angle > 0)
      angle--;
  }
  
  public float getAngle() {
    return angle;
  }

  private void arrow(int x1, int y1, int x2, int y2) {
    push();
    line(x1, y1, x2, y2);
    translate(x2, y2);
    rotate(atan2(x1-x2, y2-y1));
    line(0, 0, -10, -10);
    line(0, 0, 10, -10);
    pop();
  }

  private void drawArc() {
    float angleStart = calcAngle(new PVector(1, 0), new PVector(200, 0));
    float angleEnd = calcAngle(new PVector(1, 0), new PVector(mouseX-playerPos.x, mouseY-playerPos.y));
    arc(0, 0, 100, 100, angleStart, -constrain(angleEnd, -PI/2, PI/2));
    if (angleEnd > angleStart) {
      arc(0, 0, 100, 100, -constrain(angleEnd, -PI/2, PI/2), angleStart);
    }
  }

  private float calcAngle(PVector v1, PVector v2) {
    return atan2(v1.y, v1.x)-atan2(v2.y, v2.x);
  }
}
