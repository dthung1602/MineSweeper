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
    //skip squares at edges
    if (value == -2) 
      return;
    
    //draw square
    fill(255);
    rect(x,y,x+sqrSize,y+sqrSize);
    
    //draw content
    if (open) {
      fill(100,100,100,100);
      rect(x,y,x+sqrSize,y+sqrSize);
      if (value == -1)
        fill(255,0,0);
      else 
        fill(0);
    } else {
      if (flag)
        fill(0,0,255);
      else 
        fill(0);
    }
    text(value,x+sqrSize/2,y+sqrSize/2);
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
      //mark/unmark a flag
      if (mouseButton == RIGHT) {
          flag = !flag;
          if (value == -1 && flag) 
            game.flagCount += 1;
          if (value == -1 && !flag) 
            game.flagCount -= 1;
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
    game.openCount += 1;
    
    //check if open a bomb
    if (value == -1) { 
      game.lose = true;
      return;
    }
    
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
        
    //false if too few or too many flay
    if (count != value)      
      return false;
      
    return true;
  }
}