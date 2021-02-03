class Player {
  private PVector playerPos;
  private PVector playerAni;
  private PVector playerVel;
  private PVector playerAcc;
  private float angle;
  private int round;
  private int score;
  private boolean running;

  // Player constructor
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

  // Display player on screen
  public void display() {
    push();
    fill(0);
    noFill();
    push();
    translate(playerPos.x, playerPos.y);
    strokeWeight(3);
    drawArc();
    pop();
    imageMode(CENTER);
    playerImg.resize(int(r),int(r));
    image(playerImg, playerAni.x, playerAni.y);
    textAlign(CENTER);
    textSize(40);
    text("θ = " + angle, 100, 50);
    text("Round: " + round + "/" + ROUNDS, width/2, 50);
    text("Points: " + player.score, width - 100, height - (height-50));
    textSize(20);
    text("Press H to toggle hard mode", 800, height - 50);
    pop();
  }

  // Update player position
  public void update() {
    playerAni.add(playerVel);
  }
  
  // Increase angle by 1
  public void incAngle() {
    if(angle < 90)
      angle++;
  }
  
  // Decrease angle by 1
  public void decAngle() {
    if(angle > -90)
      angle--;
  }
  
  // Get angle
  public float getAngle() {
    return angle;
  }
  
  // Set velocity of player from angle
  public void setVel(float angle) {
    player.playerVel.set(6 * cos(radians(angle)), 6 * -sin(radians(angle)));
  }

  // Draw arc between two lines in any quadrant
  private void drawArc() {
    float angleStart = calcAngle(new PVector(1, 0), new PVector(abs(target.targetPos.x-playerPos.x), abs(target.targetPos.y-playerPos.y)));
    float angleEnd = calcAngle(new PVector(1, 0), new PVector(abs(target.targetPos.x-playerPos.x), 0));
    if(target.targetPos.x-playerPos.x > 0 && target.targetPos.y-playerPos.y < 0) {
      arc(0, 0, 150, 150, angleStart, angleEnd);
    } else if(target.targetPos.x-playerPos.x < 0 && target.targetPos.y-playerPos.y > 0) {
      arc(0, 0, 150, 150, angleStart-PI, angleEnd-PI);
    } else if(target.targetPos.x-playerPos.x > 0 && target.targetPos.y-playerPos.y > 0) {
      arc(0, 0, 150, 150, angleEnd, -angleStart);
    } else {
      arc(0, 0, 150, 150, angleEnd+PI, -angleStart+PI);
    }
  }
  
  // Reset player
  public void reset(float x, float y) {
    playerVel.set(0,0);
    angle = 0;
    running = false;
    playerPos.set(x,y);
    playerAni.set(x,y);
  }

  // Calculate angle between to PVectors
  public float calcAngle(PVector v1, PVector v2) {
    return atan2(v1.y, v1.x)-atan2(v2.y, v2.x);
  }
}
