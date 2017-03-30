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
    yStart = 100;
    
    //create data
    data = new Square [r+2][c+2];
    int s = (width - xStart*2) / col;
    for (int i=0; i<row+2; i++) 
      for (int j=0; j<col+2; j++)
        data[i][j] = new Square(i,j,(int) random(-2,3));
        
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
    for (int i=0; i<row+2; i++)
      for (int j=0; j<col+2; j++)
        data[i][j].show();
  }
}