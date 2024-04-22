Game game;

void setup() {
  size(1100, 700);
  background(0);
  noStroke();
  frameRate(60);
  
  surface.setTitle("Game");
  
  game = new Game();
}

void draw() {
  game.run(); 
}
