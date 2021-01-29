/*
 * time Class
 *     
 * new(29th)
 */


public class Time {
  public boolean forceIsBeingApplied = false;
  private float time;

  // ill grab the time from the .z 
  public boolean timeTracker (float interval) {
    time = interval-int(millis()/1000);
    if (time < 0) {
      return false;
    }else{
    return true;
    }
  }
}
