Game game;
Map map;
int xStart, yStart;
int sqrSize = 50;

void setup () {
  size(700,700);
  frameRate(25);
  rectMode(CORNERS);
  
  //font
  textFont(loadFont("./data/font2.vlw"));
  
  //create objects
  game = new Game ();
  map = new Map(9,9,10);
}

void draw () {
  if (game.checkWinLose())
    return;
  background(255); //<>//
  map.show();
  game.showInfo();
}