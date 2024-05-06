class DefeatLayout extends Layout
{
  Button botao;
  PImage celulinhaImg;
  
  public DefeatLayout(float width, float height)
  {
    super(width, height);
    this.initButtons();
    this.initImages();
  }
  
  private void initImages()
  {
    this.celulinhaImg = loadImage("Images/char.png");
    celulinhaImg.resize(180, 180);
  }
  
  private void initButtons()
  {
    
    this.botao = new Button(this.width / 2, 200, 200, 40,
                                            "VOLTAR", 30,
                                            #FFFFFF, #FEFEFE, #B90404,
                                            #B90404, #EE0000, #AA0000);
  }
  public void update()
  {  
    if (this.botao.isPressed())
    {
      game.endCurrentLayout();
    }
  }
  
  public void render()
  {
    background(#EAEAEA);
    image(this.celulinhaImg, this.width / 2 - this.celulinhaImg.width / 2, this.height / 2 - this.celulinhaImg.height / 2);
    String text = "Você errou algumas alternativas :( ! Mas você pode tentar novamente!";
    String points = "Pontos: " + String.valueOf(Math.round(game.playerPoints));
    fill(0);
    textSize(20); 
    text(text, this.width / 2 - textWidth(text) / 2, this.height - 100);
  }
}
