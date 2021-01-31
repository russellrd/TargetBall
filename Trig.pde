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
    // the square points at the 90 degree point 
<<<<<<< HEAD
    int squareSize = 25;
    if (player.x<target.x && player.y>target.y){
      square(player.x , target.y, squareSize);
    }
    if (player.x>target.x && player.y<target.y){
      square(player.x-squareSize, target.y-squareSize, squareSize);
    }
    if (player.x<target.x && player.y<target.y){
      square(player.x, target.y-squareSize, squareSize);
    }
    if (player.x>target.x && player.y>target.y){
      square(player.x-squareSize, target.y, squareSize);
=======
    int squareSize = 55;
    if (player.x<target.x && player.y>target.y){
      square(player.x - squareSize, target.y+ squareSize, squareSize);
    }
    if (player.x>target.x && player.y<target.y){
      square(player.x - squareSize, target.y+ squareSize, squareSize);
    }
    if (player.x>target.x && player.y>target.y){
      square(player.x, target.y-squareSize, squareSize);
    }
    if (player.x>target.x && player.y>target.y){
      square(player.x, target.y+squareSize, squareSize);
>>>>>>> 59a3b061180995ba3e596b33c36d1de4c6e4e515
    }
    //square(player.x, target.y, 55);
    push();
    strokeWeight(3);
    // line from the player to the target
    line(player.x, player.y, target.x, target.y);
    // line from the player square
    line(player.x, player.y, target.x, player.y);
    // line from the tragt to the square
    line(target.x, player.y, target.x, target.y);
    pop();
  }
  public void showDist(boolean squareTragt, boolean squarePlayer, boolean playerTragt, PVector player, PVector target) {
    square.set(player.x, target.y);
    if (squareTragt) {
      textSize(22);
      text(dist(square.x, square.y, target.x, target.y), (square.x + target.x)/2, (square.y + target.y)/2);
    }
    if (squarePlayer) {
      textSize(22);
      text(dist(square.x, square.y, player.x, player.y), (square.x + player.x)/2, (square.y + player.y)/2);
    }
    if (playerTragt) {
<<<<<<< HEAD
      textSize(22);
      text(dist(player.x, player.y, target.x, target.y), (player.x + target.x)/2, (player.y + target.y)/2);
=======
      textSize(32);
      text(dist(player.x, player.y, target.x, target.y), (player.x - target.x)/2, (player.y + target.y)/2);
>>>>>>> 59a3b061180995ba3e596b33c36d1de4c6e4e515
    }
  }
}
