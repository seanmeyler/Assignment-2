# Assignment-2
C15431532
Sean Meyler
DT228 -2
Object Oriented Programming

# Youtube Video
[![Video](http://img.youtube.com/vi/UGgNme-YYrk/0.jpg)](http://www.youtube.com/watch?v=UGgNme-YYrk&feature=youtu.beE)

For Christmas Assignment to make a game, I chose to make a coded game version of the classic game nearly everyone had growing up as a kid in the 90s or early 2000s, "BopIt" as it was my favourite game as a kid growing up before I had access to consoles and PCs.
I have made the game so that Player 1 is the player bopping, if you'd like, and Player 2 is the one who decides which option player 1 must do correctly. This made the game far more enjoyable for the people I tested it with.

# Features

The game has 3 features.

- Loading screen
  -A visually appealling loading screen
- Main menu
  -3 functions Play, Sound on/off and quit
- Game
  -The BopIt game
  
# Controls

- Mouse click while hovering over to preform different functions in menu
- Click the bop it to BopIt
- Space bar to PullIt
- T to twist it
- 1 player 2 control to bop it
- 2 player 2 control to pull it
- 3 player 2 control to twist it
- R reset the game
- Q to quit the game

# Functionality

setup()

Setup is used to load in all fonts and input files, font, mp3 and images. It is also used to draw the start of the loading screen.

draw()

Used to call functions and for player 2 controls.

loadingscreen()

This is the loading screen of my game I used a series of if statements as well as millis to get the perfect synchronisation between loading and menu screen and also to display the use of timers.
I then used an if statement in which a variable is incremented as a for loop is iterated through in order to create a blank white screen again that the menu can be drawn upon.

menuscreenlogo()

Used to move game logo onto menu screen, again by incrementing a variable.

menu_screen_options()

Used to draw the different menu screen options.

mouseOver()

Used to change the colour of menu options when mouse changes over them to give a more visually appealling look.

mousePressed()

If mouse is over the menu options and the mouse is clicked it does the different menu options.

playselect()

Moves the menu off the screen.

bopit()

If the mouse is over the bopit button and the player clicks it the score is incremented else game over.

pullit()

If key space is pressed the score is incremented else game over.

twistit()

If T key is pressed the score is incremented else game over.

resetgame()

To make the game more tricky for player 1 or incase of errors this resets the game.

gameoverscreen()

Displays a game over screen and the score player 1 received.

The sketch uses the mousePressed function as well as the mouseOver function to choose the menu options.
