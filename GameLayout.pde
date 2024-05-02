public class GameLayout extends Layout
{  
  
  GameLayout(float height, float width)
  {
    super(height, width);
  }
  
 
  
  public void update()
  {
   
  }
  
  public void render()
  {
    this.renderBackground();
  }
  
  private void renderBackground()
  {
    background(#EAEAEA);
  }
}
