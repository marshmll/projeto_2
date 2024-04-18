Game game;

void setup() {
  size(800, 600);
  background(0);
  frameRate(60);
  
  surface.setTitle("Game");
  
  game = new Game();
}

void draw() {
  game.run(); 
}
