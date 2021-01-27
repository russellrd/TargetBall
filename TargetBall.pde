void setup() {
  size(1600, 600);
  rectMode(CENTER);
  
}
  
public class Ball{
  
private PVector acceleration = new PVector(0,0);
private PVector position = new PVector(0,0);
private PVector velocity = new PVector(0,0);

public Ball(PVector a, PVector p, PVector v){
  
  this.acceleration = a;
  this.position = p;
  this.velocity = v;
  
}


public void update(){
  
}

public PVector getA(){
  return this.acceleration;
}

public PVector getP(){
  return this.position;
}

public PVector getV(){
  return this.velocity;
}

}

void draw(){
  
  PVector a1 = new PVector (0,0);
  PVector p1 = new PVector (0,0);
  PVector v1 = new PVector (0,0);
  
  Ball ball = new Ball(a1, p1, v1);
  
}
