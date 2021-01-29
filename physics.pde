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
  // Mass
  float mass;
  // constructor 
  public Physics(int forceX, int forceY) {
    //instantiating
    force = new PVector (forceX, forceY);
    acceleration = new PVector (0, 0);
    dragVector = new PVector (0, 0);
    Fnet = new PVector (0, 0);
  }
  
  
  /*
    this method will set the force, by inputing a float for the amount of the forec and an int angle in degrees.
  */
  public void setForce(float dragCoefficient, float mass) {
    
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

    // Fnet = sum of all Force Vectors
    Fnet.add(force);
    Fnet.add(dragVector);
    // acceleration = Fnet / mass of object
    acceleration.div(Fnet, mass);
    println(dragVector);

    return acceleration;
  }
}
