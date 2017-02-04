PImage logo;
PFont font;

float time = millis();
int load_width = 0;
int load_circle = 0;
boolean load_finished = false;

void setup()
{
  size(1650,900);
  background(255);
  
  //Load in different images
  logo = loadImage("bopit.jpg");
  
  //For fonts
  font = loadFont("BerlinSansFB-Bold-48.vlw");
  textFont(font);
}

void draw()
{
  loadingscreen();
  circleout();
}


//Loading screen of my game
void loadingscreen()
{
    image(logo, 680, 100);
    noFill();
    strokeWeight(10);
    rect(460, 600, 800, 75, 15);
    fill(0);
    noStroke();
    rect(460, 600, load_width, 75, 15);
    textSize(80);
    text("LOADING...", width/2 - 170, 550);
    
    if(load_width <= 800)
    {
      load_width += 2;
    }
}

//Fade out into main menu after loading screen
void circleout()
{
    if  if (millis() > time + 2000)
  {
    miss.moveMissile();
    time = millis();
  };
    {
      fill(255);
      ellipse(width/2, height/2, load_circle, load_circle);
      if(load_circle <= 2000)
      {
      load_circle += 10;
      }
    } 
}