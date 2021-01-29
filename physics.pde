/*
 * physics Class
 *     
 * new(28th)
 */

public class Physics {

  // PVectors
  PVector acceleration;
  PVector dragVector;
  PVector Fnet;
  PVector force;
  // numbers
  float mass;
  float xForce;
  float yForce;
  // constructor 
  public Physics() {
    //instantiating
    force = new PVector (0, 0);
    acceleration = new PVector (0, 0);
    dragVector = new PVector (0, 0);
    Fnet = new PVector (0, 0);
  }
  
  
  /*
    this method will set the force, by inputing a float for the amount of the force and an int angle in degrees.
  */
  public void setForce(float forceMagnitude, float angle) {
    xForce = forceMagnitude * cos(angle);
    yForce = forceMagnitude * -sin(angle);
    force.set(xForce, yForce);
  } 

  /*
  to use this method you want to call it and feed PVector velocity, PVector force, int dragCoefficient, float mass
   the method will return acceleration and you add the it to your velocity
   */
  public PVector getAcceleration(PVector velocity, float dragCoefficient, float mass) {

    // creating the drag vector
    dragVector.set(velocity);
    dragVector.normalize();
    dragVector.mult(-1);
    dragVector.mult(dragCoefficient);
    //println(dragVector);
    //dragVector.set(new PVector(2,2));

    // Fnet = sum of all Force Vectors
    Fnet.set(force);
    
    
    Fnet.add(dragVector);
    println(Fnet);
    // acceleration = Fnet / mass of object
    acceleration.set(Fnet.x/mass,Fnet.y/mass);

    return acceleration;
  }
}
