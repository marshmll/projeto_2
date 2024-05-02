class IntroductionLayout extends Layout
{
  Button startBtn;
  
  IntroductionLayout(float width, float height)
  {
    super(width, height);
    
    this.initButtons();
  }
  
  private void initButtons()
  {
    this.startBtn = new Button(this.width / 2 - 125, this.height - 250, 250, 50,
                          "INICIAR", 30,
                          #FFFFFF, #FEFEFE, #B90404, 
                          #B90404, #EE0000, #AA0000); 
  }
  
  public void update()
  {
    if (this.startBtn.isPressed())
      game.layouts.push(new GameLayout(this.width, this.height));
  }
  
  public void render()
  {
    this.renderBackground();
    this.renderText();
    this.startBtn.updateAndRender();
  }
  
  private void renderBackground()
  {
    background(#EAEAEA);
  }
  
  private void renderText()
  {
    String text = "Olá! Eu sou a [nome]\nSeja bem-vindo(a) ao BioQuiz!";
    textAlign(CENTER, CENTER);
    fill(0);
    textFont(JetBrainsMonoBold);
    text(text, this.width/2, 100);
  }
};
