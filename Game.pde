import java.util.Stack;

// This class acts like the game engine.
// Game class is the core of the application.
class Game
{
  // Game class members
  public final int windowHeight;
  public final int windowWidth;
  public Stack layouts;
  
  // Constructor
  Game()
  {
    this.windowWidth = width;
    this.windowHeight = height;
    this.initLayouts();
  }
  
  public void initLayouts()
  {
    // This method initializes all layouts.
    // The last layout initialized is the one
    // which is going to be rendered into the
    // screen.
    
    this.layouts = new Stack<Layout>();
    this.layouts.push(new MainMenuLayout(this.windowWidth, this.windowHeight));
  }
  
  public void run()
  {
    // This method updates and renders the top
    // layout.
    
    // If there are still layouts in the layouts stack
    if (this.layouts.empty() == false)
    {
      Layout layout = (Layout) this.layouts.peek();
      layout.update();
      layout.render();
    }
    // If not, exit application
    else
    {
      exit();  
    }
  }
}
