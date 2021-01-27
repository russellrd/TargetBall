void setup() {
  size(1600, 600);
}

PVector acceleration = new PVector(0, 2);
PVector velocity = new PVector(0, 3);
PVector position = new PVector(150, 250);
float airFriction = 0.997;
float friction = 0.8;

int[] letterPosX = {400, 500, 575, 675, 775, 875, 350, 400, 450, 500, 550, 600};
int[] letterPosY = {-200, -200, -200, -200, -200, -200, -200, -200, -200, -200, -200, -200};


void draw(){
  
  background(0, 150, 255);
  rectMode(CENTER);
  noStroke();
  fill(0, 150, 0);
  rect(800, 550, 1600, 100);
  fill(255, 50, 50);
  ellipse(position.x, position.y, 50, 50);
  updatePos();
  moveText();
  clouds(100, 200);
  clouds(300, 300);
  clouds(500, 150);
  clouds(700, 380);
  clouds(800, 200);
  clouds(1000, 150);
  clouds(1200, 250);
  clouds(1400, 100);
  clouds(300, -10);
  
  
}

public void updatePos(){
  
if(position.y > height-50){
    position.y = height-50;
  }

velocity = velocity.add(acceleration);
velocity = velocity.mult(airFriction);
position = position.add(velocity);

if(position.y > height-50){
  velocity.y *= -1 * friction;
  position.y = height-50;
}
    
  }
  
  
public void moveText(){
  
  textSize(100);
  text("T", letterPosX[0], letterPosY[0]);
  text("I", letterPosX[1], letterPosY[1]);
  text("T", letterPosX[2], letterPosY[2]);
  text("L", letterPosX[3], letterPosY[3]);
  text("E", letterPosX[4], letterPosY[4]);
  text("!", letterPosX[5], letterPosY[5]);
  
  if(letterPosY[0] < 350){
    letterPosY[0] += 14;
  } else {
    letterPosY[0] = 350;
  }
  
    if(letterPosY[1] < 350){
    letterPosY[1] += 13;
  } else {
    letterPosY[1] = 350;
  }
  
    if(letterPosY[2] < 350){
    letterPosY[2] += 12;
  } else {
    letterPosY[2] = 350;
  }
  
      if(letterPosY[3] < 350){
    letterPosY[3] += 11;
  } else {
    letterPosY[3] = 350;
  }
  
        if(letterPosY[4] < 350){
    letterPosY[4] += 10;
  } else {
    letterPosY[4] = 350;
  }
  
        if(letterPosY[5] < 350){
    letterPosY[5] += 9;
  } else {
    letterPosY[5] = 350;
  }


  
}

public void clouds(int i, int j){
  
  fill(255);
  noStroke();
  ellipse(i, j, 100, 50);
  ellipse(i + 50, j + 15, 75, 50);
  ellipse(i + 50, j, 50, 50);
  ellipse(i + 25, j - 5, 50, 50);
  ellipse(i, j - 10, 50, 50);
  ellipse(i + 25, j + 15, 50, 50);
  ellipse(i + 10, j + 5, 50, 50);
  
  
  
}
