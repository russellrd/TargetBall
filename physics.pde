/*
 * physics Class
 *     
 *
 */

public class physics {

  // PVectors
  PVector acceleration;
  PVector dragVector;
  PVector Fnet;
  PVector velocity
    // Mass
    float mass;
  //instantiating
  acceleration = new PVector acceleration(0, 0);
  dragVector = new PVector dragVector(0, 0);
  Fnet = new PVector Fnet(0, 0);
  // constructor 
  physics() {
    //instantiating
    acceleration = new PVector acceleration(0, 0);
    dragVector = new PVector dragVector(0, 0);
    Fnet = new PVector Fnet(0, 0);
  }

  /*
  to use this method you want to call it and feed PVector velocity, PVector force, int dragCoefficient, float mass
   the method will return acceleration and you add the it to your velocity
   */
  public PVector getAcceleration(PVector velocity, PVector force, float dragCoefficient, float mass) {

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

    return acceleration;
  }
}
