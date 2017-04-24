abstract class Button {
  float x1,y1;
  float x2,y2;
  color clbg = color(36,162,11);
  color clfg = color(255);
  String content;
  int h;
  
  Button(float tmp_x1, float tmp_y1, float tmp_x2, float tmp_y2) {
    x1 = tmp_x1;
    y1 = tmp_y1;
    x2 = tmp_x2;
    y2 = tmp_y2;
  }
  
  boolean containPoint(float X, float Y) {
    if (x1<=X && X<x2 && y1<Y && Y<y2)
      return true;
    return false;
  }
  
  void show() {
    fill(clbg);
    rect(x1,y1,x2,y2);
    fill(clfg);
    text(content,x1+10,y1+h);
  }
  
  void action() {}
}


class PlayAgainButton extends Button  {
  PlayAgainButton () {
    super(625,30,775,80);
    content = "  RESET";
    h = 30;
  }
  
  void action () {
    textFont(loadFont("./data/font2.vlw"));
    initFrame = frameCount;
    bt[0].content = "  RESET";
    game = new Game ();
    map = new Map(map.row,map.col,constrain(map.bomb,5,map.row*map.col));
  }
}


class ColDecButton extends Button  {
  ColDecButton () {
    super(300,30,330,50);
    content = "<";
    h = 18;
  }
  
  void action () {
    textFont(loadFont("./data/font2.vlw"));
    initFrame = frameCount;
    bt[0].content = "  RESET";
    game = new Game ();
    map = new Map(map.row,constrain(map.col-1,5,maxCol),constrain(map.bomb,5,map.row*map.col));
  }
}


class ColIncButton extends Button  {
  ColIncButton () {
    super(330,30,360,50);
    content = ">";
    h = 18;
  }
  
  void action () {
    textFont(loadFont("./data/font2.vlw"));
    initFrame = frameCount;
    bt[0].content = "  RESET";
    game = new Game ();
    map = new Map(map.row,constrain(map.col+1,5,maxCol),constrain(map.bomb,5,map.row*map.col));
  }
}


class RowDecButton extends Button  {
  RowDecButton () {
    super(300,60,330,80);
    content = "<";
    h = 18;
  }
  
  void action () {
    textFont(loadFont("./data/font2.vlw"));
    initFrame = frameCount;
    bt[0].content = "  RESET";
    game = new Game ();
    map = new Map(constrain(map.row-1,5,maxRow),map.col,constrain(map.bomb,5,map.row*map.col));
  }
}


class RowIncButton extends Button  {
  RowIncButton () {
    super(330,60,360,80);
    content = ">";
    h = 18;
  }
  
  void action () {
    textFont(loadFont("./data/font2.vlw"));
    initFrame = frameCount;
    bt[0].content = "  RESET";
    game = new Game ();
    map = new Map(constrain(map.row+1,5,maxRow),map.col,constrain(map.bomb,5,map.row*map.col));
  }
}


class BombDecButton extends Button  {
  BombDecButton () {
    super(480,60,510,80);
    content = "<";
    h = 18;
  }
  
  void action () {
    textFont(loadFont("./data/font2.vlw"));
    initFrame = frameCount;
    bt[0].content = "  RESET";
    game = new Game ();
    map = new Map(map.row,map.col,constrain(map.bomb-1,5,map.row*map.col));
  }
}


class BombIncButton extends Button  {
  BombIncButton () {
    super(510,60,540,80);
    content = ">";
    h = 18;
  }
  
  void action () {
    textFont(loadFont("./data/font2.vlw"));
    initFrame = frameCount;
    bt[0].content = "  RESET";
    game = new Game ();
    map = new Map(map.row,map.col,constrain(map.bomb+1,5,map.row*map.col));
  }
}