class Game {
  float time = 0;
  boolean lose = false;
  boolean win = false;
  int openCount = 0;
  int flagCount = 0;
  int flagCorrect = 0;
  
  Game () {}
  
  void showInfo () {
    fill(0);
    time = (frameCount-initFrame)/frameRate;
    text("TIME: ",25,50);
    text(time,100,50);
    text("FLAG: ",25,75);
    text(flagCount,100,75);
    text("COL: ",200,50);
    text(map.col,260,50);
    text("ROW: ",200,75);
    text(map.row,260,75);
    text("BOMBS: ",400,50);
    text(map.bomb,520,50);
  }
  
   boolean WinLose () {
    if (win) {
      textFont(loadFont("./data/font.vlw"));
      fill(0,0,255);
      text("YOU WIN!",width/2-100,130);
      return true;
    }
    
    if (lose) {
      textFont(loadFont("./data/font.vlw"));
      fill(255,0,0);
      text("YOU LOSE!",width/2-100,130);
      return true;
    }
    
    return false;
  }
  
  void checkWinLose () {
    if (openCount == map.col*map.row - map.bomb || flagCorrect == map.bomb)
      win = true;
  }
}