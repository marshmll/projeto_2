class VictoryLayout extends Layout
{
  Button botao;
  PImage celulinhaImg;
  
  public VictoryLayout(float width, float height)
  {
    super(width, height);
    this.initButtons();
    this.initImages();
  }
  
  private void initImages()
  {
    this.celulinhaImg = loadImage("Images/char.png");
  }
  
  private void initButtons()
  {
    
    this.botao = new Button(this.width / 2, 40, 20, 40,
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
    String text = "Parabéns! Você acertou todas as alternativas!";
    String points = "Pontos: " + String.valueOf(Math.round(game.playerPoints));
    fill(0);
    textSize(20);
    text(text, this.width / 2 - textWidth(text) / 2, this.height - 100);
  }
}
