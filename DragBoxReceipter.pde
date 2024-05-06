/* This class receipts a specific drag box according to its text */
class DragBoxReceipter
{
  /* POSITIONS */
  private float x;
  private float y;
  
  /* IMAGE */
  private PImage image;
  
  /* TEXT */
  private String correctDragBoxText;
  
  /* CORRECT STATE */
  public boolean isCorrect;
  public boolean isVisible;
  
  public DragBoxReceipter(float x, float y, String correctDragBoxText)
  {
    this.x = x;
    this.y = y;
    
    this.image = loadImage("Images/receipterbox.png");
    this.correctDragBoxText = correctDragBoxText;
    
    this.isCorrect = false;
    this.isVisible = true;
  }
  
  public void render()
  {
    image(this.image, this.x, this.y);
  }
  
  public void checkForMatch(DragNDropBox dragBox)
  {
    /*
      @return void
      
      Checks if a given drag box matches correctly
    */
    
    this.isCorrect = false;
    
    if (this.x >= dragBox.x - dragBox.image.width / 2 && this.x <= dragBox.x + dragBox.image.width / 2 &&
        this.y >= dragBox.y - dragBox.image.height / 2 && this.y <= dragBox.y + dragBox.image.height / 2)
    {
      if (!mousePressed)
      {
        if (dragBox.text == this.correctDragBoxText)
        {
          dragBox.setPosition(this.x, this.y);
          this.isCorrect = true;
          
          game.playerPoints += 100.f / 12.f; // Add points
          popFx.play();
          popFx.amp(0.3);
        }
        else
        {
          game.playerPoints -= 5.f; // Remove points
          
          if (game.playerPoints < 0.f)
            game.playerPoints = 0.f;
            
          dragBox.resetPosition();
          wrongFx.play();
        }
      }
    }
  }
};
