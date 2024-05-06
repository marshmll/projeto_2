public class SpeechBubble
{
  private PImage bubble;
  
  private float x;
  private float y;
  
  private String text;
  
  public SpeechBubble(float x, float y, String text)
  {
    this.bubble = loadImage("Images/speech-bubble.png");
    this.bubble.resize(200, 80);
    
    this.x = x;
    this.y = y;
    
    this.text = text;
  }
  
  public void update()
  {
    
  }
  
  public void render()
  {
    image(this.bubble, this.x, this.y);
    text(this.text, this.x + this.bubble.width / 2 - textWidth(this.text) / 2, this.y + this.bubble.height / 2 - 10.f);
  }
  
  public void setText(String text)
  {
    this.text = text;
  }
};
