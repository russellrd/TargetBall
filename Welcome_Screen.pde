PVector acceleration = new PVector(0, 2);
PVector velocity = new PVector(0, 3);
PVector position = new PVector(150, 0);
float airFriction = 0.997;
float friction = 0.8;

int[] letterPosX = {450, 525, 600, 675, 750, 825, 600, 675, 750, 825};
int[] letterPosY = {-200, -200, -200, -200, -200, -200, 1000, 1000, 1000, 1000};

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
  velocity = velocity.add(acceleration);
  velocity = velocity.mult(airFriction);
  position = position.add(velocity);

  if (position.y > height-150) {
    velocity.y *= -1 * friction;
    position.y = height-150;
  }
}

public void moveText() {
  textSize(100);
  fill(255, 0, 0);
  text("T", letterPosX[0], letterPosY[0]);
  fill(255, 165, 0);
  text("A", letterPosX[1], letterPosY[1]);
  fill(255, 255, 0);
  text("R", letterPosX[2], letterPosY[2]);
  fill(0, 128, 0);
  text("G", letterPosX[3], letterPosY[3]);
  fill(0, 0, 255);
  text("E", letterPosX[4], letterPosY[4]);
  fill(128, 0, 255);
  text("T", letterPosX[5], letterPosY[5]);
  fill(255, 0, 0);
  text("B", letterPosX[6], letterPosY[6]);
  fill(255, 165, 0);
  text("A", letterPosX[7], letterPosY[7]);
  fill(255, 255, 0);
  text("L", letterPosX[8], letterPosY[8]);
  fill(0, 128, 0);
  text("L", letterPosX[9], letterPosY[9]);

  if (letterPosY[0] < 400) {
    letterPosY[0] += 14;
  } else {
    letterPosY[0] = 400;
  }

  if (letterPosY[1] < 400) {
    letterPosY[1] += 13;
  } else {
    letterPosY[1] = 400;
  }

  if (letterPosY[2] < 400) {
    letterPosY[2] += 12;
  } else {
    letterPosY[2] = 400;
  }

  if (letterPosY[3] < 400) {
    letterPosY[3] += 11;
  } else {
    letterPosY[3] = 400;
  }

  if (letterPosY[4] < 400) {
    letterPosY[4] += 10;
  } else {
    letterPosY[4] = 400;
  }

  if (letterPosY[5] < 400) {
    letterPosY[5] += 9;
  } else {
    letterPosY[5] = 400;
  }
  
  if (letterPosY[6] > 490) {
    letterPosY[6] -= 12;
  } else {
    letterPosY[6] = 490;
  }

  if (letterPosY[7] > 490) {
    letterPosY[7] -= 11;
  } else {
    letterPosY[7] = 490;
  }

  if (letterPosY[8] > 490) {
    letterPosY[8] -= 10;
  } else {
    letterPosY[8] = 490;
  }

  if (letterPosY[9] > 490) {
    letterPosY[9] -= 9;
  } else {
    letterPosY[9] = 490;
  }
}

void getTrack() {
  file = new SoundFile(this, "Main-Song.mp3");     // tavern music
  file.amp(0.2);
  file.loop();
}
