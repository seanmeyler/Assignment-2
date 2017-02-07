import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer sound1;

PImage logo;
PImage bopit;
PFont font;

float time = millis();
int load_width = 0;
int load_circle = 0;
int load_circle2 = 0;
int menu_logo_y = - 100;
int menu_text_y = 900;
int menu_bg_y = 1000;
int menu_option1_x = -400;
int menu_option2_x = 1650;
int menu_option3_x = -400;
int option_text_x1 = -330;
int option_text_x2 = 1690;
int option_text_x3 = -330;
int menu_function = 0;
int menu_off = 0;
int game_on = 0;
int score = 0;
int condition = 0;
int spots_on = 0;
float which = 0;
String s = "SCORE: ";
boolean right_check;
boolean load_finished = false;
boolean menu_check1 = false;
boolean menu_check2 = false;
boolean menu_check3 = false;

void setup()
{
  size(1650, 900);
  background(255);

  for (int i = 0; i < 2000; i++)
  {
    fill(random(255), random(255), random(255), random(255));
    noStroke();
    ellipse(random(0, width), random(0, height), random(0, 30), random(0, 30));
  }

  //Load in different images
  logo = loadImage("bopit.jpg");
  bopit = loadImage("bopit2.png");

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
  mouseOver();
  
  if(menu_off == 1)
  {
     playselect(); 
  }
  
  if(game_on == 1)
  {
     spots_on = 0;
     menu_function = 0;
       
    for(int i = 0; i < 100; i++)
    {
      which = int(random(1,3));
    }
  }
} 


//Loading screen of my game
void loadingscreen()
{
  image(logo, 680, 100);
  fill(25,175,225);
  noFill();
  strokeWeight(10);
  rect(460, 600, 800, 75, 15);
  fill(25,175,225);
  strokeWeight(10);
  rect(460, 600, load_width, 75, 15);
  textSize(80);
  text("LOADING...", width/2 - 170, 550);

  //Used timing to get the perfect synchronisation between my loadscreens
  if (millis() < 9*1000)
  {
    if (load_width <= 800)
    {
      load_width += 2;
    }
  } else 
  {
    fill(255);
    ellipse(width/2, height/2, load_circle, load_circle);
    if (load_circle <= 2000)
    {
      load_circle += 20;
    }
    if (load_circle == 1800)
    {
      menu_check1 = true;
    }
  }
}

void menuscreenlogo()
{  
  if (menu_check1 == true)
  {
    spots_on = 1;
    //spots_menu();
    image(logo, 680, menu_logo_y);
    if (menu_logo_y < 100)
    {
      menu_logo_y += 1.5;
    }
    if (menu_logo_y == 100)
    {
      menu_check2 = true;
    }
  }
}

void menu_screen_options()
{
  if (menu_check2 == true)
  {
    fill(255);
    stroke(25,175,225);
    strokeWeight(10);
    rect(590, menu_bg_y, 500, 305, 15);
    fill(25,175,225);
    textSize(80);
    text("MAIN MENU", width/2 - 215, menu_text_y);
    if (menu_bg_y > 500)
    {
      menu_bg_y -= 20;
    }
    if(menu_text_y > 450)
    {
      menu_text_y -= 20; 
    }
    if (menu_bg_y == 500)
    {
      menu_check3 = true;
    }
  }

  if (menu_check3 == true)
  {
    noFill();
    stroke(25,175,225);
    strokeWeight(2);
    rect(menu_option1_x, 520, 400, 75, 15);
    fill(25,175,225);
    textSize(80);
    text("PLAY", option_text_x1, 585);
    if (menu_option1_x < 640)
    {
      menu_option1_x += 20;
    }
    if(option_text_x1 < 720)
    {
       option_text_x1 += 20; 
    }

    noFill();
    stroke(25,175,225);
    strokeWeight(2);
    rect(menu_option2_x, 615, 400, 75, 15);
    fill(25,175,225);
    textSize(45);
    text("SOUND: ON  OFF", option_text_x2, 670);
    if (menu_option2_x > 630)
    {
      menu_option2_x -= 20;
    }
    if(option_text_x2 > 660)
    {
       option_text_x2 -= 20; 
    }


    noFill();
    stroke(25,175,225);
    strokeWeight(2);
    rect(menu_option1_x, 710, 400, 75, 15);
    fill(25,175,225);
    textSize(80);
    text("QUIT", option_text_x3, 772);
    if (menu_option3_x < 630)
    {
      menu_option3_x += 20;
    }
    if(option_text_x3 < 730)
    {
       option_text_x3 += 20; 
    }
    
    menu_function = 1;
  }
}

void mouseOver()
{
  if(menu_function == 1)
  {
    if (mouseX >= 630 && mouseX <= 630+410 && mouseY >= 520 && mouseY <= 520+75)
    {
      fill(25,175,225);
      rect(menu_option1_x, 520, 400, 75, 15);
      fill(255);
      textSize(80);
      text("PLAY", option_text_x1, 585);
    }
    if (mouseX >= 630 && mouseX <= 630+410 && mouseY >= 615 && mouseY <= 615+75)
    {
      fill(25,175,225);
      rect(menu_option2_x, 615, 400, 75, 15);
      fill(255);
      textSize(45);
      text("SOUND: ON  OFF", option_text_x2, 670);
    }
    if (mouseX >= 630 && mouseX <= 630+410 && mouseY >= 710 && mouseY <= 710+75)
    {
      fill(25,175,225);
      rect(menu_option1_x, 710, 400, 75, 15);
      fill(255);
      textSize(80);
      text("QUIT", option_text_x3, 772);
    }
  }
}

void spots_menu()
{
  if(spots_on == 1)
  {
    for (int i = 0; i < 2000; i++)
    {
      fill(random(255), random(255), random(255), random(255));
      noStroke();
      ellipse(random(0, width), random(0, height), random(0, 30), random(0, 30));
    }
  }
}

void mousePressed()
{
  if(menu_function == 1)
  {
    if (mouseX >= 630 && mouseX <= 630+410 && mouseY >= 520 && mouseY <= 520+75 && mousePressed)
    {
      menu_off = 1;
      menu_function = 0;
    }
    if (mouseX >= 630+200 && mouseX <= 630+270 && mouseY >= 615 && mouseY <= 615+75 && mousePressed)
    {
      sound1.play();
    }
    if (mouseX >= 630+300 && mouseX <= 630+385 && mouseY >= 615 && mouseY <= 615+75 && mousePressed)
    {
      sound1.pause();
    }
    if (mouseX >= 630 && mouseX <= 630+410 && mouseY >= 710 && mouseY <= 710+75 && mousePressed)
    {
      exit();
    }
  }
}

void playselect()
{
  menu_function = 0;
  
     if (menu_logo_y > -400)
     {
      menu_logo_y -= 10;
     }
     if (menu_bg_y < 1100)
     {
       menu_bg_y += 40;
     }
     if(menu_text_y < 1100)
     {
       menu_text_y += 40; 
     }
     if (menu_option1_x > -500)
     {
       menu_option1_x -= 50;
     }
     if(option_text_x1 > -500)
     {
        option_text_x1 -= 50; 
     }
  
     if (menu_option2_x < 1750)
     {
        menu_option2_x += 50;
     }
     if(option_text_x2 < 1790)
     {
        option_text_x2 += 50; 
     }
  
     if (menu_option3_x > -500)
     {
       menu_option3_x -= 50;
     }
     if(option_text_x3 > -800)
     {
        option_text_x3 -= 50;
     }
     if(option_text_x3 == -800)
     {
        game_on = 1; 
     }
}

void bopit()
{
  fill(25,175,225);
  textSize(80);
  text(s + score, 30, 100);
  image(bopit, 440, 250);
  
  //BOP IT
  if (mouseX >= 750 - 95 && mouseX <= 750+95 && mouseY >= 445-95 && mouseY <= 445+95 && mousePressed)
  {
    score += 1;
  }
  
  /*fill(25,175,225);
  textSize(180);
  text("BOP IT!", 500, 875);*/
}

void pullit()
{
  if(keyPressed)
  {
     if(key == ' ')
     {
        score += 1; 
     }
  }
  
  /*fill(25,175,225);
  textSize(180);
  text("PULL IT!", 470, 875);*/
}

void twistit()
{
  if(keyPressed)
  {
     if(key == 'P')
     {
        score += 1; 
     }
  }
  /*fill(25,175,225);
  textSize(180);
  text("TWIST IT!", 435, 875);*/
}


void gameoverscreen()
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