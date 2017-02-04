PImage logo;

void setup()
{
  size(1650,900);
  background(255);
  logo = loadImage("bopit.jpg");
}

void draw()
{
  loadingscreen();
}

void loadingscreen()
{
    image(logo, 800, 400);
}