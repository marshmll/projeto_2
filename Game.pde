import java.util.*;

class Game {
  public final int windowHeight;
  public final int windowWidth;
  public Stack layouts;
  
  Game() {
    this.windowWidth = height;
    this.windowHeight = width;
    this.initLayouts();
  }
  
  void initLayouts() {
    layouts = new Stack<Layout>();
    layouts.push(new MainMenu(windowHeight, windowWidth));
  }
  
  void run() {
    this.update();
    this.render();
  }
  
  void update() {
    
  }
  
  void render() {
    if (!this.layouts.empty()) {
      Layout layout = (Layout) this.layouts.peek();
      layout.render();
    }
  }
}
