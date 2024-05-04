import processing.sound.SoundFile;

/* FONTS */
PFont JetBrainsMonoRegular;
PFont JetBrainsMonoBold;

/* SOUND FILES */
SoundFile mainTheme;
SoundFile clickSoundFx;
SoundFile popFx;
SoundFile wrongFx;

/* GAME ENGINE */
Game game;

void setup()
{
  /* DEFAULT CONFIGURATION */
  size(1280, 800);
  background(0);
  noStroke();
  surface.setTitle("BioQuiz");
  
  /* CREATE FONTS */
  JetBrainsMonoRegular = createFont("Fonts/JetBrainsMono-Regular.ttf", 20);
  JetBrainsMonoBold = createFont("Fonts/JetBrainsMono-Bold.ttf", 20);
  
  /* LOAD SOUND FILES */
  mainTheme = new SoundFile(this, "Sounds/Mind Games.mp3");
  clickSoundFx = new SoundFile(this, "Sounds/mouse-click.mp3");
  popFx = new SoundFile(this, "Sounds/pop.mp3");
  wrongFx = new SoundFile(this, "Sounds/wrong.mp3");
  
  /* CREATE A GAME INSTANCE */
  game = new Game();
}

void draw()
{
  /* RUN GAME ENGINE */
  game.run();
  //fill(#000010);
  //textSize(14);
  //text(mouseX + " " + mouseY, mouseX, mouseY - 10);
}
