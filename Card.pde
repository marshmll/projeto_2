public class Card
{
  private float x;
  private float y;
  
  private float width;
  private float height;
  
  private color outlineColor;
  private color textColor;
  
  private PImage image;
  private String text;
  
  private boolean isVisible;
  
  Card(float x, float y,
      float width, float height,
      color outlineColor, color textColor,
      String text)
  {
    this.x = x;
    this.y = y;
    
    this.width = width;
    this.height = height;
    
    this.outlineColor = outlineColor;
    this.textColor = textColor;
    
    image = loadImage("logo.png");
    image.resize((int) this.width, (int) this.height);
    
   
    this.text = text;
    this.isVisible = false;
  }
  
  public void update()
  {
    this.checkForMouseHover();
  }
  
  public void render()
  {  
    fill(0);
    rect(this.x, this.y, this.width, this.height);
    image(this.image, this.x, this.y);
    stroke(this.outlineColor);

    if (this.isVisible)
    {
      tint(255, 140);
      
      textSize(20);
      fill(this.textColor);
      textAlign(CENTER);
      text(this.text, this.width / 2, this.height / 2, this.width, this.height);
    }
    else
      tint(255);
  }
  
  private void checkForMouseHover()
  {
    if (mouseX >= this.x && mouseX <= this.x + this.width &&
          mouseY >= this.y && mouseY <= this.y + this.height)
      this.isVisible = true;
    else
      this.isVisible = false;
  }
};
