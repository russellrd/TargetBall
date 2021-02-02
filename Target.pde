class Target {
  private PVector targetPos;

  // Constructor for target
  public Target(float x, float y) {
    targetPos = new PVector(x, y);
  }

  // Display target to display
  public void display() {
    push();
    fill(0);
    noStroke();
    for (int i = int(r); i > int(r/6); i -= int(2*r/6)) {
      fill(255, 0, 0);
      ellipse(targetPos.x, targetPos.y, i, i);
      fill(255);
      ellipse(targetPos.x, targetPos.y, i-(r/6), i-(r/6));
    }
    textAlign(CENTER);
    textSize(20);
    fill(0);
    pop();
  }
  
  // Reset x and y position to new coords
  public void reset(float x, float y) {
    targetPos.set(x,y);
  }
  
  // Get distance of position (x,y) to the target
  public int getDist(float x, float y) {
    return int(dist(targetPos.x, targetPos.y, x, y));
  }

  // Check if position (x,y) is outside the screen
  public boolean hasPassed (float xpos, float ypos) { 
    if (xpos > width ) {
      return true;
    }else if(xpos < 0){
      return true;
    }else if(ypos > height){
      return true;
    }else if(ypos < 0){
      return true;
    }
    return false;
  }
}
