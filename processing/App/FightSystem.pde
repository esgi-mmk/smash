class FightSystem{

  float[] hp;
  float[] hpRemaining;
  int numberOfPlayer;
  
  FightSystem(int players, float[] life){
     
    hp = life; 
    numberOfPlayer = players;
  }
  
  
  boolean checkBattleState(){
    
    return false;
    
  }
  
}
