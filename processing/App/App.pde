/**
 * App
 * 
 */

// Constants
int Y_AXIS = 1, X_AXIS = 2;
color b1, b2, c1, c2;
int playerTurn = 1;

//Data Reception
import oscP5.*;
import netP5.*;

//Object
FightScene fightScene;
FightSystem fightSystem;
OscP5 oscP5;


void setup() {
  
  size(1080, 720);
  //frameRate(250);
  
  surface.setTitle("Smash");
  
  //Create the scene
  fightScene = new FightScene();

  // Define colors of the scene
  b1 = color(255); b2 = color(0); c1 = color(204, 102, 0); c2 = color(0, 102, 153);
  
  /* start oscP5, listening for incoming messages at port 4559 */
  //oscP5 = new OscP5(this,4559);
  
  fightSystem = new FightSystem(2, 30.0);

  noLoop();
}


void draw() {
  
  // Background
  fightScene.setGradient(0, 0, width/2, height, b1, b2, X_AXIS);
  fightScene.setGradient(width/2, 0, width/2, height, b2, b1, X_AXIS);
  fightScene.setPlayersName("Player 1", "Player 2");
  
  oscEventFake();
  oscEventFake();
  oscEventFake();
  oscEventFake();
  oscEventFake();
  
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {

  int zone = theOscMessage.get(0).intValue();
  float str = theOscMessage.get(1).floatValue();
  
  fightSystem.calculateDamage(playerTurn, zone, str);
  fightScene.printDamage(playerTurn, zone, str);

  int endOfBattle = fightSystem.checkBattleState();
  
  if(endOfBattle != -1)
    fightScene.printWinner(endOfBattle);
  else{
    if(playerTurn == 1)
      playerTurn = 2;
     else
       playerTurn = 1;
  }
  
}


void oscEventFake() {
  
  fightSystem.calculateDamage(playerTurn, 0, 10);
  fightScene.printDamage(playerTurn, 0, 10);

  int endOfBattle = fightSystem.checkBattleState();
  
  if(endOfBattle != -1)
    fightScene.printWinner(endOfBattle+1);
  else{
    if(playerTurn == 1)
      playerTurn = 2;
     else
       playerTurn = 1;
  }
  
}
