

char[][] name = new char[4][16];
int[] nameLength = new int[4];
boolean allowKey;
boolean useTextBox;
boolean clickOnce=false;
boolean escape;


void scene1()        //main menu
{
  rectMode(CORNER);
  PFont dotum;
  background(#93ccea);

  dotum = createFont("Dotum", 70);
  textFont(dotum);
  fill(255);
  textAlign(CENTER, CENTER);
  text("Pong", width/2, height/3);

  //**for any similar looking structure**
  //the following is a button, when mosed over it turns darker
  //to indicate to the player that it is selected
  if (mouseOver(width/2-75, 550, 150, 50))                                //start button
  {
    fill(210);
  } else
    fill(255);

  rect(width/2-75, 550, 150, 50);
  fill(0);

  textSize(30);
  text("Start", width/2, 572);
}
void scene2(int numPlayers)            //initialize game menu - uses number of players to darken a button
{
  rectMode(CORNER);
  PFont dotum;
  dotum = createFont("Dotum", 70);
  textAlign(CENTER, CENTER);
  textFont(dotum);
  background(#93ccea);
  stroke(0);
  
  
  
  
  if (mouseOver(150, 550, 150, 50))                                  //back button
  {
    fill(210);
  } else
    fill(255);  
  rect(150, 550, 150, 50);
  textSize(30);
  fill(0);
  text("Back", 225, 570);
  
  if (mouseOver(width-300, 550, 150, 50))                            //continue button
    {
      fill(210);
    } else
      fill(255);
    rect(width-300, 550, 150, 50);
    fill(0);
    text("Continue", width-300+75, 570);
    
    if (mouseOver(100, 250, 150, 50) || difficulty ==1)    //easy mode
    {
      fill(210);
    } else
      fill(255);
    rect(100, 250, 150, 50);
    fill(0);
    text("Easy", 175, 270);
    
    if (mouseOver(275, 250, 150, 50) || difficulty ==2)  // hard mode
    {
      fill(210);
    } else
      fill(255);
    rect(275, 250, 150, 50);
    fill(0);
    text("Hard", 350, 270);
    
    
    textAlign(LEFT, CENTER);
    text("Players",55,100);
    text("Points Per Game",55,320);
    text("Games Per Match",55,420);
    textAlign(CENTER, CENTER);
    
    
    
   if (mouseOver(100, 150, 50, 50) || numPlayers == 2)  // setting number of players to 2
    {
      fill(210);
    } else
      fill(255);
      
    rect(100, 150, 50, 50);
    fill(0);
    text("2", 125, 170);
    
    
    if (mouseOver(175, 150, 50, 50) ||numPlayers == 3)                            //setting players to 3
    {
      fill(210);
    } else
      fill(255);
      
    rect(175, 150, 50, 50);
    fill(0);
    text("3", 200, 170);
    
    if (mouseOver(250, 150, 50, 50) || numPlayers == 4)                          //setting players to 4
    {
      fill(210);
    } else
      fill(255);
      
    rect(250, 150, 50, 50);
    fill(0);
    text("4", 275, 170);
    
    /*if (mouseOver(325, 150, 50, 50) || numPlayers == 4)                          //setting players to 4
    {
      fill(210);
    } else
      fill(255);
      
    rect(325, 150, 50, 50);
    fill(0);
    text("4", 350, 170);
    */
    
    
    
    if (mouseOver(100, 350, 50, 50) || ppg == 5)                          //setting ppg to 5
    {
      fill(210);
    } else
      fill(255);
      
    rect(100, 350, 50, 50);
    fill(0);
    text("5", 125, 370);
    
    
    if (mouseOver(175, 350, 50, 50) || ppg == 7)                          //setting ppg to 7
    {
      fill(210);
    } else
      fill(255);
      
    rect(175, 350, 50, 50);
    fill(0);
    text("7", 200, 370);
    
    
    if (mouseOver(250, 350, 50, 50) || ppg == 11)                          //setting ppg to 11
    {
      fill(210);
    } else
      fill(255);
      
    rect(250, 350, 50, 50);
    fill(0);
    text("11", 275, 370);
    
    if (mouseOver(325, 350, 50, 50) || ppg == 21)                          //setting ppg to 21
    {
      fill(210);
    } else
      fill(255);
      
    rect(325, 350, 50, 50);
    fill(0);
    text("21", 350, 370);
    
    
    textAlign(CENTER,CENTER);
    if (mouseOver(100, 450, 50, 50) || gpm == 1)                          //setting games per match to 1
    {
      fill(210);
    } else
      fill(255);
      
    rect(100, 450, 50, 50);
    fill(0);
    text("1", 125, 470);
    
    if (mouseOver(175, 450, 50, 50) || gpm == 3)                          //setting games per match to 3
    {
      fill(210);
    } else
      fill(255);
      
    rect(175, 450, 50, 50);
    fill(0);
    text("3", 200, 470);
    
    if (mouseOver(250, 450, 50, 50) || gpm == 5)                          //setting games per match to 5
    {
      fill(210);
    } else
      fill(255);
      
    rect(250, 450, 50, 50);
    fill(0);
    text("5", 275, 470);
    
    if (mouseOver(325, 450, 50, 50) || gpm == 11)                          //setting games per match to 11
    {
      fill(210);
    } else
      fill(255);
      
    rect(325, 450, 50, 50);
    fill(0);
    text("11", 350, 470);
    
    
    
  
  
}


void scene3(int player, int numPlayers)        //player initialize menu looks at which player is selected and how many players
{

  PFont dotum;
  dotum = createFont("Dotum", 70);
  textAlign(CENTER, CENTER);
  textFont(dotum);
  background(#93ccea);


  if (mouseOver(150, 550, 150, 50))                                    //back button
  {
    fill(210);
  } else
    fill(255);  
  rect(150, 550, 150, 50);
  textSize(30);
  fill(0);
  text("Back", 225, 570);

 if(numPlayers >=1){                                                //player 1 button
    if (mouseOver(width-300, 100, 50, 50) || player == 0)
    {
      fill(210);
    } else
      fill(255);
      
    rect(width-300, 100, 50, 50);
    fill(0);
    text("1", width-350+75, 120);
 }
 if(numPlayers >=2){                                                //player 2 button
    if (mouseOver(width-225, 100, 50, 50) || player == 1)
    {
      fill(210);
    } else
      fill(255);
      
    rect(width-225, 100, 50, 50);
    fill(0);
    text("2", width-275 +75, 120);
 }
 if(numPlayers >= 3){                                        //player 3 button
    if (mouseOver(width-150, 100, 50, 50) || player == 2)
    {
      fill(210);
    } else
      fill(255);
      
    rect(width-150, 100, 50, 50);
    fill(0);
    text("3", width-200 +75, 120);
 }if(numPlayers ==4){                                          //player 4 button
    if (mouseOver(width-75, 100, 50, 50) || player == 3)
    {
      fill(210);
    } else
      fill(255);
      
    rect(width-75, 100, 50, 50);
    fill(0);
    text("4", width-125 +75, 120);
    
    
    
    
    
    
    
 } 
 if (mouseOver(width-300, 550, 150, 50))    //continue button
    {
      fill(210);
    } else
      fill(255);
    rect(width-300, 550, 150, 50);
    fill(0);
    text("Continue", width-300+75, 570);
    
    if(players[player][1] == "red"){            //red bubble
     stroke(255);
     strokeWeight(4);
    }else{
     stroke(0);
     strokeWeight(1);
    }
    fill(244, 66, 72);
    ellipse(110,170,20,20);
    
    if(players[player][1] == "blue"){            //blue bubble
     stroke(255);
     strokeWeight(4);
    }else{
     stroke(0);
     strokeWeight(1);
    }
    fill(65, 110, 244);
    ellipse(140,170,20,20);
    
    if(players[player][1] == "green"){            //green bubble
     stroke(255);
     strokeWeight(4);
    }else{
     stroke(0);
     strokeWeight(1);
    }
    fill(65, 244, 79);
    ellipse(170,170,20,20);
    
    if(players[player][1] == "yellow"){            //yellow bubble
     stroke(255);
     strokeWeight(4);
    }else{
     stroke(0);
     strokeWeight(1);
    }
    fill(244, 232, 65);
    ellipse(200,170,20,20);
    
    if(players[player][1] == "purple"){            //purple bubble
     stroke(255);
     strokeWeight(4);
    }else{
     stroke(0);
     strokeWeight(1);
    }
    fill(151, 65, 244);
    ellipse(230,170,20,20);
    
    stroke(0);
    strokeWeight(1);
    
    
    
    
    
    
    
  
  fill(255);
  rect(100, 100, 250, 40);
  if (mouseOver(100, 100, 250, 40) && mousePressed)                        //checks if text box should check for input
  {
    useTextBox = true;
  } else if (!mouseOver(100, 100, 250, 40) && mousePressed)
  {
    useTextBox = false;
  }

  if (useTextBox)
  {
    fill(0);
    rect(110, 102, 1, 36);
  }


  if (keyPressed && allowKey && useTextBox)
  {
  //player name is set in this text box, it is saved in a char array then converted to a string
    if (key == BACKSPACE && nameLength[player] >0)                //text box code
    {
      nameLength[player]--;
      name[player][nameLength[player]] = ' ';
    } else if (nameLength[player] <= 15 && !(key == BACKSPACE || key == ENTER || key == DELETE || key == RETURN || key == SHIFT))
    {
      name[player][nameLength[player]] = key;
      nameLength[player]++;
    }

    allowKey = false;
  }

  if (!keyPressed)
  {
    allowKey = true;
  }
  textAlign(LEFT, CENTER);
  fill(0);
  players[player][0] = nameCombined(name[player], nameLength[player]);
  text(players[player][0], 110, 110);
  
  players[0][2] = "w";
  players[0][3] = "s";
  players[1][2] = "p";
  players[1][3] = ";";
  players[2][2] = "r";
  players[2][3] = "t";
  players[3][2] = "b";
  players[3][3] = "n";
 
}



void scene4(int numPlayers)                  //game menu - makes paddles based on number of players
{
  PFont dotum;
  dotum = createFont("Dotum", 70);
  textAlign(CENTER, CENTER);
  textFont(dotum);
  background(#93ccea);
  
  
  
  
  
  
  if(numPlayers == 1)
  {
    fill(#6495ed);
    noStroke();
    rect(900,0,100,700);
  }else if(numPlayers == 3)
  {
    fill(#6495ed);
    noStroke();
    rect(0,height-50,1000,60);
    rect(0,0,200,50);
    rect(800,0,200,50);
  }else if(numPlayers == 4)
  {
    fill(#6495ed);
    noStroke();
    
    rect(0,0,200,50);
    rect(800,0,200,50);
    rect(0,height-50,200,50);
    rect(800,height-50,200,50);
  }
  
  
  for(int i = 0; i <= numPlayers -1; i++)
  {
    paddle[i].move(numPlayers);
    paddle[i].show();
  
  }
  for(int i = 0; i < balls; i++)
  {    
    ball[i].move();
    ball[i].drawBall();
    ball[i].checkCollision(numPlayers);
    for(int j = 0; j < numPlayers; j++)
    players[j][4] = str(ball[i].score[j]);
  }
    println(players[2][4]);
    
  if(numPlayers <= 2)
  {
  textAlign(LEFT);                        //showing score
  fill(255);  
  text(players[0][0], 20, 60);
  if(numPlayers == 1)
  text(players[0][4], 20, 120);
  else
  text(players[1][4], 20, 120);
  } if(numPlayers == 2)
  {
    textAlign(RIGHT);
  fill(255);
  text(players[1][0], width-20, 60);
  text(players[0][4], width-20, 120);
  }else if (numPlayers ==3)
  {
  fill(0);
  textAlign(LEFT);
  fill(paddle[0].R,paddle[0].G,paddle[0].B);
  text(players[0][4], 20, height - 50);
  textAlign(CENTER);
  fill(paddle[2].R,paddle[2].G,paddle[2].B);
  text(players[2][4], width/2, height - 50);
  textAlign(RIGHT);
  fill(paddle[1].R,paddle[1].G,paddle[1].B);
  text(players[1][4], width-20, height - 50);
  }
  else if (numPlayers ==4)
  {
  fill(0);
  textAlign(LEFT);
  fill(paddle[0].R,paddle[0].G,paddle[0].B);
  text(players[0][4], 20, 50);
  fill(paddle[3].R,paddle[3].G,paddle[3].B);
  text(players[3][4], 20, height - 50);
  textAlign(RIGHT);
  fill(paddle[2].R,paddle[2].G,paddle[2].B);
  text(players[2][4], width-20, 50);
  fill(paddle[1].R,paddle[1].G,paddle[1].B);
  text(players[1][4], width-20, height - 50);
  
  }
  
  
  rectMode(CORNER);
  
  if(numPlayers ==2)
  {
  fill(255);
  rect(width/2 -6, 10, 10,20);      //pause button
  rect(width/2 +6, 10, 10,20);
  }else
  {
  fill(255);
  rect(width - 30, 10, 10,20);
  rect(width - 15, 10, 10,20);
  }
  
  
  
}

void scene5(int numPlayers)                            //help menu - different menu for different number of players
{
  PFont dotum;
  dotum = createFont("Dotum", 70);
  textAlign(CENTER, CENTER);
  textFont(dotum);
  
  rectMode(CENTER);
  fill(#6495ed);
  rect(width/2, height/2, 500, 650);
  rectMode(CORNER);
  
    
  
  
    if (mouseOver(width/2 - 75, 575, 150, 50))    //continue button
    {
      fill(210);
    } else
      fill(255);
    rect(width/2 - 75, 575, 150, 50);
    fill(0);
    textSize(30);
    text("Continue", width/2, 595);
    
    rectMode(CENTER);                                         
    fill(255);                          //showing keys
    rect(width/2 - 175, height/2 - 200, 50,50);        
    fill(0);
    text(players[0][2], width/2 - 175, height/2 - 207.5);
    fill(255);                          
    rect(width/2 - 175, height/2 - 125, 50,50);        
    fill(0);
    text(players[0][3], width/2 - 175, height/2 - 132.5);
    
    fill(255);                          //showing keys
    rect(width/2 + 175, height/2 - 200, 50,50);        
    fill(0);
    text(players[1][2], width/2 + 175, height/2 - 207.5);
    fill(255);                          
    rect(width/2 + 175, height/2 - 125, 50,50);        
    fill(0);
    text(players[1][3], width/2 + 175, height/2 - 132.5);
    
    
    
    
   if(numPlayers >= 3)
  {
    
    
    fill(255);                          //showing keys
    rect(width/2 - 37.5, height/2 - 275, 50,50);        
    fill(0);
    text(players[2][2], width/2 -37.5, height/2 - 282.5);
    fill(255);                          
    rect(width/2 + 37.5, height/2 - 275, 50,50);        
    fill(0);
    text(players[2][3], width/2 +37.5, height/2 - 282.5);
  }if(numPlayers == 4)
  {
      fill(255);                          //showing keys
    rect(width/2 - 37.5, height/2 - 50, 50,50);        
    fill(0);
    text(players[3][2], width/2 -37.5, height/2 - 57.5);
    fill(255);                          
    rect(width/2 + 37.5, height/2 - 50, 50,50);        
    fill(0);
    text(players[3][3], width/2 +37.5, height/2 - 57.5);
  }
     textSize(15);
    text("Each game is up to "+ ppg + " points", width/2, height/2+75);
    text("The winner will be determined by the first to "+ gpm +" matches", width/2, height/2 + 105);
    
  if(numPlayers ==2)
  {
    text("In this gamemode, you gain points when the", width/2, height/2 + 135);
    text("ball passes through your opponent's end",width/2, height/2 + 165);
    
  }else{ 
    text("In this gamemode, you gain points when",width/2, height/2 + 135);
    text(" the ball passes through your end",width/2, height/2 +155);
    text("The player with the lowest score ", width/2, height/2 + 175);
    text("in the end of each game is awarded a point",width/2, height/2 + 195);
  }
  
  
  
}

void escape()    // pause menu
{
  PFont dotum;
  dotum = createFont("Dotum", 70);
  textAlign(CENTER, CENTER);
  textFont(dotum);
  rectMode(CORNER);
  textSize(30);
  
  fill(#6495ed);
  noStroke();
  rect(width/2 - 250, height/2 -150, 500,300);
  
  stroke(0);
  
   if (mouseOver(width/2 +50, height/2, 150, 50))    //resume button
    {
      fill(210);
    } else
      fill(255);
    rect(width/2 +50, height/2, 150, 50);
    fill(0);
    text("Resume", width/2 +125, height/2+20);
    
    if (mouseOver(width/2 -200, height/2, 150, 50))    //exit button
    {
      fill(210);
    } else
      fill(255);
    rect(width/2 -200, height/2, 150, 50);
    fill(0);
    text("Exit", width/2 -125, height/2+20);
    
    if (mouseOver(width/2 -75, height/2-75, 150, 50))    //help button
    {
      fill(210);
    } else
      fill(255);
    rect(width/2 -75, height/2-75, 150, 50);
    fill(0);
    text("Help", width/2 , height/2-55);
  
    
  
}
void scene7(int numPlayers)     //  between game score check - number of players is used in a for loop
{
  PFont dotum;
  dotum = createFont("Dotum", 70);
  textAlign(LEFT, CENTER);
  textFont(dotum);
  background(#93ccea);
  textSize(30);
  
  for(int i = 0; i < numPlayers; i++)
  {
    fill(paddle[i].R,paddle[i].G,paddle[i].B);
    text(players[i][0], 60, 100 + 60 * i);
    text(players[i][5], 200, 100 + 60 * i);
  }
  textAlign(CENTER, CENTER);
  if (mouseOver(width-300, 550, 150, 50))    //continue button
    {
      fill(210);
    } else
      fill(255);
    rect(width-300, 550, 150, 50);
    fill(0);
    text("Continue", width-300+75, 570);
}
void scene8()                          // final win screen --
{
  PFont dotum;
  dotum = createFont("Dotum", 70);
  textAlign(CENTER, CENTER);
  textFont(dotum);
  background(#93ccea);
  text("Congratulations",width/2, height/2 -200);
   textSize(30);
   matchOver = false;
  for(int i = 0; i < numPlayers; i++)
  {
    
    if(players[i][6].equals("1")){
    fill(paddle[i].R, paddle[i].G, paddle[i].B);
    if(players[i][0].equals(" "))
    text("player "+(i+1), width/2, height/2 -100 + 30*i);
    text(players[i][0], width/2, height/2 -100 + 30*i);
    }
  }
  
  
  
 
  if (mouseOver(width/2 - 75, 575, 150, 50))    //continue button
    {
      fill(210);
    } else
      fill(255);
    rect(width/2 - 75, 575, 150, 50);
    fill(0);
    textSize(30);
    text("Continue", width/2, 595);
  
}


void mouseClicked()
{
  clickOnce = true;
}