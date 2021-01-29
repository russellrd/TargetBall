/*
 * physics Class
 *     
 *
 */

//public class physics {

//   PVectors 

//  PVector acceleration;
//  PVector dragVector;
//  PVector Fnet;
//  // Mass
//  float mass;

//  /*
//  to use this method you want to call it and feed PVector velocity, PVector force, int dragCoefficient, float mass
//   the method will return acceleration and you add the it to your velocity
//   */
//  public PVector getAcceleration(PVector velocity, PVector force, float dragCoefficient, float mass) {
//    try{
//    // creating the drag vector
//    dragVector.set(velocity);
//    dragVector.normalize();
//    dragVector.mult(-1);
//    dragVector.mult(dragCoefficient);

//    // Fnet = sum of all Force Vectors
//    Fnet.add(force);
//    Fnet.add(dragVector);
//    // acceleration = Fnet / mass of object
//    acceleration.div(Fnet, mass);
//    }catch (NullPointerException){
//    }
//    return acceleration;
//  }
//}
