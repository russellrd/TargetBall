/*
 * Trig Class
 *     
 * new(31st)
 */

public class Trig {
  private PVector square;

  public Trig() {
    //instantiating
    square = new PVector(0, 0);
  }


  public void showTrig(PVector player, PVector target) {
    push();
    noFill();
    strokeWeight(3);
    // the square points at the 90 degree point 
    int squareSize = 25;
    if (player.x<target.x && player.y>target.y){
      
      square(target.x-squareSize, player.y-squareSize, squareSize);
    }
    if (player.x>target.x && player.y<target.y){
      square(target.x , player.y, squareSize);
    }
    if (player.x<target.x && player.y<target.y){
      
      square(target.x-squareSize, player.y, squareSize);
    }
    if (player.x>target.x && player.y>target.y){
      square(target.x, player.y-squareSize, squareSize);
      
    }
    //square(player.x, target.y, 55);
    // line from the player to the target
    line(player.x, player.y, target.x, target.y);
    // line from the player square
    line(player.x, player.y, target.x, player.y);
    // line from the tragt to the square
    line(target.x, target.y,  target.x, player.y);
    pop();
  }
  public void showDist(boolean squareTragt, boolean squarePlayer, boolean playerTragt, PVector player, PVector target) {
    push();
    square.set(target.x, player.y);
    if (squareTragt) {
      textSize(22);
      //opp
      text(dist(square.x, square.y, target.x, target.y), (square.x + target.x)/2, (square.y + target.y)/2);
    }
    if (squarePlayer) {
      textSize(22);
      //aj
      text(dist(square.x, square.y, player.x, player.y), (square.x + player.x)/2, (square.y + player.y)/2);
    }
    if (playerTragt) {
      //hyp
      textSize(22);
      text(dist(player.x, player.y, target.x, target.y), (player.x + target.x)/2, (player.y + target.y)/2);
    }
    pop();
  }
}
