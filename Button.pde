enum ButtonState // All possible buttons states
{
  BTN_IDLE,   // Idle is the standard state
  BTN_HOVER,  // Hover is for mouse is over
  BTN_ACTIVE  // Active is for mouse clicked
}

// This is the base class for any button.
class Button
{
  // All button members
  public boolean isPressed;
  private ButtonState state;
  private final float x;
  private final float y;
  private final float width;
  private final float height;
  private final String text;
  private final color idleColor;
  private final color hoverColor;
  private final color activeColor;

  // Constructor 
  Button(float x, float y, float width, float height, String text,
         color idleColor, color hoverColor, color activeColor)
  {         
    this.state = ButtonState.BTN_IDLE;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.text = text;
    this.idleColor = idleColor;
    this.hoverColor = hoverColor;
    this.activeColor = activeColor;
  }
  
  public void updateAndRender() 
  {
    this.update();
    this.render();
  }
  
  // Update method.
  public void update()
  {  
    this.updateMouseInteraction();
    this.updateFillColor();
  }
  
  public void render()
  {
    // This method renders the button shape into the
    // screen and renders the text in the center of
    // the button.
    rect(this.x, this.y, this.width, this.height);
    
    this.renderText();
  }
  
  private void updateMouseInteraction()
  {
    // This method keeps the button state updated and
    // change it when mouse hover or pressed.
    // Also changes the mouse cursor to the respective
    // state.
    
    // Reset the button state
    this.state = ButtonState.BTN_IDLE;
    this.isPressed = false;
    
    // If the mouse position is inside the button area
    if (mouseX >= this.x && mouseX <= this.x + this.width
    && mouseY >= this.y && mouseY <= this.y + this.height)
    {
      // Update the state to hover and chance cursor.
      this.state = ButtonState.BTN_HOVER;
      
      // If the mouse is clicked
      if (mousePressed)
      {
        // Set state to active.
        this.state = ButtonState.BTN_ACTIVE;
        this.isPressed = true;
      }
    }
  }
  
  private void updateFillColor()
  { 
    // This method updates the button fill collor
    // according to its state.
    
    if (this.state != ButtonState.BTN_IDLE)
    {
      switch (this.state)
      {
      case BTN_HOVER:
        fill(this.hoverColor);
        break;
        
      case BTN_ACTIVE:
        fill(this.activeColor);
        break;
        
       default:
         break;
      }
    }
    else
    {
      fill(this.idleColor);  
    }
  }
  
  private void renderText()
  {
    // This method renders the text in the center of
    // the button.
    
    fill(255);
    textSize(16);
    
    float textHeight = textAscent() + textDescent();
    
    text(this.text, this.x + this.width / 2 - textWidth(this.text) / 2,
         this.y + this.height / 2 + textHeight / 2);
  }
}
