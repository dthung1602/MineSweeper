class Game {
  int time = 0;
  boolean lose = false;
  int openCount = 0;
  int flagCount = 0;
  
  Game () {}
  
  void showInfo () {
    fill(0);
    time = (int) (frameCount/frameRate);
    text("TIME: ",width/2-100,50);
    text(time,width/2,50);
  }
  
  boolean checkWinLose () {
    if (openCount == map.col*map.row - map.bomb || flagCount == map.bomb) {
      textFont(loadFont("./data/font.vlw"));
      fill(0,0,255);
      text("YOU WIN!",width/3,100);
      return true;
    }
    
    if (lose) {
      textFont(loadFont("./data/font.vlw"));
      fill(255,0,0);
      text("YOU LOSE!",width/3,100);
      return true;
    }
    
    return false;
  }
}