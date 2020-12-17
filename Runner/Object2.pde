public class Obstacle{
  
    private float yPosition;
    private float xPosition;
    private float radius;
  
    public Obstacle(){
      this.yPosition = 340;
      this.xPosition = 640;
      this.radius = cactusImage.width/2;
      
    }
    
    public float getX(){
      return this.xPosition;
    }
  
    public float getY(){
      return this.yPosition;
    }
    
    public float getRadius(){
      return this.radius;
    }
    
    public void move(){
      this.xPosition -= 5;
    }
    
    public void display(){
      image(cactusImage, this.xPosition - this.radius, this.yPosition - cactusImage.height);
    }
  
}
