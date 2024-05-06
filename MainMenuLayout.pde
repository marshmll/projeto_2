public class MainMenuLayout extends Layout
{
  /* LOGO IMAGE */
  PImage logo;
  
  /* A MAP OF ALL BUTTONS AND THEIR NAMES */
  HashMap<String, Button> buttons = new HashMap<String, Button>();
  
  /* CONSTRUCTOR */
  public MainMenuLayout(float width, float height)
  {
    super(width, height);
    
    this.logo = loadImage("Images/logo_with_cell.png");
    
    this.initButtons();
  }
  
  private void initButtons()
  { 
    /*
      @return void
      
      Initializes all buttons.
    */
    
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
    /*
      @return void
      
      Updates the layout.
    */
    
    this.updateSounds();
    this.updateButtons();
  }
  
  private void updateSounds()
  {
    /*
      @return void
      
      Updates the sounds.
    */
    
    if (!mainTheme.isPlaying())
    {
      mainTheme.loop();
      mainTheme.amp(0.2);
    }
    
    if (mousePressed && !clickSoundFx.isPlaying())
    {
      clickSoundFx.play();
      clickSoundFx.amp(0.2);
    }
  }
  
  public void updateButtons()
  {
    /*
      @return void
      
      Updates all buttons.
    */
    
    if (this.buttons.get("NEW_GAME").isPressed())
    {
      game.pushLayout(new IntroductionLayout(game.windowWidth, game.windowHeight));
    }
    else if (this.buttons.get("ABOUT").isPressed())
    {
      game.pushLayout(new AboutLayout(game.windowWidth, game.windowHeight));
    }
    else if (this.buttons.get("EXIT").isPressed())
    {
      game.endCurrentLayout();
    }
  }
  
  public void render()
  {
    /*
      @return void
      
      Renders the layout into the screen.
    */
    
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
