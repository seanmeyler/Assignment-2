PImage bopit;
String s = "Score:";
int score = 0;
void setup()
{
size(1650,900);
bopit = loadImage("bopit2.png");
}

void draw()
{
  textSize(80);
  text(s + score, 30, 100);
    image(bopit, 440, 250);
    fill(0,255,0);
    ellipse(750, 445, 190, 190);
   
}