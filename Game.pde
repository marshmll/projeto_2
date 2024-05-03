import java.util.Stack;

/*
This class acts like the game engine.
Game class is the core of the application.
*/
class Game
{
  /* SCREEN DIMENSIONS */
  protected final int windowHeight;
  protected final int windowWidth;
  
  /* LAYOUTS */
  private Stack layouts;
  
  /* CONSTRUCTOR */
  Game()
  {
    this.windowWidth = width;
    this.windowHeight = height;
    
    this.initLayouts();
    //this.playMainTheme();
  }
  
  private void initLayouts()
  {
    /*
      @return void
    
      This method initializes all layouts.
      The last layout initialized is the one
      which is going to be rendered into the
      screen and updated.
    */
    
    this.layouts = new Stack<Layout>();
    this.pushLayout(new MainMenuLayout(this.windowWidth, this.windowHeight));
  }
  
  //private void playMainTheme()
  //{
  //  mainTheme.loop();
  //  mainTheme.amp(0.2);
  //}
  
  protected void run()
  {
    /*
    @return void
    
    This method updates and renders at the top
    of the layouts stack.
    */
    
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
  
  protected void pushLayout(Layout layout)
  {
    /*
      @return void
      
      Pushes a new layout into the layouts stack.
    */
    
    this.layouts.push(layout);
  }
  
  protected void endCurrentLayout()
  {
    /*
      @return void
      
      Pops the layout at the top of the stack.
    */
    
    this.layouts.pop();
  }
}
