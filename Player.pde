class Player {
  private PVector playerPos;
  private PVector playerVel;
  private PVector playerAcc;
  private int maxForce;
  private int angle;
  private int force;
  private boolean launched;

  public Player(int x, int y) {
    playerPos = new PVector(x, y);
    playerVel = new PVector(0, 0);
    playerAcc = new PVector(0, 0);
    maxForce = 200;
    launched = false;
  } 

  public void display() {
    push();
    fill(0);
    ellipse(playerPos.x, playerPos.y, 40, 40);
    pop();
    if (!launched) {
      push();
      fill(255);
      strokeWeight(4);
      PVector m = new PVector(mouseX, mouseY);
      if (dist(m.x, m.y, playerPos.x, playerPos.y) > maxForce) {
        m.sub(new PVector(playerPos.x, playerPos.y));
        m.normalize();
        m.mult(maxForce);
        m.add(new PVector(playerPos.x, playerPos.y));
      }
      arrow(int(playerPos.x), int(playerPos.y), int(playerPos.x+maxForce), int(playerPos.y));
      fill(0);
      arrow(int(playerPos.x), int(playerPos.y), int(constrain(m.x, playerPos.x, 500)), int(m.y));
      push();
      translate(playerPos.x, playerPos.y);
      angle = int(constrain(degrees(angle(new PVector(maxForce, 0), new PVector(mouseX-playerPos.x, mouseY-playerPos.y))), -90, 90));
      text(angle, 50, 50);
      force = int(map(dist(m.x, m.y, playerPos.x, playerPos.y), 0, maxForce, 0, 10));
      text(force, m.x-playerPos.x, m.y-playerPos.y);
      noFill();
      drawArc();
      pop();
      textAlign(CENTER);
      textSize(20);
      text("(" + int(playerPos.x) + ", " + int(playerPos.y) + ")", playerPos.x, playerPos.y-40);
      pop();
    }
  }

  public void update() {
    if (mousePressed) {
      launched = true;
      playerAcc = new PVector();
    }
    if(launched) {
      playerVel.add(playerAcc);
      playerPos.add(playerVel);
    }
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
    float angleStart = angle(new PVector(1, 0), new PVector(maxForce, 0));
    float angleEnd = angle(new PVector(1, 0), new PVector(mouseX-playerPos.x, mouseY-playerPos.y));
    arc(0, 0, 100, 100, angleStart, constrain(angleEnd, -PI/2, PI/2));
    if (angleEnd < angleStart) {
      arc(0, 0, 100, 100, constrain(angleEnd, -PI/2, PI/2), angleStart);
    }
  }

  private float angle(PVector v1, PVector v2) {
    return atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
  }

  public int getAngle() {
    return angle;
  }

  public int getForce() {
    return force;
  }
}
