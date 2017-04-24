void mousePressed () {   
  //check if player click into a square
  for (int i=1; i<=map.row; i++)
    for (int j=1; j<=map.col; j++)
      if (map.data[i][j].containPoint(mouseX,mouseY)) {
        map.data[i][j].action();
        return;
      }
      
  // check if player click on buttons
  for (int i=0; i<bt.length; i++)
    if (bt[i].containPoint(mouseX,mouseY)) {
      bt[i].action();
      return;
    }
}