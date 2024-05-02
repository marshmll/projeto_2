PFont JetBrainsMonoRegular;
PFont JetBrainsMonoBold;

Game game;

void setup() {

  fullScreen();
  background(0);
  noStroke();
  
  surface.setTitle("BioQuiz");
  
  game = new Game();
  
  JetBrainsMonoRegular = createFont("Fonts/JetBrainsMono-Regular.ttf", 20);
  JetBrainsMonoBold = createFont("Fonts/JetBrainsMono-Bold.ttf", 20);
  
}

void draw() {
  game.run();
  fill(#000010);
  textSize(14);
  text(mouseX + " " + mouseY, mouseX, mouseY - 10);
}
