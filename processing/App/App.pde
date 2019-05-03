/**
 * App
 * 
 */

// Constants
int Y_AXIS = 1, X_AXIS = 2;

// Global
int playerTurn = 1, toDraw = 0, zone, endOfBattle;
color b1, b2, c1, c2;
float str;

//Data Reception
import oscP5.*;
import netP5.*;

//Object
FightScene fightScene;
FightSystem fightSystem;
OscP5 oscP5;


void setup() {
  
  size(1080, 720);
  
  surface.setTitle("Smash");
  
  //Create the scene
  fightScene = new FightScene();

  // Define colors of the scene
  b1 = color(255); b2 = color(0); c1 = color(204, 102, 0); c2 = color(0, 102, 153);
  
  /* start oscP5, listening for incoming messages at port 4559 */
  oscP5 = new OscP5(this,4559);
  
  fightSystem = new FightSystem(2, 10.0);

  noLoop();
}


void draw() {
  
  // Background
  if(toDraw == 0){
    fightScene.setGradient(0, 0, width/2, height, b1, b2, X_AXIS);
    fightScene.setGradient(width/2, 0, width/2, height, b2, b1, X_AXIS);
    fightScene.setPlayersName("Player 1", "Player 2");
    toDraw = 1;
  }
  else{
    fightScene.printDamage(playerTurn, zone, str);
  
    if(endOfBattle != -1)
      fightScene.printWinner(endOfBattle+1);
    else
     playerTurn = (playerTurn == 1) ? 2 : 1 ;    
  }
  
  //fightScene.drawBar(width/4.5, height/19, fightSystem.hpRemaining[0], fightSystem.hp[0]);
  //fightScene.drawBar(width-(width/4), height/19, fightSystem.hpRemaining[1], fightSystem.hp[1]);

}


/* Incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {

  zone = theOscMessage.get(0).intValue();
  str = theOscMessage.get(1).floatValue();
  
  fightSystem.calculateDamage(playerTurn, zone, str);

  endOfBattle = fightSystem.checkBattleState();
 
  redraw();
  
}


// Test Function in order to simulate the recept of data 
void oscEventFake() {
  
  fightSystem.calculateDamage(playerTurn, 0, 10);
  fightScene.printDamage(playerTurn, 0, 10);

  endOfBattle = fightSystem.checkBattleState();
  
  if(endOfBattle != -1)
      fightScene.printWinner(endOfBattle+1);
    else
     playerTurn = (playerTurn == 1) ? 2 : 1 ;  
}
