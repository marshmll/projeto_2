class MainMenu extends Layout
{
  HashMap<String, Button> buttons = new HashMap<String, Button>();
  
  MainMenu(float width, float height)
  {
    super(width, height);
    this.initButtons();
  }
  
  private void initButtons()
  { 
    this.buttons.put("NEW_GAME", new Button(100, 100, 250, 50,
                                            "New Game", 30,
                                            #333333, #fefefe, #111111,
                                            #11111100, #11111100, #22222200));
    
    this.buttons.put("QUIT", new Button(100, 200, 250, 50,
                                        "Quit", 30,
                                        #333333, #fefefe, #111111,
                                        #11111100, #11111100, #22222200));
    
    this.buttons.put("TEST", new Button(100, 300, 250, 50,
                                        "Test", 30,
                                        #333333, #fefefe, #111111,
                                        #11111100, #11111100, #22222200));
  }
  
  public void update()
  {
    if (this.buttons.get("NEW_GAME").isPressed && !mousePressed)
    {
      println("New Game Pressed");
    }
    
    if (this.buttons.get("QUIT").isPressed && !mousePressed)
    {
      println("Quit Pressed");
      game.layouts.pop();
    }
    
    if (this.buttons.get("TEST").isPressed && !mousePressed)
    {
      println("Test Pressed");
    }
  }
  
  public void render()
  {
    background(#faafb2);
    
    this.buttons.forEach((name, button) -> {
      button.updateAndRender();
    });
  }
}
