import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer sound1;

PImage logo;
PFont font;

float time = millis();
int load_width = 0;
int load_circle = 0;
int menu_logo_y = - 100;
int menu_bg_y = 900;
int menu_option1_x = -400;
int menu_option2_x = 0;
int menu_option3_x = 0;
int menu_option4_x = 0;
boolean load_finished = false;
boolean menu_check1 = false;
boolean menu_check2 = false;
boolean menu_check3 = false;
boolean menu_check4 = false;
boolean menu_check5 = false;
boolean menu_check6 = false;

void setup()
{
  size(1650,900);
  background(255);
  
  //Load in different images
  logo = loadImage("bopit.jpg");
  
  //For fonts
  font = loadFont("BerlinSansFB-Bold-48.vlw");
  textFont(font);
  
  minim = new Minim(this);
  sound1 = minim.loadFile("drumbeats.mp3");
  sound1.loop();
}

void draw()
{
  loadingscreen();
  menuscreenlogo();
  menu_screen_options();
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

//Used timing to get the perfect synchronisation between my loadscreens
    if (millis() < 9*1000)
    {
        if(load_width <= 800)
        {
          load_width += 2;
        }
    }
    else 
    {
      fill(255);
      ellipse(width/2, height/2, load_circle, load_circle);
      if(load_circle <= 2000)
      {
        load_circle += 10;
      }
      if(load_circle == 1500)
      {
         menu_check1 = true; 
      }
    }
}

void menuscreenlogo()
{  
  if(menu_check1 == true)
  {
     image(logo, 680, menu_logo_y);
     if(menu_logo_y < 100)
     {
        menu_logo_y += 1.5;
     }
     if(menu_logo_y == 100)
     {
        menu_check2 = true; 
     }
  }
}

void menu_screen_options()
{
  if(menu_check2 == true)
  {
    noFill();
    stroke(0);
    strokeWeight(10);
    rect(590, menu_bg_y, 500, 400, 15);
    if(menu_bg_y > 400)
     {
        menu_bg_y -= 20;
     }
     if(menu_bg_y == 400)
     {
        menu_check3 = true; 
     }
  }
  if(menu_check3 == true)
  {
    noFill();
    stroke(0);
    strokeWeight(10);
    rect(menu_option3_x, 420, 400, 75, 15);
    if(menu_option3_x < 610)
     {
        menu_option1_x += 20;
     }
     if(menu_option1_x > 400)
     {
        menu_check4 = true; 
     }
  }
}