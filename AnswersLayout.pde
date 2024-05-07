class AnswersLayout extends Layout
{
  Button backBtn;
  PImage answersImg;
  
  public AnswersLayout(float width, float height)
  {
    super(width, height);
    
    this.answersImg = loadImage("Images/answers.png");
    
    backBtn = new Button(50, this.height - 130, 250, 50,
                          "VOLTAR", 30,
                          #FFFFFF, #FEFEFE, #B90404, 
                          #B90404, #EE0000, #AA0000);
  }
  
  public void update()
  {
    if (mainTheme.isPlaying())
      mainTheme.stop();
    
    if (backBtn.isPressed())
      game.endCurrentLayout();
  }
  
  public void render()
  {
    background(#EAEAEA);
    
    backBtn.updateAndRender();
    
    image(this.answersImg, this.width / 2 - this.answersImg.width / 2 - 60, this.height / 2 - this.answersImg.height / 2);
  }
};
