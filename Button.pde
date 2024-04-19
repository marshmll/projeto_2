enum ButtonState {
  BTN_IDLE,
  BTN_HOVER,
  BTN_ACTIVE
}

class Button {
  private ButtonState state;
  private final float x;
  private final float y;
  private final float width;
  private final float height;
  private final String text;
  private final color idleColor;
  private final color hoverColor;
  private final color activeColor;

  Button(float x, float y, float width, float height, String text,
         color idleColor, color hoverColor, color activeColor) {
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
  
  public void update() {
    this.state = ButtonState.BTN_IDLE;
    
    if (mouseX >= this.x && mouseX <= this.x + this.width && mouseY >= this.y && mouseY <= this.y + this.height) {
     this.state = ButtonState.BTN_HOVER;
     
     if (mousePressed) {
       this.state = ButtonState.BTN_ACTIVE;
     }
    }
  }
  
  public void render() {
    
    if (this.state != ButtonState.BTN_IDLE) {
      switch (this.state) {
      case BTN_HOVER:
        fill(this.hoverColor);
        break;
      case BTN_ACTIVE:
        fill(this.activeColor);
        break;
       default:
         break;
      }
    } else {
      fill(this.idleColor);  
    }
    
    rect(this.x, this.y, this.width, this.height);
  }
}
