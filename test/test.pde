PImage logo;
PFont font;
String s = "Score:";
int score = 1;
void setup()
{
  size(1650,900);
  logo = loadImage("bopit.jpg");

  font = loadFont("BerlinSansFB-Bold-48.vlw");
  textFont(font);
}

void draw()
{
  background(255);
  image(logo, 660, 100);
    
  fill(25,175,225);
  textSize(180);
  text("TWIST IT!", 435, 875);
  
  
}