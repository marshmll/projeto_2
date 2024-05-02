public class MainMenuLayout extends Layout
{
  PImage logo;
  
  HashMap<String, Button> buttons = new HashMap<String, Button>();
  
  MainMenuLayout(float width, float height)
  {
    super(width, height);
    
    this.logo = loadImage("Images/logo_with_cell.png");
    
    this.initButtons();
  }
  
  private void initButtons()
  { 
    this.buttons.put("NEW_GAME", new Button(this.width / 2 - 125, 400, 250, 50,
                                            "JOGAR", 30,
                                            #FFFFFF, #FEFEFE, #B90404,
                                            #B90404, #EE0000, #AA0000));
                                            
    this.buttons.put("ABOUT", new Button(this.width / 2 - 125, 480, 250, 50,
                                            "SOBRE", 30,
                                            #FFFFFF, #FEFEFE, #45B723,
                                            #45B723, #007000, #004000));
                                            
    this.buttons.put("EXIT", new Button(this.width / 2 - 125, 560, 250, 50,
                                            "SAIR", 30,
                                            #FFFFFF, #FEFEFE, #000080,
                                            #000080, #000070, #000040));
  }
  
  public void update()
  {
    this.updateButtons();
  }
  
  public void updateButtons()
  {
    if (this.buttons.get("NEW_GAME").isPressed())
    {
      game.layouts.push(new IntroductionLayout(game.windowWidth, game.windowHeight));
    }
    else if (this.buttons.get("ABOUT").isPressed())
    {

    }
    else if (this.buttons.get("EXIT").isPressed())
    {
      game.layouts.pop();
    }
  }
  
  public void render()
  {
    this.renderBackground();
    
    this.renderButtons();
  }
  
  private void renderBackground()
  {
    background(#EAEAEA);
    image(logo, width/2 - logo.width/2 , 100);
  }
  
  private void renderButtons()
  {
    this.buttons.forEach((k, button) -> {
      button.updateAndRender();
    });
  }
}
