class VictoryLayout extends Layout
{
  private Button backBtn;
  private Button answersBtn;
  
  private PImage celulinhaImg;
  
  private float incrementer;
  
  public VictoryLayout(float width, float height)
  {
    super(width, height);
    this.initButtons();
    this.initImages();

    victoryFx.play();
    victoryFx.amp(0.5);
    
    this.incrementer = 0.f;
  }
  
  private void initImages()
  {
    this.celulinhaImg = loadImage("Images/char.png");
    celulinhaImg.resize(180, 180);
  }
  
  private void initButtons()
  {
    
    this.backBtn = new Button(this.width - 300, this.height - 160, 250, 50,
                          "MENU", 30,
                          #FFFFFF, #FEFEFE, #B90404, 
                          #B90404, #EE0000, #AA0000);
    
    this.answersBtn = new Button(this.width - 600, this.height - 160, 250, 50,
                          "RESPOSTAS", 30,
                          #FFFFFF, #FEFEFE, #000080,
                          #000080, #000070, #000040);
  }
  public void update()
  {
    this.incrementer += 0.1;
    
     if (mainTheme.isPlaying())
      mainTheme.stop();
    
    if (this.backBtn.isPressed())
      game.endCurrentLayout();
    else if (this.answersBtn.isPressed())
      game.pushLayout(new AnswersLayout(this.width, this.height));
  }
  
  public void render()
  {
    background(#EAEAEA);
    
    this.backBtn.updateAndRender();
    this.answersBtn.updateAndRender();
    
    textFont(JetBrainsMonoRegular);
    
    image(this.celulinhaImg, this.width / 2 - this.celulinhaImg.width / 2, this.height / 2 - this.celulinhaImg.height / 2 - 100 + sin(this.incrementer) * 2.f);
    String text = "Parabéns! Você acertou todas as alternativas!";
    String points = "Pontos: " + String.valueOf(Math.round(game.playerPoints));
    
    fill(0);
    textSize(30); 
    
    text(text, this.width / 2 - textWidth(text) / 2, this.height - 300);
    text(points, this.width / 2 - textWidth(points) / 2, this.height - 260);
  }
}
