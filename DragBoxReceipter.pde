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
  
  public DragBoxReceipter(float x, float y, String correctDragBoxText)
  {
    this.x = x;
    this.y = y;
    
    this.image = loadImage("Images/receipterbox.png");
    this.correctDragBoxText = correctDragBoxText;
    
    this.isCorrect = false;
  }
  
  public void render()
  {
    image(this.image, this.x, this.y);
  }
  
  public void checkForMatch(DragNDropBox dragBox)
  {
    /*
      @return void
      
      Checks if a given drag box is the correct one
      -> Checks if the dragbox is touching receipter box
      -> Checks if the text is the correct one
      -> If so, move it to the center and set isCorrect to true
      -> If not, reset the drag box positions
    */
    
    this.isCorrect = true;
    
    if (this.x >= dragBox.x - dragBox.image.width / 2 && this.x <= dragBox.x + dragBox.image.width / 2 &&
        this.y >= dragBox.y - dragBox.image.height / 2 && this.y <= dragBox.y + dragBox.image.height / 2)
    {
      if (!mousePressed)
      {
        if (dragBox.text == this.correctDragBoxText)
        {
          dragBox.setPosition(this.x, this.y);
          this.isCorrect = true;
        }
        else
        {
          dragBox.resetPosition();
        }
      }
    }
  }
};
