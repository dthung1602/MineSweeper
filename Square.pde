class Square {
  int x,y;
  int row, col;
  int value;
  boolean open;
  boolean flag;
  int rowAround [] = {-1,0,1,1,1,0,-1,-1};
  int colAround [] = {-1,-1,-1,0,1,1,1,0};
  
  Square (int row, int col, int value) {
    this.row = row;
    this.col = col;
    this.value = value;
    this.open = false;
    this.flag = false;
    this.x = xStart + sqrSize*col;
    this.y = yStart + sqrSize*row;
  }
  
  void show () {    
    //draw square
    fill(255);
    rect(x,y,x+sqrSize,y+sqrSize);
    
    //draw content
    if (open) {
      //open a bomb
      if (value == -1) {
        game.lose = true;
        bt[0].content = "PLAY AGAIN";
        fill(255,0,0);
        rect(x,y,x+sqrSize,y+sqrSize);
        image(bombImg,x,y,sqrSize,sqrSize);
        return;
      } else {
        fill(100,100,100,100);
        rect(x,y,x+sqrSize,y+sqrSize);
        fill(0);
        if (value > 0)
          text(value,x+10,y+22);
      }
    } else if (flag)
        image(flagImg,x,y,sqrSize,sqrSize);
  }
    
  boolean containPoint (int x, int y) {
    //skip squares at edges
    if (value == -2) 
      return false;
      
    if (this.x > x || this.x + sqrSize < x || this.y > y || this.y + sqrSize < y)
      return false;
    return true;
  }
  
  void action () {     
    if (open) {
     // expand open from an opened square
     if (mouseButton == LEFT && value != 0 && enoughFlag()) 
       for (int i=0; i<8; i++)
         map.data[row+rowAround[i]][col+colAround[i]].open();
    } else {
      if (mouseButton == RIGHT) {
        //unmark a flag
        if (flag) {
          flag = false;
          game.flagCount++;
          if (value == -1) 
            game.flagCorrect--;
        //mark a flag
        } else {
          if (game.flagCount>0) { // check if player have any flag left
            flag = true;
            game.flagCount--;
            if (value == -1) 
              game.flagCorrect++;         
          }
        }
      }
      //open a square directly
      if (mouseButton == LEFT)
          open();
    }
  }
  
  void open () {
    //skip opened squares, on-edge squares and flag squares
    if (open || value == -2 || flag) 
      return;
    
    //open square
    open = true;
    if (value != -1)
      game.openCount += 1;

    //check if open a bomb
    if (value == -1)  
      return;
    
    //continue to expand open if this is a 0 square
    if (value == 0) 
      for (int i=0; i<8; i++) {
        Square s = map.data[row+rowAround[i]][col+colAround[i]];
        if (s.value != -1) 
          map.data[row+rowAround[i]][col+colAround[i]].open();
      }
  }
  
  boolean enoughFlag () {
    //count flags
    int count = 0;
    for (int i=0; i<8; i++) 
      if (map.data[row+rowAround[i]][col+colAround[i]].flag)
        count++;
        
    //false if too few or too many flag
    if (count != value)      
      return false;
      
    return true;
  }
}