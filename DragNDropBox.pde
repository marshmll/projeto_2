class DragNDropBox
{
  /* IMAGE */
  public PImage image;
  
  /* INITIAL POSITIONS */
  private float initialX;
  private float initialY;
  
  /* RENDERING POSITIONS */
  public float x;
  public float y;
  
  /* TEXT CONTENT */
  public String text; 
  
  
  public DragNDropBox(float x, float y, String text)
  {
    this.x = x;
    this.y = y;
    
    this.initialX = x;
    this.initialY = y;
    
    this.text = text;
    
    this.image = loadImage("Images/dragndropbox.png");
  }
  
  public void update()
  {
    /*
      @return void
      
      Updates the positions.
      If the mouse is clicked inside the box, move
      its center to the mouse coordinates.
    */
    
    if (mousePressed)
    {
      if (mouseX >= this.x && mouseX <= this.x + this.image.width &&
          mouseY >= this.y && mouseY <= this.y + this.image.height)
      {
        this.x = mouseX - this.image.width / 2;
        this.y = mouseY - this.image.height / 2;
      }
    }
  }
  
  public void render()
  {
    /*
      @return void
      
      Renders the images and the texts into screen
    */
    
    this.renderImages();
    this.renderText();
  }
  
  private void renderImages()
  {
    image(image, this.x, this.y);
  }
  
  private void renderText()
  {
    fill(0);
    textSize(14);
    text(this.text, this.x + this.image.width / 2 - textWidth(this.text) / 2,
          this.y + this.image.height / 2 + textAscent() / 2);
  }
  
  public void setPosition(float x, float y)
  {
    /*
      @return void
      
      Sets the box positions given x and y coordinates
    */
    
    this.x = x;
    this.y = y;
  }
  
  public void resetPosition()
  {
    /*
     @return void
     
     Reset the box position to its initial state.
    */
    
    this.x = this.initialX;
    this.y = this.initialY;
  }
};
