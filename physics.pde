/**
 * physics Class
 *     input:
 *      int force, int angle, mass
 *     return:
 *       new delta position offset x,y for the ball
 *       *then you add the x,y *
 *
 */


public class physics {

  // the chang in position 
  public PVector NewPosition= new PVector(0,0);


  public PVector PushBall(PVector position, int mass, int angle, int force, int drag, int time) {
   
    // the body will always start from rest
    int distance = (force/mass * time) / drag; 
    
    // now that i have the distance traveld i need to put it into the diraction of the angle
    float rad = radians(angle);
      NewPosition.x = position.x + (distance * cos(rad));
      NewPosition.y = position.y + (distance * sin(rad));
     print(NewPosition.x+ " "+ NewPosition.y);
      return NewPosition;
  }
}
