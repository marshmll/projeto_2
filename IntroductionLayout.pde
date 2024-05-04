class IntroductionLayout extends Layout
{
  /* START BUTTON */
  Button startBtn;
  
  /* CHARACTER IMAGE */
  PImage imgCelulinha;
  
  /* CONSTRUCTOR */
  public IntroductionLayout(float width, float height)
  {
    super(width, height);
    
    this.initButtons();
    this.initImages();
  }
  
  private void initButtons()
  {
    /*
      @return void
      
      Initializes the buttons.
    */
    
    this.startBtn = new Button(this.width / 2 - 125, this.height - 250, 250, 50,
                          "INICIAR", 30,
                          #FFFFFF, #FEFEFE, #B90404, 
                          #B90404, #EE0000, #AA0000); 
  }
  
  private void initImages()
  {
    /*
      @return void
      
      Initializes the images.
    */
    
    imgCelulinha = loadImage("Images/char.png");
    imgCelulinha.resize(170, 170);
  }
  
  public void update()
  {
    /*
      @return void
      
      Updates the layout
    */
    
    this.updateSounds();
    this.updateButtons();
  }
  
  private void updateButtons()
  {
    /*
      @return void
      
      Updates all buttons.
    */
    
    if (this.startBtn.isPressed())
    {
      game.endCurrentLayout();
      game.pushLayout(new GameLayout(this.width, this.height));
    }
  }
  
  private void updateSounds()
  {
    /*
      @return void
      
      Updates all sounds.
    */
    
    if (mousePressed && !clickSoundFx.isPlaying())
    {
      clickSoundFx.play();
      clickSoundFx.amp(0.2);
    }
  }
  
  public void render()
  {
    /*
      @return void
      
      Renders the layout into the screen.
    */
    
    this.renderBackground();
    this.renderText();
    this.renderImages();
    this.startBtn.updateAndRender();
  }
  
  private void renderBackground()
  {
    background(#EAEAEA);
  }
  
  private void renderText()
  {
    
    String text = "Olá! Eu sou a Celulinha!\nSeja bem-vindo(a) ao BioQuiz!";
    textAlign(CENTER, CENTER);
    fill(0);
    textFont(JetBrainsMonoBold);
    textSize(40);
    text(text, this.width/2, 160);
    
    text = "A seguir, você terá que nomear corretamente\nos componentes de uma célula. \nArraste as caixinhas para\no local correto.";
    textFont(JetBrainsMonoRegular);
    textSize(40);
    text(text, this.width/2, 400);
}
  
  private void renderImages()
  {
    image(imgCelulinha, 80, 70);
  }
};