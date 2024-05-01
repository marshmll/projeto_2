public class GameLayout extends Layout
{  
  ArrayList<Card> cards;
  
  GameLayout(float height, float width)
  {
    super(height, width);
    
    initCards();
  }
  
  private void initCards()
  {
    this.cards = new ArrayList<Card>();
    this.cards.add(new Card(100.f, 100.f, 200.f, 400.f, #010101, #FFFFFF, "Esta será uma informação muito daora que vai fazer todo mundo aprender aa"));

  }
  
  public void update()
  {
    cards.forEach((card) -> {
      card.update();
    });
  }
  
  public void render()
  {
    this.renderBackground();
    
    cards.forEach((card) -> {
      card.render();
    });
  }
  
  private void renderBackground()
  {
    background(#f2f2f2);
  }
}
