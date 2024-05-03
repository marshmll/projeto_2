public class GameLayout extends Layout
{ 
  /* COLLECTION OF DRAGBOXES */
  ArrayList<DragNDropBox> dragBoxes;
  
  /* COLLECTION OF DRAGBOXES RECEIPTERS */
  ArrayList<DragBoxReceipter> dragBoxReceipters;
  
  /* CONSTRUCTOR */
  public GameLayout(float height, float width)
  {
    super(height, width);
    
    this.initDragBoxes();
    this.initDragBoxReceipters();
  }
  
  private void initDragBoxes()
  {
    /*
      @return void
      
      Initializes the drag boxes.
    */
    
     this.dragBoxes = new ArrayList<DragNDropBox>();
     
     this.dragBoxes.add(new DragNDropBox(100, 100, "Ribossomo"));
  }
  
  private void initDragBoxReceipters()
  {
    /*
      @return void
      
      Initializes the drag box receipters.
    */
    
    this.dragBoxReceipters = new ArrayList<DragBoxReceipter>();
    this.dragBoxReceipters.add(new DragBoxReceipter(200, 300, "Ribossomo"));
  }
  
  public void update()
  {
    /*
      @return void
      
      Updates the game layout.
      -> Update dragboxes
      -> Check if there are matches between dragboxes
         and dragbox receipters.
    */
    
    this.dragBoxes.forEach((dragBox) -> {
      dragBox.update();
      
      this.dragBoxReceipters.forEach((receipter) -> {
        receipter.checkForMatch(dragBox);
      });
      
    });
  }
  
  public void render()
  {
    /*
      @return void
      
      Renders the game layout into the screen
    */
    
    this.renderBackground();
    
    this.dragBoxReceipters.forEach((receipter) -> {
      receipter.render();
    });
    
    this.dragBoxes.forEach((dragBox) -> {
      dragBox.render();
    });
  }
  
  private void renderBackground()
  {
    background(#EAEAEA);
  }
}
