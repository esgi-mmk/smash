/**
 * App
 * 
 * JavaDoc
 * 
 */

// Constants
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;

//Data Reception
import oscP5.*;
import netP5.*;

//Object
FightScene fightScene;
FightSystem fightSystem;
OscP5 oscP5;


void setup() {
  
  size(1080, 720);
  frameRate(250);
  
  frame.setTitle("Smash");
  
  //Create the scene
  fightScene = new FightScene();

  // Define colors of the scene
  b1 = color(255); b2 = color(0); c1 = color(204, 102, 0); c2 = color(0, 102, 153);
  
  /* start oscP5, listening for incoming messages at port 4559 */
  oscP5 = new OscP5(this,4559);
  
  //
  fightSystem = new FightSystem(2, 30.0);

}


void draw() {
  
  // Background
  fightScene.setPlayersName("Player 1", "Player 2");
  fightScene.setGradient(0, 0, width/2, height, b1, b2, X_AXIS);
  fightScene.setGradient(width/2, 0, width/2, height, b2, b1, X_AXIS);

  //
  
  
  textSize(10);
  String s = "The quick brown fox jumps over the lazy dog.";
  text(s, 10, 10, 70, 80);
  
}




/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  
  //print("maxValue : ");
  //println(theOscMessage.get(0).floatValue());
  
}
