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
  fill(255);
  strokeWeight(10);
  stroke(25,175,225);
  rect(475,400, 720, 400, 15);
  noFill();
  strokeWeight(2);
  stroke(25,175,225);
  rect(630, 700, 400, 80, 15);
  fill(25,175,225);
  textSize(80);
  text("QUIT", 735, 764);
  textSize(110);
  text("GAME OVER!", 490, 495);
  textSize(80);
  text("YOU SCORED:", 570, 590);
  textSize(100);
  text(score, 815, 680);
    
  if (mouseX >= 630 && mouseX <= 630+400 && mouseY >= 700 && mouseY <= 700+80)
  {
    fill(25,175,225);
    rect(630, 700, 400, 80, 15);
    fill(255);
    textSize(80);
    text("QUIT", 735, 764);
  }
    
  if (mouseX >= 630 && mouseX <= 630+400 && mouseY >= 700 && mouseY <= 700+80 && mousePressed)
  {
    exit();
  }
}