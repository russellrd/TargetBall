/*
 * Trig Class
 *     
 * new(31st)
 */

public class Trig {
  private PVector square;
  float opp;
  float adj;
  float hyp;

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
      text(dist(square.x, square.y, target.x, target.y), (square.x + target.x)/2, (square.y + target.y)/2);
    }
    if (squarePlayer) {
      textSize(22);
      text(dist(square.x, square.y, player.x, player.y), (square.x + player.x)/2, (square.y + player.y)/2);
    }
    if (playerTragt) {
      textSize(22);
      text(dist(player.x, player.y, target.x, target.y), (player.x + target.x)/2, (player.y + target.y)/2);
    }
    pop();
  }
  public void getAns(){
    opp = dist(trig.square.x, trig.square.y, target.targetPos.x, target.targetPos.y);
    adj = dist(trig.square.x, trig.square.y, player.playerPos.x, player.playerPos.y);
    hyp = dist(player.playerPos.x, player.playerPos.y, target.targetPos.x, target.targetPos.y);
    
    float asin = asin(opp/hyp);
    float acos = acos(adj/hyp);
    float atan = atan(opp/adj);
    
    fill(255);
    stroke(50);
    textMode(CENTER);
    textSize(50);
    text("Oops! That answer was incorrect!", width/2-450, height/2-150);
    text("The correct answer was " + round(degrees(asin)) + " degrees!", width/2-515, height/2-100);
    text("Press ENTER for the next round!", width/2-450, height/2-50);
    textSize(20);
    text("Opposite : " + opp, width/2-750, height/2 + 50);
    text("Adjacent : " + adj, width/2-750, height/2 + 100);
    text("Hypotenuse : " + hyp, width/2-750, height/2 + 150);
    
    text("a = sin-1(opp/hyp)" , width/2-400, height/2 + 50);
    text("a = sin-1(" + opp + "/" + hyp + ")" , width/2-400, height/2 + 100);
    text("a = sin-1(" + opp/hyp + ")" , width/2-400, height/2 + 150);
    text("a = " + degrees(asin) + " degrees!", width/2-400, height/2 + 200);
    
    text("a = cos-1(adj/hyp)" , width/2+25, height/2 + 50);
    text("a = cos-1(" + adj + "/" + hyp + ")" , width/2+25, height/2 + 100);
    text("a = cos-1(" + adj/hyp + ")" , width/2+25, height/2 + 150);
    text("a = " + degrees(acos) + " degrees!", width/2+25, height/2 + 200);
    
    text("a = tan-1(opp/adj)" , width/2+450, height/2 + 50);
    text("a = tan-1(" + opp + "/" + adj + ")" , width/2+450, height/2 + 100);
    text("a = tan-1(" + opp/adj + ")" , width/2+450, height/2 + 150);
    text("a = " + degrees(atan) + " degrees!", width/2+450, height/2 + 200);
  }
}
