public class GameLayout extends Layout
{ 
  private int phase;
  
  public HashMap<String, PImage> gameImages;
  
  /* COLLECTION OF DRAGBOXES */
  public HashMap<String, DragNDropBox> dragBoxes;
  
  /* COLLECTION OF DRAGBOXES RECEIPTERS */
  public ArrayList<DragBoxReceipter> dragBoxReceipters;
  
  /* STATE VARIABLES */
  public boolean dragging;
  public String dragBoxBeingDragged;
  
  /* CONSTRUCTOR */
  public GameLayout(float height, float width)
  {
    super(height, width);
    
    this.phase = 0;
    
    this.initImages();
    
    this.initDragBoxes();
    this.initDragBoxReceipters();
    
    this.dragging = false;
    this.dragBoxBeingDragged = "";
  }
  
  private void initImages()
  {
    this.gameImages = new HashMap<String, PImage>();
    
    this.gameImages.put("Celulinha", loadImage("Images/char.png"));
    this.gameImages.get("Celulinha").resize(100, 100);
    
    this.gameImages.put("Ribossomo", loadImage("Images/game_ribossomo.png"));
    this.gameImages.put("Parede Celular", loadImage("Images/game_parede_celular.png"));
    this.gameImages.put("Mem. Plasmatica", loadImage("Images/game_membrana.png"));
    this.gameImages.put("Citoplasma", loadImage("Images/game_citoplasma.png"));
    this.gameImages.put("Mitocondria", loadImage("Images/game_mitocondria.png"));
    this.gameImages.put("C. de Golgi", loadImage("Images/game_golgi.png"));
    this.gameImages.put("R. Endoplasmático", loadImage("Images/game_reticulo.png"));
    this.gameImages.put("Nucléolo", loadImage("Images/game_nucleolo.png"));
    this.gameImages.put("Núcleo", loadImage("Images/game_nucleo.png"));
    this.gameImages.put("Vacúolo", loadImage("Images/game_vacuolo.png"));
    this.gameImages.put("Lisossomo", loadImage("Images/game_lisossomo.png"));
    this.gameImages.put("Cloroplasto", loadImage("Images/game_cloroplasto.png"));

  }
  
  private void initDragBoxes()
  {
    /*
      @return void
      
      Initializes the drag boxes.
    */
    
     this.dragBoxes = new HashMap<String, DragNDropBox>();
     
     this.dragBoxes.put("Cloroplasto", new DragNDropBox(20, 200, "Cloroplasto"));
     this.dragBoxes.put("Nucléolo", new DragNDropBox(20, 300, "Nucléolo"));
     this.dragBoxes.put("Mem. Plasmática", new DragNDropBox(20, 400, "Mem. Plasmática"));
     this.dragBoxes.put("Núcleo", new DragNDropBox(20, 500, "Núcleo"));
     this.dragBoxes.put("Ribossomo", new DragNDropBox(20, 600, "Ribossomo"));
     this.dragBoxes.put("Lisossomo", new DragNDropBox(20, 700, "Lisossomo"));
     this.dragBoxes.put("R. Endoplasmático", new DragNDropBox(1060, 200, "R. Endoplasmático"));
     this.dragBoxes.put("Parede Celular", new DragNDropBox(1060, 300, "Parede Celular"));
     this.dragBoxes.put("Citoplasma", new DragNDropBox(1060, 400, "Citoplasma"));
     this.dragBoxes.put("Vacúolo", new DragNDropBox(1060, 500, "Vacúolo"));
     this.dragBoxes.put("C. de Golgi", new DragNDropBox(1060, 600, "C. de Golgi"));
     this.dragBoxes.put("Mitocôndria", new DragNDropBox(1060, 700, "Mitocôndria"));
  }
  
  private void initDragBoxReceipters()
  {
    /*
      @return void
      
      Initializes the drag box receipters.
    */
    
    this.dragBoxReceipters = new ArrayList<DragBoxReceipter>();
    
    this.dragBoxReceipters.add(new DragBoxReceipter(760, 589, "Ribossomo"));
    this.dragBoxReceipters.add(new DragBoxReceipter(815, 563, "Parede Celular"));
    this.dragBoxReceipters.add(new DragBoxReceipter(253, 167, "Mem. Plasmática"));
    this.dragBoxReceipters.add(new DragBoxReceipter(391, 139, "Citoplasma"));
    this.dragBoxReceipters.add(new DragBoxReceipter(871, 193, "Mitocôndria"));
    this.dragBoxReceipters.add(new DragBoxReceipter(587, 107, "C. de Golgi"));
    this.dragBoxReceipters.add(new DragBoxReceipter(539, 603, "R. Endoplasmático"));
    this.dragBoxReceipters.add(new DragBoxReceipter(669, 137, "Nucléolo"));
    this.dragBoxReceipters.add(new DragBoxReceipter(306, 148, "Núcleo"));
    this.dragBoxReceipters.add(new DragBoxReceipter(189, 229, "Vacúolo"));
    this.dragBoxReceipters.add(new DragBoxReceipter(178, 469, "Lisossomo"));
    this.dragBoxReceipters.add(new DragBoxReceipter(280, 577, "Cloroplasto"));
  }
  
  public void update()
  {
    /*
      @return void
      
      Updates the game layout.
    */

    this.dragBoxes.forEach((k, dragBox) -> {
      if (dragBox.isVisible)
      {
        // If there is no dragbox being dragged
        if (this.dragging == false)
        {
          dragBox.update();
          
          if (dragBox.isBeingDragged)
          {
            this.dragBoxBeingDragged = dragBox.text;
            this.dragging = true;
          }
        }
        // If there is a dragbox being dragged
        else
        {
          if (!this.dragBoxes.get(dragBoxBeingDragged).isBeingDragged)
            this.dragging = false;
          else
            this.dragBoxes.get(this.dragBoxBeingDragged).update();
        }
        
        // If game has not ended yet
        if (this.phase < 12)
        {
          this.dragBoxReceipters.get(this.phase).checkForMatch(dragBox);
          
          if (this.dragBoxReceipters.get(this.phase).isCorrect)
          {
            dragBox.isVisible = false;
            this.phase++; // Move to next
          }
        } 
      }
    });
  }
  
  public void render()
  {
    /*
      @return void
      
      Renders the game layout into the screen
    */
    
    this.renderBackground();
    
    this.renderImages();
    
    // If game has not ended yet
    if (this.phase < 12)
    {
      this.dragBoxReceipters.get(this.phase).render();
    
      this.dragBoxes.forEach((k, dragBox) -> {
        
        if (dragBox.isVisible)
          dragBox.render();
          
        if (this.dragging)
          this.dragBoxes.get(this.dragBoxBeingDragged).render();
      });
    }
  }
  
  private void renderBackground()
  {
    background(#EAEAEA);
  }
  
  private void renderImages()
  {
    /*
      @return void
      
      Renders the images according to the current game state.
    */
    
    image(this.gameImages.get("Celulinha"), 50, 50);
    
    switch (this.phase)
    {
    case 0:
      this.renderCenteredImage(this.gameImages.get("Ribossomo"));
      break;
    case 1:
      this.renderCenteredImage(this.gameImages.get("Parede Celular"));
      break;
    case 2:
      this.renderCenteredImage(this.gameImages.get("Mem. Plasmatica"));
      break;
    case 3:
      this.renderCenteredImage(this.gameImages.get("Citoplasma"));
      break;
    case 4:
      this.renderCenteredImage(this.gameImages.get("Mitocondria"));
      break;
    case 5:
      this.renderCenteredImage(this.gameImages.get("C. de Golgi"));
      break;
    case 6:
      this.renderCenteredImage(this.gameImages.get("R. Endoplasmático"));
      break;
    case 7:
      this.renderCenteredImage(this.gameImages.get("Nucléolo"));
      break;
    case 8:
      this.renderCenteredImage(this.gameImages.get("Núcleo"));
      break;
    case 9:
      this.renderCenteredImage(this.gameImages.get("Vacúolo"));
      break;
    case 10:
      this.renderCenteredImage(this.gameImages.get("Lisossomo"));
      break;
    case 11:
      this.renderCenteredImage(this.gameImages.get("Cloroplasto"));
      break;
    }
  }
  
  private void renderCenteredImage(PImage image)
  {
    image(image, width/2 - image.width / 2, height/2 - image.height / 2);
  }
}
