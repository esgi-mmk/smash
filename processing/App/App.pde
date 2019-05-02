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

//Object
FightScene fightScene;


void setup() {
  
  size(1080, 720);
  fightScene = new FightScene();

  // Define colors
  b1 = color(255);
  b2 = color(0);
  c1 = color(204, 102, 0);
  c2 = color(0, 102, 153);

  noLoop();
}


void draw() {
  
  // Background
  fightScene.setGradient(0, 0, width/2, height, b1, b2, X_AXIS);
  fightScene.setGradient(width/2, 0, width/2, height, b2, b1, X_AXIS);

  
  textSize(40);
  text("Player 1", width/6.5, height/10);
  
  textSize(40);
  text("Player 2", width/1.45, height/10);
  
  textSize(10);
  String s = "The quick brown fox jumps over the lazy dog.";
  text(s, 10, 10, 70, 80);
}
