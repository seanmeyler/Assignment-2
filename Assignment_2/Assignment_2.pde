/*C15431532 
Sean Meyler 
DT228 -2 
Object Oriented Programming
*/

//Use the library minim for the sounds in my program
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer sound1, sound2, sound3, sound4, sound5;


//Variables declared

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
int done = 1;
int score = 0;
int condition = 0;
int spots_on = 0;
float which = 0;
String s = "SCORE: ";
boolean right_check = true;;
boolean load_finished = false;
boolean menu_check1 = false;
boolean menu_check2 = false;
boolean menu_check3 = false;

void setup()
{
  //Set size and background colour to white as it looks best in my opinion with many colors
  size(1650, 900);
  background(255);

  //Using a variable which I incremented on everyloop I generate multicolored circles for my main loading screen
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

  //Loading in sound files
  minim = new Minim(this);
  sound1 = minim.loadFile("drumbeats.mp3");
  sound1.loop();
  sound2 = minim.loadFile("bopit.mp3");
  sound3 = minim.loadFile("pullit.mp3");
  sound5 = minim.loadFile("fail.mp3");
  
  //As I hate the look of stock cursors in games I changed mines to a cross
  cursor(CROSS); 
}

void draw()
{
  //Call different functions
  loadingscreen();
  menuscreenlogo();
  menu_screen_options();
  mouseOver();
  
  //I use this if statement to make sure the menu isn't still working when I am playing the game as it changes the color of my fonts to white which makes them dissapear into the white background
  if(menu_off == 1)
  {
     playselect(); 
  }
  
  //After the play button is selected this use of if statements help me control the game and makes sure the games functions don't overlap each other
  //I wanted to make the game somewhat player versus player so player 1 is the scoring player and player 2 is the player responsible for whether player 1 must Bop it, Twist it, or Pull it
  if(game_on == 1)
  {
     resetgame();
     spots_on = 0;
     menu_function = 0;
  }
  
     if( key == '1')
     {
        sound2.play();
        sound2.rewind();
        bopit(); 
     }
     if(key == '2')
     {
        sound3.play();
        sound3.rewind();
        pullit(); 
     }
     if(key == '3')
     {
        twistit(); 
     }
  
  if(keyPressed)
  {
     if(key == 'r' || key == 'R')
     {
        resetgame(); 
     }
  }
  
  if(keyPressed)
  {
     if(key == 'q' || key == 'Q')
     {
        sound5.play();
        sound5.rewind();
        game_on = 0;
        gameoverscreen(); 
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

//I used a series of boolean variables menucheck1,2,etc.. to have my animations running smoothly as the menu screen comes into view for the users
void menuscreenlogo()
{  
  if (menu_check1 == true)
  {
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


//To make a more visually appealling menu I used a series of if statements which change the colour of the menu option boxes if the mouse pointer is hovered over them, using MouseX+Y co-ordinates
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

//Again I used MouseX+Y co-ordinates and mousePressed to choose the relevant menu options
void mousePressed()
{
  if(menu_function == 1)
  {
    if (mouseX >= 630 && mouseX <= 630+410 && mouseY >= 520 && mouseY <= 520+75 && mousePressed)
    {
      menu_off = 1;
      menu_function = 0;
      game_on = 1;
    }
    if (mouseX >= 630+200 && mouseX <= 630+270 && mouseY >= 615 && mouseY <= 615+75 && mousePressed)
    {
      //As some might find the sounds annoying I included an option to turn music off
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

//I used a series of if statements to remove the menu in fluid movements off the screen in different directions
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


//The Bop-It! function using if statements and boolean variables to see if player one chooses the right option
void bopit()
{
  fill(25,175,225);
  textSize(80);
  text(s + score, 30, 100);
  image(bopit, 440, 250);
  
  fill(25,175,225);
  textSize(180);
  text("BOP IT!", 500, 875);
  
  //BOP IT
  if (mouseX >= 750 - 95 && mouseX <= 750+95 && mouseY >= 445-95 && mouseY <= 445+95 && mousePressed)
  {
    score += 1;
    right_check = true;
  }
  else if (keyPressed)
  {
    if(key == ' ' || key == 'T' || key == 't')
    { 
      gameoverscreen();
    }
  }
}

//The Pull-It! function using if statements and boolean variables to see if player one chooses the right option
void pullit()
{
  fill(25,175,225);
  textSize(80);
  text(s + score, 30, 100);
  image(bopit, 440, 250);
  
  fill(25,175,225);
  textSize(180);
  text("PULL IT!", 470, 875);
  
  if(keyPressed)
  {
     if(key == ' ')
     {
        score += 1; 
        right_check = true;
     }
  }
  else if (keyPressed)
  {
    if(key == 'T' || key == 't' || mouseX >= 750 - 95 && mouseX <= 750+95 && mouseY >= 445-95 && mouseY <= 445+95 && mousePressed)
    { 
       gameoverscreen();
    }
  }
}

//The Twist-It! function using if statements and boolean variables to see if player one chooses the right option
void twistit()
{
  fill(25,175,225);
  textSize(80);
  text(s + score, 30, 100);
  image(bopit, 440, 250);
  
  fill(25,175,225);
  textSize(180);
  text("TWIST IT!", 500, 875);
  
  if(keyPressed)
  {
     if(key == 'T' || key == 't')
     {
        score += 1;
        right_check = true;
     }
  }
  else if (keyPressed)
  {
    if(key == ' ' || mouseX >= 750 - 95 && mouseX <= 750+95 && mouseY >= 445-95 && mouseY <= 445+95 && mousePressed)
    { 
       gameoverscreen();
    }
  }
}

//Incase of errors or incase player 2 wants to make the game more tricky for player one I included a reset button to delay time between options and confuse player 1
void resetgame()
{
  fill(25,175,225);
  textSize(80);
  text(s + score, 30, 100);
  image(bopit, 440, 250);
  done = 0;
}

//This is my game over screen which displays the score that player 1 got and also gives the option to quit the game
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