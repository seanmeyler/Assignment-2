PImage logo;

int load_width = 0;

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


//Loading screen of my game
void loadingscreen()
{
    image(logo, 680, 100);
    noFill();
    strokeWeight(5);
    rect(460, 600, 800, 75, 50);
    strokeWeight(1);
    rect(460, 600, load_width, 50);
    
    if(load_width <= 800)
    {
      load_width++;
    }
}