class MainMenu extends Layout {
  
  Button button = new Button(100, 100, 150, 50, "New Game", #000000, #111111, #222222);
  
  MainMenu(float width, float height) {
    super(width, height);
  }
  
  public void update() {
    button.update(); 
  }
  
  public void render() {
    background(#faafb2);
    button.render();
  }
}
