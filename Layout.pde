// This class is used as the base class for any screen
// of the game, like main menu and game screens. 

class Layout
{
  public float width;
  public float height;
  
  Layout(float width, float height)
  {
    this.width = width;
    this.height = height;
  }
  
  void update() {};
  void render() {};
}
