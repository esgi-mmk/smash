import java.util.ArrayDeque;


class FightSystem{

  float[] hp;
  float[] hpRemaining;
  int numberOfPlayer;
  ArrayDeque<Integer> activePlayers;
  
  
  FightSystem(int players, float life){
     
    numberOfPlayer = players;  
    hp = new float[players];
    hpRemaining = new float[players];
    activePlayers = new ArrayDeque<Integer>(players);
    
    for(int i=0 ; i<players ; i++){
      hp[i] = life;
      hpRemaining[i] = life;    
      activePlayers.push(i);
    }
  }
  
  
  //Return the winner's id. 
  //Return -1 if the game isn't over.
  int checkBattleState(){
    
    for(int i=0 ; i<numberOfPlayer ; i++){
      
      if(hpRemaining[i] <= 0){
        activePlayers.remove(i);
      }
      
    }
    
    if( activePlayers.size() > 1)
      return -1;
    else
      return activePlayers.pop(); 
  }
  
  
  void calculateDamage(int player, float damages){
    
  }
  
}
