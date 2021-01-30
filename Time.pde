/*
 * time Class
 *     
 * how to use:  if you want to shoot you call shootingTimeTracker and give the z axis from the csv file 
 * the shootingTimeTracker will set the forceIsBeingApplied to true until the time is out.
 *
 *  you can use the public boolean forceIsBeingApplied as a condition to apply the force in the player class

example code :

Time t;

void setup() {
  t= new Time();
}
void draw() {
  
  if (t.shootingTimeTracker(10.0)){
    println(t.time);// you apply the force here
  }else{
    println("time out");
  }
  
}

 *  
 */


public class Time {
  public boolean forceIsBeingApplied = false;
  private float time;

  // grab the time from the .z 
  public boolean shootingTimeTracker (float interval) {
    time = interval-int(millis()/1000);
    if (time < 0) {
      return false;
    } else {
      return true;
    }
  }
}
