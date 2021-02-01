import processing.sound.*;
SoundFile file;

PImage Floor;
PImage Log;
PImage Wall;
PImage Window;
PImage Brick;

int gameState = 0;

void setup() {
  size(1600, 600, P2D);
  Floor = loadImage("floor.jpg");
  Log = loadImage("goodlog.jpg");
  Wall = loadImage("WALL (1).jpg");
  Window = loadImage("Window.jpg");
  Brick = loadImage("GreyBrick (1).jpg");
}

PVector acceleration = new PVector(0, 2);
PVector velocity = new PVector(0, 3);
PVector position = new PVector(150, 0);
float airFriction = 0.997;
float friction = 0.8;

int[] letterPosX = {400, 500, 575, 675, 775, 875, 350, 400, 450, 500, 550, 600};
int[] letterPosY = {-200, -200, -200, -200, -200, -200, -200, -200, -200, -200, -200, -200};

void draw() {

  if (gameState == 0) {
    //getTrack();            // music doesnt play correctly 

    background(000000);
    
   
    
    if (keyCode == 32) {    // if spacebar is pressed game starts 
      gameState = 1;
    }

    if (keyCode == 67 ) {      // if c is pressed the user goes into the controls 

      gameState = 2;
    }

    wall();

    bricks();

    logs();              // made to look like a tavern 

    windows();

    floors();

  
   
    rectMode(CENTER);
    noStroke();
    fill(0, 150, 0);

    fill(255, 50, 50);  
    stroke(000000);
    ellipse(position.x, position.y - 10, 75, 75);     // draw ball
    updatePos();
    moveText();

    stroke(000000);
    fill(000000);
    rect(1400, 200, 300, 100);    //start button 

    rect(1400, 400, 300, 100);    //instructions button

    fill(255);
    rect(1400, 200, 275, 75);  // inside of the start button 

    rect(1400, 400, 275, 75);    // inside of the instructions buttton
   
     fill(000000);
   textSize(18);
   text("Press Spacebar To Play", 1300, 200);
    
    text("Press C For The Controls", 1300, 400);
    
  }
  
  if (gameState == 1)  {      // game screen
   background(000000);
  
  }
  
  if (gameState == 2)  {    // controls screen 
   background(000000); 
    
  }
  
}

public void wall() {

  image(Wall, 0, 0, 1600, 250);    // wooden wall
}

public void bricks() {

  image(Brick, 0, 250, 1600, 250);    // bricks
}

public void logs() {

  image(Log, 300, 0, 100, 250);      // logs on the left side 
  image(Log, 300, 250, 100, 250);

  image(Log, 1100, 0, 100, 250);      // logs on right side 
  image(Log, 1100, 250, 100, 250);
}

public void windows () {

  image(Window, 450, 125, 200, 200);  // windows 

  image(Window, 860, 125, 200, 200 );
}

public void floors () {

  image(Floor, 0, 500, 1600, 100);   // floor
}

public void updatePos() {

  if (position.y > height-50) {
    position.y = height-50;
  }

  velocity = velocity.add(acceleration);
  velocity = velocity.mult(airFriction);
  position = position.add(velocity);

  if (position.y > height-50) {
    velocity.y *= -1 * friction;
    position.y = height-50;
  }
}

public void moveText() {

  textSize(100);
  text("T", letterPosX[0], letterPosY[0]);
  text("I", letterPosX[1], letterPosY[1]);
  text("T", letterPosX[2], letterPosY[2]);
  text("L", letterPosX[3], letterPosY[3]);
  text("E", letterPosX[4], letterPosY[4]);
  text("!", letterPosX[5], letterPosY[5]);

  if (letterPosY[0] < 350) {
    letterPosY[0] += 14;
  } else {
    letterPosY[0] = 350;
  }

  if (letterPosY[1] < 350) {
    letterPosY[1] += 13;
  } else {
    letterPosY[1] = 350;
  }

  if (letterPosY[2] < 350) {
    letterPosY[2] += 12;
  } else {
    letterPosY[2] = 350;
  }

  if (letterPosY[3] < 350) {
    letterPosY[3] += 11;
  } else {
    letterPosY[3] = 350;
  }

  if (letterPosY[4] < 350) {
    letterPosY[4] += 10;
  } else {
    letterPosY[4] = 350;
  }

  if (letterPosY[5] < 350) {
    letterPosY[5] += 9;
  } else {
    letterPosY[5] = 350;
  }
}

void getTrack() {

  file = new SoundFile(this, "Main-Song.mp3");     // tavern music   
  file.loop();
}
