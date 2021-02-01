class Player {
  private PVector playerPos;
  private PVector playerAni;
  private PVector playerVel;
  private PVector playerAcc;
  private float angle;
  private int round;
  private int score;
  private boolean running;

  public Player(float x, float y) {
    playerPos = new PVector(x, y);
    playerAni = new PVector(x, y);
    playerVel = new PVector(0, 0);
    playerAcc = new PVector(0, 0);
    angle = 0;
    round = 1;
    score = 0;
    running = false;
  } 

  public void display() {
    push();
    fill(0);
    //ellipse(playerPos.x, playerPos.y, r, r);
    imageMode(CENTER);
    playerImg.resize(int(r),int(r));
    image(playerImg, playerAni.x, playerAni.y);
    noFill();
    textAlign(CENTER);
    textSize(40);
    text("θ = " + angle, 100, 50);
    text("Round: " + round + "/" + ROUNDS, width/2, 50);
    textSize(20);
    text("(" + int(playerPos.x) + ", " + int(playerPos.y) + ")", playerPos.x, playerPos.y-30);
    pop();
  }

  public void update() {
    playerAni.add(playerVel);
  }
  
  public void incAngle() {
    if(angle < 90)
      angle++;
  }
  
  public void decAngle() {
    if(angle > -90)
      angle--;
  }
  
  public float getAngle() {
    return angle;
  }
  
  public void setVel(float angle) {
    player.playerVel.set(3 * cos(radians(angle)), 3 * -sin(radians(angle)));
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
    float angleStart = calcAngle(new PVector(playerPos.x, 0), new PVector(200, 0));
    float angleEnd = calcAngle(new PVector(playerPos.x, 0), new PVector(mouseX-playerPos.x, mouseY-playerPos.y));
    arc(0, 0, 100, 100, angleStart, -constrain(angleEnd, -PI/2, PI/2));
    if (angleEnd > angleStart) {
      arc(0, 0, 100, 100, -constrain(angleEnd, -PI/2, PI/2), angleStart);
    }
  }
  
  public void reset(float x, float y) {
    playerVel.set(0,0);
    angle = 0;
    running = false;
    playerPos.set(x,y);
    playerAni.set(x,y);
  }

  public float calcAngle(PVector v1, PVector v2) {
    return atan2(v1.y, v1.x)-atan2(v2.y, v2.x);
  }
}
