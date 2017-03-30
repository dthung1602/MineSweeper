void mousePressed () {
  for (int i=1; i<=map.row; i++)
    for (int j=1; j<=map.col; j++)
      if (map.data[i][j].containPoint(mouseX,mouseY)) {
        map.data[i][j].action();
        /*print(map.data[i][j].value);
        print(map.data[i][j].flag);
        println(map.data[i][j].open);*/
        return;
      }
}