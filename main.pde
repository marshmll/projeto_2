Game game;

void setup() {
  fullScreen();
  background(0);
  noStroke();
  frameRate(60);
  
  surface.setTitle("BioQuiz");
  
  game = new Game();
}

void draw() {
  game.run(); 
}
