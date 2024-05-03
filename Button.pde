enum button_state // All possible buttons states
{
  BTN_IDLE,   // Idle is the standard state
  BTN_HOVER,  // Hover is for mouse is over
  BTN_ACTIVE  // Active is for mouse clicked
}

/* This is the base class for all buttons. */
class Button
{
  /* BUTTONS VARIABLES */
  
  // Stores if button is pressed
  public boolean isPressed; 
  
  // Stores the button state
  private button_state state;
  
  // Positioning
  private final float x;
  private final float y;
  
  // Dimensions
  private final float width;
  private final float height;
  
  // Text
  private final String text;
  private final int textSize;
  
  // Text colors
  private final color textIdleColor;
  private final color textHoverColor;
  private final color textActiveColor;
  
  // Shape colors
  private final color idleColor;
  private final color hoverColor;
  private final color activeColor;

  /* CONSTRUCTOR */
  public Button(float x, float y, float width, float height,
         String text, int textSize,
         color textIdleColor, color textHoverColor, color textActiveColor,
         color idleColor, color hoverColor, color activeColor)
  {         
    this.state = button_state.BTN_IDLE;
    
    this.x = x;
    this.y = y;
    
    this.width = width;
    this.height = height;
    
    this.text = text;
    this.textSize = textSize;
    
    this.textIdleColor = textIdleColor;
    this.textHoverColor = textHoverColor;
    this.textActiveColor = textActiveColor;
    
    this.idleColor = idleColor;
    this.hoverColor = hoverColor;
    this.activeColor = activeColor;
  }
  
  public void updateAndRender() 
  {
    /*
      @return void
      
      Updates and renders the button in the screen.
    */
    
    this.update();
    this.render();
  }
  
  public void update()
  {
    /*
      @return void
      
      Updates the mouse interactions and
      updates the fill color.
    */
    
    this.updateMouseInteraction();
    this.updateFillColor();
  }
  
  public void render()
  {
    /*
      @return void
      
      This method renders the button shape into the
      screen and renders the text in the center of
      the button.
    */
    
    rect(this.x, this.y, this.width, this.height);
    
    this.renderText();
  }
  
  public boolean isPressed()
  {
    /*
      @return boolean
      
      Returns if the button is pressed.
    */
    
    return this.isPressed;
  }
  
  private void updateMouseInteraction()
  {
    /*
      @return void
      
      This method keeps the button state updated and
      change it when mouse hover or pressed.
      Also changes the mouse cursor to the respective
      state.
    */
    
    // Reset the button state
    this.state = button_state.BTN_IDLE;
    this.isPressed = false;
    
    // If the mouse position is inside the button area
    if (mouseX >= this.x && mouseX <= this.x + this.width
    && mouseY >= this.y && mouseY <= this.y + this.height)
    {
      // Update the state to hover and chance cursor.
      this.state = button_state.BTN_HOVER;
      
      // If the mouse is clicked
      if (mousePressed)
      {
        // Set state to active.
        this.state = button_state.BTN_ACTIVE;
        this.isPressed = true;
      }
    }
  }
  
  private void updateFillColor()
  { 
    /*
      @return void
      
      This method updates the button fill collor
      according to its state.
    */
    
    switch (this.state)
    {
    case BTN_IDLE:
      fill(this.idleColor);
      break;
      
    case BTN_HOVER:
      fill(this.hoverColor);
      break;
      
    case BTN_ACTIVE:
      fill(this.activeColor);
      break;
    }
  }
  
  private void renderText()
  {
    /*
      @return void
      
      This method renders the text in the center of
      the button.
    */
    
    switch (this.state)
    {
    case BTN_IDLE:
      fill(this.textIdleColor);
      break;
      
    case BTN_HOVER:
      fill(this.textHoverColor);
      break;
      
    case BTN_ACTIVE:
      fill(this.textActiveColor);
      break;
    }
    
    textSize(this.textSize);
    
    float textHeight = textAscent();
    
    textAlign(LEFT);
    textFont(JetBrainsMonoRegular);
    text(this.text, this.x + this.width / 2 - textWidth(this.text) / 2,
         this.y + this.height / 2 + textHeight / 2);
  }
}
