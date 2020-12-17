PImage playerImage; //<>//
PImage cactusImage;
PImage bgImage;
 
Player player;
int numObstacles = 1;
float bottomPosition = 340;
int frameWidth = 640;
int frameHeight = 360;
int time;
float spacing = 0;
float score1;
ArrayList<Obstacle> obstacles;
boolean isCollided = false;
int score2 = 0;

PFont f;

void setup()
{
  playerImage = loadImage("steve.png");
  cactusImage = loadImage("cactus.png");
  //bgImage = loadImage("PixelArtSubwayLoop.gif");
  bgImage = loadImage("background.jpeg");
   
  player = new Player();
  obstacles = new ArrayList<Obstacle>();
  
  background(bgImage);
  size(640, 360);
  fill(255, 204);
  frameRate(60);
  f = createFont("Arial",16,true);
}
 
void draw()
{
  background(bgImage);
  stroke(0);
  line(0, bottomPosition, 640, 340); // line for the road 
  
  score1 = millis()/100; //scoring system based off time
  textSize(24);
  fill(0);
  text("Time Score: " + score1, 10, 30);
  
  player.display(); 
  player.move();
  
  int interval = int(random(500, 6000)); //random interval to create objects, tune this, in milliseconds
  if (millis() - time > interval) 
  {
    obstacles.add(new Obstacle());
    time = millis();
  }
  
  for (Obstacle i : obstacles){
    i.display();
    i.move();
    if (i.xPosition == 0){
      score2++;
      if (i.xPosition < -100){ // once the obstacle is long out of use, we can remove it
       obstacles.remove(i); 
      }
    }
    if (isCollided(player, i)){
      String x = "Game Over";
      fill(0);
      textSize(32);
      text(x, 220, 150);
      noLoop();
    }
    
  } 
  String y = String.valueOf(score2);
  fill(0);
  textSize(24);
  text("Blocks Passed: " + y, 410, 30);
}

boolean isCollided(Player player, Obstacle i){ // checking if the two objects have collided
  
  // Check if top edge of obstacle overlaps with y-coordinate range of player AND left edge of obstacle overlaps with x-coordinate range of player
  if ((i.getY()-cactusImage.height <= player.getY()-10) && (i.getX() <= player.getX()+playerImage.width) && (i.getX() >= player.getX())) {
    return true;
  } else if ((i.getY()-cactusImage.height <= player.getY()-10) && (i.getX()+cactusImage.width <= player.getX()+playerImage.width) && (i.getX()+cactusImage.width >= player.getX())) {
    // Check if top edge of obstacle overlaps with y-coordinate range of player AND right edge of obstacle overlaps with x-coordinate range of player
      return true;
  }
    
  return false;
}

void keyPressed(){  
  if (key == ' '){
    player.jump(); // if space bar is clicked, have the character jump
  }
  else if (key == 'q'){ // press q to quit the game //<>//
    String s = "Game Quit";
    fill(0);
    textSize(32);
    text(s, 320, 180);
    noLoop();
  }
  
}
