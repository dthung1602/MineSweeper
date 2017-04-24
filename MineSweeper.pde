Game game;
Map map;
int xStart, yStart;
int sqrSize = 30;
PImage bombImg;
PImage flagImg;
Button bt [] = new Button [7];
long initFrame = 0;
int maxCol = 24;
int maxRow = 17;

void setup () {
  size(800,700);
  frameRate(25);
  rectMode(CORNERS);
  ellipseMode(CENTER);
  
  //font
  textFont(loadFont("./data/font2.vlw"));
  
  //pics
  bombImg = loadImage("./data/bomb.png");
  flagImg = loadImage("./data/flag.png");
  
  //create objects
  game = new Game ();
  map = new Map(10,10,10);
  bt[0] = new PlayAgainButton();
  bt[1] = new ColDecButton();
  bt[2] = new ColIncButton();
  bt[3] = new RowDecButton();
  bt[4] = new RowIncButton();
  bt[5] = new BombDecButton();
  bt[6] = new BombIncButton();
}

void draw () {
  if (game.WinLose())
    return;
  background(255); //<>//
  map.show();
  game.showInfo();
  for (int i=0; i<bt.length; i++)
    bt[i].show();
  game.checkWinLose();
}