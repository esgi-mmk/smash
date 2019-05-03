int textPlace[];


class FightScene {

  void setPlayersName(String playerOne, String playerTwo){
    
  textSize(height/17);
  text(playerOne, width/25, height/10);
  
  textSize(height/17);
  text(playerTwo, width/1.8, height/10);
  
  textPlace = new int[2];
  textPlace[0] = 1; 
  textPlace[1] = 1;
  }
  
  
  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
  
    noFill();
  
    if (axis == Y_AXIS) {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    }  
    else if (axis == X_AXIS) {  // Left to right gradient
      for (int i = x; i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(i, y, i, y+h);
      }
    }
  }
  
  
  void printDamage(int player, int zone, float damages){
    
    String s = "";
      
    s += " " + nf( ( ( damages / (zone+1) ) * 2), 1, 2) + " damages dealt !";  
    
    textSize(height/35);
    
    if(player-1 == 1){
      testCritical(player-1, zone);
      text(s, width/8, (height/6) + textPlace[0] );
      textPlace[0] += height/20;
    }
    else{
      testCritical(player-1, zone);
      text(s, width/1.50, (height/6) + textPlace[1] );
      textPlace[1] += height/20;
    }
  }
  
  
  void testCritical(int player, int zone){
      
      String critical = "Critical Hit !";
      
      if(zone == 0){
        
        if(player == 1){
          text(critical, width/6, (height/6) + textPlace[0] );
          textPlace[0] += height/25;
        }
        else{
          text(critical, width/1.41, (height/6) + textPlace[1] );
          textPlace[1] += height/25;
        }
        
      }   
  }
  
  
  void printWinner(int player){
    
    String s = "Player " + player + " wins !";
    
    textSize(height/10);
    text(s, width/3.8, (height/1.1));
    
  }
  
  void drawBar(float positionX, float positionY, float health, float maxHealth){
  
    // Change color
    if (health < 2.5)
    {
      fill(255, 0, 0);
    }  
    else if (health < 5)
    {
      fill(255, 200, 0);
    }
    else
    {
      fill(0, 255, 0);
    }
    
    // Draw bar
    noStroke();
    // Get fraction 0->1 and multiply it by width of bar
    float drawWidth = (health / maxHealth) * width/5;
    rect(positionX, positionY, drawWidth, height/20);
    
    // Outline
    stroke(0);
    noFill();
    rect(positionX, positionY, width/5, height/20);
    
  }


}
