class MainMenu extends Layout
{
  HashMap<String, Button> buttons;
  
  MainMenu(float width, float height)
  {
    super(width, height);
    this.initButtons();
  }
  
  private void initButtons()
  {
    this.buttons = new HashMap<String, Button>();
    
    this.buttons.put("NEW_GAME", new Button(100, 100, 150, 50, "New Game", #000000, #111111, #222222));
    this.buttons.put("QUIT", new Button(100, 200, 150, 50, "Quit", #000000, #111111, #222222));
    this.buttons.put("TEST", new Button(100, 300, 150, 50, "Test", #222222, #333333, #444444));
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
