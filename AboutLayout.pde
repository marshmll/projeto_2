class AboutLayout extends Layout
{
  Button backBtn;
  
  public AboutLayout(float width, float height)
  {
     super(width, height);
     
     this.backBtn = new Button(
                           1000, 645, 250, 50,
                           "VOLTAR", 30,
                           #FFFFFF, #FEFEFE, #000080,
                           #000080, #000070, #000040);
  }
  
  public void update()
  { 
    if (this.backBtn.isPressed())
    {
      game.endCurrentLayout();
      return;
    }
      
    if (mousePressed && !clickSoundFx.isPlaying())
    {
      clickSoundFx.play();
      clickSoundFx.amp(0.2);
    }
  }
  
  public void render()
  {
    background(#EAEAEA);
    textSize(30);
    fill(0);
    textAlign(CENTER);
    String text = "Este projeto é uma idealização de:\n\nAndré Scharaiber\nBrenda Barbosa\nJoão Guilherme Machado\nMatheus Teixeira Atner\nRenan da Silva Oliveira Andrade\nRiscala Miguel Fadel Neto\n\n Bacharelado em Ciência da Computação PUCPR\nTurma B\n 1º Período 2024\n\n Obrigado por jogar! :)";
    text(text, this.width / 2, 150);
    
    this.backBtn.updateAndRender();
  }
};
