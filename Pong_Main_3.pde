
int screens = 1;
String[][] players = new String[4][7];    //where most of the information of the players is stored
boolean tempPPG;
boolean tempGPM = false;
int player = 0;
int numPlayers = 2;
int difficulty = 1;
int balls = 1;
int winner = -1;
paddle[] paddle = new paddle[4];
ball[] ball = new ball[2];
boolean ballTimer = true;
int ppg = 11;
int gpm = 3;
int highScore = 0;
int highPlayer = -1;
boolean showHelp = false;
boolean matchOver = false;

void setup()
{
  size(1000, 700);
  for (int i =0; i < 4; i++)
  {
    players[i][0] = " ";        //initializes players array
    players[i][1] = "red";
    players[i][4] = "0";
    players[i][5] = "0";
    players[i][6] = "0";
  }
}



void draw()
{
  if (screens == 1)              //sets which backgrounf the program should draw
    scene1();
  else if (screens ==2)
    scene2(numPlayers);
  else if (screens ==3)
    scene3(player, numPlayers);
  else if (screens ==4)
    scene4(numPlayers);
  else if (screens == 5)
    scene5(numPlayers);
  else if (screens ==6)
    escape();
  else if (screens ==7)
    scene7(numPlayers);
    else if(screens ==8)
   scene8();
   
   //the following structures are buttons
   //they look at if the mouse is pressed, the mouse is over the button, the user is on the proper screen
   //and if the mouse has already performed an action on that click
   //some also have other requirements
   //they all update the screen and the clickOnce boolean and most also have other variables they update
  if ((mousePressed && mouseOver(width/2 -75, height/2-75, 150, 50) && screens ==6 && !clickOnce)||showHelp) // help button
  {
    screens = 5;
    showHelp = false;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(width/2-75, 550, 150, 50) && screens ==1 && !clickOnce) // main menu start
  {
    screens = 2;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(150, 550, 150, 50) && screens ==2 && !clickOnce)    //back button
  {
    screens = 1;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(width-300, 550, 150, 50) && (screens ==2 || screens == 3) && !clickOnce)  //continue button for screen 2 & 3
  {
    //the following is when the player is making a new game
    //they loop creates an appropirate number of paddles and based on the number of players
    if (screens ==3)
    {
      for (int i = 0; i < numPlayers; i++)
      {
        paddle[i] = makePaddles(numPlayers)[i];
        players[i][4] = "0";
        players[i][5] = "0";
        players[i][6] = "0";
      }
      for (int i = 0; i < balls; i++)
      {
        ball[i] = makeBalls(balls)[i];
      }
    }

    if (screens == 2 || screens ==3) screens++;
    
  if(screens ==4) showHelp = true;    //the help menu appears everytime the game screen is opeened for the first time
    clickOnce = true;
  }
  
  if (mousePressed && mouseOver(100, 150, 50, 50) && screens ==2 && !clickOnce)  //setting number of players to 2
  {
    screens = 2;
    numPlayers = 2;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(175, 150, 50, 50) && screens ==2 && !clickOnce)  //setting number of players to 3
  {
    screens = 2;
    numPlayers = 3;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(250, 150, 50, 50) && screens ==2 && !clickOnce)  //setting number of players to 4
  {
    screens = 2;
    numPlayers = 4;
    clickOnce = true;
  }
  /*
  if (mousePressed && mouseOver(325, 150, 50, 50) && screens ==2 && !clickOnce)  //setting number of players to 4
  {
    screens = 2;
    numPlayers = 4;
    clickOnce = true;
  }*/
  if (mousePressed && mouseOver(100, 250, 150, 50) && screens ==2 && !clickOnce)  //setting difficulty to easy
  {
    screens = 2;
    difficulty = 1;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(275, 250, 150, 50) && screens ==2 && !clickOnce)  //setting difficulty to hard
  {
    screens = 2;
    difficulty = 2;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(100, 350, 50, 50) && screens ==2 && !clickOnce)  //setting ppg to 5
  {
    screens = 2;
    ppg = 5;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(175, 350, 50, 50) && screens ==2 && !clickOnce)  //setting ppg to 7
  {
    screens = 2;
    ppg = 7;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(250, 350, 50, 50) && screens ==2 && !clickOnce)  //setting ppg to 11
  {
    screens = 2;
    ppg = 11;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(325, 350, 50, 50) && screens ==2 && !clickOnce)  //setting ppg to 21
  {
    screens = 2;
    ppg = 21;
    clickOnce = true;
  }

  if (mousePressed && mouseOver(100, 450, 50, 50) && screens ==2 && !clickOnce)  //setting gpm to 1
  {
    screens = 2;
    gpm = 1;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(175, 450, 50, 50) && screens ==2 && !clickOnce)  //setting gpm to 3
  {
    screens = 2;
    gpm = 3;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(250, 450, 50, 50) && screens ==2 && !clickOnce)  //setting gpm to 5
  {
    screens = 2;
    gpm = 5;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(325, 450, 50, 50) && screens ==2 && !clickOnce)  //setting gpm to 11
  {
    screens = 2;
    gpm = 11;
    clickOnce = true;
  }




  if (mousePressed && mouseOver(150, 550, 150, 50) && screens ==3 && !clickOnce) // back button
  {
    screens = 2;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(width-300, 550, 150, 50) && screens ==3 && !clickOnce)  //add player button
  {
    screens = 3;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(100, 160, 20, 20) && screens ==3 && !clickOnce)  //select red button
  {
    screens = 3;
    players[player][1] = "red";
    clickOnce = true;
  }
  if (mousePressed && mouseOver(130, 160, 20, 20) && screens ==3 && !clickOnce)  //select blue button
  {
    screens = 3;
    players[player][1] = "blue";
    clickOnce = true;
  }
  if (mousePressed && mouseOver(160, 160, 20, 20) && screens ==3 && !clickOnce)  //select green button
  {
    screens = 3;
    players[player][1] = "green";
    clickOnce = true;
  }
  if (mousePressed && mouseOver(190, 160, 20, 20) && screens ==3 && !clickOnce)  //select yellow button
  {
    screens = 3;
    players[player][1] = "yellow";
    clickOnce = true;
  }
  if (mousePressed && mouseOver(220, 160, 20, 20) && screens ==3 && !clickOnce)  //select purple button
  {
    screens = 3;
    players[player][1] = "purple";
    clickOnce = true;
  }
  if (mousePressed && mouseOver(width-300, 100, 50, 50) && screens ==3 && !clickOnce)  //select for player 1
  {
    screens = 3;
    player = 0;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(width-225, 100, 50, 50) && screens ==3 && numPlayers > 1 && !clickOnce)  //select for player 2
  {
    screens = 3;
    player = 1;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(width-150, 100, 50, 50) && screens ==3 && numPlayers > 2 && !clickOnce)  //select for player 3
  {
    screens = 3;
    player = 2;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(width-75, 100, 50, 50) && screens ==3 && numPlayers > 3 && !clickOnce)  //select for player 4
  {
    screens = 3;
    player = 3;
    clickOnce = true;
  }

  if (mousePressed && mouseOver(width/2-6, 10, 28, 20) && screens ==4 && numPlayers ==2 && !clickOnce)  //open pause menu
  {
    screens = 6;
    clickOnce = true;
  } else if (mousePressed && mouseOver(width -30, 10, 28, 20) && screens ==4 && numPlayers != 2 && !clickOnce)
  {
    screens = 6;
    clickOnce = true;
  }
   if (mousePressed && mouseOver(width/2 - 75, 575, 150, 50) && screens ==5 && !clickOnce) //continue  button
  {
    screens = 4;
    showHelp = false;
    clickOnce = true;
  }

  if (mousePressed && mouseOver(width/2 +50, height/2, 150, 50) && screens ==6 && !clickOnce) // resume  button
  {
    screens = 4;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(width/2 -200, height/2, 150, 50) && screens ==6 && !clickOnce) // exit button
  {
    screens = 2;
    clickOnce = true;
  }
  

  tempPPG = false;      //initializing variables used in scoring system
  int lowScore=40;
  int lowPlayer = -1;
   highPlayer = -1;
   



//the following checks if any players ahve reached the required score 
//and if they have updates the games won array spot
  for (int i = 0; i < numPlayers; i++)
  {
    if (int(players[i][4]) >= ppg)    
    {
      tempPPG = true;
      if (numPlayers == 2 && i == 0)
        players[1][5] = str(int(players[1][5])+1);
      else if (numPlayers == 2 && i == 1)
        players[0][5] = str(int(players[0][5])+1);
    }
  }
  //in games with more than two players, the player(s) with the lowest score get a point
  //this checks for who has the lowest score and if there are any ties
  if (numPlayers > 2) {
     for (int i = 0; i < numPlayers; i++)
  {
    if (int(players[i][4]) >= ppg)
    {tempPPG = true;
    }
  }
  if(tempPPG){
    for (int j = 0; j < numPlayers; j++)
    {
      if (int(players[j][4]) < lowScore){
        lowScore = int(players[j][4]);
      lowPlayer = j;
      }
    }
    //players[lowPlayer][5] = str(int(players[lowPlayer][5])+1);
     
    for (int i = 0; i < numPlayers; i++)
    {   
      if (players[lowPlayer][4].equals(players[i][4]))
      {
        players[i][5] = str(int(players[i][5])+1);
      }
    }
  }
  }
  //this checks is any players have won enough games to win the match
  //if they have, it checks if more than one player has won
   tempGPM = false;
   highScore = 0;
   for(int i = 0; i < numPlayers; i++)
   {
     if(int(players[i][5]) == gpm)
     tempGPM = true;
   }
   if(tempGPM)
   {
    for (int i = 0; i < numPlayers; i++)
    {
      if (int(players[i][5]) > highScore){
        highScore = int(players[i][5]);
      highPlayer = i;
      }
    }
    
     
    for (int i = 0; i < numPlayers; i++)
    {   
      if (players[highPlayer][5].equals(players[i][5]))
      {
        players[i][6] = "1";
      }
    }
    matchOver = true;
  }
  
   
   
   
   
   
   
   

//opens between game screen
  if (tempPPG)
  {
    screens = 7;
    for (int j = 0; j < numPlayers; j++)
    {
      players[j][4] = "0";
      ball[0].score[j] = 0;
    }
    tempPPG = false;
  }
  //opens final screen
  if(matchOver)
  {
    screens = 8;
  }

  if (mousePressed && mouseOver(width-300, 550, 150, 50) && screens ==7 && !clickOnce) // continue button
  {
    screens = 4;
    clickOnce = true;
  }
  if (mousePressed && mouseOver(width/2 - 75, 575, 150, 50) && screens ==8 && !clickOnce) // continue button
  {
    for (int i = 0; i < numPlayers; i++)
      {
        players[i][4] = "0";
        players[i][5] = "0";
        players[i][6] = "0";
      }
      matchOver = false;
    screens = 2;
    clickOnce = true;
  }




  if (!mousePressed)
    clickOnce = false;
}
//these functions allow players to press more than one key at a time
//while it is pressed, the key is set to true when it is released it is set to false
//the paddle moves when set to true
void keyPressed()
{
  if (screens ==4) {
    for (int i = 0; i < numPlayers; i++)
      paddle[i].keysPressed(key, true, paddle[i].key1, paddle[i].key2);
  }
}
void keyReleased()
{
  if (screens ==4) {
    for (int i = 0; i < numPlayers; i++)
      paddle[i].keysPressed(key, false, paddle[i].key1, paddle[i].key2);
  }
}