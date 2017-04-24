class Map {
  int col;
  int row;
  int bomb;
  Square data [][];
  
  Map (int r, int c, int b) {
    row = r;
    col = c;
    bomb = b;
    xStart = (width - (c+2)*sqrSize)/2;
    yStart = 130;
    data = new Square [r+2][c+2];
    game.flagCount = bomb;
    
    //fill squares with 0
    for (int i=0; i<row+2; i++)
      for (int j=0; j<col+2; j++)
        data[i][j] = new Square(i,j,0);
    
    //create bombs
    while (b>0) {
      int i = (int) random(1,row+1);
      int j = (int) random(1,col+1);
      if (data[i][j].value == -1)
        continue;
      data[i][j] = new Square(i,j,-1);
      b--;
    }
    
    //put number in data
    for (int i=1; i<=row; i++)
      for (int j=1; j<=col; j++) {     
        Square s = data[i][j];
        if (s.value==-1)
          continue;
        int count = 0;
        for (int k=0; k<8; k++)
          if (data[i+s.rowAround[k]][j+s.colAround[k]].value==-1)
            count++;
        s.value = count;
      }
        
    //wrap around data
    for (int i=0; i<row+2; i++) {
      data[i][0] = new Square(i,0,-2);
      data[i][col+1] = new Square(i,col+1,-2);
    }
    for (int j=0; j<col+2; j++) {
      data[0][j] = new Square(0,j,-2);
      data[row+1][j] = new Square(row+1,j,-2);
    }
  }
  
  void show () {
    fill(255);
    for (int i=1; i<=row; i++)
      for (int j=1; j<=col; j++)
        data[i][j].show();
  }
}